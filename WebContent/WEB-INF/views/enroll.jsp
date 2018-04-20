<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Enroll</title>
	</head>
	<body>
	<form:form action="${pageContext.request.contextPath}/payment/charge" modelAttribute="chargeRequest" method="POST" id="checkout-form">
		    <form:hidden path="amount" />
		    <form:hidden path="groupId" />
		    <c:if test="${chargeRequest.pageName != null}">
			    <form:hidden path="groupName" />
			    <form:hidden path="groupSize" />
			    <form:hidden path="howOften" />
			    <form:hidden path="duration_weeks" />
			    <form:hidden path="startDate" />
			    <form:hidden path="pageName" />
		    </c:if>
		    <label>Price:<span>${chargeRequest.amount}</span></label>
		    <script src="https://checkout.stripe.com/checkout.js" class="stripe-button"
			    data-key="${stripePublicKey}"
			    data-amount="${chargeRequest.amount*100}"
			    data-currency="${chargeRequest.currency}"
			    data-name="FastSusu"
			    data-description="Fastsusu Payment"
			    data-image="${pageContext.request.contextPath}/static/images/logo1.png"
			    data-locale="auto">
			  </script>
		</form:form>
	</body>
</html>