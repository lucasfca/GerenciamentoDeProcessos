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

import model.Processo;

public class InserirProcesso implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// busca o writer
				PrintWriter out = response.getWriter();
				
				String nomeProcesso = request.getParameter("nomeProcesso");
				String pTempoChegada = request.getParameter("tempoChegada");
				String pDuracao = request.getParameter("duracao");
				
				int tempoChegada = 0;
				try {
					tempoChegada = Integer.parseInt(pTempoChegada);
				} catch (NumberFormatException e) {
				}
				
				int duracao = 0;
				try {
					duracao = Integer.parseInt(pDuracao);
				} catch (NumberFormatException e) {
				}
				
				Processo p = new Processo(nomeProcesso,tempoChegada,duracao);
				@SuppressWarnings("unchecked")
				ArrayList<Processo> processos = (ArrayList<Processo>)request.getSession().getAttribute("Meus Processos");
				
				if (processos == null) {
					processos = new ArrayList<Processo>();
					processos.add(p);
					request.getSession().setAttribute("Meus Processos", processos);
					request.getRequestDispatcher("ProcessoAdicionado.jsp").forward(request,response);
				}
				else {
					processos.add(p);
					request.getSession().setAttribute("Meus Processos", processos);
					request.getRequestDispatcher("ProcessoAdicionado.jsp").forward(request,response);
				}
	}

}
