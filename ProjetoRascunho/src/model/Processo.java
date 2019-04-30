package model;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.Serializable;
import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

@Entity
public class Processo implements Serializable {
	private static final long serialVersionUID = 1L;

	/* Atributos */
	private String nomeProcesso;
	private int tempoChegada;
	private int duracao;
//	private int duracaoRestante;

	public Processo(String nomeProcesso, int tempoChegada, int duracao) {
		this.nomeProcesso = nomeProcesso;
		this.tempoChegada = tempoChegada;
		this.duracao = duracao;
	}
	
	public Processo() {
		
	}

	public String getNomeProcesso() {
		return nomeProcesso;
	}
	public void setNomeProcesso(String nomeProcesso) {
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

//	public int getDuracaoRestante() {
//		return duracaoRestante;
//	}
//
//	public void setDuracaoRestante(int duracaoRestante) {
//		this.duracaoRestante = duracaoRestante;
//	}

	/**
	 * Ordena a lista de acordo com a duracao e tempo de chegada
	 * 
	 * @param Processo
	 */
	public int compareTo(Processo p) {
		if ((this.tempoChegada < p.getTempoChegada() || this.tempoChegada == p.getTempoChegada())
				&& (this.getDuracao() < p.getDuracao())) {
			return -1;
		} else if ((this.tempoChegada > p.getTempoChegada()
				|| (this.tempoChegada == p.getTempoChegada()) && this.getDuracao() > p.getDuracao())) {
			return 1;
		} else {
			return 0;
		}
	}

//	@Override
//	public boolean equals(Object obj) {
//		if (this == obj)
//			return true;
//		if (obj == null)
//			return false;
//		if (getClass() != obj.getClass())
//			return false;
//		Processo other = (Processo) obj;
//		if (tempoChegada == 0) {
//			if (other.tempoChegada != 0)
//				return false;
//		} else if (!tempoChegada.equals(other.tempoChegada))
//			return false;
//		if (inicio == null) {
//			if (other.inicio != null)
//				return false;
//		} else if (!inicio.equals(other.inicio))
//			return false;
//		if (id != other.id)
//			return false;
//		if (nome == null) {
//			if (other.nome != null)
//				return false;
//		} else if (!nome.equals(other.nome))
//			return false;
//		return true;
//	}

	@Override
	public String toString() {
		return "P" + getNomeProcesso() + "(" + getTempoChegada() + " " + getDuracao() + ")";
	}

}