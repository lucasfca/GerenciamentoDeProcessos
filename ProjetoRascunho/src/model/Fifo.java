package model;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Scanner;

import javax.swing.JOptionPane;

public class Fifo {
 @SuppressWarnings({ "rawtypes", "unchecked" })
public static void main(String[] args) {
  // declaracao de variaveis
  @SuppressWarnings("resource")
Scanner scanner = new Scanner(System.in);
  int N, entrada, tempoAtual;
  double tempoExecucao, tempoEspera, turnaround; // Turnaround é o tempo de permanência
  ArrayList<Integer> processos, tempoChegada, burst, temposFinais, temposIniciais;
  int contTeste = 0; 
  String formato, saida;
  DecimalFormat decimal = new DecimalFormat("0.00");

   System.out.println("Quantos processos deseja armazenar? ");
   N = scanner.nextInt();
  
  while (N != 0) {
   contTeste++;
   // Iniciando as variaveis
   processos = new ArrayList();
   tempoChegada = new ArrayList();
   burst = new ArrayList();
   temposFinais = new ArrayList();
   temposIniciais = new ArrayList();
   tempoEspera = 0;
   tempoExecucao = 0;
   turnaround = 0;

   for (int i = 1; i <= N; i++) {
    // adiciona processo a lista de processos
	   System.out.println("Qual o tempo de chegada do processo P" + i + " ?");
	   
	   entrada = scanner.nextInt();
	   tempoChegada.add(entrada);
    
	   System.out.println("Qual o burst do processo P" + i);
	   entrada = scanner.nextInt();
	   burst.add(entrada);
	   processos.add(i);

   }

   // tempo inicial = tempo de ingresso do primeiro processo
   tempoAtual =  tempoChegada.get(0);

   // adicionando tempos de inicio e termino dos processos
   for (int i = 0; i < N; i++) {
    if (tempoChegada.get(i) > tempoAtual) {
     tempoAtual =  tempoChegada.get(i);
    }
    temposIniciais.add(tempoAtual);
    tempoAtual += burst.get(i);
    temposFinais.add(tempoAtual);
   }

   // calculo dos tempos medios de espera e execucao
   for (int i = 0; i < N; i++) {
    tempoExecucao += temposFinais.get(i) - tempoChegada.get(i);
    tempoEspera += temposIniciais.get(i) - tempoChegada.get(i);
   }
   
   System.out.println("Processamento PART" + contTeste);
   System.out.println("|       ESCALONAMENTO FIFO       |");
   
   for (int i = 0; i < N; i++) {
	   turnaround = temposFinais.get(i) - tempoChegada.get(i);
	   formato = decimal.format(turnaround);
	   saida = "|Turnaround| p" + i + ": " + formato + "ms";
	   saida = saida.replace(".",",");
	   System.out.println(saida);
   }
   
   		System.out.println("|----------------------------------");
   tempoExecucao = tempoExecucao / N;
   tempoEspera = tempoEspera / N;
   System.out.println("Teste " + contTeste);

   formato = decimal.format(tempoExecucao);
   saida = "Tempo medio de execucao: " + formato + "s";
   saida = saida.replace(".", ",");
   System.out.println(saida);

   formato = decimal.format(tempoEspera);
   saida = "Tempo medio de espera: " + formato + "s";
   saida = saida.replace(".", ",");
   System.out.println(saida);

   // ordem dos processos = em tempo de entrada
   System.out.println("|-------------GRAFICO DE GANTT--------------|");
   for (int i = 0; i < N; i++) {
    System.out.print("P" + processos.get(i) + " ");
   }
   System.out.println();
   System.out.println();
   N = scanner.nextInt();
  }
 }
}