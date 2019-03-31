package controller;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.util.Date;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class XMLController
 */
@WebServlet("/JSON.do")
public class JSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JSON() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 
        /* -------------------------------------------------------
         * TESTE 1 
         * cria um JSONObject para armazenar dados de um filme
         * -------------------------------------------------------*/
         
        //instancia um novo JSONObject
		String nome = request.getParameter("nome");
		String dataInicio = request.getParameter("inicial");
		String dataFinal = request.getParameter("final");
		String totalDias = request.getParameter("totalDias");
		
        JSONObject my_obj = new JSONObject();
 
        //preenche o objeto com os campos: titulo, ano e genero
        my_obj.put("totalDias", totalDias);
        my_obj.put("dataInicio", dataInicio);
        my_obj.put("dataFinal", dataFinal);  
        my_obj.put("projeto", nome);
        
         
        //serializa para uma string e imprime
        String json_string = my_obj.toString();
        System.out.println(json_string);
        System.out.println();
        
        PrintWriter out = response.getWriter();
		out.println(json_string);
        
        FileWriter fw = new FileWriter("b.json");
		fw.write(json_string);
		response.setContentType("application/json");
		fw.close();
		
		
		//out.println("<a href='arquivo4.xml' onclick=\"window.open('arquivo4.xml');\">download</a>");
		//response.sendRedirect("a.xml");
	}

}
