<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestion des Utilisateurs - Accueil</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .fade-in {
            animation: fadeIn 0.5s ease-out;
        }
    </style>
</head>
<body class="bg-gradient-to-br from-blue-50 to-indigo-100 min-h-screen">
    <!-- Barre de navigation -->
    <nav class="bg-white shadow-lg">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex justify-between h-16">
                <div class="flex">
                    <div class="flex-shrink-0 flex items-center">
                        <i class="fas fa-users-cog text-blue-600 text-2xl"></i>
                        <span class="ml-2 text-xl font-bold text-gray-800">GestUsers</span>
                    </div>
                </div>
                <div class="flex items-center">
                    <c:choose>
                        <c:when test="${empty sessionScope.utilisateur}">
                            <a href="login" class="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 transition-colors duration-300">
                                <i class="fas fa-sign-in-alt mr-2"></i>
                                Connexion
                            </a>
                        </c:when>
                        <c:otherwise>
                            <span class="mr-4 text-gray-600">
                                <i class="fas fa-user-circle mr-2"></i>
                                Bienvenue, <c:out value="${sessionScope.utilisateur.prenom}"/>
                            </span>
                            <a href="logout" class="inline-flex items-center px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 transition-colors duration-300">
                                <i class="fas fa-sign-out-alt mr-2"></i>
                                Déconnexion
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </nav>

    <!-- Contenu principal -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div class="text-center mb-12 fade-in">
            <h1 class="text-4xl font-bold text-gray-900 mb-4">
                Système de Gestion des Utilisateurs
            </h1>
            <p class="text-xl text-gray-600">
                Une application simple et efficace pour gérer vos utilisateurs
            </p>
        </div>

        <div class="mt-10 grid gap-6 md:grid-cols-2 lg:grid-cols-3 fade-in">
            <c:if test="${not empty sessionScope.utilisateur}">
                <!-- Carte Gestion des Utilisateurs -->
                <a href="list" class="bg-white rounded-lg shadow-xl p-6 hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-1">
                    <div class="flex items-center">
                        <div class="p-3 rounded-full bg-blue-100 text-blue-600">
                            <i class="fas fa-users text-2xl"></i>
                        </div>
                        <div class="ml-4">
                            <h2 class="text-xl font-semibold text-gray-900">Liste des Utilisateurs</h2>
                            <p class="mt-2 text-gray-600">Gérez vos utilisateurs</p>
                        </div>
                    </div>
                </a>

                <!-- Carte Ajouter Utilisateur -->
                <a href="add" class="bg-white rounded-lg shadow-xl p-6 hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-1">
                    <div class="flex items-center">
                        <div class="p-3 rounded-full bg-green-100 text-green-600">
                            <i class="fas fa-user-plus text-2xl"></i>
                        </div>
                        <div class="ml-4">
                            <h2 class="text-xl font-semibold text-gray-900">Ajouter un Utilisateur</h2>
                            <p class="mt-2 text-gray-600">Créez un nouvel utilisateur</p>
                        </div>
                    </div>
                </a>
            </c:if>
            
            <c:if test="${empty sessionScope.utilisateur}">
                <!-- Carte Connexion -->
                <a href="login" class="bg-white rounded-lg shadow-xl p-6 hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-1">
                    <div class="flex items-center">
                        <div class="p-3 rounded-full bg-indigo-100 text-indigo-600">
                            <i class="fas fa-sign-in-alt text-2xl"></i>
                        </div>
                        <div class="ml-4">
                            <h2 class="text-xl font-semibold text-gray-900">Connexion</h2>
                            <p class="mt-2 text-gray-600">Connectez-vous pour accéder à l'application</p>
                        </div>
                    </div>
                </a>
            </c:if>
        </div>
    </div>
</body>
</html>