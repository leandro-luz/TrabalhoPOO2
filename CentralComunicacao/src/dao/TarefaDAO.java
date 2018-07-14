package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import jdbc.ConnectionFactory;
import modelo.Tarefa;
import util.FormatarDatas;

public class TarefaDAO {

	private Connection connection;

	public TarefaDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public void adiciona(Tarefa tarefa) {
		String sql = "Insert into tarefa (tar_dt_registro, tar_topico, reg_nome, tar_subestacao, tar_alimentador,"
				+ "doc_descricao,tar_num_doc, usu_mat, tar_acao, tar_dt_prevista, tar_situacao, tar_status) values (?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, tarefa.getDt_registro());
			stmt.setString(2, tarefa.getTopico());
			stmt.setString(3, tarefa.getRegional());
			stmt.setInt(4, tarefa.getSubestacao());
			stmt.setInt(5, tarefa.getAlimentador());
			stmt.setString(6, tarefa.getTipoDocumento());
			stmt.setInt(7, tarefa.getnDocumento());
			stmt.setString(8, tarefa.getMatricula());
			stmt.setString(9, tarefa.getAcao());
			stmt.setString(10, tarefa.getDt_prevista());
			stmt.setString(11, tarefa.getSituacao());
			stmt.setString(12, tarefa.getStatus());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			System.out.println("Erro: " + e.getMessage());
		}
	}

	public void exclui(Tarefa tar) {

		Tarefa lastTarefa = getTarefa(tar);
		if (lastTarefa != null) {
			try {
				PreparedStatement stmt = this.connection
						.prepareStatement("Delete from tarefa where tar_codigo =" + tar.getId() + "'");
				stmt.execute();
				stmt.close();
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
	}

	public void atualiza(Tarefa tarefa) {
		Tarefa lastTarefa = getTarefa(tarefa);
		// faltando where id
		String sql = "Update tarefa SET tar_topico = '?', reg_nome = '?', tar_acao = '?',"
				+ " tar_dt_prevista = '?', tar_situacao = '?', tar_status = '?', tar_dt_conclusao = '?', tar_alterado_mat = '?')";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			String topico = (lastTarefa.getTopico().equals(tarefa.getTopico())) ? lastTarefa.getTopico()
					: tarefa.getTopico();
			stmt.setString(1, topico);
			String regional = (lastTarefa.getRegional().equals(tarefa.getRegional())) ? lastTarefa.getRegional()
					: tarefa.getRegional();
			stmt.setString(2, regional);
			String acao = (lastTarefa.getAcao().equals(tarefa.getAcao())) ? lastTarefa.getAcao() : tarefa.getAcao();
			stmt.setString(3, acao);
			String dt_prev = (lastTarefa.getDt_prevista().equals(tarefa.getDt_prevista())) ? lastTarefa.getDt_prevista()
					: tarefa.getDt_prevista();
			stmt.setString(4, dt_prev);
			String situacao = (lastTarefa.getSituacao().equals(tarefa.getSituacao())) ? lastTarefa.getSituacao()
					: tarefa.getSituacao();
			stmt.setString(5, situacao);
			String status = (lastTarefa.getStatus().equals(tarefa.getStatus())) ? lastTarefa.getStatus()
					: tarefa.getStatus();
			stmt.setString(6, status);
			String dt_con = (lastTarefa.getDt_conclusao().equals(tarefa.getDt_conclusao()))
					? lastTarefa.getDt_conclusao()
					: tarefa.getDt_conclusao();
			stmt.setString(7, dt_con);
			String alterado = (lastTarefa.getAlterado().equals(tarefa.getAlterado())) ? lastTarefa.getAlterado()
					: tarefa.getAlterado();
			stmt.setString(8, alterado);
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Tarefa> getLista(String regional) {
		try {
			List<Tarefa> tarefas = new ArrayList<>();
			String sqlTexto = (regional.equalsIgnoreCase("Todas")) ? "select * from tarefa order by tar_codigo desc"
					: "select * from tarefa where reg_nome = '" + regional + "' order by tar_codigo desc";
			PreparedStatement stmt = this.connection.prepareStatement(sqlTexto);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Tarefa tarefa = new Tarefa();
				tarefa.setId(rs.getInt("tar_codigo"));
				tarefa.setDt_registro(rs.getString("tar_dt_registro"));
				tarefa.setTopico(rs.getString("tar_topico"));
				tarefa.setRegional(rs.getString("reg_nome"));
				tarefa.setSubestacao(rs.getInt("tar_subestacao"));
				tarefa.setAlimentador(rs.getInt("tar_alimentador"));
				tarefa.setTipoDocumento(rs.getString("doc_descricao"));
				tarefa.setnDocumento(rs.getInt("tar_num_doc"));
				tarefa.setMatricula(rs.getString("usu_mat"));
				tarefa.setAcao(rs.getString("tar_acao"));
				tarefa.setDt_prevista(rs.getString("tar_dt_prevista"));
				tarefa.setSituacao(rs.getString("tar_situacao"));
				tarefa.setStatus(rs.getString("tar_status"));
				tarefa.setDt_conclusao(rs.getString("tar_dt_conclusao"));
				tarefa.setAlterado(rs.getString("tar_alterado_mat"));
				tarefas.add(tarefa);
			}
			rs.close();
			stmt.close();
			return tarefas;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Tarefa getTarefa(Tarefa tar) {
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from tarefa where tar_codigo = '" + tar.getId() + "'");
			ResultSet rs = stmt.executeQuery();
			Tarefa tarefa = new Tarefa();
			if (rs.next()) {

				tarefa.setDt_registro(rs.getString("tar_dt_registro"));
				tarefa.setTopico("tar_topico");
				tarefa.setRegional(rs.getString("reg_nome"));
				tarefa.setSubestacao(rs.getInt("tar_subestacao"));
				tarefa.setAlimentador(rs.getInt("tar_alimentador"));
				tarefa.setTipoDocumento(rs.getString("doc_descricao"));
				tarefa.setnDocumento(rs.getInt("tar_num_doc"));
				tarefa.setMatricula(rs.getString("usu_mat"));
				tarefa.setAcao(rs.getString("tar_acao"));
				tarefa.setDt_prevista(rs.getString("tar_dt_prevista"));
				tarefa.setSituacao(rs.getString("tar_situacao"));
				tarefa.setStatus(rs.getString("tar_status"));
				tarefa.setDt_conclusao(rs.getString("tar_dt_conclusao"));
				tarefa.setAlterado(rs.getString("tar_alterado_mat"));
			}
			rs.close();
			stmt.close();
			return tarefa;

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public List<String> getRegional() {
		try {
			List<String> regionais = new ArrayList<>();
			PreparedStatement stmt = this.connection.prepareStatement("select * from regional");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				regionais.add(rs.getString("reg_nome"));
			}
			rs.close();
			stmt.close();
			return regionais;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void atualizaSituacao(Tarefa tarefa, String acao, String situacao) throws ParseException {
		String sql = "Update tarefa SET tar_situacao = ?, tar_status = ?, tar_dt_conclusao = ?,"
				+ "tar_alterado_mat = ? where tar_codigo = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, situacao);
			stmt.setString(2, acao);
			stmt.setString(3, FormatarDatas.dataAtual());
			stmt.setString(4, tarefa.getAlterado());
			stmt.setInt(5, tarefa.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<String> getTopico() {
		try {
			List<String> topicos = new ArrayList<>();
			PreparedStatement stmt = this.connection.prepareStatement("select * from topico");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				topicos.add(rs.getString("top_descricao"));
			}
			rs.close();
			stmt.close();
			return topicos;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<String> getTipoDocumentos() {
		try {
			List<String> documentos = new ArrayList<>();
			PreparedStatement stmt = this.connection.prepareStatement("select * from documento");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				documentos.add(rs.getString("doc_descricao"));
			}
			rs.close();
			stmt.close();
			return documentos;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
