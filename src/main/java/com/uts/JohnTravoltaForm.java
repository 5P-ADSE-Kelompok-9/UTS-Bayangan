package com.uts;

import java.math.BigDecimal;

public class JohnTravoltaForm {

    private String inputName;
    private BigDecimal jamKerja;
    private BigDecimal upahPerJam;
    private BigDecimal pengeluaran;

    public String getInputName() {
        return inputName;
    }

    public void setInputName(String inputName) {
        this.inputName = inputName;
    }

    public BigDecimal getJamKerja() {
        return jamKerja;
    }

    public void setJamKerja(BigDecimal jamKerja) {
        this.jamKerja = jamKerja;
    }

    public BigDecimal getUpahPerJam() {
        return upahPerJam;
    }

    public void setUpahPerJam(BigDecimal upahPerJam) {
        this.upahPerJam = upahPerJam;
    }

    public BigDecimal getPengeluaran() {
        return pengeluaran;
    }

    public void setPengeluaran(BigDecimal pengeluaran) {
        this.pengeluaran = pengeluaran;
    }
}