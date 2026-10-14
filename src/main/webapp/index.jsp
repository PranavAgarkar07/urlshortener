<%-- Landing page: forwards to Spring controller, do not open JSPs in WEB-INF directly --%>
<% response.sendRedirect(request.getContextPath() + "/login"); %>
