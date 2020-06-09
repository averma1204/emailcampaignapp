    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registerModal;


import com.mongodb.BasicDBObject;
import com.mongodb.ConnectionString;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientSettings;
import com.mongodb.MongoClientURI;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletContext;
import org.bson.Document;

/**
 *
 * @author 11141
 */
public class registerImpl implements Interface{

      
   @Override 
  public Map registerUser(modal m) {
     
 System.out.println("first time time time time time");

  MongoClient mongoClient = null;
 Map<String,String> map=null;  
 MongoCollection<Document> collection=null;
         try 
         {
            MongoClientURI connectionString = new MongoClientURI("mongodb+srv://god_father:uppertab@mycluster-jd4oh.mongodb.net/test?retryWrites=true&w=majority");

             mongoClient = new MongoClient(connectionString);
            map=new HashMap<String,String>();  
             MongoDatabase database = mongoClient.getDatabase("emailCampaign");
           //Preparing a document
            Document document = new Document();
         document.append("userId", m.getUserId());
         document.append("fullName", m.getFullName());
         document.append("emailId", m.getEmailId());
         document.append("userPassword", m.getPassword());
         document.append("confirmPassword", m.isConfirmPassword());
         document.append("createdDate", m.getCreateDate());
         document.append("modifiedDate", m.getModifiedDate());
         
         //Inserting the document into the collection
          database.getCollection("registerUser").insertOne(document);
          mongoClient.close();

             
              } catch (Exception e) {
                  mongoClient.close();
                  e.printStackTrace();
        }
       return map;
    }

    @Override
    public String ValidateUser(String emailId) {
          MongoClient mongoClient = null;
          MongoCollection<Document> collection=null;
          String password=null;
         try 
         {
            MongoClientURI connectionString = new MongoClientURI("mongodb+srv://god_father:uppertab@mycluster-jd4oh.mongodb.net/test?retryWrites=true&w=majority");

            mongoClient = new MongoClient(connectionString);
            MongoDatabase database = mongoClient.getDatabase("emailCampaign");
                        collection = database.getCollection("registerUser");
                  
                  Document doc = new Document();
                  doc.put("emailId", emailId);
                        
                 Document result = collection.find(doc).iterator().next();
                
                 String pass=result.getString("userPassword");  
                 String username=result.getString("fullName");  
                 String userId=result.getLong("userId").toString();  

                    password=pass+":"+username+":"+userId;
                 mongoClient.close();

         }
         catch(Exception e)
         {
                   mongoClient.close();
                  e.printStackTrace();
         }
        return password;
     }
    
     
}
