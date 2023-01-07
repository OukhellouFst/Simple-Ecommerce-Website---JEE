package com.mycompany.phone_shoop.servlets;

import com.mycompany.phone_shoop.Dao.CategoryDao;
import com.mycompany.phone_shoop.Dao.ProductDao;
import com.mycompany.phone_shoop.entities.Category;
import com.mycompany.phone_shoop.entities.Product;
import com.mycompany.phone_shoop.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            // check the type of operation ( addCategory or product )
            String op = request.getParameter("operation");
            if(op.trim().equals("addCategory")){
                // add category
                // fetching category data 
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");
                Category cat= new Category();
                cat.setCategoryTitle(title);
                cat.setCategoryDescription(description);
                // category database save;
                CategoryDao catDao=new CategoryDao(FactoryProvider.getFactory());
                catDao.saveCategory(cat);
                // add message of success to session
                HttpSession httpSession=request.getSession();
                httpSession.setAttribute("message", "A new Category has been added successufly ");
                response.sendRedirect("admin.jsp");
            } else if(op.trim().equals("addProduct")){
                // add product
                // fetching the data 
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                int pPrice =Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount =Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity =Integer.parseInt(request.getParameter("pQuantity"));
                int catId =Integer.parseInt(request.getParameter("catId"));
                Part part= request.getPart("pPic");
                
                Product p=new Product();
                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpPrice(pPrice);
                p.setpDiscount(pDiscount);
                p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());
                
                // get Category by id 
                CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
                Category cat=(Category)catDao.getCategoryById(catId);
                p.setCategory(cat);
                
                // pic upload 
                // find out the path to upload photo
                String path = request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
                
                try {
                    // uploading code 
                    FileOutputStream fos = new FileOutputStream(path);
                    InputStream is = part.getInputStream();
                    // reading and writing data
                    byte[] data = new byte[is.available()];
                    is.read(data);
                    fos.write(data);
                    fos.close();
                }catch(Exception e) {
                    e.printStackTrace();
                }
                
                // save the new product into db 
                ProductDao pDao=new ProductDao(FactoryProvider.getFactory());
                pDao.saveProduct(p);

                
                // add message to session ( success) 
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "New product has been added successfuly");
                response.sendRedirect("admin.jsp");
                
            }else {
                
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
