package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Modelo.Cliente;
import java.text.DecimalFormat;
import java.util.ArrayList;
import ModeloDAO.ClienteDAO;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\" crossorigin=\"anonymous\"> \n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css\" integrity=\"sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"Estilos/estilos.css\"/>\n");
      out.write("        <script type=\"text/javascript\" src=\"Js/codigo.js\"></script> \n");
      out.write("        <title>Technology Networks</title>\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("      <header class=\"page-header\">\n");
      out.write("       ");

            if(request.getAttribute("contador")==null){
                request.setAttribute("contador", 0);
            }
            /*else{
                request.setAttribute("contador", request.getAttribute("contador"));
            }   */        
       
      out.write(" \n");
      out.write("        ");

            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("cliente") == null) {
        
      out.write("\n");
      out.write("        ");

        } else {
      out.print( sesion.getAttribute("cliente"));
      out.write("\n");
      out.write("        ");
}
      out.write(" \n");
      out.write("    </header>\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("        <div class=\"container mt-4 col-lg-4\">\n");
      out.write("            <div class=\"card col-sm-10\">\n");
      out.write("                <div class=\"card-body text-center\">\n");
      out.write("                    <form class =\"form-sign\" action=\"Control?accion=login\" method=\"POST\">\n");
      out.write("                        <div class=\"form-group text-center\">\n");
      out.write("                            <h3>Bienvenidos a</h3> \n");
      out.write("                            <img src=\"Img/3.jpeg\" alt=\"300\" width=\"500\"/>\n");
      out.write("                            \n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group text-left\">\n");
      out.write("                            <label>Usuario:</label>\n");
      out.write("                            <input type=\"text\" placeholder=\"Introduce Su Usuario...\" name=\"txtlogin\" class=\"form-control\" required=\"\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group text-left\">\n");
      out.write("                            <label>Password:</label>\n");
      out.write("                            <input type=\"password\" placeholder=\"Introduce Su Contraseña ...\" name=\"txtpassword\"  id=\"txtpassword\" class=\"form-control\" required=\"\">\n");
      out.write("                        </div>\n");
      out.write("                        <input type=\"submit\" name=\"accion\" value=\"Login\" class=\"btn btn-primary btn-blog\">\n");
      out.write("                        <div>\n");
      out.write("                            <br>\n");
      out.write("                        </div>\n");
      out.write("                        <div>\n");
      out.write("                        <button data-toggle=\"modal\" data-target=\"#ventana1\" href=\"#\" class=\"btn btn-primary btn-blog\">Recuperar contraseña</button>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("                                            \n");
      out.write("          <div class=\"modal fade\" id=\"ventana1\">\n");
      out.write("            <div class=\"modal-dialog\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("                    <form action=\"Control?accion=recuperar\" method=\"POST\">   \n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("                            <label>Email</label>\n");
      out.write("                            <input type=\"text\" placeholder=\"Introduca su Correo Electronico\" name=\"txtemail\" id=\"txtemail\" class=\"form-control\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">   \n");
      out.write("                        <button type=\"submit\" value=\"Login\"  class=\"btn btn-info\" data-toggle=\"modal\" data-target=\"#ventana2\" href=\"#\" >Enviar</button>\n");
      out.write("                        <button class=\"btn btn-danger btn-large\" data-dismiss=\"modal\" aria-hidden=\"true\">Cancelar</button>\n");
      out.write("                        </div>\n");
      out.write("                    </form>                           \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("             <div class=\"modal fade\" id=\"ventana2\">\n");
      out.write("            <div class=\"modal-dialog\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("                    <a>Mensaje Enviado Correctamente</a>                     \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("                                                                                     \n");
      out.write("                 <!-- PARA SEGUIR CON MOSTRAR CONTRASEÑA -->\n");
      out.write("                <!-- https://www.baulphp.com/3-formas-para-mostrar-y-ocultar-contrasenas/ -->                 \n");
      out.write("             \n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js\" integrity=\"sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js\" integrity=\"sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13\" crossorigin=\"anonymous\"></script>\n");
      out.write("    \n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\" integrity=\"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\" integrity=\"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM\" crossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("    \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
