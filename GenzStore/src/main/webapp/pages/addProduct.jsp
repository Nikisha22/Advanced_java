<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
   
    <title>Add Product</title>

    <style>
        /* CSS styles for Add Product page */

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .logo {
            display: flex;
            align-items: center;
        }

        .logo img {
            width: 50px;
            height: auto;
            margin-right: 10px;
        }

        .icons img {
            width: 30px;
            height: auto;
            margin-right: 5px;
        }

        .admin-text {
            font-size: 14px;
            margin: 0;
        }

        form {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        input[type="text"],
        input[type="file"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        .Add-Pro button {
            padding: 10px 20px;
           
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }


        #image-container {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="logo">
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo">
                <p>GenZ Store</p>
            </div>
            <div class="icons">
                <p class="admin-text">Admin</p>
            </div>
        </div>

        <form id="productForm" method="post">
            <!-- Form Field for Product Name -->
            <div id="form1">
                <label for="product-name">Product Name</label>
                <input type="text" id="product-name" name="product-name">
                <!-- Input field for Product Description -->
                <label for="product-description">Product Description:</label>
                <input type="text" id="product-description" name="product-description">
            </div>
            
            <!-- Form Field for Product Image -->
            <div id="form2" style="position: relative;">
                <label for="product-image">Product Image</label>
                <input type="file" id="product-image" name="product-image" onchange="previewImage(event)">
                <div id="image-container" style="position: absolute; top: 40px; left: 0;">
                    <img id="preview" src="#" style="max-width: 100px; max-height: 200px;">
                </div>
            </div>

            <!-- Form Fields for Selling Price and Quantity -->
            <div id="form3">
                <label for="selling-price">Selling Price</label>
                <input type="text" id="selling-price" name="selling-price">
                <label for="quantity">Quantity</label>
                <input type="text" id="quantity" name="quantity">
            </div>

            <!-- Button to Add Product -->
            <div class="Add-Pro">
            <a href="${pageContext.request.contextPath}/AdminProductList" class="btn btn-danger">Cancel</a>
                <button type="button" class="btn btn-primary" onclick="addProduct()">Add Product</button>
                
            </div>
        </form>

       
    </div>

    <!-- JavaScript Code to Preview Image and Add Product -->
    <script>
        function previewImage(event) {
            var input = event.target;
            var reader = new FileReader();
            reader.onload = function(){
                var imgContainer = document.getElementById('image-container');
                var img = document.getElementById('preview');
                img.src = reader.result;
                imgContainer.style.display = '';
            };
            reader.readAsDataURL(input.files[0]);
        }

        function addProduct() {
            var form = document.getElementById('productForm');
            var formData = new FormData(form);

            fetch('${pageContext.request.contextPath}/AddProduct', {
                method: 'POST',
                body: formData
            })
            .then(response => {
                if (response.ok) {
                    console.log('Product added successfully');
                    // Optionally, redirect to a success page or display a success message
                } else {
                    console.error('Failed to add product');
                    // Optionally, display an error message to the user
                }
            })
            .catch(error => {
                console.error('Error adding product:', error);
            });
        }
    </script>
</body>
</html>
