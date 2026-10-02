<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Admin Dashboard</title>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body class="bg-gray-50 text-gray-800">
	<div class="min-h-screen flex">
		<aside class="hidden md:flex w-64 bg-gray-900 text-white p-5 flex-col">
			<div class="text-2xl font-extrabold mb-10">🍽️ StarAdmin</div>
			<nav class="space-y-2">
				<a class="block p-3 rounded-xl bg-white/10"
					href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a><a
					class="block p-3 rounded-xl hover:bg-white/10"
					href="${pageContext.request.contextPath}/admin/foods">Foods</a><a
					class="block p-3 rounded-xl hover:bg-white/10"
					href="${pageContext.request.contextPath}/orders">Orders</a><a
					class="block p-3 rounded-xl hover:bg-white/10"
					href="${pageContext.request.contextPath}/admin/users">Users</a>
			</nav>
			<a class="mt-auto p-3 text-red-300"
				href="${pageContext.request.contextPath}/admin/logout">Logout</a>
		</aside>
		<main class="flex-1 p-5 md:p-8">
			<div class="flex justify-between items-center mb-8">
				<div>
					<h1 class="text-3xl font-extrabold">Dashboard</h1>
					<p class="text-gray-500">Welcome, ${sessionScope.admin}</p>
				</div>
				<a class="md:hidden bg-gray-900 text-white px-4 py-2 rounded-xl"
					href="${pageContext.request.contextPath}/admin/logout">Logout</a>
			</div>
			<div class="grid sm:grid-cols-2 lg:grid-cols-4 gap-5">
				<div class="bg-white p-6 rounded-2xl shadow-sm">
					<p class="text-gray-500">Users</p>
					<b class="text-3xl">${users}</b>
				</div>
				<div class="bg-white p-6 rounded-2xl shadow-sm">
					<p class="text-gray-500">Foods</p>
					<b class="text-3xl">${foods}</b>
				</div>
				<div class="bg-white p-6 rounded-2xl shadow-sm">
					<p class="text-gray-500">Orders</p>
					<b class="text-3xl">${orders}</b>
					<p class="text-xs text-amber-600 mt-1">${pending}pending</p>
				</div>
				<div class="bg-white p-6 rounded-2xl shadow-sm">
					<p class="text-gray-500">Sales</p>
					<b class="text-3xl">$${sales}</b>
				</div>
			</div>
			<div class="mt-8 bg-white rounded-2xl p-6">
				<h2 class="text-xl font-bold mb-4">Quick Actions</h2>
				<div class="flex flex-wrap gap-3">
					<a href="${pageContext.request.contextPath}/admin/foods"
						class="bg-pink-600 text-white px-5 py-3 rounded-xl">Manage
						Foods</a><a href="${pageContext.request.contextPath}/orders"
						class="bg-amber-500 text-white px-5 py-3 rounded-xl">Manage
						Orders</a><a href="${pageContext.request.contextPath}/admin/users"
						class="bg-gray-900 text-white px-5 py-3 rounded-xl">View Users</a>
				</div>
			</div>
		</main>
	</div>
</body>
</html>
