package mvc.logica;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TarefaDAO;
import modelo.Tarefa;
import modelo.Usuario;
import util.Aviso;
import util.FormatarDatas;

public class AlteraSituacaoLogica implements Logica {

	@Override
	public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		String url;
		Usuario u = (Usuario) session.getAttribute("usuarioLogado");
		Aviso avisos = new Aviso();
		if (u == null) {
			session.invalidate();
			url = "/WEB-INF/jsp/login.jsp";
		} else {
			Integer id = Integer.parseInt(req.getParameter("id"));
			String acao = req.getParameter("acao");
			if (verificaAcao(id, acao)) {
				try {
					Tarefa tarefa = new Tarefa();
					tarefa.setId(id);
					tarefa.setAlterado(u.getMatricula());
					TarefaDAO dao = new TarefaDAO();
					String situacao = verificarSituacao(id);
					dao.atualizaSituacao(tarefa, acao, situacao);
					avisos.add("A alteração foi realizada sucesso!");
					url = "mvc?logica=IniciaTarefaLogica&url=/WEB-INF/jsp/tarefa.jsp";
				} catch (RuntimeException e) {
					url = "erro.jsp";
				}
			}
			if (u.getPerfil() != 1) {
				url = "mvc?logica=ListaTarefaLogica&regional=Todas";
			} else {
				url = "mvc?logica=ListaTarefaLogica&regional=" + u.getRegional();
			}
		}
		return url;
	}

	public boolean verificaAcao(Integer id, String acao) {
		boolean result = false;
		Tarefa tarefaBackup = buscarTarefa(id);
		String situacaoAntiga = tarefaBackup.getStatus();

		if (situacaoAntiga.equalsIgnoreCase("Pendente")) {
			result = (situacaoAntiga.equalsIgnoreCase("Concluida")) ? false : true;
		}
		if (situacaoAntiga.equalsIgnoreCase("Excluida")) {
			result = false;
		}
		if (situacaoAntiga.equalsIgnoreCase("Aprovada") || situacaoAntiga.equalsIgnoreCase("Reprovada")
				|| situacaoAntiga.equalsIgnoreCase("Concluida")) {
			result = (acao.equalsIgnoreCase("Excluida")) ? false : true;
		}
		return result;
	}

	public String verificarSituacao(int id) throws ParseException {
		Tarefa tarefaBackup = buscarTarefa(id);
		String situacaoAntiga = tarefaBackup.getDt_prevista();
		DateFormat f1 = DateFormat.getDateTimeInstance();
        Date dataAntiga = f1.parse(situacaoAntiga);
        String dataAtual = FormatarDatas.dataAtual();
        Date dataAtualFormatada = f1.parse(dataAtual);
        String situacao = (dataAntiga.after(dataAtualFormatada)? "No prazo" :"Atrasada");
        return situacao;
	}

	public Tarefa buscarTarefa(int id) {
		TarefaDAO daoAntigo = new TarefaDAO();
		Tarefa tarefaBackup = new Tarefa();
		tarefaBackup.setId(id);
		tarefaBackup = daoAntigo.getTarefa(tarefaBackup);
		return tarefaBackup;
	}

}
