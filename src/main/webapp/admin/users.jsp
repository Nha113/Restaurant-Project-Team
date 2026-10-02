<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Users</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 p-5 md:p-8">
	<div class="max-w-6xl mx-auto bg-white rounded-2xl shadow-sm p-6">
		<div class="flex justify-between mb-6">
			<h1 class="text-2xl font-bold">Registered Users</h1>
			<a href="${pageContext.request.contextPath}/admin/dashboard"
				class="px-4 py-2 rounded-xl bg-gray-900 text-white">Dashboard</a>
		</div>
		<div class="overflow-x-auto">
			<table class="w-full text-left">
				<thead>
					<tr class="border-b">
						<th class="p-3">ID</th>
						<th class="p-3">Name</th>
						<th class="p-3">Email</th>
						<th class="p-3">Created</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="u" items="${users}">
						<tr class="border-b">
							<td class="p-3">${u.id}</td>
							<td class="p-3 font-semibold">${u.name}</td>
							<td class="p-3">${u.email}</td>
							<td class="p-3">${u.created}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
