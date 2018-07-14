package mvc.logica;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.threads.ThreadPoolExecutor;

import dao.UsuarioDAO;
import modelo.Usuario;
import util.Erro;

public class Login extends HttpServlet implements Logica {

	@Override
	public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
		Erro erros = new Erro();
		if (req.getParameter("bOK") != null) {
			String matricula = req.getParameter("matricula");
			String senha = req.getParameter("senha");
			if (matricula == null || matricula.isEmpty()) {
				erros.add("Nome não informado!");
			}
			if (senha == null || senha.isEmpty()) {
				erros.add("Senha não informada!");
			}
			if (!erros.isExisteErros()) {
				Usuario usuario = new Usuario();
				usuario.setMatricula(matricula);
				usuario.setNome(null);
				usuario.setSenha(senha);
				usuario.setPerfil(1);
				UsuarioDAO dao = new UsuarioDAO();
				Usuario user = dao.existeUsuario(usuario);
				//verificar se existe o cadastro do usuario
				if (user != null) {
					//verificar se a senha cadastrada são iguais
					if (user.getSenha().equalsIgnoreCase(senha)) {
						user.setSenha("******");//retira a senha da sessão
						req.getSession().setAttribute("usuarioLogado", user);
						//verificar se o email já foi confirmado
						if(user.isMailConfirm()) {
							return "mvc?logica=IniciaTarefaLogica&url=/WEB-INF/jsp/tarefa.jsp";
						}else {
							return "mvc?logica=IniciaTarefaLogica&url=/WEB-INF/jsp/alterarSenha.jsp";
						}
					} else {
						erros.add("Senha inválida!");
					}
				} else {
					erros.add("Usuário não encontrado!");
				}
			}
		}
		req.getSession().invalidate();
		req.setAttribute("mensagens", erros);
		return "/WEB-INF/jsp/login.jsp";
	}
}