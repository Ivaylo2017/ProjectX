<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Enroll</title>
	</head>
	<body>
	<form:form action="${pageContext.request.contextPath}/charge" modelAttribute="chargeRequest" method="POST" id="checkout-form">
		    <form:hidden path="amount" />
		    <label>Price:<span>${amount/100}</span></label>
		    <script src='https://checkout.stripe.com/checkout.js' class='stripe-button'
	        	attr='data-key=${stripePublicKey}, 
	         	data-amount=${chargeRequest.amount}, 
	         	data-currency=${chargeRequest.currency}'
	         	data-name='FastSusu'
	         	data-description='Spring course checkout'
	         	data-image='../images/logo1.png'
	         	data-locale='auto'
	         	data-zip-code='false'>
         </script>
		</form:form>
	</body>
</html>