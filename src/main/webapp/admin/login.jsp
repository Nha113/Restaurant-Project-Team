<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Admin Login - LittleStar</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body
	class="min-h-screen bg-gradient-to-br from-pink-100 via-white to-amber-50 flex items-center justify-center p-5">
	<div class="w-full max-w-md bg-white rounded-3xl shadow-xl p-8">
		<div class="text-center mb-7">
			<div class="text-5xl mb-2">🍽️</div>
			<h1 class="text-3xl font-extrabold">Admin Login</h1>
			<p class="text-gray-500 mt-1">LittleStar Restaurant</p>
		</div>
		<%
		if (request.getParameter("error") != null) {
		%><div
			class="bg-red-50 text-red-600 rounded-xl p-3 mb-4 text-sm"><%=request.getParameter("error")%></div>
		<%
		}
		%>
		<form action="<%=request.getContextPath()%>/admin/login" method="post"
			class="space-y-4">
			<input name="username" required placeholder="Username"
				class="w-full border rounded-xl px-4 py-3"> <input
				name="password" type="password" required placeholder="Password"
				class="w-full border rounded-xl px-4 py-3">
			<button
				class="w-full bg-gray-900 text-white rounded-xl py-3 font-bold hover:bg-black">Login
				to Dashboard</button>
		</form>
		<p class="text-center text-xs text-gray-400 mt-5">Demo: admin /
			admin123</p>
		<a href="<%=request.getContextPath()%>/"
			class="block text-center text-sm text-pink-600 mt-4">← Back to
			Restaurant</a>
	</div>
</body>
</html>
