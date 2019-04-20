/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
/*import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
*/

/**
 *
 * @author Hassam Ali Shah
 */
public class NewServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("form-username");
        String password = request.getParameter("form-password");
        DataBase dbObj = new DataBase();
        String check = dbObj.verifyuser(name, password);
        if(check.equals("student")){
       //   request.setAttribute("username", dbObj.getName(name, password, "student"));
       //     RequestDispatcher rd = request.getRequestDispatcher("/main");
       //     rd.forward(request,response);
       //
            Cookie ck = new Cookie("name",dbObj.getName(name, password, "student"));
            response.addCookie(ck);
            response.sendRedirect("student.jsp");
        }
        else if(check.equals("teacher")){
        //    request.setAttribute("username", dbObj.getName(name, password, "teacher"));
        //    RequestDispatcher rd = request.getRequestDispatcher("teacher.jsp");
        //    rd.forward(request,response);
        //
        //    System.out.println("name: "+name+"  Password: "+password);
            Cookie ck = new Cookie("name",name);
           // Cookie ck2 = new Cookie("username",name);
            response.addCookie(ck);
           // response.addCookie(ck2);
            response.sendRedirect("teacher.jsp");
        }
        else{
            response.sendRedirect("login2.html");
        }
//      response.setContentType("text/html;charset=UTF-8");
//        try(PrintWriter out = response.getWriter()){
//            if(check.equals("student")){
//                out.print(dbObj.getName(name, password, "student"));
//            }
//            else if(check.equals("teacher")){
//                out.print(dbObj.getName(name, password, "teacher"));
//            }
//            else
//                out.print("Not Found");
//        }
     
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>


}
