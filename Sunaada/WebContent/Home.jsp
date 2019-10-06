<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sunada-Home</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="style.css">


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<style type="text/css">
.card {
	text-align: center;
	border: none;
	border-radius: 5px;
	-webkit-box-shadow: 12px 14px 22px 2px rgba(0, 0, 0, 0.75);
	-moz-box-shadow: 12px 14px 22px 2px rgba(0, 0, 0, 0.75);
	box-shadow: 12px 14px 22px 2px rgba(0, 0, 0, 0.75);
	margin-bottom: 100px;
}
</style>
</head>
<body>
	<div class="">
		<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
			class="navbar-brand" href="#">Navbar</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Dropdown </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a
					class="btn btn-md btn-danger ml-4 text-light"><i
						class="fa fa-shopping-cart" aria-hidden="true"></i> CART</a></li>
			</ul>
		</div>
		</nav>
	</div>


	<div class="row">
		<div class="col-md-12">
			<div id="carouselExampleControls" class="carousel slide"
				data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img style="height: 500px; width: 700px" class="d-block w-100"
							src="http://localhost:8080/Sunaada/Images/ConfigImages/background1.jpg"
							alt="First slide">
					</div>
					<div class="carousel-item">
						<img style="height: 500px; width: 700px" class="d-block w-100"
							src="http://localhost:8080/Sunaada/Images/ConfigImages/background2.jpg"
							alt="Second slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleControls"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleControls"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>

	</div>



	<div class="container">
		<div class="row mt-5">
			<h2>Similar Products</h2>
		</div>

		<div class="row mt-5">
			<div class="col-md-3">
				<div class="card">
					<img class="card-img-top img-fluid" src="c61.jpg">
					<div class="card-title">
						<h4>GYM Tops</h4>
					</div>
					<div class="card-text">
						Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Repudiandae fugiat et voluptate sunt officia vero molestias.<br />
						<br /> <a class="btn btn-success text-light"> Buy Now</a> &nbsp;
						<a class="btn btn-danger text-light"><i
							class="fa fa-cart-plus" aria-hidden="true"></i> Add To Cart</a> <br />
						<br />
					</div>
				</div>
			</div>


			<div class="col-md-3">
				<div class="card">
					<img class="card-img-top img-fluid" src="c94.jpg">
					<div class="card-title">
						<h4>GYM Tops</h4>
					</div>
					<div class="card-text">
						Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Repudiandae fugiat et voluptate sunt officia vero molestias.<br />
						<br /> <a class="btn btn-success text-light"> Buy Now</a> &nbsp;
						<a class="btn btn-danger text-light"><i
							class="fa fa-cart-plus" aria-hidden="true"></i> Add To Cart</a> <br />
						<br />
					</div>
				</div>
			</div>


			<div class="col-md-3">
				<div class="card">
					<img class="card-img-top img-fluid" src="c132.jpg">
					<div class="card-title">
						<h4>GYM Tops</h4>
					</div>
					<div class="card-text">
						Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Repudiandae fugiat et voluptate sunt officia vero molestias.<br />
						<br /> <a class="btn btn-success text-light"> Buy Now</a> &nbsp;
						<a class="btn btn-danger text-light"><i
							class="fa fa-cart-plus" aria-hidden="true"></i> Add To Cart</a> <br />
						<br />
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<img class="card-img-top img-fluid" src="c172.jpg">
					<div class="card-title">
						<h4>GYM Tops</h4>
					</div>
					<div class="card-text">
						Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Repudiandae fugiat et voluptate sunt officia vero molestias.<br />
						<br /> <a class="btn btn-success text-light"> Buy Now</a> &nbsp;
						<a class="btn btn-danger text-light"><i
							class="fa fa-cart-plus" aria-hidden="true"></i> Add To Cart</a> <br />
						<br />
					</div>
				</div>
			</div>
		</div>


	</div>


	<div class="container mt-5 mb-5">
		<div class="row">
			<h2>Ratings & Reviews</h2>
		</div>

		<div class="row mt-5 mb-5">
			<div class="media">
				<img class="mr-3" src="11.jpg" alt="Generic placeholder image">
				<div class="media-body">
					<h5 class="mt-0">
						Very nice product. <span class="text-warning"><i
							class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
							aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star-half-o" aria-hidden="true"></i> <i
							class="fa fa-star-o" aria-hidden="true"></i> </span>
					</h5>
					Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
					scelerisque ante sollicitudin. Cras purus odio, vestibulum in
					vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi
					vulputate fringilla. Donec lacinia congue felis in faucibus.
				</div>
			</div>
		</div>

		<div class="row mb-5">
			<div class="media">
				<img class="mr-3" src="12.jpg" alt="Generic placeholder image">
				<div class="media-body">
					<h5 class="mt-0">
						Best product best material.<span class="text-warning"><i
							class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
							aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star" aria-hidden="true"></i> <i
							class="fa fa-star" aria-hidden="true"></i> </span>
					</h5>
					Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
					scelerisque ante sollicitudin. Cras purus odio, vestibulum in
					vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi
					vulputate fringilla. Donec lacinia congue felis in faucibus.
				</div>
			</div>
		</div>


		<div class="row mb-5">
			<div class="media">
				<img class="mr-3" src="13.jpg" alt="Generic placeholder image">
				<div class="media-body">
					<h5 class="mt-0">
						Bad product.dont take this<span class="text-warning"><i
							class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
							aria-hidden="true"></i> <i class="fa fa-star-o"
							aria-hidden="true"></i> <i class="fa fa-star-o"
							aria-hidden="true"></i> <i class="fa fa-star-o"
							aria-hidden="true"></i> </span>
					</h5>
					Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
					scelerisque ante sollicitudin. Cras purus odio, vestibulum in
					vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi
					vulputate fringilla. Donec lacinia congue felis in faucibus.
				</div>
			</div>
		</div>


		<div class="row mb-5">
			<div class="media">
				<img class="mr-3" src="14.jpg" alt="Generic placeholder image">
				<div class="media-body">
					<h5 class="mt-0">
						really nice product,value for money.<span class="text-warning"><i
							class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
							aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star-half-o" aria-hidden="true"></i> <i
							class="fa fa-star-o" aria-hidden="true"></i> </span>
					</h5>
					Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
					scelerisque ante sollicitudin. Cras purus odio, vestibulum in
					vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi
					vulputate fringilla. Donec lacinia congue felis in faucibus.
				</div>
			</div>
		</div>

		<div class="row mb-5">
			<h2>Post Your Own Reviews</h2>
		</div>


		<form>
			<div class="form-group">
				<label for="exampleInputEmail1">Email address</label> <input
					type="email" class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" placeholder="Enter email"> <small
					id="emailHelp" class="form-text text-muted">We'll never
					share your email with anyone else.</small>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Password</label>
				<textarea type="text" class="form-control" id="exampleInputtextarea"
					placeholder="write your own reviews" rows="3"></textarea>
			</div>
			<div class="form-check">
				<input type="checkbox" class="form-check-input" id="exampleCheck1">
				<label class="form-check-label" for="exampleCheck1">Check me
					out</label>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>

	</div>





</body>
</html>