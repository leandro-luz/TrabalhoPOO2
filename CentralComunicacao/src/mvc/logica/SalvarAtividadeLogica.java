package mvc.logica;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TarefaDAO;
import modelo.Tarefa;
import modelo.Usuario;
import util.Aviso;
import util.Erro;
import util.FormatarDatas;

public class SalvarAtividadeLogica implements Logica {
	public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
		Erro erros = new Erro();
		Aviso avisos = new Aviso();
		HttpSession session = req.getSession();
		String url;

		Usuario u = (Usuario) session.getAttribute("usuarioLogado");
		if (u == null) {
			session.invalidate();
			url = "/WEB-INF/jsp/login.jsp";
		} else {
			if (req.getParameter("bOK") != null) {
				// pegando os parametros do request
				String topico = req.getParameter("topico");
				String regional = req.getParameter("regional");
				String sub = (req.getParameter("subestacao"));
				int subestacao = (sub != "") ? Integer.parseInt(sub) : 0;
				String al = (req.getParameter("alimentador"));
				int alimentador = (al != "") ? Integer.parseInt(al) : 0;
				String tipoDocumento = req.getParameter("tipoDocumento");
				String doc = req.getParameter("nDocumento");
				int nDocumento = (doc != "") ?Integer.parseInt(doc): 0;
		
				String acao = req.getParameter("acao");
				String dt_prevista = req.getParameter("dt_prevista");

				if (topico == null || topico.isEmpty()) {
					erros.add("O topico não foi informado!");
				}
				if (regional == null || regional.isEmpty() || regional.equalsIgnoreCase("Todas")) {
					erros.add("A regional não foi informada!");
				}
				if (subestacao == 0) {
					erros.add("A subestação não foi informada!");
				}
				if (alimentador == 0) {
					erros.add("O alimentador não foi informado!");
				}
				if (acao == null || acao.isEmpty()) {
					erros.add("A ação não foi informada!");
				}
				if (dt_prevista == null || dt_prevista.isEmpty()) {
					erros.add("A data prevista não foi informada");
				}
				
				if (tipoDocumento == null || tipoDocumento.isEmpty()) {
					erros.add("O tipo do documento não foi informado");
				}
				if (nDocumento == 0) {
					erros.add("O número do documento não foi informado");
				}
				
				
				if (!erros.isExisteErros()) {
					Usuario user = (Usuario) session.getAttribute("usuarioLogado");

					// monta um objeto contato
					Tarefa tarefa = new Tarefa();
					tarefa.setDt_registro(FormatarDatas.dataAtual());
					tarefa.setTopico(topico);
					tarefa.setSubestacao(subestacao);
					tarefa.setAlimentador(alimentador);
					tarefa.setTipoDocumento(tipoDocumento);
					tarefa.setnDocumento(nDocumento);
					tarefa.setRegional(regional);
					tarefa.setMatricula(user.getMatricula());
					tarefa.setAcao(acao);
					tarefa.setDt_prevista(FormatarDatas.converterData(dt_prevista));
					tarefa.setSituacao("Em analise");
					tarefa.setStatus("Pendente");
					tarefa.setAlterado("");

					// salva o contato
					TarefaDAO dao = new TarefaDAO();
					try {
						dao.adiciona(tarefa);
						avisos.add("Ação adicionada com sucesso!");
						url = "mvc?logica=IniciaTarefaLogica&url=/WEB-INF/jsp/tarefa.jsp";
					} catch (RuntimeException e) {
						url = "erro.jsp";
					}
				}
				req.setAttribute("mensagens", erros);
				req.setAttribute("noticias", avisos);
			}
			url = "mvc?logica=IniciaTarefaLogica&url=/WEB-INF/jsp/tarefa.jsp";
		}
		return url;
	}
}
