package command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.Processo;

public class ListarProcessoPuxar implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		@SuppressWarnings("unchecked")
		ArrayList<Processo> processos = (ArrayList<Processo>)request.getSession().getAttribute("Meus Processos");
		
		
	    String json = new Gson().toJson(processos);

	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);		
	}
}