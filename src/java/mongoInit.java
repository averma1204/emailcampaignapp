
import com.mongodb.MongoClient;
import com.mongodb.MongoCredential;
import com.mongodb.client.MongoDatabase;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

    public class mongoInit implements ServletContextListener   
  {
      public void contextInitialized(ServletContextEvent event) {  
          
            System.out.println("called servlet lisenter");
 
     }  
  
        public void contextDestroyed(ServletContextEvent arg0)
        {
            System.out.println("servlet destory");
        }  
    }  


