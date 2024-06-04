package filters;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
	        throws IOException, ServletException {
	    HttpServletRequest req = (HttpServletRequest) request;
	    HttpServletResponse res = (HttpServletResponse) response;
	    
	    String uri = req.getRequestURI();    
	    
	    HttpSession session = req.getSession(false);
	    boolean isLoggedIn = session != null && session.getAttribute("user") != null;
	    
	    // Allow access to certain resources without authentication
	    if (uri.endsWith(".css") || uri.endsWith(".jpg") || uri.endsWith("Register.jsp") || uri.endsWith("pages/Home.jsp") || uri.endsWith("Contactus.jsp")) {
	        chain.doFilter(request, response);
	        return;
	    }
	    
	    // Redirect to login page if not logged in and trying to access restricted resources
	    if (!isLoggedIn && (uri.endsWith("Profile.jsp") || uri.endsWith("Cart.jsp")|| uri.endsWith("AddToCartServlet.java"))) {
	        res.sendRedirect(req.getContextPath() + "/pages/Login.jsp");
	        return;
	    }
	    if (!isLoggedIn && (uri.endsWith("Profile.jsp") || uri.endsWith("Cart.jsp"))) {
	        res.sendRedirect(req.getContextPath() + "/pages/Login.jsp");
	        return;
	    }
	    if (!isLoggedIn && (uri.endsWith("AdminProductList")|| uri.endsWith("AdminOrderServlet") || uri.endsWith("Message.jsp"))) {
	    	  res.sendRedirect(req.getContextPath() + "/pages/Login.jsp");
	          return;
	       
	    }
//	    // Allow access to other resources if logged in or not trying to access restricted resources
	    chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
			
	}

}
