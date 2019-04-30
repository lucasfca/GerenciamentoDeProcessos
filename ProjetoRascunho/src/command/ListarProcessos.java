package command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import model.Processo;

public class ListarProcessos implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		HttpSession session = request.getSession();
		Processo processo = new Processo();
				@SuppressWarnings("unchecked")
				ArrayList<Processo> processos = (ArrayList<Processo>)request.getSession().getAttribute("Meus Processos");
				
			    
				String erro="";
				if (processos == null) {
					erro = "Não existe nenhum processo";
					request.getSession().setAttribute("Erro", erro);
					request.getRequestDispatcher("erro.jsp").forward(request, response);;
				}
				else {
					session.setAttribute("processos", processos);
					request.getRequestDispatcher("inserirProcesso.jsp").forward(request, response);;
				}
				
				
				
				
	}

}
