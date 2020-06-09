/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package campaign;

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
public class campaignImpl implements campiagnInter{

    @Override
    public campaignModal addcampaign(campaignModal m) {
                  MongoClient  mongoClient = null;
                  
                  System.out.println("here add the campaign: "+ m.getTemplateId());
                  
          campaignModal c=m;
                  
          try 
         {
             MongoClientURI connectionString = new MongoClientURI("mongodb+srv://god_father:uppertab@mycluster-jd4oh.mongodb.net/test?retryWrites=true&w=majority");

             mongoClient = new MongoClient(connectionString);
              MongoDatabase database = mongoClient.getDatabase("emailCampaign");
           //Preparing a document
             Document document = new Document();
            
     
         document.append("subClientID", m.getSubclientID());
         document.append("campaignID", m.getCampiagnID());
         document.append("campaignName", m.getCampiagnName());
         document.append("description", m.getDescription());
         document.append("region", m.getRegion());
         document.append("status", "Active");
         document.append("templateID", m.getTemplateId());
         
         
         //Inserting the document into the collection
           database.getCollection("campaign").insertOne(document);
           
           mongoClient.close();

             
              } catch (Exception e) {
                  mongoClient.close();
                  e.printStackTrace();
        }

        return c;

     }

    @Override
    public List<campaignModal> getAllCampaign(int campiagnID) {
        
        MongoClient mongoClient = null;
             MongoCollection<Document> collection=null;
             List<campaignModal> list=null;
         try 
         {
             System.out.println("here we come in the method"+ campiagnID);
             list=new ArrayList<campaignModal>();
             MongoClientURI connectionString = new MongoClientURI("mongodb+srv://god_father:uppertab@mycluster-jd4oh.mongodb.net/test?retryWrites=true&w=majority");
             mongoClient = new MongoClient(connectionString);
             MongoDatabase database = mongoClient.getDatabase("emailCampaign");
                   collection = database.getCollection("campaign");
                   Document doc = new Document();
                  doc.put("subClientID", campiagnID);
                        
                    FindIterable<Document> docs=collection.find(doc);
                     for (Document d : docs) 
                     {
                       campaignModal c =new campaignModal(); 
                       c.setCampiagnID(d.getInteger("campaignID"));
                       c.setCampiagnName(d.getString("campaignName"));
                       c.setDescription(d.getString("description"));
                       c.setRegion(d.getString("region"));
                       c.setStatus(d.getString("status"));
                       c.setTemplateId(d.getInteger("templateID"));
                       System.out.println(d.getInteger("campaignID")+" "+d.getString("description"));
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
    public int deleteCampaign(int campiagnID) {
        MongoClient mongoClient = null;
          MongoCollection<Document> collection=null;
          int delete=0;
          try 
         {
             MongoClientURI connectionString = new MongoClientURI("mongodb+srv://god_father:uppertab@mycluster-jd4oh.mongodb.net/test?retryWrites=true&w=majority");
             mongoClient = new MongoClient(connectionString);
            MongoDatabase database = mongoClient.getDatabase("emailCampaign");
                   collection = database.getCollection("campaign");
                   Document doc = new Document();
                  doc.put("campaignID", campiagnID);
                  
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
    public campaignModal updateCampaign(campaignModal c) {
          MongoClient mongoClient = null;
          MongoCollection<Document> collection=null;
          System.out.println("here updation ::"+ c.getTemplateId());
            campaignModal c2=null;
        try 
         {
             System.out.println("here:: " +c.getDescription()+" "+ c.getCampiagnName()+" "+ c.getRegion()+" "+ c.getStatus());
              MongoClientURI connectionString = new MongoClientURI("mongodb+srv://god_father:uppertab@mycluster-jd4oh.mongodb.net/test?retryWrites=true&w=majority");
             mongoClient = new MongoClient(connectionString);
            MongoDatabase database = mongoClient.getDatabase("emailCampaign");
                   collection = database.getCollection("campaign");
                   
                   Document doc = new Document();
                  doc.put("campaignID", c.getCampiagnID());

                   List<Bson> ds=new ArrayList<>();
                        
   		Bson updateOperationDocument1 = new Document("$set", new Document("campaignName", c.getCampiagnName()));
                Bson updateOperationDocument2= new Document("$set", new Document("description", c.getDescription()));
                Bson updateOperationDocument3= new Document("$set", new Document("region", c.getRegion()));
                Bson updateOperationDocument4= new Document("$set", new Document("status", c.getStatus()));
                Bson updateOperationDocument5= new Document("$set", new Document("templateID", c.getTemplateId()));

                ds.add(updateOperationDocument1);
                ds.add(updateOperationDocument2);
                ds.add(updateOperationDocument3);
                ds.add(updateOperationDocument4);
                ds.add(updateOperationDocument5);
                 
                 UpdateResult ur= collection.updateMany(doc, ds);
                  if(ur.getModifiedCount()>0)
                 {
                       c2=c;
                  }
          }
          catch(Exception e)
          {
              e.printStackTrace();
          }
        return c;

    }
    
}
