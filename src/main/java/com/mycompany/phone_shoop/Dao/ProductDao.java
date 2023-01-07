package com.mycompany.phone_shoop.Dao;

import com.mycompany.phone_shoop.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {
    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public  boolean saveProduct(Product product){
        boolean status = false;
        try {
            Session session = this.factory.openSession();
            Transaction tr=session.beginTransaction();
            session.save(product);
            tr.commit();
            session.close();
            status = true;
        } catch(Exception e ){
            e.printStackTrace();
        }
        return  status;
    }
    
    public List<Product> getAllProducts() {
        Session s=this.factory.openSession();
        Query query=s.createQuery("from Product");
        List<Product> list = query.list();
        s.close();
        return list;
    }
    
    // get all products of given category 
    public List<Product> getAllProductsByCatId(int cid) {
        Session s=this.factory.openSession();
        Query query=s.createQuery("from Product as p where p.category.categoryId =: id");
        query.setParameter("id", cid);
        List<Product> list = query.list();
        s.close();
        return list;
    }
}
