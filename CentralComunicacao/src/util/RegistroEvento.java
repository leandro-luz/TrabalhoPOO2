package util;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import modelo.Usuario;

public class RegistroEvento {

	public static void registrar(HttpServletRequest req, String logica)  {
		String path = "d:\\centralcomunicacaolog.txt";
		String texto = null;
		String dataTime = null;
		HttpSession session = req.getSession();
		Usuario u = (Usuario) session.getAttribute("usuarioLogado");
		try {
			dataTime = FormatarDatas.dataAtual();
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		
		if(logica.equalsIgnoreCase("AdicionaUsuarioLogica")) {
			String matricula = req.getParameter("matricula");
			String nome = req.getParameter("nome");
			String regional = req.getParameter("regional");
			texto = "logica:" + logica + ", time:" + dataTime + ", matricula:" + matricula + ", nome:" + nome + ", regional:" + regional;
		}
		if(logica.equalsIgnoreCase("Login")) {
			String matricula = req.getParameter("matricula");
			texto = "logica:" + logica +  ", time:" + dataTime + ", matricula:" + matricula;
		}
		if(logica.equalsIgnoreCase("ListaTarefaLogica")) {
			String matricula = u.getMatricula();
			String regional = req.getParameter("regional");
			texto = "logica:" + logica +  ", time:" + dataTime +", matricula:" + matricula + ", regional:" + regional;
		}
		
		try {
			FileWriter fw = new FileWriter(path, true);
			BufferedWriter conexao = new BufferedWriter(fw);
			conexao.write(texto);
			conexao.newLine();
			conexao.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
