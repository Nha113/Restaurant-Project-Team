<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>My Dashboard</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen p-5 md:p-8">
	<div class="max-w-5xl mx-auto">
		<div class="flex justify-between items-center mb-7">
			<div>
				<h1 class="text-3xl font-extrabold">Welcome,
					${sessionScope.user.name}! 👋</h1>
				<p class="text-gray-500">${sessionScope.user.email}</p>
			</div>
			<div class="flex gap-2">
				<a href="${pageContext.request.contextPath}/"
					class="px-4 py-2 rounded-xl bg-pink-600 text-white">Restaurant</a><a
					href="${pageContext.request.contextPath}/logout"
					class="px-4 py-2 rounded-xl bg-gray-900 text-white">Logout</a>
			</div>
		</div>
		<div class="bg-white rounded-2xl shadow-sm p-6">
			<h2 class="text-xl font-bold mb-4">My Orders</h2>
			<c:choose>
				<c:when test="${not empty orders}">
					<div class="overflow-x-auto">
						<table class="w-full text-left">
							<thead>
								<tr class="border-b">
									<th class="p-3">Order</th>
									<th class="p-3">Total</th>
									<th class="p-3">Status</th>
									<th class="p-3">Date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="o" items="${orders}">
									<tr class="border-b">
										<td class="p-3 font-bold">#${o.id}</td>
										<td class="p-3">$${o.total}</td>
										<td class="p-3">${o.status}</td>
										<td class="p-3">${o.created}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:when>
				<c:otherwise>
					<p class="text-gray-500 py-10 text-center">You have no orders
						yet.</p>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>
