package util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public final class Aviso implements Serializable {

	private final List<String> avisos;

	public Aviso() {
		avisos = new ArrayList<>();
	}

	public Aviso(String mensagem) {
		avisos = new ArrayList<>();
		avisos.add(mensagem);
	}

	public void add(String mensagem) {
		avisos.add(mensagem);
	}

	public boolean isExisteAvisos() {
		return !avisos.isEmpty();
	}

	public List<String> getAvisos() {
		return avisos;
	}
}