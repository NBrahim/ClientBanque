<%@page import="java.util.ArrayList"%>
<%@page import="service.Compte"%>
<%@page import="java.util.List"%>
<%@page import="service.BanqueWSProxy"%>
<%@page import="service.BanqueServiceService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
double mt=0;
double rs=0;
double solde=0;
Compte cpts[]=null;
Compte cpt=null;
BanqueWSProxy stub=new BanqueWSProxy();
if(request.getParameter("montant")!=null){
	mt=Double.parseDouble(request.getParameter("montant"));
	rs=stub.conversionEuroToDA(mt);
   cpts= stub.getCompts();
}
if(request.getParameter("solde")!=null){
	solde=stub.getCompte(Integer.parseInt(request.getParameter("solde"))).getSolde();
	 cpt=stub.getCompte(Integer.parseInt(request.getParameter("solde")));
		}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="banque.jsp">
Mantant: <input type="text" name="montant" value="<%=mt%>">
<input type="submit" value="OK">
</form>
<br><br>
Le montant est <%=rs %>
<br><br>
<table border="1px solid black" >
   <tr>
       <th>Code</th>
       <th>Solde</th>
       <th>Conversion EURO vs DA</th>
   </tr>
     <%
   
   if (cpts!=null && cpt==null){
   for (int i=0; i<cpts.length; i++){
	 %>
   <tr>
       <td><%=cpts[i].getCode() %></td>
       <td><%=cpts[i].getSolde() %> Euros</td>
       <td><%=stub.conversionEuroToDA(cpts[i].getSolde()) %> DA</td>
   </tr>
   <%} 
   } else{%>
      <tr>
       <td><%=cpt.getCode() %></td>
       <td><%=cpt.getSolde() %> Euros</td>
       <td><%=stub.conversionEuroToDA(cpt.getSolde()) %> DA</td>
   </tr>
 <%} %>
</table>
<br><br>
<form action="banque.jsp">
Code : <input type="text" name="solde" >
<input type="submit" value="OK">
</form>
<br><br>
Le solde est:  <%=solde %>
</body>
</html>