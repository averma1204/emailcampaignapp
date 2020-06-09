/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clientModal;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.bson.Document;
import org.bson.conversions.Bson;

/**
 *
 * @author 11141
 */
public class ClientImpl implements  clientInterface{

    @Override
    public void addClient(clientmodal m) {
        
  MongoClient mongoClient = null;
          try 
         {
            MongoClientURI connectionString = new MongoClientURI("mongodb+srv://god_father:uppertab@mycluster-jd4oh.mongodb.net/test?retryWrites=true&w=majority");

             mongoClient = new MongoClient(connectionString);
              MongoDatabase database = mongoClient.getDatabase("emailCampaign");
           //Preparing a document
            Document document = new Document();
         document.append("userId", m.getUserId());
         document.append("clientId", m.getClientId());
         document.append("clientName", m.getClientName());
         document.append("description", m.getDescription());
         
         //Inserting the document into the collection
          database.getCollection("clients").insertOne(document);
          mongoClient.close();

             
              } catch (Exception e) {
                  mongoClient.close();
                  e.printStackTrace();
        }
     }

    @Override
    public List<clientmodal> getClient(long userId) {
            MongoClient mongoClient = null;
             MongoCollection<Document> collection=null;
             String password=null;
             List<clientmodal> list=null;
            try 
            {
                 list=new ArrayList<clientmodal>();
               MongoClientURI connectionString = new MongoClientURI("mongodb+srv://god_father:uppertab@mycluster-jd4oh.mongodb.net/test?retryWrites=true&w=majority");
                mongoClient = new MongoClient(connectionString);
               MongoDatabase database = mongoClient.getDatabase("emailCampaign");
                      collection = database.getCollection("clients");
                      Document doc = new Document();
                     doc.put("userId", userId);

                       FindIterable<Document> docs=collection.find(doc);
                        for (Document d : docs) 
                        {
                           clientmodal c =new clientmodal(); 
                           c.setClientId(d.getInteger("clientId"));
                          c.setClientName(d.getString("clientName"));
                          c.setDescription(d.getString("description"));
                          System.out.println(d.getString("clientName")+" "+d.getString("description"));
                          list.add(c);
                        }

                      mongoClient.close();
             }
            catch(Exception e)
            {
                      mongoClient.close();
                     e.printStackTrace();
            }
            return list;
     }

    @Override
    public int deleteClient(int clientId) {
         MongoClient mongoClient = null;
          MongoCollection<Document> collection=null;
          int delete=0;
          try 
         {
             MongoClientURI connectionString = new MongoClientURI("mongodb+srv://god_father:uppertab@mycluster-jd4oh.mongodb.net/test?retryWrites=true&w=majority");
             mongoClient = new MongoClient(connectionString);
            MongoDatabase database = mongoClient.getDatabase("emailCampaign");
                   collection = database.getCollection("clients");
                   Document doc = new Document();
                  doc.put("clientId", clientId);
                  
                DeleteResult dr=  collection.deleteOne(doc);
                System.out.println("delete :"+dr.getDeletedCount());
                if(dr.getDeletedCount()>0)
                {
                 delete=1;   
                }
                 
         }
         catch(Exception e)
         {
             e.printStackTrace();
         }
        return delete;
     }

    @Override
    public int updateClient(int clientId, String clientName, String description) {
          MongoClient mongoClient = null;
          MongoCollection<Document> collection=null;
          int update1=0;
          try 
         {
             System.out.println("updation here::"+clientId+" "+ clientName+" "+ description);
             MongoClientURI connectionString = new MongoClientURI("mongodb+srv://god_father:uppertab@mycluster-jd4oh.mongodb.net/test?retryWrites=true&w=majority");
             mongoClient = new MongoClient(connectionString);
            MongoDatabase database = mongoClient.getDatabase("emailCampaign");
                   collection = database.getCollection("clients");
                   
                   Document doc = new Document();
                  doc.put("clientId", clientId);

                   List<Bson> ds=new ArrayList<>();
                   
  		Bson updateOperationDocument1 = new Document("$set", new Document("clientName", clientName));
                Bson updateOperationDocument2= new Document("$set", new Document("description", description));
                ds.add(updateOperationDocument1);
                ds.add(updateOperationDocument2);
                
                
                 UpdateResult ur= collection.updateMany(doc, ds);
                  if(ur.getModifiedCount()>0)
                 {
                    update1=1; 
                 }
          }
          catch(Exception e)
          {
              e.printStackTrace();
          }
        return update1;
     }

    @Override
    public void addTemplate( long userID,int tempId,String temName, String encodeTemp) {
        
  MongoClient mongoClient = null;
          try 
         {
            MongoClientURI connectionString = new MongoClientURI("mongodb+srv://god_father:uppertab@mycluster-jd4oh.mongodb.net/test?retryWrites=true&w=majority");

             mongoClient = new MongoClient(connectionString);
              MongoDatabase database = mongoClient.getDatabase("emailCampaign");
           //Preparing a document
            Document document = new Document();
            document.append("userId",userID);
          document.append("tempID", tempId);
         document.append("tempName", temName);
         document.append("tempView", encodeTemp);
          
         //Inserting the document into the collection
          database.getCollection("templateHolder").insertOne(document);
          mongoClient.close();

             
              } catch (Exception e) {
                  mongoClient.close();
                  e.printStackTrace();
        }
    }

    @Override
    public void emailConfigure(long userID, String emailID, String password) {
         MongoClient mongoClient = null;
          MongoCollection<Document> collection=null;
          MongoDatabase database =null;
          try 
         {
             System.out.println("here value:"+userID+" "+emailID+" "+password);
             MongoClientURI connectionString = new MongoClientURI("mongodb+srv://god_father:uppertab@mycluster-jd4oh.mongodb.net/test?retryWrites=true&w=majority");
             mongoClient = new MongoClient(connectionString);
             database = mongoClient.getDatabase("emailCampaign");
                   collection = database.getCollection("emailConfiguration");
                   Document doc1 = new Document();
                  doc1.put("userID", userID);
                 // doc1.put("emailID", emailID);
                  Document result = collection.find(doc1).iterator().next();

                        if(result!=null && result.containsKey("userID"))
                      {
                          System.out.println("email  in collection");   
                            Document doc = new Document();
                            doc.put("userID", userID);

                   List<Bson> ds=new ArrayList<>();
                   
  		Bson updateOperationDocument1 = new Document("$set", new Document("emailID", emailID));
                Bson updateOperationDocument2= new Document("$set", new Document("password", password));
                ds.add(updateOperationDocument1);
                ds.add(updateOperationDocument2);
                
                
                 UpdateResult ur= collection.updateMany(doc, ds);
                      }
                      else
                      {
                          System.out.println("email not in collection");

                             Document document = new Document();
                        document.append("userID", userID);
                        document.append("emailID", emailID);
                        document.append("password", password);
          
                            //Inserting the document into the collection
                            database.getCollection("emailConfiguration").insertOne(document);
                      }
                   mongoClient.close();
          }
         catch(Exception e)
         {
                                       System.out.println("email not in collection");

                             Document document = new Document();
                        document.append("userID", userID);
                        document.append("emailID", emailID);
                        document.append("password", password);
          
                            //Inserting the document into the collection
                            database.getCollection("emailConfiguration").insertOne(document);

                   mongoClient.close();
                  e.printStackTrace();
         }
     }

    @Override
    public List<templateModal> getAlltemplate(long userID) {
        MongoClient mongoClient = null;
          MongoCollection<Document> collection=null;
           List list=null;
         try 
         {
              list=new ArrayList<clientmodal>();
            MongoClientURI connectionString = new MongoClientURI("mongodb+srv://god_father:uppertab@mycluster-jd4oh.mongodb.net/test?retryWrites=true&w=majority");
             mongoClient = new MongoClient(connectionString);
            MongoDatabase database = mongoClient.getDatabase("emailCampaign");
                   collection = database.getCollection("templateHolder");
                   Document doc = new Document();
                  doc.put("userId", userID);
                        
                    FindIterable<Document> docs=collection.find(doc);
                     for (Document d : docs) 
                      {
                          templateModal t=new templateModal();
                          t.setTemplateID(d.getInteger("tempID"));
                          t.setTemplateName(d.getString("tempName"));
                            list.add(t);
                       }
                    mongoClient.close();
          }
         catch(Exception e)
         {
                   mongoClient.close();
                  e.printStackTrace();
         }
         return list;

     }

    @Override
    public String getSelectedTemp(int campID) {
        String tempView=null;
        MongoClient mongoClient = null;
          MongoCollection<Document> collection=null;
          MongoDatabase database =null;
          try 
         {

             MongoClientURI connectionString = new MongoClientURI("mongodb+srv://god_father:uppertab@mycluster-jd4oh.mongodb.net/test?retryWrites=true&w=majority");
             mongoClient = new MongoClient(connectionString);
             database = mongoClient.getDatabase("emailCampaign");
                   collection = database.getCollection("campaign");
                   Document doc1 = new Document();
                  doc1.put("campaignID", campID);
                 // doc1.put("emailID", emailID);
                  Document result = collection.find(doc1).iterator().next();
                    int tempId=result.getInteger("templateID");
 
                    
                    
                    MongoCollection<Document>  collection2 = database.getCollection("templateHolder");
                   Document doc2 = new Document();
                   doc2.put("tempID", tempId);
 
                    Document result2 = collection2.find(doc2).iterator().next();
                    
                    tempView=result2.getString("tempView");

                    System.out.println("here temp View:"+ tempView);
             mongoClient.close();

       }
          catch(Exception e)
          {
              e.printStackTrace();
             mongoClient.close();
          }
            return  tempView;
      }

    @Override
    public String getEmailPass(long userID) {
        System.out.println("userID are here:: "+userID);
        String emailpass=null;
         MongoClient mongoClient = null;
          MongoCollection<Document> collection=null;
          MongoDatabase database =null;
          try 
         {
             MongoClientURI connectionString = new MongoClientURI("mongodb+srv://god_father:uppertab@mycluster-jd4oh.mongodb.net/test?retryWrites=true&w=majority");
             mongoClient = new MongoClient(connectionString);
             database = mongoClient.getDatabase("emailCampaign");
                   collection = database.getCollection("emailConfiguration");
                   Document doc1 = new Document();
                  doc1.put("userID", userID);
                 // doc1.put("emailID", emailID);
                  Document result = collection.find(doc1).iterator().next();
                    String email=result.getString("emailID");
                    String pass=result.getString("password");
                    emailpass=email+" : "+pass;
                    System.out.println("emailpass: "+emailpass);
                    mongoClient.close();

         }
          catch(Exception e)
          {
              e.printStackTrace();
              mongoClient.close();
          }
        return emailpass;
     }

    @Override
    public int sendEmail(String email, String password, String content,String subject,String emailto) {
        
        Properties props = new Properties();    
          props.put("mail.smtp.host", "smtp.gmail.com");    
          props.put("mail.smtp.socketFactory.port", "465");    
          props.put("mail.smtp.socketFactory.class",    
                    "javax.net.ssl.SSLSocketFactory");    
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", "465");    
          //get Session   
          Session session = Session.getDefaultInstance(props,    
           new javax.mail.Authenticator() {    
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication(email,password);  
           }    
          });    
          //compose message    
          try {    
           MimeMessage message = new MimeMessage(session);    
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(emailto));    
           message.setSubject(subject);  
            message.setContent(content, "text/html");
            //send message  
           Transport.send(message);    
           System.out.println("message sent successfully");    
          } catch (MessagingException e) {throw new RuntimeException(e);} 
          return 1;
    }
  }
