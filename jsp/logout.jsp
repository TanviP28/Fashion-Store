<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
session.invalidate();

out.println("<script>setTimeout(function(){location.href = '../html/index1.html'; }, 100);</script>");
%>