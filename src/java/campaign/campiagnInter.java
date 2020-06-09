/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package campaign;

import java.util.List;

/**
 *
 * @author 11141
 */
public interface campiagnInter {
    
    public campaignModal addcampaign(campaignModal m);
    public List<campaignModal> getAllCampaign(int campiagnID);
    public int deleteCampaign(int campiagnID);
    public campaignModal updateCampaign(campaignModal c);
}
