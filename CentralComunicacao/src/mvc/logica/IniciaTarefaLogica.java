package mvc.logica;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TarefaDAO;

public class IniciaTarefaLogica implements Logica {

	public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
		List<String> regionais = new TarefaDAO().getRegional();
		List<String> topicos = new TarefaDAO().getTopico();
		List<String> documentos = new TarefaDAO().getTipoDocumentos();
		req.getSession().setAttribute("regionais", regionais);
		req.getSession().setAttribute("topicos", topicos);
		req.getSession().setAttribute("documentos", documentos);
		String url = req.getParameter("url");
		return url;
	}

}
