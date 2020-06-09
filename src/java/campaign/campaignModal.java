/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package campaign;

/**
 *
 * @author 11141
 */
public class campaignModal {
    private int subclientID;
    private int campiagnID;
    private String campiagnName;
    private String description;
    private String region;
    private String status;
    private int templateId;

    public int getTemplateId() {
        return templateId;
    }

    public void setTemplateId(int templateId) {
        this.templateId = templateId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
    public int getCampiagnID() {
        return campiagnID;
    }

    public void setCampiagnID(int campiagnID) {
        this.campiagnID = campiagnID;
    }

    public String getCampiagnName() {
        return campiagnName;
    }

    public void setCampiagnName(String campiagnName) {
        this.campiagnName = campiagnName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public int getSubclientID() {
        return subclientID;
    }

    public void setSubclientID(int subclientID) {
        this.subclientID = subclientID;
    }
     
    
    
}
