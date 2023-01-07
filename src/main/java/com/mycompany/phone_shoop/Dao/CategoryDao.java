package com.mycompany.phone_shoop.Dao;

import com.mycompany.phone_shoop.entities.Category;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    // save the category to bdd
    public int saveCategory(Category cat) {
            Session session=this.factory.openSession();
            Transaction tr=session.beginTransaction();
            int catId=(int)session.save(cat);
            tr.commit();
            session.close();
            return catId;
    }
    
    public List<Category> getCategories() {
            Session s=this.factory.openSession();
            Query query=s.createQuery("from Category");
            List<Category> categories = query.list();
            s.close();
            return categories;
    }
    
    public Category getCategoryById(int id) {
        Category cat=null;
        try {
            Session s=this.factory.openSession();
            cat=s.get(Category.class ,id);
            s.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return  cat;
    }
}
