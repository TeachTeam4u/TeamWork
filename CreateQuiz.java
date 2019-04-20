/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Hassam Ali Shah
 */
public class CreateQuiz extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            ArrayList<String> about =new ArrayList<String>();
            Cookie ck[] = request.getCookies();
            about.add(ck[1].getValue());
            about.add(request.getParameter("subject"));
            about.add(request.getParameter("topic"));
            
            DataBase obj = new DataBase();
            int qid=obj.Insert_Initial_Quiz(about);
            if(qid>0){
                ArrayList<String> question = new ArrayList<String>();

                question.add(request.getParameter("Q1"));
                question.add(request.getParameter("A1"));
                question.add(request.getParameter("B1"));
                question.add(request.getParameter("C1"));
                question.add(request.getParameter("D1"));
                question.add(request.getParameter("E1"));
                question.add(request.getParameter("F1"));

                if((obj.Inser_second_part_quiz(question,qid))){
                    question.clear();
                }                   
                else
                    System.out.println("Inser_second_part_quiz returns false");

                question.add(request.getParameter("Q2"));
                question.add(request.getParameter("A2"));
                question.add(request.getParameter("B2"));
                question.add(request.getParameter("C2"));
                question.add(request.getParameter("D2"));
                question.add(request.getParameter("E2"));
                question.add(request.getParameter("F2"));

                obj.Inser_second_part_quiz(question,qid);
                question.clear();

                question.add(request.getParameter("Q3"));
                question.add(request.getParameter("A3"));
                question.add(request.getParameter("B3"));
                question.add(request.getParameter("C3"));
                question.add(request.getParameter("D3"));
                question.add(request.getParameter("E3"));
                question.add(request.getParameter("F3"));

                obj.Inser_second_part_quiz(question,qid);
                question.clear();            

                question.add(request.getParameter("Q4"));
                question.add(request.getParameter("A4"));
                question.add(request.getParameter("B4"));
                question.add(request.getParameter("C4"));
                question.add(request.getParameter("D4"));
                question.add(request.getParameter("E4"));
                question.add(request.getParameter("F4"));

                obj.Inser_second_part_quiz(question,qid);
                question.clear();

                question.add(request.getParameter("Q5"));
                question.add(request.getParameter("A5"));
                question.add(request.getParameter("B5"));
                question.add(request.getParameter("C5"));
                question.add(request.getParameter("D5"));
                question.add(request.getParameter("E5"));
                question.add(request.getParameter("F5"));

                obj.Inser_second_part_quiz(question,qid);
                question.clear();
                response.sendRedirect("teacher.jsp");
/*
                question.add(request.getParameter("Q6"));
                question.add(request.getParameter("A6"));
                question.add(request.getParameter("B6"));
                question.add(request.getParameter("C6"));
                question.add(request.getParameter("D6"));
                question.add(request.getParameter("E6"));
                question.add(request.getParameter("F6"));

                obj.Inser_second_part_quiz(question,qid);
                question.clear();

                question.add(request.getParameter("Q7"));
                question.add(request.getParameter("A7"));
                question.add(request.getParameter("B7"));
                question.add(request.getParameter("C7"));
                question.add(request.getParameter("D7"));
                question.add(request.getParameter("E7"));
                question.add(request.getParameter("F7"));

                obj.Inser_second_part_quiz(question,qid);
                question.clear();

                question.add(request.getParameter("Q8"));
                question.add(request.getParameter("A8"));
                question.add(request.getParameter("B8"));
                question.add(request.getParameter("C8"));
                question.add(request.getParameter("D8"));
                question.add(request.getParameter("E8"));
                question.add(request.getParameter("F8"));

                obj.Inser_second_part_quiz(question,qid);
                question.clear();

                question.add(request.getParameter("Q9"));
                question.add(request.getParameter("A9"));
                question.add(request.getParameter("B9"));
                question.add(request.getParameter("C9"));
                question.add(request.getParameter("D9"));
                question.add(request.getParameter("E9"));
                question.add(request.getParameter("F9"));

                obj.Inser_second_part_quiz(question,qid);
                question.clear();

                question.add(request.getParameter("Q10"));
                question.add(request.getParameter("A10"));
                question.add(request.getParameter("B10"));
                question.add(request.getParameter("C10"));
                question.add(request.getParameter("D10"));
                question.add(request.getParameter("E10"));
                question.add(request.getParameter("F10"));

                obj.Inser_second_part_quiz(question,qid);
                question.clear();
                */
            }
            else
                System.out.println("quiz id is less than 0");
        }
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
