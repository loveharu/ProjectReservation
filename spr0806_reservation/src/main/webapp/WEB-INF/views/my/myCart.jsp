<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            width: 80%;
            max-width: 1200px;
        }

        .product {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin: 20px;
            padding: 20px;
            width: 250px;
            height: 350px;
            transition: transform 0.3s ease, background-color 0.3s ease;
            position: relative;
            animation: float 3s ease-in-out infinite;
            text-align: center;
        }

        .product:hover {
            transform: scale(1.05);
            background-color: #f9f9f9;
        }

        .product img {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }

        .product h2 {
            font-size: 18px;
            margin: 10px 0;
            color: #333;
        }

        .product p {
            font-size: 16px;
            color: #666;
            margin: 5px 0;
        }

        .product .price {
            font-size: 20px;
            color: #d84315;
            margin: 10px 0;
        }

        @keyframes float {
            0% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px);
            }
            100% {
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="product">
            <img src="product1.jpg" alt="제품 1">
            <h2>제품 이름 1</h2>
            <p>상세 설명 1</p>
            <p class="price">₩10,000</p>
        </div>
        <div class="product">
            <img src="product2.jpg" alt="제품 2">
            <h2>제품 이름 2</h2>
            <p>상세 설명 2</p>
            <p class="price">₩20,000</p>
        </div>
        <div class="product">
            <img src="product3.jpg" alt="제품 3">
            <h2>제품 이름 3</h2>
            <p>상세 설명 3</p>
            <p class="price">₩30,000</p>
        </div>
        <!-- 추가 제품을 여기에 삽입 -->
    </div>
</body>
</html>
