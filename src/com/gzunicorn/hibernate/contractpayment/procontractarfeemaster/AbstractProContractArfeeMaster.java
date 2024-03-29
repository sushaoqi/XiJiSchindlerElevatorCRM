package com.gzunicorn.hibernate.contractpayment.procontractarfeemaster;

/**
 * AbstractProContractArfeeMaster entity provides the base persistence
 * definition of the ProContractArfeeMaster entity. @author MyEclipse
 * Persistence Tools
 */

public abstract class AbstractProContractArfeeMaster implements
		java.io.Serializable {

	// Fields

	private String jnlNo;
	private String billNo;
	private String contractNo;
	private String contractType;
	private String companyId;
	private String recName;
	private Double preMoney;
	private String preDate;
	private String maintDivision;
	private String operId;
	private String operDate;
	private String rem;
	private String auditOperid;
	private String auditStatus;
	private String auditDate;
	private String auditRem;
	private String submitType;
	private String r1;
	private String r2;
	private String r3;
	private String r4;
	private String r5;
	private Double r6;
	private Double r7;
	private Double r8;
	private Integer r9;
	private Integer r10;
	private String maintStation;
	private String maintScope;
	private String warnRem;
	private String modifyId;
	private String modifyDate;
	private String oldPreDate;
	private Double oldPreMoney;

	// Constructors

	public String getModifyId() {
		return modifyId;
	}

	public void setModifyId(String modifyId) {
		this.modifyId = modifyId;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getOldPreDate() {
		return oldPreDate;
	}

	public void setOldPreDate(String oldPreDate) {
		this.oldPreDate = oldPreDate;
	}

	public Double getOldPreMoney() {
		return oldPreMoney;
	}

	public void setOldPreMoney(Double oldPreMoney) {
		this.oldPreMoney = oldPreMoney;
	}
	// Constructors

	/** default constructor */
	public AbstractProContractArfeeMaster() {
	}

	/** minimal constructor */
	public AbstractProContractArfeeMaster(String jnlNo, String billNo,
			String contractNo, String contractType, String companyId,
			String recName, Double preMoney, String preDate,
			String maintDivision, String operId, String operDate,
			String submitType) {
		this.jnlNo = jnlNo;
		this.billNo = billNo;
		this.contractNo = contractNo;
		this.contractType = contractType;
		this.companyId = companyId;
		this.recName = recName;
		this.preMoney = preMoney;
		this.preDate = preDate;
		this.maintDivision = maintDivision;
		this.operId = operId;
		this.operDate = operDate;
		this.submitType = submitType;
	}

	/** full constructor */
	public AbstractProContractArfeeMaster(String jnlNo, String billNo,
			String contractNo, String contractType, String companyId,
			String recName, Double preMoney, String preDate,
			String maintDivision, String operId, String operDate, String rem,
			String auditOperid, String auditStatus, String auditDate,
			String auditRem, String submitType, String r1, String r2,
			String r3, String r4, String r5, Double r6, Double r7, Double r8,
			Integer r9, Integer r10, String maintStation, String maintScope,
			String warnRem,String modifyId, String modifyDate, String oldPreDate,Double oldPreMoney) {
		this.modifyId=modifyId;
		this.modifyDate=modifyDate;
		this.oldPreDate=oldPreDate;
		this.oldPreMoney=oldPreMoney;
		this.jnlNo = jnlNo;
		this.billNo = billNo;
		this.contractNo = contractNo;
		this.contractType = contractType;
		this.companyId = companyId;
		this.recName = recName;
		this.preMoney = preMoney;
		this.preDate = preDate;
		this.maintDivision = maintDivision;
		this.operId = operId;
		this.operDate = operDate;
		this.rem = rem;
		this.auditOperid = auditOperid;
		this.auditStatus = auditStatus;
		this.auditDate = auditDate;
		this.auditRem = auditRem;
		this.submitType = submitType;
		this.r1 = r1;
		this.r2 = r2;
		this.r3 = r3;
		this.r4 = r4;
		this.r5 = r5;
		this.r6 = r6;
		this.r7 = r7;
		this.r8 = r8;
		this.r9 = r9;
		this.r10 = r10;
		this.maintStation = maintStation;
		this.maintScope = maintScope;
		this.warnRem = warnRem;
	}

	// Property accessors

	public String getJnlNo() {
		return this.jnlNo;
	}

	public void setJnlNo(String jnlNo) {
		this.jnlNo = jnlNo;
	}

	public String getBillNo() {
		return this.billNo;
	}

	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}

	public String getContractNo() {
		return this.contractNo;
	}

	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}

	public String getContractType() {
		return this.contractType;
	}

	public void setContractType(String contractType) {
		this.contractType = contractType;
	}

	public String getCompanyId() {
		return this.companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getRecName() {
		return this.recName;
	}

	public void setRecName(String recName) {
		this.recName = recName;
	}

	public Double getPreMoney() {
		return this.preMoney;
	}

	public void setPreMoney(Double preMoney) {
		this.preMoney = preMoney;
	}

	public String getPreDate() {
		return this.preDate;
	}

	public void setPreDate(String preDate) {
		this.preDate = preDate;
	}

	public String getMaintDivision() {
		return this.maintDivision;
	}

	public void setMaintDivision(String maintDivision) {
		this.maintDivision = maintDivision;
	}

	public String getOperId() {
		return this.operId;
	}

	public void setOperId(String operId) {
		this.operId = operId;
	}

	public String getOperDate() {
		return this.operDate;
	}

	public void setOperDate(String operDate) {
		this.operDate = operDate;
	}

	public String getRem() {
		return this.rem;
	}

	public void setRem(String rem) {
		this.rem = rem;
	}

	public String getAuditOperid() {
		return this.auditOperid;
	}

	public void setAuditOperid(String auditOperid) {
		this.auditOperid = auditOperid;
	}

	public String getAuditStatus() {
		return this.auditStatus;
	}

	public void setAuditStatus(String auditStatus) {
		this.auditStatus = auditStatus;
	}

	public String getAuditDate() {
		return this.auditDate;
	}

	public void setAuditDate(String auditDate) {
		this.auditDate = auditDate;
	}

	public String getAuditRem() {
		return this.auditRem;
	}

	public void setAuditRem(String auditRem) {
		this.auditRem = auditRem;
	}

	public String getSubmitType() {
		return this.submitType;
	}

	public void setSubmitType(String submitType) {
		this.submitType = submitType;
	}

	public String getR1() {
		return this.r1;
	}

	public void setR1(String r1) {
		this.r1 = r1;
	}

	public String getR2() {
		return this.r2;
	}

	public void setR2(String r2) {
		this.r2 = r2;
	}

	public String getR3() {
		return this.r3;
	}

	public void setR3(String r3) {
		this.r3 = r3;
	}

	public String getR4() {
		return this.r4;
	}

	public void setR4(String r4) {
		this.r4 = r4;
	}

	public String getR5() {
		return this.r5;
	}

	public void setR5(String r5) {
		this.r5 = r5;
	}

	public Double getR6() {
		return this.r6;
	}

	public void setR6(Double r6) {
		this.r6 = r6;
	}

	public Double getR7() {
		return this.r7;
	}

	public void setR7(Double r7) {
		this.r7 = r7;
	}

	public Double getR8() {
		return this.r8;
	}

	public void setR8(Double r8) {
		this.r8 = r8;
	}

	public Integer getR9() {
		return this.r9;
	}

	public void setR9(Integer r9) {
		this.r9 = r9;
	}

	public Integer getR10() {
		return this.r10;
	}

	public void setR10(Integer r10) {
		this.r10 = r10;
	}

	public String getMaintStation() {
		return this.maintStation;
	}

	public void setMaintStation(String maintStation) {
		this.maintStation = maintStation;
	}

	public String getMaintScope() {
		return this.maintScope;
	}

	public void setMaintScope(String maintScope) {
		this.maintScope = maintScope;
	}

	public String getWarnRem() {
		return this.warnRem;
	}

	public void setWarnRem(String warnRem) {
		this.warnRem = warnRem;
	}

}