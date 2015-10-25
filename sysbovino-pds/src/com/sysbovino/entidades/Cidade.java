package com.sysbovino.entidades;
// Generated 07/10/2015 20:17:36 by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;  
import javax.persistence.Entity;  

/**
 * Cidade generated by hbm2java
 */
@Entity
@Table(name = "cidade", catalog = "projetoSistemas")
public class Cidade implements java.io.Serializable {

	private int codCidade;
	private int codUf;
	private String nomeCidade;

	public Cidade() {
	}

	public Cidade(int codCidade, int codUf, String nomeCidade) {
		this.codCidade = codCidade;
		this.codUf = codUf;
		this.nomeCidade = nomeCidade;
	}

	@Id

	@Column(name = "cod_cidade", unique = true, nullable = false)
	public int getCodCidade() {
		return this.codCidade;
	}

	public void setCodCidade(int codCidade) {
		this.codCidade = codCidade;
	}

	@Column(name = "cod_uf", nullable = false)
	public int getCodUf() {
		return this.codUf;
	}

	public void setCodUf(int codUf) {
		this.codUf = codUf;
	}

	@Column(name = "nome_cidade", nullable = false, length = 150)
	public String getNomeCidade() {
		return this.nomeCidade;
	}

	public void setNomeCidade(String nomeCidade) {
		this.nomeCidade = nomeCidade;
	}

}