<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/adminProductList.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        .form-container {
            padding-top: 50px; /* Adjust as needed */
        }

        .product-title {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body style="background-color: #DEDEDE">
  
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6 form-container"> <!-- Added form-container class here -->
                <div class="product-title"> Update Product</div>
                <form action="${pageContext.request.contextPath}/UpdateProductServlet" method="post">
                    <input type="hidden" name="productId" value="${param.productId}">
                    <div class="mb-3">
                        <label for="productName" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="productName" name="productName" value="${product.name}">
                    </div>
                    <div class="mb-3">
                        <label for="productDescription" class="form-label">Product Description</label>
                        <textarea class="form-control" id="productDescription" name="productDescription">${product.description}</textarea>
                    </div>
                    <div class="mb-3">
                        <label for="productImage" class="form-label">Product Image URL</label>
                        <input type="text" class="form-control" id="productImage" name="productImage" value="${product.image}">
                    </div>
                    <div class="mb-3">
                        <label for="productPrice" class="form-label">Product Price</label>
                        <input type="number" class="form-control" id="productPrice" name="productPrice" value="${product.price}">
                    </div>
                    <div class="mb-3">
                        <label for="productStock" class="form-label">Product Stock</label>
                        <input type="number" class="form-control" id="productStock" name="productStock" value="${product.stock}">
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
