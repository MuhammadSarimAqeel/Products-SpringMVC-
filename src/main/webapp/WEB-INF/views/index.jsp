<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    <title>Home Page</title>
  </head>
  <body>

<div class="container mt-4">
<div class="row">
<div class="col-md-8 mb-2">


<h1 class="text-center mb-3">Welcome to Products App</h1>
</div>
<div class="col-md-4 mt-2">
<div class="row">

 <form class="form-inline my-lg-0" action="searching" method="post" id="search-bar" name="myform">
      <input class="form-control mr-sm-2" type="text" placeholder="Search Posts Here" required aria-label="Search" name="search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  
      
</div>
</div>
</div>
<table class="table">
  <thead class="thead-dark">
    <tr>
     <tr>
      <th scope="col">ID</th>
      <th scope="col">Product name</th>
      <th scope="col">Product Description</th>
      <th scope="col">Price</th>
      <th scope="col">Actions</th>
    </tr>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${products}" var="p">
    <tr>
      <th scope="row">${p.id}</th>
      <td>${p.name}</td>
      <td>${p.description}</td>
      <td class="font-weight-bold">&#36;${p.price}</td>
      <td>
      
      <a onclick="dodelete(${p.id})"><i class="fas fa-trash-alt text-danger mr-2" style="font-size: 30px"></i></a>
           
            <a href="update/${p.id}"><i class="fas fa-pen-nib text-primary" style="font-size: 30px"></i></a>
      </td>
    </tr>
    </c:forEach>
    </tbody>
</table>

<div class="container mt-3 text-center ">

<a href="addproduct" class="btn btn-outline-success">Add Products</a>
</div>

</div>









    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/10.5.0/sweetalert2.all.js"></script>

    
     
<script>
function dodelete(id){
	console.log(id);
	
	
	const k = {
		
		id:id
	
		
	}

	Swal.fire({
	  title: 'Are you sure?',
	  text: "You won't be able to revert this!",
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: 'Yes, delete it!'
	}).then((result) => {
	  if (result.isConfirmed) {
		$.ajax({
			url: "delete",
			data: k,
			
			success: function(data, textStatus, jqXHR){
				
		            
		           location.reload(true) 
		      
				    Swal.fire(
	      'Deleted!',
	      'Your file has been deleted.',
	      'success'
	    )
				
		
			},
			error: function(jqXHR, textStatus, errorThrown){
				
				Swal.fire('An Error Occured');
				
			}
			
		})


	  }
	})
	
	
}




</script>
  </body>
</html>