package modelo;

import java.io.Serializable;

public class Usuario implements Serializable {
	private String matricula;
	private String nome;
	private String senha;
	private String email;
	private boolean mailConfirm;
	private String regional;
	private Integer perfil;

	public Usuario() {
	}

	public Usuario(String matricula, String nome, String senha, String email, boolean mailConfirm, String regional,
			Integer perfil) {
		super();
		this.matricula = matricula;
		this.nome = nome;
		this.senha = senha;
		this.email = email;
		this.mailConfirm = mailConfirm;
		this.regional = regional;
		this.perfil = perfil;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isMailConfirm() {
		return mailConfirm;
	}

	public void setMailConfirm(boolean mailConfirm) {
		this.mailConfirm = mailConfirm;
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

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public Integer getPerfil() {
		return perfil;
	}

	public void setPerfil(Integer perfil) {
		this.perfil = perfil;

	}

}
