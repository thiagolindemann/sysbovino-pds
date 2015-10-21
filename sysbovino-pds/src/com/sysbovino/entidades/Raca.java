package com.sysbovino.entidades;
// Generated 07/10/2015 20:17:36 by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;  
import javax.persistence.Entity;  

/**
 * Raca generated by hbm2java
 */
@Entity
@Table(name = "raca", catalog = "projetoSistemas")
public class Raca implements java.io.Serializable {

	private Integer codRaca;
	private int codPais;
	private String nomeRaca;
	private String observacao;

	public Raca() {
	}

	public Raca(int codPais) {
		this.codPais = codPais;
	}

	public Raca(int codPais, String nomeRaca, String observacao) {
		this.codPais = codPais;
		this.nomeRaca = nomeRaca;
		this.observacao = observacao;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	@Column(name = "cod_raca", unique = true, nullable = false)
	public Integer getCodRaca() {
		return this.codRaca;
	}

	public void setCodRaca(Integer codRaca) {
		this.codRaca = codRaca;
	}

	@Column(name = "cod_pais", nullable = false)
	public int getCodPais() {
		return this.codPais;
	}

	public void setCodPais(int codPais) {
		this.codPais = codPais;
	}

	@Column(name = "nome_raca", length = 50)
	public String getNomeRaca() {
		return this.nomeRaca;
	}

	public void setNomeRaca(String nomeRaca) {
		this.nomeRaca = nomeRaca;
	}

	@Column(name = "observacao", length = 500)
	public String getObservacao() {
		return this.observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

}
