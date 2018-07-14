package mvc.logica;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsuarioDAO;
import modelo.Usuario;
import util.Aviso;
import util.Erro;

public class AlterarSenha implements Logica {

	@Override
	public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String url = "/WEB-INF/jsp/login.jsp";
		Erro erros = new Erro();
		Aviso avisos = new Aviso();
		if (req.getParameter("bOK") != null) {
			String matricula = req.getParameter("matricula");
			String senhaAntiga = req.getParameter("senhaAntiga");
			String senha1 = req.getParameter("senhaNova1");
			String senha2 = req.getParameter("senhaNova2");

			Usuario usuario = new Usuario();
			usuario.setMatricula(matricula);
			usuario.setSenha(senhaAntiga);
			UsuarioDAO dao = new UsuarioDAO();
			Usuario user = dao.existeUsuario(usuario);
			if (user != null) {
				user.setSenha(senha1);
				if (user.getSenha().equalsIgnoreCase(senha2)) {
					user.setMatricula(matricula);
					dao.alterarSenha(user);
					url = "mvc?logica=IniciaTarefaLogica&url=/WEB-INF/jsp/login.jsp";
					avisos.add("Senha alterada com sucesso!");
				} else {
					erros.add("As senhas não são identicas!");
					url = "mvc?logica=IniciaTarefaLogica&url=/WEB-INF/jsp/alterarSenha.jsp";
				}
			} else {
				erros.add("Usuário não cadastrado ou senha errada!");
			}
		}
		return url;
	}

}
