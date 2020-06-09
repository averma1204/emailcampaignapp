/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package subClient;

import java.util.List;

/**
 *
 * @author 11141
 */
public interface subClientInter {
    
    public subClientmodal addSubClient(subClientmodal sub);
    public List<subClientmodal> subclients(int ClientId);
    public int deleteSubClient(int subClientId);
    public subClientmodal updatesubClient(subClientmodal sub);
}
