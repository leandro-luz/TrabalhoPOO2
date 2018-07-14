package mvc.logica;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TarefaDAO;
import modelo.Tarefa;
import modelo.Usuario;

public class ListaTarefaLogica implements Logica {
	public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		String url;
		Usuario u = (Usuario) session.getAttribute("usuarioLogado");
		if (u == null) {
			session.invalidate();
			url = "/WEB-INF/jsp/login.jsp";
		} else {
			String reg = req.getParameter("regional");
			List<Tarefa> tarefas = new TarefaDAO().getLista(reg);
			req.setAttribute("tarefas", tarefas);
			
			List<String> regionais = new TarefaDAO().getRegional();
			req.setAttribute("regionais", regionais);
			url = "/WEB-INF/jsp/tarefa.jsp";
		}
		return url;
	}
}
