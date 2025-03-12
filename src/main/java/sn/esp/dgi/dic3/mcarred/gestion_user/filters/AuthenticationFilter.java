package sn.esp.dgi.dic3.mcarred.gestion_user.filters;

import javax.servlet.*;
// import jakarta.servlet.annotation.WebFilter;
// import jakarta.servlet.http.HttpServletRequest;
// import jakarta.servlet.http.HttpServletResponse;
// import jakarta.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import java.io.IOException;

@WebFilter(filterName = "AuthenticationFilter", urlPatterns = {"/add", "/edit", "/delete", "/list"})
public class AuthenticationFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        boolean isAuthenticated = session != null && session.getAttribute("utilisateur") != null;
        
        if (isAuthenticated) {
            chain.doFilter(request, response);
        } else {
            httpRequest.setAttribute("errorMessage", "Veuillez vous connecter pour accéder à cette page");
            httpRequest.getRequestDispatcher("/login").forward(request, response);
        }
    }

    @Override
    public void destroy() {
    }
}