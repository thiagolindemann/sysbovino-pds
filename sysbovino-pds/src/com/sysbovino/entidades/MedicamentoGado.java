package com.sysbovino.entidades;
// Generated 07/10/2015 20:17:36 by Hibernate Tools 4.0.0

import java.math.BigDecimal;
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
 * MedicamentoGado generated by hbm2java
 */
@Entity
@Table(name = "medicamento_gado", catalog = "projetoSistemas")
public class MedicamentoGado implements java.io.Serializable {

	private Integer codHistoricoMedicacao;
	private int codGado;
	private int codPessoa;
	private int codMedicamento;
	private String loteMedicamento;
	private Date dataMedicacao;
	private String observacao;
	private BigDecimal dosagemMg;

	public MedicamentoGado() {
	}

	public MedicamentoGado(int codGado, int codPessoa, int codMedicamento, Date dataMedicacao, BigDecimal dosagemMg) {
		this.codGado = codGado;
		this.codPessoa = codPessoa;
		this.codMedicamento = codMedicamento;
		this.dataMedicacao = dataMedicacao;
		this.dosagemMg = dosagemMg;
	}

	public MedicamentoGado(int codGado, int codPessoa, int codMedicamento, String loteMedicamento, Date dataMedicacao,
			String observacao, BigDecimal dosagemMg) {
		this.codGado = codGado;
		this.codPessoa = codPessoa;
		this.codMedicamento = codMedicamento;
		this.loteMedicamento = loteMedicamento;
		this.dataMedicacao = dataMedicacao;
		this.observacao = observacao;
		this.dosagemMg = dosagemMg;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	@Column(name = "cod_historico_medicacao", unique = true, nullable = false)
	public Integer getCodHistoricoMedicacao() {
		return this.codHistoricoMedicacao;
	}

	public void setCodHistoricoMedicacao(Integer codHistoricoMedicacao) {
		this.codHistoricoMedicacao = codHistoricoMedicacao;
	}

	@Column(name = "cod_gado", nullable = false)
	public int getCodGado() {
		return this.codGado;
	}

	public void setCodGado(int codGado) {
		this.codGado = codGado;
	}

	@Column(name = "cod_pessoa", nullable = false)
	public int getCodPessoa() {
		return this.codPessoa;
	}

	public void setCodPessoa(int codPessoa) {
		this.codPessoa = codPessoa;
	}

	@Column(name = "cod_medicamento", nullable = false)
	public int getCodMedicamento() {
		return this.codMedicamento;
	}

	public void setCodMedicamento(int codMedicamento) {
		this.codMedicamento = codMedicamento;
	}

	@Column(name = "lote_medicamento", length = 15)
	public String getLoteMedicamento() {
		return this.loteMedicamento;
	}

	public void setLoteMedicamento(String loteMedicamento) {
		this.loteMedicamento = loteMedicamento;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_medicacao", nullable = false, length = 19)
	public Date getDataMedicacao() {
		return this.dataMedicacao;
	}

	public void setDataMedicacao(Date dataMedicacao) {
		this.dataMedicacao = dataMedicacao;
	}

	@Column(name = "observacao", length = 500)
	public String getObservacao() {
		return this.observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	@Column(name = "dosagem_mg", nullable = false, precision = 5)
	public BigDecimal getDosagemMg() {
		return this.dosagemMg;
	}

	public void setDosagemMg(BigDecimal dosagemMg) {
		this.dosagemMg = dosagemMg;
	}

}
