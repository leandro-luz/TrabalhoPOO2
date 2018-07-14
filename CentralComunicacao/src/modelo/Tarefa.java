package modelo;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

public class Tarefa implements Serializable {
	private int id;
	private String dt_registro;
	private String topico;
	private String regional;
	private int subestacao;
	private int alimentador;
	private String matricula;
	private String tipoDocumento;
	private int nDocumento;
	private String acao;
	private String dt_prevista;
	private String situacao;
	private String status;
	private String dt_conclusao;
	private String alterado;


	public String getTipoDocumento() {
		return tipoDocumento;
	}

	public void setTipoDocumento(String tipoDocumento) {
		this.tipoDocumento = tipoDocumento;
	}

	public int getnDocumento() {
		return nDocumento;
	}

	public void setnDocumento(int nDocumento) {
		this.nDocumento = nDocumento;
	}

	public Tarefa(int id, String dt_registro, String topico, String regional, int subestacao, int alimentador,
			String matricula, String tipoDocumento, int nDocumento, String acao, String dt_prevista, String situacao,
			String status, String dt_conclusao, String alterado) {
		super();
		this.id = id;
		this.dt_registro = dt_registro;
		this.topico = topico;
		this.regional = regional;
		this.subestacao = subestacao;
		this.alimentador = alimentador;
		this.matricula = matricula;
		this.tipoDocumento = tipoDocumento;
		this.nDocumento = nDocumento;
		this.acao = acao;
		this.dt_prevista = dt_prevista;
		this.situacao = situacao;
		this.status = status;
		this.dt_conclusao = dt_conclusao;
		this.alterado = alterado;
	}

	public int getSubestacao() {
		return subestacao;
	}

	public void setSubestacao(int subestacao) {
		this.subestacao = subestacao;
	}

	public int getAlimentador() {
		return alimentador;
	}

	public void setAlimentador(int alimentador) {
		this.alimentador = alimentador;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAlterado() {
		return alterado;
	}

	public void setAlterado(String alterado) {
		this.alterado = alterado;
	}

	public Tarefa() {
	}

	public String getDt_registro() {
		return dt_registro;
	}

	public void setDt_registro(String dt_registro) {
		this.dt_registro = dt_registro;
	}

	public String getTopico() {
		return topico;
	}

	public void setTopico(String topico) {
		this.topico = topico;
	}

	public String getRegional() {
		return regional;
	}

	public void setRegional(String regional) {
		this.regional = regional;
	}

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public String getAcao() {
		return acao;
	}

	public void setAcao(String acao) {
		this.acao = acao;
	}

	public String getDt_prevista() {
		return dt_prevista;
	}

	public void setDt_prevista(String dt_prevista) {
		this.dt_prevista = dt_prevista;
	}

	public String getSituacao() {
		return situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDt_conclusao() {
		return dt_conclusao;
	}

	public void setDt_conclusao(String dt_conclusao) {
		this.dt_conclusao = dt_conclusao;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


}
