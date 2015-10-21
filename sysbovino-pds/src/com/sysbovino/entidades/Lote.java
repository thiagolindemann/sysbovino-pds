package com.sysbovino.entidades;
// Generated 07/10/2015 20:17:36 by Hibernate Tools 4.0.0

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Table;  
import javax.persistence.Entity;  

/**
 * Lote generated by hbm2java
 */
@Entity
@Table(name = "lote", catalog = "projetoSistemas")
public class Lote implements java.io.Serializable {

	private Integer codLote;
	private int codPropriedade;
	private String descricaoLote;
	private Date dataCriacao;
	private Date dataEncerramento;

	public Lote() {
	}

	public Lote(int codPropriedade) {
		this.codPropriedade = codPropriedade;
	}

	public Lote(int codPropriedade, String descricaoLote, Date dataCriacao, Date dataEncerramento) {
		this.codPropriedade = codPropriedade;
		this.descricaoLote = descricaoLote;
		this.dataCriacao = dataCriacao;
		this.dataEncerramento = dataEncerramento;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	@Column(name = "cod_lote", unique = true, nullable = false)
	public Integer getCodLote() {
		return this.codLote;
	}

	public void setCodLote(Integer codLote) {
		this.codLote = codLote;
	}

	@Column(name = "cod_propriedade", nullable = false)
	public int getCodPropriedade() {
		return this.codPropriedade;
	}

	public void setCodPropriedade(int codPropriedade) {
		this.codPropriedade = codPropriedade;
	}

	@Column(name = "descricao_lote", length = 250)
	public String getDescricaoLote() {
		return this.descricaoLote;
	}

	public void setDescricaoLote(String descricaoLote) {
		this.descricaoLote = descricaoLote;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "data_criacao", length = 10)
	public Date getDataCriacao() {
		return this.dataCriacao;
	}

	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "data_encerramento", length = 10)
	public Date getDataEncerramento() {
		return this.dataEncerramento;
	}

	public void setDataEncerramento(Date dataEncerramento) {
		this.dataEncerramento = dataEncerramento;
	}

}
