<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Food Management</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 p-5 md:p-8">
	<div class="max-w-7xl mx-auto">
		<div class="flex flex-wrap justify-between items-center gap-3 mb-6">
			<div>
				<h1 class="text-3xl font-extrabold">Food Management</h1>
				<p class="text-gray-500">Add, edit or delete restaurant menu
					items.</p>
			</div>
			<div class="flex gap-2">
				<a href="${pageContext.request.contextPath}/admin/dashboard"
					class="px-4 py-2 bg-gray-200 rounded-xl">Dashboard</a><a
					href="${pageContext.request.contextPath}/admin/logout"
					class="px-4 py-2 bg-gray-900 text-white rounded-xl">Logout</a>
			</div>
		</div>
		<c:if test="${not empty param.msg}">
			<div class="bg-green-50 text-green-700 p-3 rounded-xl mb-4">${param.msg}</div>
		</c:if>
		<div class="grid lg:grid-cols-3 gap-6">
			<div class="bg-white rounded-2xl p-6 shadow-sm">
				<h2 class="text-xl font-bold mb-4">Add Food</h2>
				<form action="${pageContext.request.contextPath}/admin/foods"
					method="post" class="space-y-3">
					<input name="name" required placeholder="Food name"
						class="w-full border rounded-xl px-3 py-2"><input
						name="price" required type="number" step="0.01"
						placeholder="Price" class="w-full border rounded-xl px-3 py-2">
					<input name="category" placeholder="Category"
						class="w-full border rounded-xl px-3 py-2"><input
						name="image_url" placeholder="Image URL"
						class="w-full border rounded-xl px-3 py-2">
					<textarea name="description" placeholder="Description"
						class="w-full border rounded-xl px-3 py-2"></textarea>
					<label class="flex gap-2"><input type="checkbox"
						name="available" checked> Available</label>
					<button
						class="w-full bg-pink-600 text-white py-3 rounded-xl font-bold">Save
						Food</button>
				</form>
			</div>
			<div
				class="lg:col-span-2 bg-white rounded-2xl p-5 shadow-sm overflow-x-auto">
				<table class="w-full text-sm">
					<thead>
						<tr class="border-b text-left">
							<th class="p-3">Food</th>
							<th class="p-3">Category</th>
							<th class="p-3">Price</th>
							<th class="p-3">Status</th>
							<th class="p-3">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="f" items="${foods}">
							<tr class="border-b hover:bg-gray-50">
								<td class="p-3 font-semibold">${f.name}</td>
								<td class="p-3">${f.category}</td>
								<td class="p-3">$${f.price}</td>
								<td class="p-3">${f.available?'Available':'Hidden'}</td>
								<td class="p-3"><a class="text-red-600"
									onclick="return confirm('Delete this food?')"
									href="${pageContext.request.contextPath}/admin/foods?action=delete&id=${f.id}">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
