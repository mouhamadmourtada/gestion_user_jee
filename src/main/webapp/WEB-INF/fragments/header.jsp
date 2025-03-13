<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>${param.title}</title>
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
        .dropdown-menu {
            display: none;
        }
        .dropdown-menu.show {
            display: block;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const dropdownButton = document.querySelector('.dropdown-button');
            const dropdownMenu = document.querySelector('.dropdown-menu');

            // Fonction pour ouvrir/fermer le menu
            function toggleDropdown(event) {
                event.stopPropagation();
                dropdownMenu.classList.toggle('show');
            }

            // Gestionnaire de clic sur le bouton
            dropdownButton.addEventListener('click', toggleDropdown);

            // Fermer le menu si on clique en dehors
            document.addEventListener('click', function(event) {
                if (!dropdownButton.contains(event.target)) {
                    dropdownMenu.classList.remove('show');
                }
            });
        });
    </script>
</head>
<body class="bg-gradient-to-br from-blue-50 to-blue-100 min-h-screen">
    <!-- Navbar -->
    <nav class="bg-white shadow-lg">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex justify-between h-16">
                <!-- Logo et titre -->
                <div class="flex items-center">
                    <a href="accueil" class="flex items-center">
                        <i class="fas fa-users text-blue-600 text-2xl mr-2"></i>
                        <span class="font-bold text-xl text-gray-800">Gestion Utilisateurs</span>
                    </a>
                </div>

                <!-- Menu de navigation -->
                <div class="flex items-center">
                    <c:if test="${not empty sessionScope.utilisateur}">
                        <!-- Dropdown pour le profil -->
                        <div class="ml-3 relative dropdown">
                            <div class="flex items-center cursor-pointer dropdown-button">
                                <div class="h-10 w-10 rounded-full bg-blue-600 flex items-center justify-center">
                                    <span class="text-white font-bold">
                                        ${fn:substring(sessionScope.utilisateur.prenom, 0, 1)}${fn:substring(sessionScope.utilisateur.nom, 0, 1)}
                                    </span>
                                </div>
                                <span class="ml-2 text-gray-700">
                                    ${sessionScope.utilisateur.prenom} ${sessionScope.utilisateur.nom}
                                </span>
                                <i class="fas fa-chevron-down ml-2 text-gray-500"></i>
                            </div>
                            
                            <!-- Menu déroulant -->
                            <div class="dropdown-menu absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg py-1 z-50">
                                <a href="profil" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">
                                    <i class="fas fa-user-circle mr-2"></i>Mon Profil
                                </a>
                                <hr class="my-1">
                                <a href="deconnexion" class="block px-4 py-2 text-sm text-red-600 hover:bg-gray-100">
                                    <i class="fas fa-sign-out-alt mr-2"></i>Déconnexion
                                </a>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </nav>

    <!-- Contenu principal avec padding supplémentaire en bas pour le footer -->
    <div class="py-12 px-4 sm:px-6 lg:px-8 pb-20">
<!-- </div> -->
<!-- </body>
</html> -->