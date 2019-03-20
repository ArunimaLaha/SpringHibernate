<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>Banking Application</title>
	<style type="text/css">
		body {
			font-family: verdana;
			font-size: 12px;
			margin: 40px;
		}
		.customerTable, .customerTable td {
			border-collapse: collapse;
			border: 1px solid #aaa;
			margin: 2px;
			padding: 2px 2px 2px 10px;
			font-size: 12px;
		}
		.CustomerTable th {
			font-weight: bold;
			font-size: 12px;
			background-color: #5C82FF;
			color: white;
		}
		.CustomerLabel {
			font-family: verdana;
			font-size: 12px;
			font-weight: bold;
		}
		a, a:AFTER {
			color: blue;
		}
		
  .error {
      color: red;
      font-style: italic;
  }

	</style>
	<script type="text/javascript">
	function deleteCustomer(customerId){
		if(confirm('Do you want to delete this Customer ?')){
			var url = 'delete/'+customerId;
			window.location.href = url;
		}
	}
	</script>
</head>
<body>

<h2>Banking Application</h2>


<c:url var="action" value="/customer/add.html" ></c:url>
<form:form method="post" action="${action}" commandName="customer" cssClass="customerForm">
	<table>
	<c:if test="${!empty customer}">
	<tr>
		<td>
			<form:label path="id" cssClass="customerLabel">
				<spring:message code="label.customerId" />
			</form:label>
		</td>
		<td>
			<form:input path="id" readonly="true" size="8"  disabled="true" />
			<form:hidden path="id" />
		</td> 
	</tr>
	</c:if>
	<tr>
		<td>
			<form:label path="name" cssClass="customerLabel">
				<spring:message code="label.customername" />
			</form:label>
		</td>
		<td>
			<form:input path="name" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="address" cssClass="customerLabel">
				<spring:message code="label.address" />
			</form:label>
		</td>
		<td>
			<form:input path="address" />
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="age" cssClass="customerLabel">
				<spring:message code="label.age" />
			</form:label>
		</td>
		<td>
			<form:input path="age" />
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="salary" cssClass="customerLabel">
				<spring:message code="label.salary" />
			</form:label>
		</td>
		<td>
			<form:input path="salary" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty customer.name}">
				<input type="submit"
					value="<spring:message code="label.editcustomer"/>" />
			</c:if>
			<c:if test="${empty customer.name}">
				<input type="submit"
					value="<spring:message code="label.addcustomer"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
<h3>List of Customer</h3>
<c:if test="${!empty customerList}">
	<table class="customerTable">
	<tr>
		<th width="180">Customer Name</th>
		<th width="160">Address</th>
		<th width="60">Age</th>
		<th width="80">Salary</th>
		<th width="60">Action</th>
	</tr>
	<c:forEach items="${customerList}" var="customer">
		<tr>
			<td><a href="<c:url value='/edit/${customer.id}' />" >${customer.name}</a></td>
			<td>${customer.address}</td>
			<td>${customer.age}</td>
			<td>${customer.salary}</td>
			<td><img src="<c:url value='/images/vcard_delete.png' />"
				title="Delete Customer"
				onclick="javascript:deleteCustomer(${customer.id})" />
				<a href="<c:url value='/edit/${customer.id}' />"  >
					<img src="<c:url value='/images/vcard_add.png' />" title="Edit Customer"/>
				</a>
			</td>
		</tr>
	</c:forEach>
	</table>
</c:if>


</body>
</html>
