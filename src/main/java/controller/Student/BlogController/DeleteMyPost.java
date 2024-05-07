package controller.Student.BlogController;

import java.io.*;

import dal.PostDAO;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "DeleteMyPostServlet", value = "/delete-my-post")
public class DeleteMyPost extends HttpServlet {
    private String message;
    private PostDAO postDAO;
    public void init() {
        message = "Hello World!";
        postDAO=new PostDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if(request.getParameter("id")!=null){
           try{
               int id=Integer.parseInt(request.getParameter("id"));
               postDAO.delete(id);
               response.sendRedirect("/my-posts");
           }catch (Exception e){
               e.printStackTrace();
           }
        }
    }

    public void destroy() {
    }
}