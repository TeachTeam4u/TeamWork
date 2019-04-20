/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

/**
 *
 * @author Hassam Ali Shah
 */
import java.sql.*;
import java.util.*;
import java.io.*;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author Hassam Ali Shah
 */

public class DataBase {
    Connection con;
    Statement st;
    ResultSet rs;
    public DataBase(){
        try{
           // System.out.println("Inside Constructor");
            Class.forName ("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
            st = con.createStatement();
        }
        catch(Exception e){
            System.out.println("Exception in connection of DataBase : "+e);
        }
    }
/*    
    public Boolean matched(String uName, String pWord){
        String query = "SELECT * FROM users";
        Boolean rtr = false;
        try{
            rs = st.executeQuery(query);
            while(rs.next()){
                String temp1,temp2,temp3;
                temp1 = rs.getString("Name");
                temp2 = rs.getString("Password");
                if(temp1.equals(uName)&&temp2.equals(pWord))
                    rtr = true;
                temp3 = rs.getString("Type");
            }
        }
        catch(Exception e){
            System.out.println("Exception in matched Function : "+e);
        }
        return rtr;
    }
    public Boolean signUp(String uName, String pWord, String type){
        if(matched(uName,pWord))
            return false;
        else{
            uName = "'"+uName+"'";
            pWord = "'"+pWord+"'";
            type = "'"+type+"'";
            System.out.println(uName+" "+pWord+" "+type);
            String query = "INSERT into users VALUES("+uName+","+pWord+","+type+")";
            try{
               st.executeUpdate(query);
               System.out.println("Updated");
            }
            catch(Exception e){
                System.out.println("Exception in SignUp: "+e);
            }
            
        }
        return true;
    }
*/
    public Boolean checkStudent(String userName,String Password){
        try{
            String query;
            query = "SELECT * FROM student";
            rs = st.executeQuery(query);
            while (rs.next())
            {
               if(userName.equals(rs.getString("userName")) && Password.equals(rs.getString("Password"))){
                   return true; // return from here when data found in student table
               }
            }
        }
        catch(Exception e){
            System.out.println("Eception in student "+e);
        }
        return false;
    }
    public Boolean checkTeacher(String userName,String Password){
        try{
            String query;
            query = "SELECT * FROM teacher";
            rs = st.executeQuery(query);
            while (rs.next())
            {
               if(userName.equals(rs.getString("userName")) && Password.equals(rs.getString("Password"))){
                   return true; // return from here when data found in student table
               }
            }
        }
        catch(Exception e){
            System.out.println("Eception in student "+e);
        }
        return false;
    }
    public String verifyuser (String userName , String password)// verify user student or teacher
    {
        if(checkStudent(userName,password))
            return "student";
        else if(checkTeacher(userName,password))
            return "teacher";
        else
            return "not found";
    }
    public int insertUser (String userName, String F_name , String L_name, String password , String type)// on new account
    {
        if(checkStudent(userName,password) && checkTeacher(userName,password)){
            System.out.println("Already assigned");
            return 0;
        }
        else{
            int result = 0;
            try{
                userName = "'"+userName+"'";
                F_name = "'"+F_name+"'";
                L_name = "'"+L_name+"'";
                password = "'"+password+"'";  
                String quizId ="NULL",marks="NULL";
            if(type.equals("student")){
                String query ="INSERT INTO student VALUE ("+userName+","+F_name+","+L_name+","+password+","+quizId+","+marks+")";// from net stackoverflow
                System.out.println(query);
                result =st.executeUpdate(query);
            }
            else if(type.equals("teacher"))
            {
                String query ="INSERT INTO teacher VALUE ("+userName+","+F_name+","+L_name+","+password+")";
                result = st.executeUpdate(query);
            }
            if (result > 0)
                {
                    System.out.println("Successfully Inserted");
                    return 1;
                }
            else
                {
                    System.out.println("Not Inserted");
                }
            }
            catch (Exception e)
                {
                System.out.println ("Error: " + e);
            }
        }
        return -1;
    }
    public String getName(String name,String passw,String type){
        String rtr = "Not Found";
        try{
            if(type.equals("student")){
                String query = "SELECT * FROM student";
                rs = st.executeQuery(query);
                while(rs.next()){
                    if(name.equals(rs.getString("userName")) && passw.equals(rs.getString("Password")))
                        rtr = rs.getString("Name");
                }
                System.out.println("Inside Student");
            }
            else{
                System.out.println("Inside teacher");
                String query = "SELECT * FROM teacher";
                rs = st.executeQuery(query);
                while(rs.next()){
                    if(name.equals(rs.getString("userName")) && passw.equals(rs.getString("Password")))
                        rtr = rs.getString("Name");
                }
            }
        }
        catch(Exception e){
            System.out.println("Exception in get Name function in DataBase "+e);
        }
        return rtr;
    }
    
    public int Insert_Initial_Quiz(ArrayList<String> arry){
        String teacher_id = "'"+arry.get(0)+"'";
        String Subject = "'"+arry.get(1)+"'";
        String Topic = "'"+arry.get(2)+"'";
        try{
          /*    String query = "SELECT * FROM teacher WHERE userName = "+teacher_id;
            rs = st.executeQuery(query);
            if(!(rs.next())){
                return -2;
            }*/
            String query = "SELECT * FROM quiz";
            rs = st.executeQuery(query);
            int quiz_id=0;
            while(rs.next()){
                quiz_id=rs.getInt("Quiz_Id");
            }
            quiz_id++;
            //System.out.println(query);
            System.out.println("Quiz_Id: "+quiz_id);
            query = "INSERT INTO quiz VALUES("+teacher_id+","+"'"+quiz_id+"'"+","+Topic+","+Subject+")";
            System.out.println(query);
           int res = st.executeUpdate(query);
           System.out.println("After Execution");
           System.out.println("result: "+res);
           if(res>0){
               return quiz_id;
           }
           else
               return -2;
        }
        catch(Exception e){
            System.out.println(e);
        }
        return -2;
    }

    public Boolean Inser_second_part_quiz(ArrayList<String> arr , int qid){
        
         
            String question = "'"+arr.get(0)+"'";
            String op1 = "'"+arr.get(1)+"'";
            String op2 = "'"+arr.get(2)+"'";
            String op3 = "'"+arr.get(3)+"'";
            String op4 = "'"+arr.get(4)+"'";
            String cor = "'"+arr.get(5)+"'";
            String disc = "'"+arr.get(6)+"'";
            
            String query = "SELECT * FROM Question";
            try{
                rs = st.executeQuery(query);
                int Question_Id = 0;
                while(rs.next()){
                    Question_Id = rs.getInt("Question_Id");
                }
                Question_Id++;
                //String questionNo =  Integer.toString(Question_Id);
                query = "INSERT INTO question VALUE("+qid+","+"'"+Question_Id+"'"+","+question+","+op1+","+op2+","+op3+","+op4+","+cor+","+disc+")";
                int res = st.executeUpdate(query);
                if(!(res>0)){
                    return false;
                }
            }
            catch(Exception e){
                System.out.println(e);
            }
        
     return true;
    }
/*    public Boolean Insert_Quiz(ArrayList<String> arr1 , ArrayList<Object> arr2){
        int qid;
        qid = Insert_Initial_Quiz(arr1);
        if(qid<0)
            return false;
        else{
            return Inser_second_part_quiz(arr2.get(0),qid);
        }
    }*/
}
