//package resource;
//
//import java.util.ArrayList;
//import java.util.List;
//  
//import javax.ws.rs.Consumes;
//import javax.ws.rs.DELETE;
//import javax.ws.rs.GET;
//import javax.ws.rs.POST;
//import javax.ws.rs.PUT;
//import javax.ws.rs.Path;
//import javax.ws.rs.PathParam;
//import javax.ws.rs.Produces;
//import javax.ws.rs.WebApplicationException;
//import javax.ws.rs.core.MediaType;
//import javax.ws.rs.core.Response;
//  
//import model.Processo;
////API QUE NÃO VAI SER UTILIZADA!!
//  
//@Path("/processo")
//public class ProcessoResource {
//  
// private static List<Processo> processos = new ArrayList<Processo>();
//  
// @GET
// @Produces(MediaType.APPLICATION_JSON)
// @Path("/{processoId}")
// public Processo getProcesso(@PathParam("processoId") int id) {
//  
//  Processo result = null;
//  
//  for (Processo processo : processos) {
//   if (processo.getId() == id) {
//    result = processo;
//    break;
//   }
//  }
//  
//  if (result == null) {
//   throw new WebApplicationException(404);
//  }
//  
//  return result;
// }
//  
// @GET
// @Produces(MediaType.APPLICATION_JSON)
// public List<Processo> list() {
//  return processos;
// }
//  
// @GET
// @Path("/find/NomeProcesso")
// @Produces(MediaType.APPLICATION_JSON)
// public List<Processo> findByName(@PathParam("nomeProcesso") String nomeProcesso) {
//  
//  List<Processo> result = new ArrayList<Processo>();
//  
//  for (Processo processo : processos) {
//   if (processo.getNomeProcesso() != null
//     && processo.getNomeProcesso().toLowerCase()
//        .contains(nomeProcesso.toLowerCase())) {
//    result.add(processo);
//   }
//  }
//  
//  return result;
// }
//  
// @POST
// @Consumes(MediaType.APPLICATION_JSON)
// @Produces(MediaType.APPLICATION_JSON)
// public Processo add(Processo processo) {
//  
//  if (processo.getNomeProcesso() == null || processo.getNomeProcesso().trim().equals("")) {
//   throw new WebApplicationException(Response
//     .status(Response.Status.BAD_REQUEST)
//     .entity("O nome do processo é obrigatório").build());
//  }
//  
//  processos.add(processo);
//  processo.setId(processos.indexOf(processo) + 1);
//  return processo;
// }
//  
// @PUT
// @Path("/{id}")
// @Consumes(MediaType.APPLICATION_JSON)
// public void update(@PathParam("id") int id, Processo processo) {
//  processos.set(id - 1, processo);
//  processo.setId(processos.indexOf(processo) + 1);
// }
//  
// @DELETE
// @Path("/{id}")
// public void delete(@PathParam("id") int id) {
//  Processo processo = processos.get(id - 1);
//  processos.remove(processo);
// }
//  
//}