package model;

import java.io.Serializable;

public class Processo implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/* Atributos */
	private String nomeProcesso;
	private double tempoDuracao;
	private int prioridadeProcesso;
	private int tempoChegada;
	private String estado;
	private String tipoProcesso;
	
	/* Metodo Construtor */
	public Processo() {
	}

	/* Métodos GETS e SETS */
	
	public String getNomeProcesso() {
		return nomeProcesso;
	}

	public void setNomeProcesso(String nomeProcesso) {
		this.nomeProcesso = nomeProcesso;
	}

	public double getTempoDuracao() {
		return tempoDuracao;
	}

	public void setTempoDuracao(double tempoDuracao) {
		this.tempoDuracao = tempoDuracao;
	}

	public int getPrioridadeProcesso() {
		return prioridadeProcesso;
	}

	public void setPrioridadeProcesso(int prioridadeProcesso) {
		this.prioridadeProcesso = prioridadeProcesso;
	}

	public int getTempoChegada() {
		return tempoChegada;
	}

	public void setTempoChegada(int tempoChegada) {
		this.tempoChegada = tempoChegada;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getTipoProcesso() {
		return tipoProcesso;
	}

	public void setTipoProcesso(String tipoProcesso) {
		this.tipoProcesso = tipoProcesso;
	}
	
	
}
