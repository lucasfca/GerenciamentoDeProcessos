package model;

import java.io.Serializable;

public class Processo implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/* Atributos */
	private String nomeProcesso;
	private int tempoChegada;
	private int duracao;
	private int duracaoRestante;

	public Processo(String nomeProcesso, int tempoChegada, int duracao) {
		this.nomeProcesso = nomeProcesso;
		this.tempoChegada = tempoChegada;
		this.duracao = duracao;
		this.duracaoRestante = duracao;
	}

	public String getNomeProcesso() {
		return nomeProcesso;
	}

	public void setId(String nomeProcesso) {
		this.nomeProcesso = nomeProcesso;
	}
	
	public int getTempoChegada() {
		return tempoChegada;
	}

	public void setTempoChegada(int tempoChegada) {
		this.tempoChegada = tempoChegada;
	}

	public int getDuracao() {
		return duracao;
	}

	public void setDuracao(int duracao) {
		this.duracao = duracao;
	}

	public int getDuracaoRestante() {
		return duracaoRestante;
	}

	public void setDuracaoRestante(int duracaoRestante) {
		this.duracaoRestante = duracaoRestante;
	}

	/**
	 * Ordena a lista de acordo com a duracao e tempo de chegada
	 * 
	 * @param Processo
	 */
	public int compareTo(Processo p) {
		if ( (this.tempoChegada < p.getTempoChegada() || this.tempoChegada == p.getTempoChegada())
				&& (this.getDuracao() < p.getDuracao()) ) {
			return -1;
		} else if ( (this.tempoChegada > p.getTempoChegada() || (this.tempoChegada == p.getTempoChegada()) && 
				this.getDuracao() > p.getDuracao()) ) {
			return 1;
		} else {
			return 0;
		}
	}

	@Override
	public String toString() {
		return "P" + getNomeProcesso() + "(" +getTempoChegada() + " "+ getDuracao() + ")";
	}

}