<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - LittleStar Restaurant</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
    <link rel="stylesheet" href="main.css">
    <link rel="stylesheet" href="hover.css">
</head>
<body class="bg-gray-50 flex items-center justify-center min-h-screen">

    <div class="w-full max-w-md bg-white rounded-xl shadow-lg p-8 border border-pink-200">
        <!-- Header -->
        <div class="text-center mb-6">
            <h2 class="text-3xl font-extrabold text-pink-700">
                LittleStar <span class="text-gray-900">Restaurant</span>
            </h2>
            <p class="text-gray-500 text-sm mt-1">សូមបញ្ចូលគណនីរបស់អ្នកដើម្បីចូលប្រព័ន្ធ</p>
        </div>

        <!-- Notification Error (បង្ហាញពេល Login ខុស) -->
        <% if (request.getParameter("error") != null) { %>
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-2 rounded mb-4 text-sm text-center">
                ឈ្មោះអ្នកប្រើប្រាស់ ឬពាក្យសម្ងាត់មិនត្រឹមត្រូវឡើយ!
            </div>
        <% } %>

        <!-- Login Form -->
        <form action="LoginServlet" method="POST" class="space-y-5">
            <div>
                <label class="block text-gray-700 font-semibold mb-1">Username / ឈ្មោះអ្នកប្រើប្រាស់</label>
                <div class="relative">
                    <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-gray-400">
                        <i class="fa-solid fa-user"></i>
                    </span>
                    <input type="text" name="username" required placeholder="បញ្ចូល username"
                        class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-pink-500 focus:border-transparent">
                </div>
            </div>

            <div>
                <label class="block text-gray-700 font-semibold mb-1">Password / ពាក្យសម្ងាត់</label>
                <div class="relative">
                    <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-gray-400">
                        <i class="fa-solid fa-lock"></i>
                    </span>
                    <input type="password" name="password" required placeholder="បញ្ចូល password"
                        class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-pink-500 focus:border-transparent">
                </div>
            </div>

            <button type="submit" 
                class="w-full bg-pink-600 hover:bg-pink-700 text-white font-bold py-2.5 rounded-lg shadow transition duration-200">
                ចូលប្រើប្រាស់ (Login)
            </button>
        </form>

        <div class="text-center mt-6">
            <a href="index.jsp" class="text-sm text-pink-600 hover:underline">← ត្រឡប់ទៅទំព័រដើម</a>
        </div>
    </div>

</body>
</html>