/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package subClient;

import clientModal.clientmodal;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;
import java.util.ArrayList;
import java.util.List;
import org.bson.Document;
import org.bson.conversions.Bson;

/**
 *
 * @author 11141
 */
public class subclientImpl implements subClientInter{

    @Override
    public subClientmodal addSubClient(subClientmodal m) {
          MongoClient mongoClient = null;
          subClientmodal c=m;
                  
          try 
         {
            MongoClientURI connectionString = new MongoClientURI("mongodb+srv://god_father:uppertab@mycluster-jd4oh.mongodb.net/test?retryWrites=true&w=majority");

             mongoClient = new MongoClient(connectionString);
              MongoDatabase database = mongoClient.getDatabase("emailCampaign");
           //Preparing a document
            Document document = new Document();
            
     
         document.append("clientId", m.getClientId());
         document.append("subclientId", m.getSubclientId());
         document.append("programName", m.getProgramName());
         document.append("description", m.getDescription());
         
         //Inserting the document into the collection
           database.getCollection("subClient").insertOne(document);
           
           mongoClient.close();

             
              } catch (Exception e) {
                  mongoClient.close();
                  e.printStackTrace();
        }

        return c;
     }

    @Override
    public List<subClientmodal> subclients(int clientID) {
             MongoClient mongoClient = null;
             MongoCollection<Document> collection=null;
             List<subClientmodal> list=null;
         try 
         {
             System.out.println("here we come in the method"+ clientID);
             list=new ArrayList<subClientmodal>();
             MongoClientURI connectionString = new MongoClientURI("mongodb+srv://god_father:uppertab@mycluster-jd4oh.mongodb.net/test?retryWrites=true&w=majority");
             mongoClient = new MongoClient(connectionString);
             MongoDatabase database = mongoClient.getDatabase("emailCampaign");
                   collection = database.getCollection("subClient");
                   Document doc = new Document();
                  doc.put("clientId", clientID);
                        
                    FindIterable<Document> docs=collection.find(doc);
                     for (Document d : docs) 
                     {
                       subClientmodal c =new subClientmodal(); 
                       c.setSubclientId(d.getInteger("subclientId"));
                       c.setProgramName(d.getString("programName"));
                       c.setDescription(d.getString("description"));
                       System.out.println(d.getInteger("subclientId")+" "+d.getString("description"));
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
    public int deleteSubClient(int subClientId) {
          MongoClient mongoClient = null;
          MongoCollection<Document> collection=null;
          int delete=0;
          try 
         {
             MongoClientURI connectionString = new MongoClientURI("mongodb+srv://god_father:uppertab@mycluster-jd4oh.mongodb.net/test?retryWrites=true&w=majority");
             mongoClient = new MongoClient(connectionString);
            MongoDatabase database = mongoClient.getDatabase("emailCampaign");
                   collection = database.getCollection("subClient");
                   Document doc = new Document();
                  doc.put("subclientId", subClientId);
                  
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
    public subClientmodal updatesubClient(subClientmodal sub) {
  MongoClient mongoClient = null;
          MongoCollection<Document> collection=null;
            subClientmodal c=null;
        try 
         {
             System.out.println("here:: " +sub.getDescription()+" "+ sub.getProgramName()+" "+ sub.getSubclientId());
              MongoClientURI connectionString = new MongoClientURI("mongodb+srv://god_father:uppertab@mycluster-jd4oh.mongodb.net/test?retryWrites=true&w=majority");
             mongoClient = new MongoClient(connectionString);
            MongoDatabase database = mongoClient.getDatabase("emailCampaign");
                   collection = database.getCollection("subClient");
                   
                   Document doc = new Document();
                  doc.put("subclientId", sub.getSubclientId());

                   List<Bson> ds=new ArrayList<>();
                   
  		Bson updateOperationDocument1 = new Document("$set", new Document("programName", sub.getProgramName()));
                Bson updateOperationDocument2= new Document("$set", new Document("description", sub.getDescription()));
                ds.add(updateOperationDocument1);
                ds.add(updateOperationDocument2);
                
                
                 UpdateResult ur= collection.updateMany(doc, ds);
                  if(ur.getModifiedCount()>0)
                 {
                       c=sub;
                  }
          }
          catch(Exception e)
          {
              e.printStackTrace();
          }
        return c;
    }
    
}
