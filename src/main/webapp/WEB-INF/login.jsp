<!-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Connexion</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        @keyframes slideIn {
            from { transform: translateY(-10px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .form-animation {
            animation: slideIn 0.5s ease-out;
        }
        .input-field {
            transition: all 0.3s ease;
        }
        .input-field:focus {
            transform: scale(1.01);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-blue-50 to-indigo-100 min-h-screen flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8"> -->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="title" value="Connexion" scope="request" />
<jsp:include page="fragments/header.jsp">
    <jsp:param name="title" value="${title}" />
</jsp:include>

<div class="h-full w-full space-y-8 mx-auto flex items-center justify-center">
    <div class="mx-auto" style = "min-width: 400px;">
        <!-- Message d'erreur -->
        <c:if test="${not empty errorMessage}">
            <div class="mb-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative form-animation" role="alert">
                <strong class="font-bold">Erreur!</strong>
                <span class="block sm:inline"><c:out value="${errorMessage}"/></span>
            </div>
        </c:if>
    
        <div class="bg-white rounded-xl shadow-2xl overflow-hidden form-animation">
            <div class="px-6 py-4 bg-gradient-to-r from-blue-600 to-indigo-600">
                <h2 class="text-2xl font-bold text-white flex items-center justify-center">
                    <i class="fas fa-lock mr-3"></i>
                    Connexion
                </h2>
            </div>
            
            <form class="px-6 py-8 space-y-6" action="login" method="POST">
                <div class="space-y-6">
                    <div>
                        <label for="login" class="block text-sm font-medium text-gray-700 mb-1">
                            <i class="fas fa-user mr-2"></i>Login
                        </label>
                        <input type="text" id="login" name="login" required
                                class="input-field mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400
                                        focus:outline-none focus:border-blue-500 focus:ring-1 focus:ring-blue-500"
                                value="<c:out value="${login}"/>">
                    </div>
    
                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-700 mb-1">
                            <i class="fas fa-lock mr-2"></i>Mot de passe
                        </label>
                        <input type="password" id="password" name="password" required
                                class="input-field mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400
                                        focus:outline-none focus:border-blue-500 focus:ring-1 focus:ring-blue-500">
                    </div>
                </div>
    
                <div class="flex flex-col space-y-3">
                    <button type="submit" 
                            class="w-full flex justify-center items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-colors duration-300">
                        <i class="fas fa-sign-in-alt mr-2"></i>
                        Se connecter
                    </button>
                    <a href="${pageContext.request.contextPath}/" 
                        class="w-full flex justify-center items-center px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-colors duration-300">
                        <i class="fas fa-home mr-2"></i>
                        Retour à l'accueil
                    </a>
                </div>
            </form>
        </div>

    </div>
</div>

    

<jsp:include page="fragments/footer.jsp" />