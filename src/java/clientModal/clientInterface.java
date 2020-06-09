/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clientModal;

import java.util.List;

/**
 *
 * @author 11141
 */
public interface clientInterface {
    
    public void addClient(clientmodal cm);
    public List<clientmodal> getClient(long userId);
    public int deleteClient(int clientId);
    public int updateClient(int clientId,String clientName,String description);
    public void addTemplate(long userId, int temId,String temName,String encodeTemp);
    public void emailConfigure(long userID,String emailID,String password);
    public List<templateModal> getAlltemplate(long userID);
    
    public String getSelectedTemp(int campID);
    public String getEmailPass(long userID);
    public int sendEmail(String email,String password,String content,String subject,String emailto);

 }
