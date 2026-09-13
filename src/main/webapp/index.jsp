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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
<style>
body {
	font-family: 'Kantumruy Pro', sans-serif;
}
</style>
</head>
<body class="bg-gray-50 text-gray-800">

	<!-------------------------------------------Navbar------------------------------------------->
	<nav
		class="bg-[#eb7589] backdrop-blur-md fixed w-full z-50 top-0 left-0 border-t border-b-pink-400 shadow-sm">
		<div
			class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
			<a href="#start" class="flex items-center space-x-2"> <span
				class="text-2xl font-extrabold text-pink-700">LittleStar <span
					class="text-gray-900">Restaurant</span></span>
			</a>
			<div class="flex md:order-2 space-x-3">
				<a href="#order-section"
					class="text-white bg-red-500 hover:bg-red-600 font-medium rounded-lg text-sm px-5 py-2.5 text-center transition duration-200 shadow-md">
					Order Now </a>
			</div>
			<div
				class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1">
				<ul
					class="flex flex-col p-4 md:p-0 mt-4 font-medium border border-gray-100 rounded-lg bg-gray-50 md:space-x-8 md:flex-row md:mt-0 md:border-0 md:bg-white">
					<li><a href="#start"
						class="block py-2 px-2 text-amber-600 font-semibold hover:text-pink-600">Home</a></li>
					<li><a href="#menu"
						class="block py-2 px-2 text-gray-700 hover:text-pink-600">Menu</a></li>
					<li><a href="#gallery"
						class="block py-2 px-2 text-gray-700 hover:text-pink-600">Gallery</a></li>
					<li><a href="#about"
						class="block py-2 px-2 text-gray-700 hover:text-pink-600">About Us</a></li>
					<li><a href="#Popular"
						class="block py-2 px-2 text-gray-700 hover:text-pink-600">Popular Foods</a></li>
					<li><a href="#contact"
						class="block py-2 px-2 text-gray-700 hover:text-pink-600">Contact</a></li>
					<li><a href="#order-section"
						class="block py-2 px-2 text-gray-700 hover:text-pink-600">Order Food</a></li>
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
					Delicious Taste <br> <span class="text-amber-200 text-4xl">Fast Service</span>
				</h1>
				<p class="text-lg text-amber-100 leading-relaxed">
					Enjoy many delicious dishes prepared by professional chefs with high hygiene standards. Dine-in or order for delivery!</p>
				<div class="flex flex-wrap gap-4 pt-2">
					<a href="#menu"
						class="bg-white text-amber-600 font-bold px-7 py-3.5 rounded-xl shadow-lg hover:bg-amber-50 transition transform hover:-translate-y-0.5">
						View Menu </a> <a href="#order-section"
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
	<section id="menu"
		class="max-w-screen-xl bg-[#e397a4] mx-auto py-20 px-4">
		<div class="text-center max-w-xl mx-auto mb-12">
			<h2 class="text-3xl font-bold text-gray-900 mb-3">Our Delicious Menu</h2>
			<p class="text-gray-600">Choose your favorite dish from the menu below</p>
		</div>

		<div class="grid grid-cols-1 md:grid-cols-3 gap-8">
			<!-- Item 1 -->
			<div
				class="bg-white rounded-2xl shadow-md overflow-hidden hover:shadow-xl transition duration-300 border border-gray-100 flex flex-col justify-between">
				<div>
					<img class="w-full h-52 object-cover"
						src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=600&q=80"
						alt="Burger">
					<div class="p-6">
						<h3 class="text-xl font-bold mb-2 text-gray-900">Special Beef Burger</h3>
						<p class="text-gray-600 text-sm mb-4">Fresh beef with cheese and fresh vegetables</p>
					</div>
				</div>
				<div class="px-6 pb-6 flex justify-between items-center">
					<span class="text-2xl font-bold text-amber-600">$4.50</span> <a
						href="#order-section"
						class="bg-amber-500 text-white px-4 py-2 rounded-lg text-sm font-medium hover:bg-amber-600 transition">Order</a>
				</div>
			</div>

			<!-- Item 2 -->
			<div
				class="bg-white rounded-2xl shadow-md overflow-hidden hover:shadow-xl transition duration-300 border border-gray-100 flex flex-col justify-between">
				<div>
					<img class="w-full h-52 object-cover"
						src="https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=600&q=80"
						alt="Pizza">
					<div class="p-6">
						<h3 class="text-xl font-bold mb-2 text-gray-900">Seafood Pizza</h3>
						<p class="text-gray-600 text-sm mb-4">Fresh seafood topped with melted Italian cheese</p>
					</div>
				</div>
				<div class="px-6 pb-6 flex justify-between items-center">
					<span class="text-2xl font-bold text-amber-600">$8.99</span> <a
						href="#order-section"
						class="bg-amber-500 text-white px-4 py-2 rounded-lg text-sm font-medium hover:bg-amber-600 transition">Order</a>
				</div>
			</div>

			<!-- Item 3 -->
			<div
				class="bg-white rounded-2xl shadow-md overflow-hidden hover:shadow-xl transition duration-300 border border-gray-100 flex flex-col justify-between">
				<div>
					<img class="w-full h-52 object-cover"
						src="https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=600&q=80"
						alt="Salad">
					<div class="p-6">
						<h3 class="text-xl font-bold mb-2 text-gray-900">Healthy Garden Salad</h3>
						<p class="text-gray-600 text-sm mb-4">Fresh organic greens with house signature dressing</p>
					</div>
				</div>
				<div class="px-6 pb-6 flex justify-between items-center">
					<span class="text-2xl font-bold text-amber-600">$3.00</span> <a
						href="#order-section"
						class="bg-amber-500 text-white px-4 py-2 rounded-lg text-sm font-medium hover:bg-amber-600 transition">Order</a>
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
				<h2 class="text-3xl font-bold text-gray-900">About LittleStar Restaurant</h2>
				<p class="text-gray-600 leading-relaxed">LittleStar Restaurant was established with a focus on quality, delicious taste, and high standards of food hygiene. We select only fresh ingredients to cook for each of our valued customers.</p>
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
					<p>We serve tasty and carefully crafted dishes prepared with the freshest ingredients every day.</p>
				</div>
				<!-- box2 -->
				<div class="box hvr-float">
					<span>Expert Chefs</span>
					<p>Our experienced chefs bring culinary passion and technique to every single meal served.</p>
				</div>
				<!-- box3 -->
				<div class="box hvr-float">
					<span>Friendly Staff</span>
					<p>Enjoy a warm, hospitable atmosphere with quick and helpful service for every visitor.</p>
				</div>
				<!-- box4 -->
				<div class="box hvr-float">
					<span>Parties & Events</span>
					<p>We provide ideal catering and dining space for private celebrations and special occasions.</p>
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
			<p>Meet our talented team of culinary professionals dedicated to creating memorable dining experiences for you and your family.</p>
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



	<!-------------------------------------------Popular Foods------------------------------------------->
	<div class="home-page" id="Popular">
		<div class="Popular">
			<h1>
				Popular <span>Foods</span>
			</h1>

			<!-- breakfast -->
			<h3>Breakfast</h3>
			<div class="Breakfast">
				<div class="img1">
					<img
						src="https://media.istockphoto.com/id/512751260/photo/homemade-labskaus-northern-germany-cuisine.jpg?s=612x612&w=0&k=20&c=zKEWlEE6Jy-DJnupraAXw0_pVzWCYlAZYSBFBOZs7Iw="
						alt="Salted Fried Egg" class="hvr-grow">
					<h2>Salted Fried Egg</h2>
					<p>$25.00</p>
				</div>
				<div class="img2">
					<img
						src="https://cdn.pixabay.com/photo/2017/07/25/00/23/calamari-2536527_1280.jpg"
						alt="Salted Fried Chicken" class="hvr-grow">
					<h2>Salted Fried Chicken</h2>
					<p>$20.00</p>
				</div>
				<div class="img3">
					<img
						src="https://cdn.pixabay.com/photo/2016/08/03/05/18/fried-1565908_1280.jpg"
						alt="Lotus Fish Wind" class="hvr-grow">
					<h2>Lotus Fish Wind</h2>
					<p>$19.00</p>
				</div>
				<div class="img4">
					<img
						src="https://cdn.pixabay.com/photo/2018/09/10/17/44/bread-3667553_1280.jpg"
						alt="Salted Bread Hotdog" class="hvr-grow">
					<h2>Salted Bread Hotdog</h2>
					<p>$27.00</p>
				</div>
			</div>

			<!-- lanch -->
			<h3>Lunch</h3>
			<div class="lanch">
				<div class="img1">
					<img
						src="https://cdn.pixabay.com/photo/2016/04/15/09/10/pasta-1330541_1280.jpg"
						alt="Italian Sauce Mushroom" class="hvr-grow">
					<h2>Italian Sauce Mushroom</h2>
					<p>$19.00</p>
				</div>
				<div class="img2">
					<img
						src="https://cdn.pixabay.com/photo/2015/03/11/00/31/chicken-667935_1280.jpg"
						alt="Salted Fried Chicken" class="hvr-grow">
					<h2>Salted Fried Chicken</h2>
					<p>$15.00</p>
				</div>
				<div class="img3">
					<img
						src="https://cdn.pixabay.com/photo/2022/07/07/17/26/fried-chicken-7307610_1280.jpg"
						alt="Fried Potato w/ Garlic" class="hvr-grow">
					<h2>Fried Potato w/ Garlic</h2>
					<p>$21.00</p>
				</div>
				<div class="img4">
					<img
						src="https://cdn.pixabay.com/photo/2022/01/06/05/56/seafood-6918672_1280.jpg"
						alt="Shrimp and olive" class="hvr-grow">
					<h2>Shrimp and Olive</h2>
					<p>$25.00</p>
				</div>
			</div>

			<!-- dinner -->
			<h3>Dinner</h3>
			<div class="dinner">
				<div class="img1">
					<img
						src="https://cdn.pixabay.com/photo/2015/04/08/13/14/food-712666_1280.jpg"
						alt="Salmon Seeded Mustard" class="hvr-grow">
					<h2>Salmon Seeded Mustard</h2>
					<p>$25.00</p>
				</div>
				<div class="img2">
					<img
						src="https://cdn.pixabay.com/photo/2019/07/28/16/42/sushi-4369011_1280.jpg"
						alt="Japanese Sushi" class="hvr-grow">
					<h2>Japanese Sushi</h2>
					<p>$27.00</p>
				</div>
				<div class="img3">
					<img
						src="https://cdn.pixabay.com/photo/2021/02/09/03/53/thai-food-5997301_1280.jpg"
						alt="Steak Vegetables Meat" class="hvr-grow">
					<h2>Steak & Vegetables</h2>
					<p>$29.00</p>
				</div>
				<div class="img4">
					<img
						src="https://cdn.pixabay.com/photo/2017/11/17/16/05/duck-2957809_1280.jpg"
						alt="Roast Duck" class="hvr-grow">
					<h2>Roast Duck</h2>
					<p>$30.00</p>
				</div>
			</div>

			<!-- Drink -->
			<h3>Drinks</h3>
			<div class="drink">
				<div class="img1">
					<img
						src="https://cdn.pixabay.com/photo/2016/09/29/20/05/drink-1703659_1280.jpg"
						alt="Kiwi Cocktail Kefir" class="hvr-grow">
					<h2>Kiwi Cocktail Kefir</h2>
					<p>$18.00</p>
				</div>
				<div class="img2">
					<img
						src="https://cdn.pixabay.com/photo/2023/05/31/11/14/smoothie-8031132_1280.jpg"
						alt="Milkshake" class="hvr-grow">
					<h2>Milkshake</h2>
					<p>$10.00</p>
				</div>
				<div class="img3">
					<img
						src="https://cdn.pixabay.com/photo/2016/09/30/15/19/cocktail-1705561_1280.jpg"
						alt="Cocktail Bar Nightlife" class="hvr-grow">
					<h2>Cocktail Bar Nightlife</h2>
					<p>$15.00</p>
				</div>
				<div class="img4">
					<img
						src="https://cdn.pixabay.com/photo/2018/03/13/11/39/fruit-3222313_1280.jpg"
						alt="Fruit Cocktails Smoothie" class="hvr-grow">
					<h2>Fruit Cocktail Smoothie</h2>
					<p>$19.00</p>
				</div>
			</div>

			<!---Popular Deserts---->
			<div class="popular-desserts">
				<h1>
					Popular <span>Desserts</span>
				</h1>

				<div class="desert">
					<div class="card">
						<img
							src="https://preview.colorlib.com/theme/meal2/images/1x/dessert_1.png"
							alt="Cherry Muffin" class="hvr-grow">
						<div class="text">
							<p>Cherry Muffin</p>
							<span>$10</span>
						</div>
					</div>

					<div class="card">
						<img
							src="https://preview.colorlib.com/theme/meal2/images/1x/dessert_2.png"
							alt="Rose Muffin" class="hvr-grow">
						<div class="text">
							<p>Rose Muffin</p>
							<span>$12</span>
						</div>
					</div>

					<div class="card">
						<img
							src="https://preview.colorlib.com/theme/meal2/images/1x/dessert_5.png"
							alt="Sweet Donut" class="hvr-grow">
						<div class="text">
							<p>Sweet Donut</p>
							<span>$15</span>
						</div>
					</div>

					<div class="card">
						<img
							src="https://preview.colorlib.com/theme/meal2/images/1x/dessert_4.png"
							alt="Choco Cake" class="hvr-grow">
						<div class="text">
							<p>Chocolate Cake</p>
							<span>$18</span>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>



	<!-------------------------------------------Order------------------------------------------->
	<section id="order-section" class="py-20 px-4 bg-gray-100">
		<div
			class="max-w-md mx-auto bg-white p-8 rounded-3xl shadow-xl border border-gray-200">
			<h2 class="text-2xl font-bold text-center text-gray-900 mb-6">Food Order Form</h2>

			<form action="place-order" method="POST" class="space-y-4">
				<div>
					<label class="block text-sm font-medium text-gray-700 mb-1">Customer Name</label>
					<input type="text" name="customerName" required
						placeholder="Enter your full name"
						class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-amber-500 outline-none">
				</div>

				<div>
					<label class="block text-sm font-medium text-gray-700 mb-1">Select Food Item</label>
					<select name="foodItem"
						class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-amber-500 outline-none bg-white">
						<option value="Special Beef Burger ($4.50)">Special Beef Burger
							($4.50)</option>
						<option value="Seafood Pizza ($8.99)">Seafood Pizza
							($8.99)</option>
						<option value="Healthy Garden Salad ($3.00)">Healthy Garden Salad
							($3.00)</option>
					</select>
				</div>

				<div>
					<label class="block text-sm font-medium text-gray-700 mb-1">Quantity</label>
					<input type="number" name="quantity" min="1" value="1" required
						class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-amber-500 outline-none">
				</div>

				<button type="submit"
					class="w-full bg-amber-500 hover:bg-amber-600 text-white font-bold py-3 rounded-xl transition duration-200 shadow-md">
					Confirm Order</button>
			</form>

			<%-- Show Result Message after Servlet redirect --%>
			<%
                String orderResult = (String) request.getAttribute("orderResult");
                if (orderResult != null) {
            %>
			<div
				class="mt-6 p-4 bg-emerald-100 border border-emerald-300 text-emerald-800 rounded-xl text-center text-sm font-medium">
				<%= orderResult %>
			</div>
			<%
                }
            %>
		</div>
	</section>



	<!--------------------------------------------------Contact page-------------------------------------------------------------- -->





	<!---------------------------------------------Footer---------------------------------------------------- -->
	<div class="footer">
		<p>
			<i class="fa-solid fa-heart"></i> Copyright &copy; 2026 WEB2026 <i
				class="fa-solid fa-heart"></i>
		</p>
	</div>


</body>
</html>