<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LittleStar - Order Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body class="bg-gray-50 text-gray-800 p-6">

    <div class="max-w-6xl mx-auto bg-white rounded-2xl shadow-sm border border-gray-100 p-6">
        <!-- Header Section -->
        <div class="flex justify-between items-center mb-6">
            <h1 class="text-2xl font-bold text-gray-900 flex items-center gap-2">
                <i class="fas fa-receipt text-pink-500"></i> Customer Orders
            </h1>
            <span class="text-xs bg-pink-100 text-pink-600 px-3 py-1 rounded-full font-semibold">
                Total Orders: ${not empty orders ? orders.size() : 0}
            </span>
        </div>

        <!-- Orders Table -->
        <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="bg-gray-100/70 text-gray-600 text-xs font-semibold uppercase tracking-wider">
                        <th class="p-3.5 rounded-l-lg">ID</th>
                        <th class="p-3.5">Customer Name</th>
                        <th class="p-3.5">Phone</th>
                        <th class="p-3.5">Address</th>
                        <th class="p-3.5">Total Amount</th>
                        <th class="p-3.5">Status</th>
                        <th class="p-3.5">Order Date</th>
                        <th class="p-3.5 rounded-r-lg text-center">Action</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-100 text-sm">
                    <c:choose>
                        <c:when test="${not empty orders}">
                            <c:forEach var="order" items="${orders}">
                                <tr class="hover:bg-gray-50/80 transition">
                                    <td class="p-3.5 font-bold text-gray-900">#${order.id}</td>
                                    <td class="p-3.5 font-medium text-gray-800">${order.customer_name}</td>
                                    <td class="p-3.5 text-gray-600">${order.phone}</td>
                                    <td class="p-3.5 text-gray-600 max-w-xs truncate">${order.address}</td>
                                    <td class="p-3.5 font-bold text-emerald-600">$${order.total_amount}</td>
                                    <td class="p-3.5">
                                        <span class="px-2.5 py-1 text-xs font-semibold rounded-md 
                                            ${order.status == 'Pending' ? 'bg-amber-100 text-amber-700' : ''}
                                            ${order.status == 'Completed' ? 'bg-emerald-100 text-emerald-700' : ''}
                                            ${order.status == 'Cancelled' ? 'bg-red-100 text-red-700' : ''}">
                                            ${order.status}
                                        </span>
                                    </td>
                                    <td class="p-3.5 text-xs text-gray-500">
                                        <fmt:formatDate value="${order.created_at}" pattern="MMM dd, yyyy • hh:mm a" />
                                    </td>
                                    <td class="p-3.5 text-center">
                                        <div class="flex items-center justify-center gap-2">
                                            <button onclick="updateStatus(${order.id}, 'Completed')" title="Mark as Completed" 
                                                    class="p-1.5 rounded-lg bg-emerald-50 text-emerald-600 hover:bg-emerald-100 transition">
                                                <i class="fas fa-check"></i>
                                            </button>
                                            <button onclick="deleteOrder(${order.id})" title="Delete Order" 
                                                    class="p-1.5 rounded-lg bg-red-50 text-red-600 hover:bg-red-100 transition">
                                                <i class="fas fa-trash-alt"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="8" class="text-center py-8 text-gray-400">
                                    <i class="fas fa-inbox text-3xl mb-2 block"></i>
                                    No orders found in the database.
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>

    <script>
    function updateStatus(orderId, status) {
        if (confirm('Are you sure you want to change order #' + orderId + ' status to ' + status + '?')) {
            const params = new URLSearchParams();
            params.append('action', 'update');
            params.append('id', orderId);
            params.append('status', status);

            fetch('<%=request.getContextPath()%>/orders', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: params.toString()
            })
            .then(res => {
                if (res.ok) {
                    window.location.reload();
                } else {
                    alert('Failed to update order status');
                }
            })
            .catch(() => alert('Error connecting to server'));
        }
    }

    function deleteOrder(orderId) {
        if (confirm('Are you sure you want to delete order #' + orderId + '?')) {
            const params = new URLSearchParams();
            params.append('action', 'delete');
            params.append('id', orderId);

            fetch('${pageContext.request.contextPath}/orders', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: params.toString()
            })
            .then(res => {
                if (res.ok) {
                    window.location.reload();
                } else {
                    res.text().then(err => alert('Failed to delete order: ' + err));
                }
            })
            .catch(err => alert('Error connecting to server: ' + err));
        }
    }

    function updateStatus(orderId, status) {
        if (confirm('Are you sure you want to change order #' + orderId + ' status to ' + status + '?')) {
            const params = new URLSearchParams();
            params.append('action', 'update');
            params.append('id', orderId);
            params.append('status', status);

            fetch('${pageContext.request.contextPath}/orders', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: params.toString()
            })
            .then(res => {
                if (res.ok) {
                    window.location.reload();
                } else {
                    res.text().then(err => alert('Failed to update order status: ' + err));
                }
            })
            .catch(err => alert('Error connecting to server: ' + err));
        }
    }
    </script>
</body>
</html>