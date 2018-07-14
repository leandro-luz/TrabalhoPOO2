package mvc.logica;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsuarioDAO;
import mail.JavaMail;
import modelo.Usuario;
import util.Aviso;
import util.Erro;

public class AdicionaUsuarioLogica implements Logica {
	public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
		Erro erros = new Erro();
		Aviso avisos = new Aviso();
		String url = "mvc?logica=IniciaTarefaLogica&url=/WEB-INF/jsp/login.jsp";
		if (req.getParameter("bOK").equalsIgnoreCase("Salvar")) {
			// pegando os parametros do request
			String matricula = req.getParameter("matricula");
			String nome = req.getParameter("nome");
			String regional = req.getParameter("regional");
			String email = req.getParameter("email");
			if (matricula == null || matricula.isEmpty()) {
				erros.add("Matricula não informada!");
			}
			if (nome == null || nome.isEmpty()) {
				erros.add("Nome não informado!");
			}
			if (regional == null || regional.isEmpty() || regional.equalsIgnoreCase("Todas")) {
				erros.add("Regional não informada!");
			}
			if (email == null || email.isEmpty()) {
				erros.add("Email não informado!");
			}
			if (!erros.isExisteErros()) {
				// monta um objeto contato
				Usuario usuario = new Usuario();
				usuario.setMatricula(matricula);
				usuario.setNome(nome);
				long senha = (long) (Math.random() * 999999l);
				usuario.setSenha(Long.toString(senha));
				usuario.setEmail(email);
				usuario.setMailConfirm(false);
				usuario.setRegional(regional);
				usuario.setPerfil(1);

				// salva o contato
				UsuarioDAO dao = new UsuarioDAO();
				Usuario user = dao.existeUsuario(usuario);
				Usuario existeEmail = dao.existeEmail(usuario);
				if (user == null && existeEmail == null) {
					try {
						dao.adiciona(usuario);
						//enviar email
						JavaMail.enviarEmail(usuario.getEmail(), usuario.getSenha());
						avisos.add("Usuário adicionado com sucesso!");
						avisos.add("Senha enviado para email cadastrado!");
						avisos.add("Abra o email e siga os passos para acessar o sistema.");
						url = "mvc?logica=IniciaTarefaLogica&url=/WEB-INF/jsp/novoUsuario.jsp";
					} catch (RuntimeException e) {
						url = "/WEB-INF/jsp/novoUsuario.jsp";
					}
				} else {
					erros.add("Usuario já cadastrado ou email já cadastrado");
					url = "mvc?logica=IniciaTarefaLogica&url=/WEB-INF/jsp/login.jsp";
				}
			}
			req.getSession().invalidate();
			req.setAttribute("mensagens", erros);
			req.setAttribute("noticias", avisos);
		}
		return url;
	}
}
