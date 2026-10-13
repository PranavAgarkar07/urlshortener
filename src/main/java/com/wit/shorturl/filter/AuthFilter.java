package com.wit.shorturl.filter;

import org.springframework.stereotype.Component;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

// Unit-II: Filter + Session. Blocks dashboard without login.
// Teacher line: "Filter runs before Servlet, checks session."
@Component
public class AuthFilter implements Filter {

    public void doFilter(ServletRequest rq, ServletResponse rs,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) rq;
        String p = req.getRequestURI();
        // allow login/register pages and short links without login
        if (p.endsWith("/login") || p.endsWith("/register") || p.contains("/s/")) {
            chain.doFilter(rq, rs);
            return;
        }
        HttpSession s = req.getSession(false);
        if (s == null || s.getAttribute("user") == null) {
            ((HttpServletResponse) rs).sendRedirect(req.getContextPath() + "/login");
            return;
        }
        chain.doFilter(rq, rs);
    }
}
