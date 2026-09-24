<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Restaurant</title>
<!-- Tailwind CSS CDN -->
<script src="https://cdn.tailwindcss.com"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Kantumruy+Pro:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<!-- link Css -->
<link rel="stylesheet" href="main.css">
<link rel="stylesheet" href="hover.css">
<!-- link logo header-->
<link rel="icon" type="image/x-icon"
	href="https://cdn-icons-png.flaticon.com/128/9206/9206340.png">
<!-- Link icon -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
body {
	font-family: 'Kantumruy Pro', sans-serif;
}
</style>
</head>
<body class="bg-white text-gray-800">

	<!-------------------------------------------Navbar------------------------------------------->
	<nav
		class="bg-[#eb7589] backdrop-blur-md fixed w-full z-50 top-0 left-0 border-b border-pink-400/30 shadow-md">
		<div
			class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-3.5 px-4">
			<a href="#start" class="flex items-center space-x-2 group"> <span
				class="text-2xl font-extrabold text-white tracking-wide group-hover:text-amber-200 transition">LittleStar
					<span class="text-gray-900 font-bold">Restaurant</span>
			</span>
			</a>

			<div class="flex md:order-2 items-center space-x-2 sm:space-x-3">
				<!-- Cart Trigger Button -->
				<button onclick="openCartModal()"
					class="relative bg-gray-900 hover:bg-black text-white px-3.5 py-2 rounded-full font-medium text-xs sm:text-sm flex items-center gap-2">
					<i class="fas fa-shopping-bag text-amber-400"></i> <span
						class="hidden sm:inline">My Cart</span> <span id="cartBadge"
						class="bg-amber-600 text-white text-[11px] font-bold w-5 h-5 rounded-full flex items-center justify-center">0</span>
				</button>

				<!-- User Auth State Toggle Button / Profile Dropdown Container -->
				<div class="relative" id="authNavContainer">
					<!-- Guest State: Login Button -->
					<button id="loginNavBtn" onclick="openAuthModal('login')"
						class="bg-white/20 hover:bg-white/30 text-white border border-white/30 hover:border-white font-medium rounded-full text-xs sm:text-sm px-4 py-2 text-center transition duration-200 flex items-center gap-2 shadow-sm active:scale-95">
						<i class="far fa-user"></i> <span>Log In</span>
					</button>

					<!-- Logged-in State: User Avatar & Dropdown Menu (Hidden by default) -->
					<div id="userProfileBtn" class="hidden relative">
						<button onclick="toggleUserDropdown()"
							class="flex items-center gap-2 p-1 pl-2 pr-3 bg-white/20 hover:bg-white/30 text-white rounded-full transition border border-white/30 focus:outline-none">
							<img id="userAvatar"
								src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=100&q=80"
								alt="User Profile"
								class="w-7 h-7 rounded-full object-cover border-2 border-white">
							<span id="userName"
								class="text-xs sm:text-sm font-semibold max-w-[100px] truncate">Jane
								Doe</span> <i class="fas fa-chevron-down text-[10px] opacity-80"></i>
						</button>

						<!-- Dropdown Menu -->
						<div id="userDropdown"
							class="hidden absolute right-0 mt-2 w-48 bg-white rounded-2xl shadow-xl py-2 z-50 text-gray-700 border border-gray-100 transform origin-top-right transition-all">
							<div class="px-4 py-2 border-b border-gray-100">
								<p id="dropdownUserFull" class="text-xs font-bold text-gray-900">Jane
									Doe</p>
								<p id="dropdownUserEmail"
									class="text-[11px] text-gray-500 truncate">jane.doe@example.com</p>
							</div>
							<a href="${pageContext.request.contextPath}/orders"
								class="flex items-center gap-2.5 px-4 py-2 text-xs hover:bg-pink-50 hover:text-pink-600 transition">
								<i class="fas fa-receipt w-4 text-gray-400"></i> My Orders
							</a> <a href="#profile" onclick="toggleUserDropdown()"
								class="flex items-center gap-2.5 px-4 py-2 text-xs hover:bg-pink-50 hover:text-pink-600 transition">
								<i class="fas fa-user-cog w-4 text-gray-400"></i> Account
								Settings
							</a>
							<div class="border-t border-gray-100 my-1"></div>
							<button onclick="logoutUser()"
								class="w-full text-left flex items-center gap-2.5 px-4 py-2 text-xs text-red-600 hover:bg-red-50 transition font-medium">
								<i class="fas fa-sign-out-alt w-4"></i> Log Out
							</button>
						</div>
					</div>
				</div>


				<!-- Mobile menu button -->
				<button onclick="toggleMobileNav()" type="button"
					class="inline-flex items-center p-2 w-9 h-9 justify-center text-sm text-white rounded-lg md:hidden hover:bg-white/10 focus:outline-none">
					<i class="fas fa-bars text-lg"></i>
				</button>
			</div>

			<div id="mobileNavMenu"
				class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1 mt-3 md:mt-0">
				<ul
					class="flex flex-col p-4 md:p-0 font-medium border border-pink-300/30 rounded-2xl bg-pink-600/90 md:bg-transparent md:space-x-6 lg:space-x-8 md:flex-row md:border-0">
					<li><a href="#start"
						class="block py-2 px-3 text-white font-semibold hover:text-amber-200 rounded md:p-0">Home</a></li>
					<li><a href="#menu"
						class="block py-2 px-3 text-white/90 hover:text-blue-500 rounded md:p-0">Menu</a></li>
					<li><a href="#gallery"
						class="block py-2 px-3 text-white/90 hover:text-blue-500 rounded md:p-0">Gallery</a></li>
					<li><a href="#about"
						class="block py-2 px-3 text-white/90 hover:text-blue-500 rounded md:p-0">About
							Us</a></li>
					<li><a href="#Popular"
						class="block py-2 px-3 text-white/90 hover:text-blue-500 rounded md:p-0">Popular
							Foods</a></li>
					<li><a href="#contact"
						class="block py-2 px-3 text-white/90 hover:text-blue-500 rounded md:p-0">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>





	<!-------------------------------------------Header------------------------------------------->
	<section id="start"
		class="pt-28 pb-20  from-amber-500 via-orange-500 to-amber-600 text-white min-h-screen flex items-center">
		<div
			class="max-w-screen-xl mx-auto px-4 flex flex-col md:flex-row items-center justify-between gap-10">
			<div class="md:w-1/2 space-y-6">
				<span
					class="bg-amber-400/30 text-amber-100 text-sm font-medium px-3.5 py-1.5 rounded-full border border-amber-300/40">
					✨ Welcome to our restaurant </span>
				<h1 class="text-4xl md:text-6xl font-extrabold leading-tight">
					Delicious Taste <br> <span class="text-amber-200 text-4xl">Fast
						Service</span>
				</h1>
				<p class="text-lg text-amber-100 leading-relaxed">Enjoy many
					delicious dishes prepared by professional chefs with high hygiene
					standards. Dine-in or order for delivery!</p>
				<div class="flex flex-wrap gap-4 pt-2">
					<a href="#menu"
						class="bg-white text-amber-600 font-bold px-7 py-3.5 rounded-xl shadow-lg hover:bg-amber-50 transition transform hover:-translate-y-0.5">
						View Menu </a>
						 <a href="#Popular"
						class="bg-amber-700/40 hover:bg-amber-700/60 text-white font-medium px-7 py-3.5 rounded-xl border border-white/20 transition">
						Order Now </a>
				</div>
			</div>
			<div class="md:w-1/2 w-full">
				<img
					src="https://images.unsplash.com/photo-1555396273-367ea4eb4db5?auto=format&fit=crop&w=800&q=80"
					alt="Restaurant Special Food"
					class="rounded-3xl shadow-2xl w-full object-cover h-[400px] border-4 border-white/20">
			</div>
		</div>
	</section>







	<!-------------------------------------------Menu------------------------------------------->
	​
	<section id="menu" class="bg-[#fbfaf8] py-20 px-4 sm:px-6 lg:px-8">
		<div class="max-w-6xl mx-auto">
			<!-- Header -->
			<div class="flex justify-between items-end mb-10">
				<div>
					<span
						class="text-amber-600 font-semibold text-sm tracking-wide uppercase">Our
						Special Selection</span>
					<h2 class="font-serif-header text-4xl font-bold text-gray-950 mt-1">
						Trending Menu</h2>
				</div>
				<a href="#Popular"
					class="text-xs font-semibold text-amber-700 hover:text-amber-800 bg-amber-50 hover:bg-amber-100 border border-amber-200 px-5 py-2.5 rounded-full transition">
					See All Items → </a>
			</div>

			<!-- Grid -->
			<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">

				<!-- Item 1 -->
				<div
					class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
					<div>
						<div
							class="relative overflow-hidden h-44 bg-gray-50 rounded-xl flex items-center justify-center mb-4">
							<img
								class="w-full h-full object-contain p-2 group-hover:scale-105 transition-transform duration-300"
								src="https://media.istockphoto.com/id/157428069/photo/sliced-smoked-turkey-sandwich.jpg?s=612x612&w=0&k=20&c=0XNz28I44SxCKHWY82oChtPtqCzKsEGBeOBeQ6U_0Mg="
								alt="Spicy Chicken Sandwich"> <span
								class="absolute top-2 left-2 bg-amber-600 text-white text-[10px] font-bold px-2.5 py-1 rounded-md shadow-sm">
								POPULAR </span>
							<button type="button" onclick="toggleFavorite(this)"
								class="absolute top-2 right-2 bg-white/80 hover:bg-white text-gray-400 hover:text-red-500 rounded-full w-8 h-8 flex items-center justify-center shadow-sm border border-gray-100 transition-colors duration-200">
								<i class="far fa-heart text-xs"></i>
							</button>
						</div>
						<h3 class="text-base font-bold text-gray-900 truncate">Spicy
							Chicken Sandwich</h3>
						<p class="text-gray-500 text-xs mt-1 mb-3 line-clamp-2">Crispy
							fillet, spicy mayo, and crunchy slaw in a toasted bun.</p>
					</div>
					<div
						class="flex justify-between items-center pt-2 border-t border-gray-50">
						<div>
							<span class="text-xs text-gray-400 block">Price</span> <span
								class="text-base font-bold text-gray-900">$8.99</span>
						</div>
						<button type="button"
							onclick="addToCart('Spicy Chicken Sandwich', '8.99', this)"
							class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
							<i class="fas fa-cart-plus"></i> <span>Add</span>
						</button>
					</div>
				</div>

				<!-- Item 2 -->
				<div
					class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
					<div>
						<div
							class="relative overflow-hidden h-44 bg-gray-50 rounded-xl flex items-center justify-center mb-4">
							<img
								class="w-full h-full object-contain p-2 group-hover:scale-105 transition-transform duration-300"
								src="https://media.istockphoto.com/id/2241118373/photo/fried-chicken-in-paper-bucket-isolated-on-white-background-fried-chicken-on-white-with.jpg?s=612x612&w=0&k=20&c=GDsBxxYISBKK2EeVlGDdCFf5z8y8pyIxxkfjZoRc_NQ="
								alt="Chicken Fry">
							<button type="button" onclick="toggleFavorite(this)"
								class="absolute top-2 right-2 bg-white/80 hover:bg-white text-gray-400 hover:text-red-500 rounded-full w-8 h-8 flex items-center justify-center shadow-sm border border-gray-100 transition-colors duration-200">
								<i class="far fa-heart text-xs"></i>
							</button>
						</div>
						<h3 class="text-base font-bold text-gray-900 truncate">Crispy
							Fried Chicken</h3>
						<p class="text-gray-500 text-xs mt-1 mb-3 line-clamp-2">Deep-fried
							golden chicken served with smoky BBQ sauce.</p>
					</div>
					<div
						class="flex justify-between items-center pt-2 border-t border-gray-50">
						<div>
							<span class="text-xs text-gray-400 block">Price</span> <span
								class="text-base font-bold text-gray-900">$9.50</span>
						</div>
						<button type="button"
							onclick="addToCart('Crispy Fried Chicken', '9.50', this)"
							class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
							<i class="fas fa-cart-plus"></i> <span>Add</span>
						</button>
					</div>
				</div>

				<!-- Item 3 -->
				<div
					class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
					<div>
						<div
							class="relative overflow-hidden h-44 bg-gray-50 rounded-xl flex items-center justify-center mb-4">
							<img
								class="w-full h-full object-contain p-2 group-hover:scale-105 transition-transform duration-300"
								src="https://media.istockphoto.com/id/2165830806/photo/isolated-bread-stick-on-a-white-background.jpg?s=612x612&w=0&k=20&c=pytJ8TeRnM2PVCEdTfdVLqOkvnsfAqHEghOVoqZ8Dw0="
								alt="Garlic Bread Sticks">
							<button type="button" onclick="toggleFavorite(this)"
								class="absolute top-2 right-2 bg-white/80 hover:bg-white text-gray-400 hover:text-red-500 rounded-full w-8 h-8 flex items-center justify-center shadow-sm border border-gray-100 transition-colors duration-200">
								<i class="far fa-heart text-xs"></i>
							</button>
						</div>
						<h3 class="text-base font-bold text-gray-900 truncate">Garlic
							Bread Sticks</h3>
						<p class="text-gray-500 text-xs mt-1 mb-3 line-clamp-2">Toasted
							bread topped with rich garlic butter and parmesan cheese.</p>
					</div>
					<div
						class="flex justify-between items-center pt-2 border-t border-gray-50">
						<div>
							<span class="text-xs text-gray-400 block">Price</span> <span
								class="text-base font-bold text-gray-900">$5.00</span>
						</div>
						<button type="button"
							onclick="addToCart('Garlic Bread Sticks', '5.00', this)"
							class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
							<i class="fas fa-cart-plus"></i> <span>Add</span>
						</button>
					</div>
				</div>

				<!-- Item 4 -->
				<div
					class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
					<div>
						<div
							class="relative overflow-hidden h-44 bg-gray-50 rounded-xl flex items-center justify-center mb-4">
							<img
								class="w-full h-full object-contain p-2 group-hover:scale-105 transition-transform duration-300"
								src="https://media.istockphoto.com/id/980036330/photo/mango-lassi-indian-popular-summer-drink-in-a-terracotta-glass-selective-focus.jpg?s=612x612&w=0&k=20&c=NEkHkQ4PAv_gXzKSIjfObKibx7psh4RLofr-4Eum9x8="
								alt="Mango Lassi"> <span
								class="absolute top-2 left-2 bg-amber-600 text-white text-[10px] font-bold px-2.5 py-1 rounded-md shadow-sm">
								POPULAR </span>
							<button type="button" onclick="toggleFavorite(this)"
								class="absolute top-2 right-2 bg-white/80 hover:bg-white text-gray-400 hover:text-red-500 rounded-full w-8 h-8 flex items-center justify-center shadow-sm border border-gray-100 transition-colors duration-200">
								<i class="far fa-heart text-xs"></i>
							</button>
						</div>
						<h3 class="text-base font-bold text-gray-900 truncate">Fresh
							Mango Lassi</h3>
						<p class="text-gray-500 text-xs mt-1 mb-3 line-clamp-2">Refreshing
							smoothie made with sweet mangoes and fresh yogurt.</p>
					</div>
					<div
						class="flex justify-between items-center pt-2 border-t border-gray-50">
						<div>
							<span class="text-xs text-gray-400 block">Price</span> <span
								class="text-base font-bold text-gray-900">$4.50</span>
						</div>
						<button type="button"
							onclick="addToCart('Fresh Mango Lassi', '4.50', this)"
							class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
							<i class="fas fa-cart-plus"></i> <span>Add</span>
						</button>
					</div>
				</div>

				<!-- Item 5 -->
				<div
					class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
					<div>
						<div
							class="relative overflow-hidden h-44 bg-gray-50 rounded-xl flex items-center justify-center mb-4">
							<img
								class="w-full h-full object-contain p-2 group-hover:scale-105 transition-transform duration-300"
								src="https://media.istockphoto.com/id/1975701807/photo/bucatini-pasta-with-tomato-sauce-and-basil-leaves.jpg?s=612x612&w=0&k=20&c=fVEcAdpC7dFqazEQ2iDvb9snMAbKB2SYhoyjhxF9zdg="
								alt="Mango Lassi"> <span
								class="absolute top-2 left-2 bg-amber-600 text-white text-[10px] font-bold px-2.5 py-1 rounded-md shadow-sm">
								POPULAR </span>
							<button type="button" onclick="toggleFavorite(this)"
								class="absolute top-2 right-2 bg-white/80 hover:bg-white text-gray-400 hover:text-red-500 rounded-full w-8 h-8 flex items-center justify-center shadow-sm border border-gray-100 transition-colors duration-200">
								<i class="far fa-heart text-xs"></i>
							</button>
						</div>
						<h3 class="text-base font-bold text-gray-900 truncate">Pasta
							Dish</h3>
						<p class="text-gray-500 text-xs mt-1 mb-3 line-clamp-2">classic
							Roman pasta dish made with spaghetti, cured pork, eggs, hard
							cheese, and black pepper</p>
					</div>
					<div
						class="flex justify-between items-center pt-2 border-t border-gray-50">
						<div>
							<span class="text-xs text-gray-400 block">Price</span> <span
								class="text-base font-bold text-gray-900">$12.50</span>
						</div>
						<button type="button"
							onclick="addToCart('Pasta Dish', '12.50', this)"
							class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
							<i class="fas fa-cart-plus"></i> <span>Add</span>
						</button>
					</div>
				</div>


				<!-- Item 6 -->
				<div
					class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
					<div>
						<div
							class="relative overflow-hidden h-44 bg-gray-50 rounded-xl flex items-center justify-center mb-4">
							<img
								class="w-full h-full object-contain p-2 group-hover:scale-105 transition-transform duration-300"
								src=https://media.istockphoto.com/id/2211908161/photo/strawberry-ice-matcha-green-tea-served-on-white-background-isolate-concept.jpg?s=612x612&w=0&k=20&c=gIAqToCYVAsFGc3zKuTHPbFufX_yXtL3BnuhVwqb3FI=
								alt="Mango Lassi"> <span
								class="absolute top-2 left-2 bg-amber-600 text-white text-[10px] font-bold px-2.5 py-1 rounded-md shadow-sm">
								POPULAR </span>
							<button type="button" onclick="toggleFavorite(this)"
								class="absolute top-2 right-2 bg-white/80 hover:bg-white text-gray-400 hover:text-red-500 rounded-full w-8 h-8 flex items-center justify-center shadow-sm border border-gray-100 transition-colors duration-200">
								<i class="far fa-heart text-xs"></i>
							</button>
						</div>
						<h3 class="text-base font-bold text-gray-900 truncate">Matcha
							Strawberry</h3>
						<p class="text-gray-500 text-xs mt-1 mb-3 line-clamp-2">a
							refreshing, layered drink made with sweet strawberry puree, milk,
							and earthy green tea</p>
					</div>
					<div
						class="flex justify-between items-center pt-2 border-t border-gray-50">
						<div>
							<span class="text-xs text-gray-400 block">Price</span> <span
								class="text-base font-bold text-gray-900">$7.50</span>
						</div>
						<button type="button"
							onclick="addToCart('Matcha Strawberry', '7.50', this)"
							class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
							<i class="fas fa-cart-plus"></i> <span>Add</span>
						</button>
					</div>
				</div>

				<!-- Item 7 -->
				<div
					class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
					<div>
						<div
							class="relative overflow-hidden h-44 bg-gray-50 rounded-xl flex items-center justify-center mb-4">
							<img
								class="w-full h-full object-contain p-2 group-hover:scale-105 transition-transform duration-300"
								src=https://media.istockphoto.com/id/1056878382/photo/noodle-soup.jpg?s=612x612&w=0&k=20&c=HdjT3UNAXCLUc4gpTg1uOv5K9SbwgpxD7CUCXSG_Cs4=
								alt="Mango Lassi"> <span
								class="absolute top-2 left-2 bg-amber-600 text-white text-[10px] font-bold px-2.5 py-1 rounded-md shadow-sm">
								POPULAR </span>
							<button type="button" onclick="toggleFavorite(this)"
								class="absolute top-2 right-2 bg-white/80 hover:bg-white text-gray-400 hover:text-red-500 rounded-full w-8 h-8 flex items-center justify-center shadow-sm border border-gray-100 transition-colors duration-200">
								<i class="far fa-heart text-xs"></i>
							</button>
						</div>
						<h3 class="text-base font-bold text-gray-900 truncate">Noodle
							Soup</h3>
						<p class="text-gray-500 text-xs mt-1 mb-3 line-clamp-2">a
							comforting, warm dish made with broth, noodles, and various
							toppings like meat and vegetables.</p>
					</div>
					<div
						class="flex justify-between items-center pt-2 border-t border-gray-50">
						<div>
							<span class="text-xs text-gray-400 block">Price</span> <span
								class="text-base font-bold text-gray-900">$5.00</span>
						</div>
						<button type="button"
							onclick="addToCart('Noodle Soup', '5.00', this)"
							class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
							<i class="fas fa-cart-plus"></i> <span>Add</span>
						</button>
					</div>
				</div>

				<!-- Item 8 -->
				<div
					class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
					<div>
						<div
							class="relative overflow-hidden h-44 bg-gray-50 rounded-xl flex items-center justify-center mb-4">
							<img
								class="w-full h-full object-contain p-2 group-hover:scale-105 transition-transform duration-300"
								src=https://media.istockphoto.com/id/673909238/photo/grilled-beef-steak.jpg?s=612x612&w=0&k=20&c=QpQzHAbx7jaUUl9WzSrWpmgcwwF9aC-2kkE5tEunUp8=
								alt="Mango Lassi"> <span
								class="absolute top-2 left-2 bg-amber-600 text-white text-[10px] font-bold px-2.5 py-1 rounded-md shadow-sm">
								POPULAR </span>
							<button type="button" onclick="toggleFavorite(this)"
								class="absolute top-2 right-2 bg-white/80 hover:bg-white text-gray-400 hover:text-red-500 rounded-full w-8 h-8 flex items-center justify-center shadow-sm border border-gray-100 transition-colors duration-200">
								<i class="far fa-heart text-xs"></i>
							</button>
						</div>
						<h3 class="text-base font-bold text-gray-900 truncate">Grilled
							Beef Steak</h3>
						<p class="text-gray-500 text-xs mt-1 mb-3 line-clamp-2">
							featuring juicy ribeye, sirloin, and flank steaks with spices and
							herbs.</p>
					</div>
					<div
						class="flex justify-between items-center pt-2 border-t border-gray-50">
						<div>
							<span class="text-xs text-gray-400 block">Price</span> <span
								class="text-base font-bold text-gray-900">$5.00</span>
						</div>
						<button type="button"
							onclick="addToCart('Grilled Beef Steak', '5.00', this)"
							class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
							<i class="fas fa-cart-plus"></i> <span>Add</span>
						</button>
					</div>
				</div>

			</div>
		</div>
	</section>









	<!-------------------------------------------Gallery------------------------------------------->
	<div class="Gallery-page" id="gallery">
		<div class="Gallery">
			<h1>
				Photo <span>Gallery</span>
			</h1>
			<div class="gallery-image">
				<!-- block1 -->
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2017/11/13/19/08/meatballs-2946482_1280.jpg"
						alt="Meatballs" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706_1280.jpg"
						alt="Burger" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2016/05/25/10/43/power-1414427_1280.jpg"
						alt="Meal" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2022/01/17/19/23/burger-6945568_1280.jpg"
						alt="Burger" class="hvr-grow">
				</div>
				<!-- block2 -->
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2016/10/12/16/59/steak-1735136_1280.jpg"
						alt="Steak" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2021/05/01/22/01/meat-6222139_1280.jpg"
						alt="Meat" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2018/09/21/18/25/fillet-3693670_1280.jpg"
						alt="Fillet" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2015/06/30/19/56/food-826743_1280.jpg"
						alt="Food" class="hvr-grow">
				</div>
				<!-- block3 -->
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2016/10/31/18/14/dessert-1786311_1280.jpg"
						alt="Dessert" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2019/11/07/13/05/waffle-4608843_1280.jpg"
						alt="Waffle" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2022/06/22/20/11/dessert-7278701_1280.jpg"
						alt="Dessert" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2020/04/27/11/49/ice-5099482_1280.jpg"
						alt="Ice Cream" class="hvr-grow">
				</div>
				<!-- block4 -->
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2017/09/16/13/14/chocolate-ice-cream-2755456_1280.jpg"
						alt="Chocolate Ice Cream" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2015/05/02/01/00/seasoned-chicken-feet-749362_1280.jpg"
						alt="Seasoned Chicken" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2018/07/29/23/37/barbecue-3571403_1280.jpg"
						alt="Barbecue" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2022/01/18/19/30/salad-6948004_1280.jpg"
						alt="Salad" class="hvr-grow">
				</div>
				<!-- block5 -->
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2016/09/21/20/18/pumpkin-soup-1685574_1280.jpg"
						alt="Pumpkin Soup" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2015/05/02/01/04/miso-soup-749368_1280.jpg"
						alt="Miso Soup" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2023/05/27/13/49/soup-8021570_1280.jpg"
						alt="Soup" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2020/10/31/08/44/soup-5700592_1280.jpg"
						alt="Soup" class="hvr-grow">
				</div>
				<!-- block6 -->
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2019/07/17/09/18/carrot-4343497_1280.jpg"
						alt="Carrot Cake" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2021/12/18/17/36/fruit-cake-6879428_1280.jpg"
						alt="Fruit Cake" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2019/03/21/21/09/date-cake-4071990_1280.jpg"
						alt="Date Cake" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2020/03/10/03/49/red-velvet-cake-4917734_1280.jpg"
						alt="Red Velvet Cake" class="hvr-grow">
				</div>
				<!-- block7 -->
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2015/09/30/02/54/food-964863_1280.jpg"
						alt="Food Dish" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2021/12/14/19/53/dish-6871188_1280.jpg"
						alt="Special Dish" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2020/03/21/04/00/shrimp-4952607_1280.jpg"
						alt="Shrimp Dish" class="hvr-grow">
				</div>
				<div class="pic">
					<img
						src="https://cdn.pixabay.com/photo/2019/09/09/22/19/rice-with-seafood-4464793_1280.jpg"
						alt="Seafood Rice" class="hvr-grow">
				</div>


			</div>
		</div>


	</div>







	<!-------------------------------------------About------------------------------------------->
	<section id="about"
		class="bg-amber-50/60 py-20 px-4 border-y border-amber-100">
		<div
			class="max-w-screen-xl mx-auto flex flex-col md:flex-row items-center gap-12">
			<div class="md:w-1/2">
				<img
					src="https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=800&q=80"
					alt="About LittleStar Restaurant"
					class="rounded-2xl shadow-xl w-full object-cover h-80">
			</div>
			<div class="md:w-1/2 space-y-4">
				<h2 class="text-3xl font-bold text-gray-900">About LittleStar
					Restaurant</h2>
				<p class="text-gray-600 leading-relaxed">LittleStar Restaurant
					was established with a focus on quality, delicious taste, and high
					standards of food hygiene. We select only fresh ingredients to cook
					for each of our valued customers.</p>
			</div>
		</div>
	</section>

	<!-- Why Choose Us -->
	<div class="btn-about" id="about-us">
		<div class="about">
			<h2>Why Choose Us</h2>
			<br>
			<div class="btn-box ">
				<!-- box1 -->
				<div class="box hvr-float">
					<span>Delicious Food</span>
					<p>We serve tasty and carefully crafted dishes prepared with
						the freshest ingredients every day.</p>
				</div>
				<!-- box2 -->
				<div class="box hvr-float">
					<span>Expert Chefs</span>
					<p>Our experienced chefs bring culinary passion and technique
						to every single meal served.</p>
				</div>
				<!-- box3 -->
				<div class="box hvr-float">
					<span>Friendly Staff</span>
					<p>Enjoy a warm, hospitable atmosphere with quick and helpful
						service for every visitor.</p>
				</div>
				<!-- box4 -->
				<div class="box hvr-float">
					<span>Parties And Events</span>
					<p>We provide ideal catering and dining space for private
						celebrations and special occasions.</p>
				</div>
			</div>
		</div>

	</div>

	<!-- about chef -->
	<div class="btn-chef">
		<div class="chef">
			<h1>
				Our Professional <span>Chefs</span>
			</h1>
			<p>Meet our talented team of culinary professionals dedicated to
				creating memorable dining experiences for you and your family.</p>
			<div class="btn-chefbox">

				<!-- box1 -->
				<div class="chefbox">
					<img
						src="https://i.pinimg.com/1200x/cf/c6/3b/cfc63bf490b7d14ebebf7eff36795225.jpg"
						alt="Jeon Jung-kook">
					<div class="chef-pn">
						<h2>Jeon Jung-kook</h2>
						<span>Master Chef</span>
						<div class="icon">
							<a href="https://web.whatsapp.com/" target="_blank"><i
								class="fa-brands fa-whatsapp"></i></a> <a
								href="https://en.wikipedia.org/wiki/Telegram_(software)"
								target="_blank"><i class="fa-brands fa-telegram"></i></a> <a
								href="https://blog.youtube/" target="_blank"><i
								class="fa-brands fa-youtube"></i></a> <a
								href="https://en.wikipedia.org/wiki/TikTok" target="_blank"><i
								class="fa-brands fa-tiktok"></i></a>
						</div>
					</div>
				</div>

				<!-- box2 -->
				<div class="chefbox">
					<img
						src="https://i.pinimg.com/1200x/74/87/7a/74877a6bcc7cbb357f2ea3093ecd0468.jpg"
						alt="Yang Jung-won">
					<div class="chef-pn">
						<h2>Yang Jung-won</h2>
						<span>Head Chef</span>
						<div class="icon">
							<a href="https://web.whatsapp.com/" target="_blank"><i
								class="fa-brands fa-whatsapp"></i></a> <a
								href="https://en.wikipedia.org/wiki/Telegram_(software)"
								target="_blank"><i class="fa-brands fa-telegram"></i></a> <a
								href="https://blog.youtube/" target="_blank"><i
								class="fa-brands fa-youtube"></i></a> <a
								href="https://en.wikipedia.org/wiki/TikTok" target="_blank"><i
								class="fa-brands fa-tiktok"></i></a>
						</div>
					</div>
				</div>

				<!-- box3 -->
				<div class="chefbox">
					<img
						src="https://i.pinimg.com/736x/79/fe/6b/79fe6b5d208d97d779edecd0b1288e1c.jpg"
						alt="Park Jong-seong">
					<div class="chef-pn">
						<h2>Park Jong-seong</h2>
						<span>Sous Chef</span>
						<div class="icon">
							<a href="https://web.whatsapp.com/" target="_blank"><i
								class="fa-brands fa-whatsapp"></i></a> <a
								href="https://en.wikipedia.org/wiki/Telegram_(software)"
								target="_blank"><i class="fa-brands fa-telegram"></i></a> <a
								href="https://blog.youtube/" target="_blank"><i
								class="fa-brands fa-youtube"></i></a> <a
								href="https://en.wikipedia.org/wiki/TikTok" target="_blank"><i
								class="fa-brands fa-tiktok"></i></a>
						</div>
					</div>
				</div>

				<!-- box4 -->
				<div class="chefbox">
					<img
						src="https://i.pinimg.com/1200x/eb/44/b8/eb44b887356531e1737596c96e49d719.jpg"
						alt="Kim Seok-jin">
					<div class="chef-pn">
						<h2>Kim Seok-jin</h2>
						<span>Pastry Chef</span>
						<div class="icon">
							<a href="https://web.whatsapp.com/" target="_blank"><i
								class="fa-brands fa-whatsapp"></i></a> <a
								href="https://en.wikipedia.org/wiki/Telegram_(software)"
								target="_blank"><i class="fa-brands fa-telegram"></i></a> <a
								href="https://blog.youtube/" target="_blank"><i
								class="fa-brands fa-youtube"></i></a> <a
								href="https://en.wikipedia.org/wiki/TikTok" target="_blank"><i
								class="fa-brands fa-tiktok"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>






	<!-------------------------------------------Popular Foods & Desserts------------------------------------------->
	<section id="Popular" class="bg-[#E397A4] py-20 px-4 sm:px-6 lg:px-8">
		<div class="max-w-6xl mx-auto space-y-16">

			<!-- Main Title -->
			<div class="text-center max-w-2xl mx-auto">
				<span
					class="text-amber-600 font-semibold text-sm tracking-wide uppercase">Delicious
					Choices</span>
				<h2 class="font-serif-header text-4xl font-bold text-gray-950 mt-1">
					Popular <span class="text-amber-600">Foods</span>
				</h2>
				<div class="w-16 h-1 bg-amber-600 mx-auto mt-3 rounded-full"></div>
			</div>

			<!-- BREAKFAST SECTION -->
			<div>
				<h3
					class="text-2xl font-bold text-gray-900 mb-6 flex items-center gap-2 border-b border-gray-200 pb-2">
					<i class="fas fa-sun text-amber-600"></i> Breakfast
				</h3>
				<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
					<!-- Item 1 -->
					<div
						class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
						<div>
							<div
								class="relative overflow-hidden h-44 bg-gray-50 rounded-xl mb-4">
								<img
									class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
									src="https://media.istockphoto.com/id/512751260/photo/homemade-labskaus-northern-germany-cuisine.jpg?s=612x612&w=0&k=20&c=zKEWlEE6Jy-DJnupraAXw0_pVzWCYlAZYSBFBOZs7Iw="
									alt="Salted Fried Egg">
							</div>
							<h4 class="text-base font-bold text-gray-900 truncate">Salted
								Fried Egg</h4>
						</div>
						<div
							class="flex justify-between items-center pt-3 mt-2 border-t border-gray-50">
							<span class="text-base font-bold text-gray-900">$25.00</span>
							<button type="button"
								onclick="addToCart('Salted Fried Egg', '25.00', this)"
								class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
								<i class="fas fa-cart-plus"></i> <span>Add</span>
							</button>
						</div>
					</div>

					<!-- Item 2 -->
					<div
						class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
						<div>
							<div
								class="relative overflow-hidden h-44 bg-gray-50 rounded-xl mb-4">
								<img
									class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
									src="https://cdn.pixabay.com/photo/2017/07/25/00/23/calamari-2536527_1280.jpg"
									alt="Salted Fried Chicken">
							</div>
							<h4 class="text-base font-bold text-gray-900 truncate">Salted
								Fried Chicken</h4>
						</div>
						<div
							class="flex justify-between items-center pt-3 mt-2 border-t border-gray-50">
							<span class="text-base font-bold text-gray-900">$20.00</span>
							<button type="button"
								onclick="addToCart('Salted Fried Chicken', '20.00', this)"
								class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
								<i class="fas fa-cart-plus"></i> <span>Add</span>
							</button>
						</div>
					</div>

					<!-- Item 3 -->
					<div
						class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
						<div>
							<div
								class="relative overflow-hidden h-44 bg-gray-50 rounded-xl mb-4">
								<img
									class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
									src="https://cdn.pixabay.com/photo/2016/08/03/05/18/fried-1565908_1280.jpg"
									alt="Lotus Fish Wind">
							</div>
							<h4 class="text-base font-bold text-gray-900 truncate">Lotus
								Fish Wind</h4>
						</div>
						<div
							class="flex justify-between items-center pt-3 mt-2 border-t border-gray-50">
							<span class="text-base font-bold text-gray-900">$19.00</span>
							<button type="button"
								onclick="addToCart('Lotus Fish Wind', '19.00', this)"
								class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
								<i class="fas fa-cart-plus"></i> <span>Add</span>
							</button>
						</div>
					</div>

					<!-- Item 4 -->
					<div
						class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
						<div>
							<div
								class="relative overflow-hidden h-44 bg-gray-50 rounded-xl mb-4">
								<img
									class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
									src="https://cdn.pixabay.com/photo/2018/09/10/17/44/bread-3667553_1280.jpg"
									alt="Salted Bread Hotdog">
							</div>
							<h4 class="text-base font-bold text-gray-900 truncate">Salted
								Bread Hotdog</h4>
						</div>
						<div
							class="flex justify-between items-center pt-3 mt-2 border-t border-gray-50">
							<span class="text-base font-bold text-gray-900">$27.00</span>
							<button type="button"
								onclick="addToCart('Salted Bread Hotdog', '27.00', this)"
								class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
								<i class="fas fa-cart-plus"></i> <span>Add</span>
							</button>
						</div>
					</div>
				</div>
			</div>

			<!-- LUNCH SECTION -->
			<div>
				<h3
					class="text-2xl font-bold text-gray-900 mb-6 flex items-center gap-2 border-b border-gray-200 pb-2">
					<i class="fas fa-utensils text-amber-600"></i> Lunch
				</h3>
				<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
					<!-- Item 1 -->
					<div
						class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
						<div>
							<div
								class="relative overflow-hidden h-44 bg-gray-50 rounded-xl mb-4">
								<img
									class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
									src="https://cdn.pixabay.com/photo/2016/04/15/09/10/pasta-1330541_1280.jpg"
									alt="Italian Sauce Mushroom">
							</div>
							<h4 class="text-base font-bold text-gray-900 truncate">Italian
								Sauce Mushroom</h4>
						</div>
						<div
							class="flex justify-between items-center pt-3 mt-2 border-t border-gray-50">
							<span class="text-base font-bold text-gray-900">$19.00</span>
							<button type="button"
								onclick="addToCart('Italian Sauce Mushroom', '19.00', this)"
								class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
								<i class="fas fa-cart-plus"></i> <span>Add</span>
							</button>
						</div>
					</div>

					<!-- Item 2 -->
					<div
						class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
						<div>
							<div
								class="relative overflow-hidden h-44 bg-gray-50 rounded-xl mb-4">
								<img
									class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
									src="https://cdn.pixabay.com/photo/2015/03/11/00/31/chicken-667935_1280.jpg"
									alt="Salted Fried Chicken">
							</div>
							<h4 class="text-base font-bold text-gray-900 truncate">Salted
								Fried Chicken</h4>
						</div>
						<div
							class="flex justify-between items-center pt-3 mt-2 border-t border-gray-50">
							<span class="text-base font-bold text-gray-900">$15.00</span>
							<button type="button"
								onclick="addToCart('Salted Fried Chicken', '15.00', this)"
								class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
								<i class="fas fa-cart-plus"></i> <span>Add</span>
							</button>
						</div>
					</div>

					<!-- Item 3 -->
					<div
						class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
						<div>
							<div
								class="relative overflow-hidden h-44 bg-gray-50 rounded-xl mb-4">
								<img
									class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
									src="https://cdn.pixabay.com/photo/2022/07/07/17/26/fried-chicken-7307610_1280.jpg"
									alt="Fried Potato w/ Garlic">
							</div>
							<h4 class="text-base font-bold text-gray-900 truncate">Fried
								Potato w/ Garlic</h4>
						</div>
						<div
							class="flex justify-between items-center pt-3 mt-2 border-t border-gray-50">
							<span class="text-base font-bold text-gray-900">$21.00</span>
							<button type="button"
								onclick="addToCart('Fried Potato w/ Garlic', '21.00', this)"
								class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
								<i class="fas fa-cart-plus"></i> <span>Add</span>
							</button>
						</div>
					</div>

					<!-- Item 4 -->
					<div
						class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
						<div>
							<div
								class="relative overflow-hidden h-44 bg-gray-50 rounded-xl mb-4">
								<img
									class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
									src="https://cdn.pixabay.com/photo/2022/01/06/05/56/seafood-6918672_1280.jpg"
									alt="Shrimp and Olive">
							</div>
							<h4 class="text-base font-bold text-gray-900 truncate">Shrimp
								and Olive</h4>
						</div>
						<div
							class="flex justify-between items-center pt-3 mt-2 border-t border-gray-50">
							<span class="text-base font-bold text-gray-900">$25.00</span>
							<button type="button"
								onclick="addToCart('Shrimp and Olive', '25.00', this)"
								class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
								<i class="fas fa-cart-plus"></i> <span>Add</span>
							</button>
						</div>
					</div>
				</div>
			</div>

			<!-- DINNER SECTION -->
			<div>
				<h3
					class="text-2xl font-bold text-gray-900 mb-6 flex items-center gap-2 border-b border-gray-200 pb-2">
					<i class="fas fa-moon text-amber-600"></i> Dinner
				</h3>
				<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
					<!-- Item 1 -->
					<div
						class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
						<div>
							<div
								class="relative overflow-hidden h-44 bg-gray-50 rounded-xl mb-4">
								<img
									class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
									src="https://cdn.pixabay.com/photo/2015/04/08/13/14/food-712666_1280.jpg"
									alt="Salmon Seeded Mustard">
							</div>
							<h4 class="text-base font-bold text-gray-900 truncate">Salmon
								Seeded Mustard</h4>
						</div>
						<div
							class="flex justify-between items-center pt-3 mt-2 border-t border-gray-50">
							<span class="text-base font-bold text-gray-900">$25.00</span>
							<button type="button"
								onclick="addToCart('Salmon Seeded Mustard', '25.00', this)"
								class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
								<i class="fas fa-cart-plus"></i> <span>Add</span>
							</button>
						</div>
					</div>

					<!-- Item 2 -->
					<div
						class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
						<div>
							<div
								class="relative overflow-hidden h-44 bg-gray-50 rounded-xl mb-4">
								<img
									class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
									src="https://cdn.pixabay.com/photo/2019/07/28/16/42/sushi-4369011_1280.jpg"
									alt="Japanese Sushi">
							</div>
							<h4 class="text-base font-bold text-gray-900 truncate">Japanese
								Sushi</h4>
						</div>
						<div
							class="flex justify-between items-center pt-3 mt-2 border-t border-gray-50">
							<span class="text-base font-bold text-gray-900">$27.00</span>
							<button type="button"
								onclick="addToCart('Japanese Sushi', '27.00', this)"
								class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
								<i class="fas fa-cart-plus"></i> <span>Add</span>
							</button>
						</div>
					</div>

					<!-- Item 3 -->
					<div
						class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
						<div>
							<div
								class="relative overflow-hidden h-44 bg-gray-50 rounded-xl mb-4">
								<img
									class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
									src="https://cdn.pixabay.com/photo/2021/02/09/03/53/thai-food-5997301_1280.jpg"
									alt="Steak And Vegetables">
							</div>
							<h4 class="text-base font-bold text-gray-900 truncate">Steak
								And Vegetables</h4>
						</div>
						<div
							class="flex justify-between items-center pt-3 mt-2 border-t border-gray-50">
							<span class="text-base font-bold text-gray-900">$29.00</span>
							<button type="button"
								onclick="addToCart('Steak And Vegetables', '29.00', this)"
								class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
								<i class="fas fa-cart-plus"></i> <span>Add</span>
							</button>
						</div>
					</div>

					<!-- Item 4 -->
					<div
						class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
						<div>
							<div
								class="relative overflow-hidden h-44 bg-gray-50 rounded-xl mb-4">
								<img
									class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
									src="https://cdn.pixabay.com/photo/2017/11/17/16/05/duck-2957809_1280.jpg"
									alt="Roast Duck">
							</div>
							<h4 class="text-base font-bold text-gray-900 truncate">Roast
								Duck</h4>
						</div>
						<div
							class="flex justify-between items-center pt-3 mt-2 border-t border-gray-50">
							<span class="text-base font-bold text-gray-900">$30.00</span>
							<button type="button"
								onclick="addToCart('Roast Duck', '30.00', this)"
								class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
								<i class="fas fa-cart-plus"></i> <span>Add</span>
							</button>
						</div>
					</div>
				</div>
			</div>

			<!-- DRINKS SECTION -->
			<div>
				<h3
					class="text-2xl font-bold text-gray-900 mb-6 flex items-center gap-2 border-b border-gray-200 pb-2">
					<i class="fas fa-glass-martini-alt text-amber-500"></i> Drinks
				</h3>
				<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
					<!-- Item 1 -->
					<div
						class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
						<div>
							<div
								class="relative overflow-hidden h-44 bg-gray-50 rounded-xl mb-4">
								<img
									class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
									src="https://cdn.pixabay.com/photo/2016/09/29/20/05/drink-1703659_1280.jpg"
									alt="Kiwi Cocktail Kefir">
							</div>
							<h4 class="text-base font-bold text-gray-900 truncate">Kiwi
								Cocktail Kefir</h4>
						</div>
						<div
							class="flex justify-between items-center pt-3 mt-2 border-t border-gray-50">
							<span class="text-base font-bold text-gray-900">$18.00</span>
							<button type="button"
								onclick="addToCart('Kiwi Cocktail Kefir', '18.00', this)"
								class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
								<i class="fas fa-cart-plus"></i> <span>Add</span>
							</button>
						</div>
					</div>

					<!-- Item 2 -->
					<div
						class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
						<div>
							<div
								class="relative overflow-hidden h-44 bg-gray-50 rounded-xl mb-4">
								<img
									class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
									src="https://cdn.pixabay.com/photo/2023/05/31/11/14/smoothie-8031132_1280.jpg"
									alt="Milkshake">
							</div>
							<h4 class="text-base font-bold text-gray-900 truncate">Milkshake</h4>
						</div>
						<div
							class="flex justify-between items-center pt-3 mt-2 border-t border-gray-50">
							<span class="text-base font-bold text-gray-900">$10.00</span>
							<button type="button"
								onclick="addToCart('Milkshake', '10.00', this)"
								class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
								<i class="fas fa-cart-plus"></i> <span>Add</span>
							</button>
						</div>
					</div>

					<!-- Item 3 -->
					<div
						class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
						<div>
							<div
								class="relative overflow-hidden h-44 bg-gray-50 rounded-xl mb-4">
								<img
									class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
									src="https://cdn.pixabay.com/photo/2016/09/30/15/19/cocktail-1705561_1280.jpg"
									alt="Cocktail Bar Nightlife">
							</div>
							<h4 class="text-base font-bold text-gray-900 truncate">Cocktail
								Bar Nightlife</h4>
						</div>
						<div
							class="flex justify-between items-center pt-3 mt-2 border-t border-gray-50">
							<span class="text-base font-bold text-gray-900">$15.00</span>
							<button type="button"
								onclick="addToCart('Cocktail Bar Nightlife', '15.00', this)"
								class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
								<i class="fas fa-cart-plus"></i> <span>Add</span>
							</button>
						</div>
					</div>

					<!-- Item 4 -->
					<div
						class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
						<div>
							<div
								class="relative overflow-hidden h-44 bg-gray-50 rounded-xl mb-4">
								<img
									class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
									src="https://cdn.pixabay.com/photo/2018/03/13/11/39/fruit-3222313_1280.jpg"
									alt="Fruit Cocktail Smoothie">
							</div>
							<h4 class="text-base font-bold text-gray-900 truncate">Fruit
								Cocktail Smoothie</h4>
						</div>
						<div
							class="flex justify-between items-center pt-3 mt-2 border-t border-gray-50">
							<span class="text-base font-bold text-gray-900">$19.00</span>
							<button type="button"
								onclick="addToCart('Fruit Cocktail Smoothie', '19.00', this)"
								class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
								<i class="fas fa-cart-plus"></i> <span>Add</span>
							</button>
						</div>
					</div>
				</div>
			</div>

			<!-- POPULAR DESSERTS SECTION -->
			<div class="pt-8">
				<div class="text-center max-w-2xl mx-auto mb-10">
					<h2 class="font-serif-header text-3xl font-bold text-gray-950">
						Popular <span class="text-amber-600">Desserts</span>
					</h2>
					<div class="w-12 h-1 bg-amber-600 mx-auto mt-2 rounded-full"></div>
				</div>

				<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
					<!-- Dessert 1 -->
					<div
						class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
						<div>
							<div
								class="relative overflow-hidden h-44 bg-gray-50 rounded-xl mb-4 flex items-center justify-center">
								<img
									class="w-full h-full object-contain p-2 group-hover:scale-105 transition-transform duration-300"
									src="https://preview.colorlib.com/theme/meal2/images/1x/dessert_1.png"
									alt="Cherry Muffin">
							</div>
							<h4 class="text-base font-bold text-gray-900 truncate">Cherry
								Muffin</h4>
						</div>
						<div
							class="flex justify-between items-center pt-3 mt-2 border-t border-gray-50">
							<span class="text-base font-bold text-gray-900">$10.00</span>
							<button type="button"
								onclick="addToCart('Cherry Muffin', '10.00', this)"
								class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
								<i class="fas fa-cart-plus"></i> <span>Add</span>
							</button>
						</div>
					</div>

					<!-- Dessert 2 -->
					<div
						class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
						<div>
							<div
								class="relative overflow-hidden h-44 bg-gray-50 rounded-xl mb-4 flex items-center justify-center">
								<img
									class="w-full h-full object-contain p-2 group-hover:scale-105 transition-transform duration-300"
									src="https://preview.colorlib.com/theme/meal2/images/1x/dessert_2.png"
									alt="Rose Muffin">
							</div>
							<h4 class="text-base font-bold text-gray-900 truncate">Rose
								Muffin</h4>
						</div>
						<div
							class="flex justify-between items-center pt-3 mt-2 border-t border-gray-50">
							<span class="text-base font-bold text-gray-900">$12.00</span>
							<button type="button"
								onclick="addToCart('Rose Muffin', '12.00', this)"
								class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
								<i class="fas fa-cart-plus"></i> <span>Add</span>
							</button>
						</div>
					</div>

					<!-- Dessert 3 -->
					<div
						class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
						<div>
							<div
								class="relative overflow-hidden h-44 bg-gray-50 rounded-xl mb-4 flex items-center justify-center">
								<img
									class="w-full h-full object-contain p-2 group-hover:scale-105 transition-transform duration-300"
									src="https://preview.colorlib.com/theme/meal2/images/1x/dessert_5.png"
									alt="Sweet Donut">
							</div>
							<h4 class="text-base font-bold text-gray-900 truncate">Sweet
								Donut</h4>
						</div>
						<div
							class="flex justify-between items-center pt-3 mt-2 border-t border-gray-50">
							<span class="text-base font-bold text-gray-900">$15.00</span>
							<button type="button"
								onclick="addToCart('Sweet Donut', '15.00', this)"
								class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
								<i class="fas fa-cart-plus"></i> <span>Add</span>
							</button>
						</div>
					</div>

					<!-- Dessert 4 -->
					<div
						class="bg-white rounded-2xl p-4 shadow-sm hover:shadow-xl hover:-translate-y-2 transition-all duration-300 border border-gray-100 flex flex-col justify-between group">
						<div>
							<div
								class="relative overflow-hidden h-44 bg-gray-50 rounded-xl mb-4 flex items-center justify-center">
								<img
									class="w-full h-full object-contain p-2 group-hover:scale-105 transition-transform duration-300"
									src="https://preview.colorlib.com/theme/meal2/images/1x/dessert_4.png"
									alt="Chocolate Cake">
							</div>
							<h4 class="text-base font-bold text-gray-900 truncate">Chocolate
								Cake</h4>
						</div>
						<div
							class="flex justify-between items-center pt-3 mt-2 border-t border-gray-50">
							<span class="text-base font-bold text-gray-900">$18.00</span>
							<button type="button"
								onclick="addToCart('Chocolate Cake', '18.00', this)"
								class="bg-amber-600 hover:bg-amber-700 text-white px-3.5 py-2 rounded-xl text-xs font-medium transition-all duration-200 flex items-center gap-1.5 shadow-sm active:scale-95">
								<i class="fas fa-cart-plus"></i> <span>Add</span>
							</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>

	<!-- Floating Cart Button -->
	<button type="button" onclick="openCartModal()"
		class="fixed bottom-6 right-6 bg-amber-600 hover:bg-amber-700 text-white p-4 rounded-full shadow-2xl z-40 flex items-center gap-2 transition-transform active:scale-95">
		<i class="fas fa-shopping-cart text-lg"></i> <span id="cartCount"
			class="bg-white text-amber-600 font-bold text-xs w-6 h-6 rounded-full flex items-center justify-center shadow">0</span>
	</button>

	<!-- Shopping Cart Modal -->
	<div id="cartModal"
		class="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 hidden flex items-center justify-center p-4">
		<div
			class="bg-white rounded-2xl max-w-md w-full p-6 shadow-2xl relative flex flex-col max-h-[85vh]">
			<div class="flex justify-between items-center border-b pb-3 mb-4">
				<h3 class="text-xl font-bold text-gray-900 flex items-center gap-2">
					<i class="fas fa-shopping-bag text-amber-600"></i> Your Cart
				</h3>
				<button type="button" onclick="closeCartModal()"
					class="text-gray-400 hover:text-gray-600 text-lg">
					<i class="fas fa-times"></i>
				</button>
			</div>

			<!-- Cart Items Container (កែ ID ទៅជា cartItems) -->
			<div id="cartItems" class="flex-1 overflow-y-auto space-y-3 pr-1">
				<!-- Dynamic Content Managed by JavaScript -->
			</div>

			<!-- Cart Summary -->
			<div class="border-t pt-4 mt-4 space-y-3">
				<div class="flex justify-between text-base font-bold text-gray-900">
					<span>Total Amount:</span> <span id="cartTotal">$0.00</span>
				</div>
				<!-- កែ Function ទៅជា checkout(event) -->
				<button type="button" onclick="checkout(event)"
					class="w-full bg-amber-600 hover:bg-amber-700 text-white font-semibold py-3 rounded-xl transition shadow duration-200 flex items-center justify-center gap-2">
					<i class="fas fa-credit-card"></i> Proceed to Checkout
				</button>
			</div>
		</div>
	</div>








	<!-- =========================================================
     LOGIN / REGISTER MODAL
     ========================================================= -->
	<div id="authModal"
		class="fixed inset-0 bg-black/50 z-50 hidden items-center justify-center p-4 backdrop-blur-sm">
		<div
			class="relative w-full max-w-md rounded-2xl bg-white shadow-2xl overflow-hidden">
			<button type="button" onclick="closeAuthModal()"
				class="absolute right-4 top-4 z-10 h-9 w-9 rounded-full bg-gray-100 text-gray-600 hover:bg-gray-200">
				<i class="fas fa-xmark"></i>
			</button>

			<div class="bg-[#E397A4] px-6 py-7 text-center text-white">
				<div
					class="mx-auto mb-3 flex h-16 w-16 items-center justify-center rounded-full bg-white/20">
					<i id="authIcon" class="far fa-user text-2xl"></i>
				</div>
				<h2 id="authTitle" class="text-2xl font-bold">Welcome Back</h2>
				<p id="authSubtitle" class="mt-1 text-sm text-white/90">Login to
					continue to LittleStar Restaurant</p>
			</div>

			<form id="authForm" action="login" method="post"
				class="space-y-4 p-6">
				<div id="registerNameGroup" class="hidden">
					<label class="mb-1 block text-sm font-semibold text-gray-700">Full
						Name</label> <input id="registerName" name="name" type="text"
						placeholder="Enter your name"
						class="w-full rounded-xl border border-gray-300 px-4 py-3 outline-none focus:border-pink-400">
				</div>

				<div>
					<label class="mb-1 block text-sm font-semibold text-gray-700">Email</label>
					<input name="email" type="email" placeholder="example@gmail.com"
						required
						class="w-full rounded-xl border border-gray-300 px-4 py-3 outline-none focus:border-pink-400">
				</div>

				<div>
					<label class="mb-1 block text-sm font-semibold text-gray-700">Password</label>
					<div class="relative">
						<input id="authPassword" name="password" type="password"
							placeholder="Enter password" required
							class="w-full rounded-xl border border-gray-300 px-4 py-3 pr-12 outline-none focus:border-pink-400">
						<button type="button" onclick="togglePassword()"
							class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-500 hover:text-gray-700">
							<i id="passwordIcon" class="far fa-eye"></i>
						</button>
					</div>
				</div>

				<div id="authMessage" class="hidden rounded-lg px-3 py-2 text-sm"></div>

				<button id="authSubmitBtn" type="submit"
					class="w-full rounded-xl bg-[#E397A4] px-4 py-3 font-bold text-white transition hover:bg-[#d88392]">
					Log In</button>

				<p class="text-center text-sm text-gray-600">
					<span id="authSwitchText">Don't have an account?</span>
					<button type="button" id="authSwitchBtn" onclick="switchAuthMode()"
						class="font-bold text-[#E397A4] hover:underline">Register</button>
				</p>
			</form>
		</div>
	</div>







	<!-- =========================================================
     CART OVERLAY + DRAWER
     ========================================================= -->
	<!-- overlay ត្រូវមាន hidden -->
	<div id="cartOverlay" onclick="toggleCartDrawer(false)"
		class="fixed inset-0 z-[90] hidden bg-black/50"></div>
	<aside id="cartDrawer"
		class="fixed right-0 top-0 z-[95] h-full w-full max-w-md translate-x-full bg-white shadow-2xl transition-transform duration-300">
		<div class="flex h-full flex-col">
			<div
				class="flex items-center justify-between bg-[#E397A4] px-5 py-4 text-white">
				<div>
					<h2 class="text-xl font-bold">
						<i class="fas fa-shopping-bag mr-2"></i>My Cart
					</h2>
					<p id="cartItemCountText" class="text-xs text-white/90">0 items</p>
				</div>
				<button type="button" onclick="toggleCartDrawer(false)"
					class="h-9 w-9 rounded-full bg-white/20 hover:bg-white/30">
					<i class="fas fa-xmark"></i>
				</button>
			</div>

			<div id="cartItems" class="flex-1 overflow-y-auto p-4">
				<div
					class="flex h-full min-h-[350px] items-center justify-center text-gray-500">Loading
					cart...</div>
			</div>

			<div class="border-t bg-white p-5">
				<div
					class="mb-3 flex items-center justify-between text-lg font-bold">
					<span>Total</span> <span id="cartTotal">$0.00</span>
				</div>

				<form action="checkout" method="post">
					<button type="submit"
						class="w-full rounded-xl bg-[#E397A4] px-4 py-3 font-bold text-white transition hover:bg-[#d88392]">
						<i class="fas fa-credit-card mr-2"></i>Checkout
					</button>
				</form>

				<button type="button" onclick="clearCart()"
					class="mt-2 w-full rounded-xl border border-gray-300 px-4 py-3 font-semibold text-gray-600 hover:bg-gray-50">
					Clear Cart</button>
			</div>
		</div>
	</aside>

	<div id="restaurantToast"
		class="fixed bottom-5 left-1/2 z-[200] hidden -translate-x-1/2 rounded-xl bg-gray-900 px-5 py-3 text-sm font-semibold text-white shadow-xl"></div>



	<!-- ========================================================= -->
	<!-- CUSTOMER INFO & CHECKOUT MODAL -->
	<!-- ========================================================= -->
	<div id="checkoutModal"
		class="fixed inset-0 z-50 hidden items-center justify-center bg-black/50 p-4">
		<div class="w-full max-w-md rounded-2xl bg-white p-6 shadow-xl">
			<div class="flex items-center justify-between border-b pb-3">
				<h3 class="text-xl font-bold text-gray-800">
					<i class="fas fa-user-edit text-[#E397A4] mr-2"></i>Customer Info
				</h3>
				<button onclick="closeCheckoutModal()"
					class="text-gray-400 hover:text-gray-600">
					<i class="fas fa-times text-xl"></i>
				</button>
			</div>

			<form id="checkoutForm" onsubmit="submitCheckout(event)"
				class="mt-4 space-y-4">
				<!-- Full Name -->
				<div>
					<label class="block text-sm font-medium text-gray-700 mb-1">Full
						Name *</label> <input type="text" id="custName" required
						placeholder="John Doe"
						class="w-full rounded-xl border border-gray-300 px-4 py-2 focus:border-[#E397A4] focus:outline-none">
				</div>

				<!-- Phone Number -->
				<div>
					<label class="block text-sm font-medium text-gray-700 mb-1">Phone
						Number *</label> <input type="tel" id="custPhone" required
						placeholder="012345678"
						class="w-full rounded-xl border border-gray-300 px-4 py-2 focus:border-[#E397A4] focus:outline-none">
				</div>

				<!-- Delivery Address -->
				<div>
					<label class="block text-sm font-medium text-gray-700 mb-1">Delivery
						Address *</label>
					<textarea id="custAddress" required rows="2"
						placeholder="Street, Khan/Sangkat, City..."
						class="w-full rounded-xl border border-gray-300 px-4 py-2 focus:border-[#E397A4] focus:outline-none"></textarea>
				</div>

				<!-- Note -->
				<div>
					<label class="block text-sm font-medium text-gray-700 mb-1">Note
						(Optional)</label> <input type="text" id="custNote"
						placeholder="e.g. Call before arrival, Less spicy"
						class="w-full rounded-xl border border-gray-300 px-4 py-2 focus:border-[#E397A4] focus:outline-none">
				</div>

				<!-- Order Total Display -->
				<div
					class="flex justify-between items-center bg-gray-50 p-3 rounded-xl border border-gray-200">
					<span class="font-bold text-gray-700">Total Payment:</span> <span
						id="checkoutModalTotal" class="text-xl font-bold text-[#E397A4]">$0.00</span>
				</div>

				<!-- Submit Button -->
				<div class="flex gap-3 pt-2">
					<button type="button" onclick="closeCheckoutModal()"
						class="w-1/2 rounded-xl border border-gray-300 py-2.5 font-bold text-gray-600 hover:bg-gray-100">
						Cancel</button>
					<button type="submit"
						class="w-1/2 rounded-xl bg-[#E397A4] py-2.5 font-bold text-white hover:bg-[#d88492] transition">
						Confirm Order</button>
				</div>
			</form>
		</div>
	</div>




	<script>
var contextPath = '<%=request.getContextPath()%>';
var authMode = 'login';

// =========================================================
// AUTHENTICATION MODAL FUNCTIONS
// =========================================================
function openAuthModal(mode, message) {
    if (!mode) mode = 'login';
    if (!message) message = '';
    authMode = mode;
    updateAuthModal();
    var modal = document.getElementById('authModal');
    if (modal) {
        modal.classList.remove('hidden');
        modal.classList.add('flex');
    }
    document.body.classList.add('overflow-hidden');
    if (message) showAuthMessage(message, 'error');
}

function closeAuthModal() {
    var modal = document.getElementById('authModal');
    if (modal) {
        modal.classList.add('hidden');
        modal.classList.remove('flex');
    }
    document.body.classList.remove('overflow-hidden');
}

function switchAuthMode() {
    authMode = (authMode === 'login') ? 'register' : 'login';
    updateAuthModal();
    hideAuthMessage();
}

function updateAuthModal() {
    var title = document.getElementById('authTitle');
    var subtitle = document.getElementById('authSubtitle');
    var icon = document.getElementById('authIcon');
    var form = document.getElementById('authForm');
    var submit = document.getElementById('authSubmitBtn');
    var switchText = document.getElementById('authSwitchText');
    var switchBtn = document.getElementById('authSwitchBtn');
    var nameGroup = document.getElementById('registerNameGroup');
    var nameInput = document.getElementById('registerName');

    if (authMode === 'register') {
        if (title) title.textContent = 'Create Account';
        if (subtitle) subtitle.textContent = 'Register to order your favorite food';
        if (icon) icon.className = 'fas fa-user-plus text-2xl';
        if (form) form.action = contextPath + '/register';
        if (submit) submit.textContent = 'Register';
        if (switchText) switchText.textContent = 'Already have an account?';
        if (switchBtn) switchBtn.textContent = 'Log In';
        if (nameGroup) nameGroup.classList.remove('hidden');
        if (nameInput) nameInput.required = true;
    } else {
        if (title) title.textContent = 'Welcome Back';
        if (subtitle) subtitle.textContent = 'Login to continue to LittleStar Restaurant';
        if (icon) icon.className = 'far fa-user text-2xl';
        if (form) form.action = contextPath + '/login';
        if (submit) submit.textContent = 'Log In';
        if (switchText) switchText.textContent = "Don't have an account?";
        if (switchBtn) switchBtn.textContent = 'Register';
        if (nameGroup) nameGroup.classList.add('hidden');
        if (nameInput) nameInput.required = false;
    }
}

function showAuthMessage(message, type) {
    if (!type) type = 'error';
    var box = document.getElementById('authMessage');
    if (!box) return;
    box.textContent = message;
    box.classList.remove('hidden', 'bg-red-50', 'text-red-600', 'bg-green-50', 'text-green-600');
    box.classList.add(type === 'success' ? 'bg-green-50' : 'bg-red-50');
    box.classList.add(type === 'success' ? 'text-green-600' : 'text-red-600');
}

function hideAuthMessage() {
    var box = document.getElementById('authMessage');
    if (box) {
        box.classList.add('hidden');
        box.textContent = '';
    }
}

function togglePassword() {
    var password = document.getElementById('authPassword');
    var icon = document.getElementById('passwordIcon');
    if (password && icon) {
        if (password.type === 'password') {
            password.type = 'text';
            icon.className = 'far fa-eye-slash';
        } else {
            password.type = 'password';
            icon.className = 'far fa-eye';
        }
    }
}

// =========================================================
// CART MODAL & AJAX ACTIONS
// =========================================================
function openCartModal() {
    var modal = document.getElementById('cartModal');
    if (modal) {
        modal.classList.remove('hidden');
        modal.classList.add('flex');
        document.body.classList.add('overflow-hidden');
        loadCart();
    }
}

function closeCartModal() {
    var modal = document.getElementById('cartModal');
    if (modal) {
        modal.classList.add('hidden');
        modal.classList.remove('flex');
        document.body.classList.remove('overflow-hidden');
    }
}

function addToCart(name, price, button) {
    var body = new URLSearchParams();
    body.append('action', 'add');
    body.append('name', name);
    body.append('price', price);

    fetch(contextPath + '/cart', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'},
        body: body.toString()
    })
    .then(function(response) {
        if (!response.ok) throw new Error('Unable to add item');
        return response.json();
    })
    .then(function(data) {
        updateCartBadge(data.count);
        showToast(name + ' added to cart');
        if (button) {
            var oldHTML = button.innerHTML;
            button.innerHTML = '<i class="fas fa-check mr-1"></i> Added';
            button.classList.add('bg-green-600');
            setTimeout(function() {
                button.innerHTML = oldHTML;
                button.classList.remove('bg-green-600');
            }, 900);
        }
    })
    .catch(function() { showToast('Could not add item to cart'); });
}

function updateCartBadge(count) {
    if (count === undefined) count = 0;
    var badge = document.getElementById('cartBadge');
    if (badge) badge.textContent = count;
    
    var countText = document.getElementById('cartCount');
    if (countText) countText.textContent = count;
}

function loadCart() {
    fetch(contextPath + '/cart')
        .then(function(response) { return response.json(); })
        .then(renderCart)
        .catch(function() { showToast('Could not load cart'); });
}

function renderCart(data) {
    var container = document.getElementById('cartItems');
    var cartTotal = document.getElementById('cartTotal');
    var cartItemCountText = document.getElementById('cartItemCountText');

    var items = data.items || [];
    var count = data.count || 0;

    var calculatedTotal = 0;
    for (var i = 0; i < items.length; i++) {
        var p = Number(items[i].price || 0);
        var q = Number(items[i].quantity || 1);
        calculatedTotal += (items[i].subtotal ? Number(items[i].subtotal) : (p * q));
    }

    var finalTotal = (data.total && Number(data.total) > 0) ? Number(data.total) : calculatedTotal;

    if (cartTotal) cartTotal.textContent = '$' + finalTotal.toFixed(2);
    if (cartItemCountText) cartItemCountText.textContent = count + (count === 1 ? ' item' : ' items');
    updateCartBadge(count);

    if (!container) return;

    if (!items.length) {
        container.innerHTML = 
            '<div class="flex h-full min-h-[200px] flex-col items-center justify-center text-center p-4">' +
                '<div class="mb-3 flex h-16 w-16 items-center justify-center rounded-full bg-amber-100">' +
                    '<i class="fas fa-shopping-bag text-2xl text-amber-600"></i>' +
                '</div>' +
                '<h3 class="text-base font-bold text-gray-700">Your cart is empty</h3>' +
                '<p class="mt-1 text-xs text-gray-500">Add some delicious food to your cart.</p>' +
            '</div>';
        return;
    }

    var html = '';
    for (var j = 0; j < items.length; j++) {
        var item = items[j];
        var itemPrice = Number(item.price || 0);
        var itemQty = Number(item.quantity || 1);
        var itemSubtotal = item.subtotal ? Number(item.subtotal) : (itemPrice * itemQty);

        html += '<div class="flex items-center justify-between p-3 bg-gray-50 rounded-xl border border-gray-100 mb-2">' +
            '<div class="min-w-0 flex-1">' +
                '<h4 class="font-semibold text-gray-800 text-sm truncate">' + escapeHtml(item.name) + '</h4>' +
                '<p class="text-xs text-gray-500">$' + itemPrice.toFixed(2) + ' × ' + itemQty + '</p>' +
            '</div>' +
            '<div class="flex items-center gap-3">' +
                '<div class="flex items-center border bg-white rounded-lg">' +
                    '<button type="button" onclick="changeQuantity(' + j + ', ' + (itemQty - 1) + ')" class="px-2 py-1 text-gray-600 hover:bg-gray-100 text-xs rounded-l-lg">-</button>' +
                    '<span class="px-2 text-xs font-bold">' + itemQty + '</span>' +
                    '<button type="button" onclick="changeQuantity(' + j + ', ' + (itemQty + 1) + ')" class="px-2 py-1 text-gray-600 hover:bg-gray-100 text-xs rounded-r-lg">+</button>' +
                '</div>' +
                '<span class="font-bold text-sm text-amber-600 w-14 text-right">$' + itemSubtotal.toFixed(2) + '</span>' +
                '<button type="button" onclick="removeFromCart(' + j + ')" class="text-gray-400 hover:text-red-500 text-xs ml-1">' +
                    '<i class="fas fa-trash"></i>' +
                '</button>' +
            '</div>' +
        '</div>';
    }
    container.innerHTML = html;
}

function changeQuantity(index, quantity) {
    var body = new URLSearchParams();
    body.append('action', 'update');
    body.append('index', index);
    body.append('quantity', quantity);
    sendCartRequest(body);
}

function removeFromCart(index) {
    var body = new URLSearchParams();
    body.append('action', 'remove');
    body.append('index', index);
    sendCartRequest(body);
}

function clearCart() {
    var body = new URLSearchParams();
    body.append('action', 'clear');
    
    return fetch(contextPath + '/cart', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'},
        body: body.toString()
    })
    .then(function(response) { return response.json(); })
    .then(function(data) {
        renderCart(data);
    })
    .catch(function() { showToast('Cart clear failed'); });
}

function sendCartRequest(body) {
    fetch(contextPath + '/cart', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'},
        body: body.toString()
    })
    .then(function(response) { return response.json(); })
    .then(renderCart)
    .catch(function() { showToast('Cart update failed'); });
}

// =========================================================
// CHECKOUT & CUSTOMER INFO MODAL FUNCTIONS
// =========================================================

// ១. ពេលចុច Checkout ពីក្នុង Cart Modal
function checkout(event) {
    if (event && event.preventDefault) {
        event.preventDefault();
    }

    fetch(contextPath + '/cart')
        .then(function(response) {
            if (!response.ok) throw new Error('Cart API response not OK');
            return response.json();
        })
        .then(function(data) {
            var items = data.items || [];
            if (!items.length) {
                alert('Your cart is empty! Please add some items before checkout.');
                return;
            }

            var totalAmount = 0;
            for (var i = 0; i < items.length; i++) {
                var p = Number(items[i].price || 0);
                var q = Number(items[i].quantity || 1);
                totalAmount += (items[i].subtotal ? Number(items[i].subtotal) : (p * q));
            }
            var formattedTotal = '$' + totalAmount.toFixed(2);

            fetch(contextPath + '/me')
                .then(function(res) { return res.json(); })
                .then(function(user) {
                    if (user && user.loggedIn) {
                        closeCartModal();
                        openCheckoutModal(formattedTotal, user);
                    } else {
                        closeCartModal();
                        openAuthModal('login', 'Please login to complete your order.');
                    }
                })
                .catch(function() {
                    closeCartModal();
                    openCheckoutModal(formattedTotal, null);
                });
        })
        .catch(function(err) {
            console.error("Checkout Error:", err);
            alert('Could not process checkout. Please try again.');
        });
}

// ២. បើក Customer Info Modal
function openCheckoutModal(totalText, user) {
    var modal = document.getElementById('checkoutModal');
    var modalTotal = document.getElementById('checkoutModalTotal');
    
    if (modalTotal) modalTotal.textContent = totalText;

    if (user) {
        var nameInput = document.getElementById('custName');
        if (nameInput && user.name) nameInput.value = user.name;
    }

    if (modal) {
        modal.classList.remove('hidden');
        modal.classList.add('flex');
        document.body.classList.add('overflow-hidden');
    }
}

// ៣. បិទ Customer Info Modal
function closeCheckoutModal() {
    var modal = document.getElementById('checkoutModal');
    if (modal) {
        modal.classList.add('hidden');
        modal.classList.remove('flex');
        document.body.classList.remove('overflow-hidden');
    }
}

function submitCheckoutForm(event) {
    // ១. បញ្ឈប់ Form មិនឱ្យ Reload ទំព័រ Web
    if (event) event.preventDefault();

    var nameElem = document.getElementById('custName');
    var phoneElem = document.getElementById('custPhone');
    var addressElem = document.getElementById('custAddress');
    var noteElem = document.getElementById('custNote');

    var name = nameElem ? nameElem.value : '';
    var phone = phoneElem ? phoneElem.value : '';
    var address = addressElem ? addressElem.value : '';
    var note = noteElem ? noteElem.value : '';

    var body = new URLSearchParams();
    body.append('customer_name', name);
    body.append('phone', phone);
    body.append('address', address);
    body.append('note', note);

    console.log("Sending checkout request...");

    // ២. ផ្ញើ Fetch Request
    fetch(contextPath + '/checkout', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'},
        body: body.toString()
    })
    .then(function(response) {
        if (response.status === 401) {
            throw new Error('401');
        }
        if (!response.ok) {
            throw new Error('HTTP status ' + response.status);
        }
        return response.json();
    })
    .then(function(data) {
        console.log("Checkout Success Response:", data);

        // ៣. Clear Cart UI ដោយផ្ទាល់
        renderCart({ items: [], count: 0, total: 0 });
        updateCartBadge(0);

        // ៤. បិទ Modal & Reset Form
        closeCheckoutModal();
        var form = document.getElementById('checkoutForm');
        if (form) form.reset();

        // ៥. Alert បង្ហាញសារជោគជ័យ
        alert('🎉 Order placed successfully!\n\nThank you for ordering with LittleStar Restaurant!');
        showToast('🎉 Order placed successfully!');
    })
    .catch(function(err) {
        console.error("Submit Checkout Error:", err);
        if (err.message === '401') {
            closeCheckoutModal();
            openAuthModal('login', 'Please login to complete your order.');
        } else {
            alert('Failed to place order. Error: ' + err.message);
        }
    });
}
//បន្ថែមបន្ទាត់នេះក្នុង JS ដើម្បីឱ្យវាស្គាល់ទាំង ២ ឈ្មោះ
function submitCheckout(event) {
    submitCheckoutForm(event);
}

function processCheckout(event) {
    checkout(event);
}

// =========================================================
// UI HELPERS & NAVIGATION
// =========================================================
function toggleUserDropdown() {
    var dropdown = document.getElementById('userDropdown');
    if (dropdown) dropdown.classList.toggle('hidden');
}

function logoutUser() {
    window.location.href = contextPath + '/logout';
}

function toggleMobileNav() {
    var menu = document.getElementById('mobileNavMenu');
    if (menu) menu.classList.toggle('hidden');
}

function showToast(message) {
    var toast = document.getElementById('restaurantToast');
    if (!toast) return;
    toast.textContent = message;
    toast.classList.remove('hidden');
    clearTimeout(window.toastTimer);
    window.toastTimer = setTimeout(function() { toast.classList.add('hidden'); }, 1800);
}

function escapeHtml(value) {
    return String(value)
        .replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#039;');
}

// =========================================================
// INITIALIZATION & EVENT LISTENERS
// =========================================================
document.addEventListener('click', function(event) {
    var profile = document.getElementById('userProfileBtn');
    var dropdown = document.getElementById('userDropdown');
    if (profile && dropdown && !profile.contains(event.target)) {
        dropdown.classList.add('hidden');
    }
});

document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        closeAuthModal();
        closeCartModal();
        closeCheckoutModal();
    }
});

document.addEventListener('DOMContentLoaded', function() {
    fetch(contextPath + '/cart')
        .then(function(response) { return response.json(); })
        .then(renderCart)
        .catch(function() {});

    fetch(contextPath + '/me')
        .then(function(response) { return response.json(); })
        .then(function(user) {
            if (!user.loggedIn) return;

            var loginBtn = document.getElementById('loginNavBtn');
            var profileBtn = document.getElementById('userProfileBtn');
            var name = document.getElementById('userName');
            var full = document.getElementById('dropdownUserFull');
            var email = document.getElementById('dropdownUserEmail');
            var avatar = document.getElementById('userAvatar');

            if (loginBtn) loginBtn.classList.add('hidden');
            if (profileBtn) profileBtn.classList.remove('hidden');
            if (name) name.textContent = user.name;
            if (full) full.textContent = user.name;
            if (email) email.textContent = user.email;
            if (avatar) avatar.alt = user.name;
        })
        .catch(function() {});

    var params = new URLSearchParams(window.location.search);
    var loginError = params.get('loginError');
    var registerError = params.get('registerError');
    var registerSuccess = params.get('registerSuccess');
    var checkoutError = params.get('checkoutError');
    var checkoutSuccess = params.get('checkoutSuccess');

    if (loginError) openAuthModal('login', loginError);
    if (registerError) openAuthModal('register', registerError);
    if (registerSuccess) {
        openAuthModal('login');
        showAuthMessage(registerSuccess, 'success');
    }
    if (checkoutError) showToast(checkoutError);
    if (checkoutSuccess) showToast(checkoutSuccess);

    var url = new URL(window.location.href);
    ['loginError', 'registerError', 'registerSuccess', 'checkoutError', 'checkoutSuccess']
        .forEach(function(key) { url.searchParams.delete(key); });
    window.history.replaceState({}, document.title, url.pathname + url.search + url.hash);
});
</script>



</body>
</html>
