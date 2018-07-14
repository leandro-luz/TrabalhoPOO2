package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.ConnectionFactory;
import modelo.Usuario;
import util.FormatarDatas;

public class UsuarioDAO {

	private Connection connection;

	public UsuarioDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public void adiciona(Usuario usuario) {
		String sql = "Insert into usuario (usu_mat, usu_nome, usu_senha, usu_email, usu_mailconfir, reg_nome, tp_perfil)"
				+ " values (?,?,?,?,?,?,?)";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario.getMatricula());
			stmt.setString(2, usuario.getNome());
			stmt.setString(3, usuario.getSenha());
			stmt.setString(4, usuario.getEmail());
			stmt.setBoolean(5, usuario.isMailConfirm());
			stmt.setString(6, usuario.getRegional());
			stmt.setInt(7, 1);
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Usuario existeUsuario(Usuario usuario) {
		try {
			String sql = ("select * from usuario where usu_mat = ?");
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario.getMatricula());

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				Usuario user = new Usuario();
				user.setMatricula(rs.getString("usu_mat"));
				user.setNome(rs.getString("usu_nome"));
				user.setSenha(rs.getString("usu_senha"));
				user.setEmail(rs.getString("usu_email"));
				user.setMailConfirm(rs.getBoolean("usu_mailconfir"));
				user.setRegional(rs.getString("reg_nome"));
				user.setPerfil(rs.getInt("tp_perfil"));
				return user;
			}
			// rs.close();
			// stmt.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return null;
	}

	public Usuario existeEmail(Usuario usuario) {
		try {
			String sql = ("select * from usuario where usu_email = ?");
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario.getEmail());
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				Usuario user = new Usuario();
				user.setMatricula(rs.getString("usu_mat"));
				user.setNome(rs.getString("usu_nome"));
				user.setSenha(rs.getString("usu_senha"));
				user.setEmail(rs.getString("usu_email"));
				user.setMailConfirm(rs.getBoolean("usu_mailconfir"));
				user.setRegional(rs.getString("reg_nome"));
				user.setPerfil(rs.getInt("tp_perfil"));
				return user;
			}
			// rs.close();
			// stmt.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return null;
	}

	public List<Usuario> getLista() {
		try {
			List<Usuario> usuarios = new ArrayList<Usuario>();
			PreparedStatement stmt = this.connection.prepareStatement("select * from contatos");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setMatricula(rs.getString("usu_mat"));
				usuario.setNome(rs.getString("usu_nome"));
				usuario.setSenha(rs.getString("usu_senha"));
				usuario.setEmail(rs.getString("usu_email"));
				usuario.setMailConfirm(rs.getBoolean("usu_mailconfir"));
				usuario.setRegional(rs.getString("reg_nome"));
				usuario.setPerfil(rs.getInt("tp_perfil"));
				usuarios.add(usuario);
			}
			rs.close();
			stmt.close();
			return usuarios;

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void alterarSenha(Usuario usuario) {
		String sql = "Update usuario SET usu_senha = ?, usu_mailconfir = ? where usu_mat = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario.getSenha());
			stmt.setBoolean(2, true);
			stmt.setString(3, usuario.getMatricula());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);

		}
	}

}
