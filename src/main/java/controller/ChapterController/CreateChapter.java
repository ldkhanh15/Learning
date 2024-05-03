package controller.ChapterController;

import java.io.*;

import dal.ChapterDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Chapter;

@WebServlet(name = "CreateChapterServlet", value = "/dashboard/create-chapter")
public class CreateChapter extends HttpServlet {
    private String message;
    private ChapterDAO chapterDAO;
    public void init() {
        message = "Hello World!";
        chapterDAO = new ChapterDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("postid")!=null){
            String id=request.getParameter("id");
            request.setAttribute("postid",id);
            request.getRequestDispatcher("").forward(request,response);
        }else{
            request.setAttribute("error","Please enter a post id");
            request.getRequestDispatcher("").forward(request,response);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String courseId=request.getParameter("courseid");
        String name=request.getParameter("name");
        String ordinal=request.getParameter("ordinal");
        try{
            chapterDAO.create(new Chapter(
                    Integer.parseInt(courseId),
                    name,
                    ordinal
            ));
            response.sendRedirect("/dashboard/chapter?courseid="+courseId);
        }catch (Exception e){
            request.setAttribute("error","Please enter a post id");
            request.getRequestDispatcher("").forward(request,response);
        }
    }
    public void destroy() {
    }
}