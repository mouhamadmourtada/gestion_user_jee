<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des utilisateurs</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        @keyframes slideIn {
            from { transform: translateY(-100%); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .notification {
            animation: slideIn 0.5s ease-out;
        }
        .table-row-hover {
            animation: fadeIn 0.5s ease-out;
            transition: all 0.3s ease;
        }
        .table-row-hover:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }
        .search-animation {
            transition: all 0.3s ease;
        }
        .search-animation:focus {
            transform: scale(1.02);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-blue-50 via-white to-indigo-50 min-h-screen">
    <div class="container mx-auto px-4 py-8">
        <!-- Notification de succès -->
        <% if(request.getAttribute("successMessage") != null) { %>
            <div class="notification fixed top-4 right-4 bg-green-500 text-white px-6 py-4 rounded-lg shadow-xl flex items-center space-x-2 z-50">
                <i class="fas fa-check-circle text-2xl"></i>
                <p class="font-medium"><%= request.getAttribute("successMessage") %></p>
            </div>
            <script>
                setTimeout(() => {
                    const notification = document.querySelector('.notification');
                    notification.style.transform = 'translateY(-100%)';
                    notification.style.opacity = '0';
                    setTimeout(() => notification.style.display = 'none', 500);
                }, 3000);
            </script>
        <% } %>

        <!-- Notification d'erreur -->
        <% if(request.getAttribute("errorMessage") != null) { %>
            <div class="notification fixed top-4 right-4 bg-red-500 text-white px-6 py-4 rounded-lg shadow-xl flex items-center space-x-2 z-50">
                <i class="fas fa-exclamation-circle text-2xl"></i>
                <p class="font-medium"><%= request.getAttribute("errorMessage") %></p>
            </div>
            <script>
                setTimeout(() => {
                    const notification = document.querySelector('.notification');
                    notification.style.transform = 'translateY(-100%)';
                    notification.style.opacity = '0';
                    setTimeout(() => notification.style.display = 'none', 500);
                }, 3000);
            </script>
        <% } %>

        <div class="bg-white rounded-2xl shadow-2xl overflow-hidden">
            <!-- En-tête avec gradient -->
            <div class="p-6 bg-gradient-to-r from-blue-600 to-indigo-600">
                <div class="flex flex-col md:flex-row justify-between items-center space-y-4 md:space-y-0">
                    <div class="flex items-center space-x-4">
                        <div class="bg-white/10 p-3 rounded-lg">
                            <i class="fas fa-users text-3xl text-white"></i>
                        </div>
                        <div>
                            <h1 class="text-3xl font-bold text-white">Liste des utilisateurs</h1>
                            <p class="text-blue-100">
                                <span class="font-semibold">
                                    <%= ((java.util.ArrayList)request.getAttribute("utilisateurs")).size() %>
                                </span> utilisateur<%= ((java.util.ArrayList)request.getAttribute("utilisateurs")).size() > 1 ? "s" : "" %> enregistré<%= ((java.util.ArrayList)request.getAttribute("utilisateurs")).size() > 1 ? "s" : "" %>
                            </p>
                        </div>
                    </div>
                    <div class="flex space-x-4 items-center">
                        <div class="relative">
                            <input type="text" id="searchInput" placeholder="Rechercher un utilisateur..." 
                                   class="search-animation pl-10 pr-4 py-2 bg-white/10 border border-white/20 rounded-lg text-white placeholder-blue-100
                                          focus:outline-none focus:border-white focus:ring-2 focus:ring-white/50 w-64">
                            <i class="fas fa-search absolute left-3 top-3 text-blue-100"></i>
                        </div>
                        <a href="add" class="flex items-center px-4 py-2 bg-white text-blue-600 rounded-lg font-semibold hover:bg-blue-50 transition-all duration-300 shadow-lg hover:shadow-xl">
                            <i class="fas fa-plus mr-2"></i>
                            Ajouter
                        </a>
                    </div>
                </div>
            </div>
            
            <!-- Table Container avec padding et coins arrondis -->
            <div class="p-6">
                <div class="overflow-x-auto bg-white rounded-lg">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead>
                            <tr class="bg-gray-50">
                                <th class="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">ID</th>
                                <th class="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Utilisateur</th>
                                <th class="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Login</th>
                                <th class="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-200" id="userTableBody">
                            <% 
                            for(sn.esp.dgi.dic3.mcarred.gestion_user.beans.Utilisateur user : 
                                (java.util.ArrayList<sn.esp.dgi.dic3.mcarred.gestion_user.beans.Utilisateur>)request.getAttribute("utilisateurs")) { 
                            %>
                                <tr class="table-row-hover">
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="bg-blue-50 text-blue-600 px-2 py-1 rounded-full text-sm font-medium">
                                            #<%= user.getId() %>
                                        </span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="flex items-center">
                                            <div class="flex-shrink-0 h-10 w-10">
                                                <div class="h-10 w-10 rounded-full bg-gradient-to-r from-blue-500 to-indigo-500 flex items-center justify-center">
                                                    <span class="text-white font-medium text-sm">
                                                        <%= user.getPrenom().substring(0, 1).toUpperCase() %><%= user.getNom().substring(0, 1).toUpperCase() %>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="ml-4">
                                                <div class="text-sm font-medium text-gray-900">
                                                    <%= user.getPrenom() %> <%= user.getNom() %>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 py-1 text-sm text-gray-600">
                                            <i class="fas fa-user text-gray-400 mr-1"></i>
                                            <%= user.getLogin() %>
                                        </span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                        <div class="flex space-x-3">
                                            <a href="edit?id=<%= user.getId() %>" 
                                               class="text-blue-600 hover:text-blue-900 transition-colors duration-200 flex items-center hover:bg-blue-50 px-3 py-1 rounded-md">
                                                <i class="fas fa-pen mr-2"></i>
                                                Modifier
                                            </a>
                                            <button onclick="confirmDelete(<%= user.getId() %>, '<%= user.getPrenom() %> <%= user.getNom() %>')" 
                                                   class="text-red-600 hover:text-red-900 transition-colors duration-200 flex items-center hover:bg-red-50 px-3 py-1 rounded-md">
                                                <i class="fas fa-trash-alt mr-2"></i>
                                                Supprimer
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal de confirmation de suppression amélioré -->
    <div id="deleteModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 hidden" style="backdrop-filter: blur(4px);">
        <div class="flex items-center justify-center min-h-screen p-4">
            <div class="bg-white rounded-lg p-8 shadow-2xl transform transition-all max-w-sm w-full">
                <div class="text-center">
                    <div class="mx-auto flex items-center justify-center h-16 w-16 rounded-full bg-red-50 mb-6">
                        <i class="fas fa-exclamation-triangle text-3xl text-red-500"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-2">Confirmer la suppression</h3>
                    <p class="text-sm text-gray-500 mb-6" id="deleteConfirmText"></p>
                    <div class="flex justify-center space-x-4">
                        <button onclick="hideDeleteModal()" 
                                class="px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-800 text-sm font-medium rounded-md transition-colors duration-200">
                            <i class="fas fa-times mr-2"></i>
                            Annuler
                        </button>
                        <a href="#" id="confirmDeleteButton" 
                           class="px-4 py-2 bg-red-600 hover:bg-red-700 text-white text-sm font-medium rounded-md transition-colors duration-200">
                            <i class="fas fa-trash-alt mr-2"></i>
                            Supprimer
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Fonction de recherche améliorée
        document.getElementById('searchInput').addEventListener('keyup', function(e) {
            const searchValue = e.target.value.toLowerCase();
            const rows = document.getElementById('userTableBody').getElementsByTagName('tr');
            
            Array.from(rows).forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(searchValue) ? '' : 'none';
                
                if(text.includes(searchValue)) {
                    row.style.display = '';
                    row.style.animation = 'fadeIn 0.5s ease-out';
                } else {
                    row.style.display = 'none';
                }
            });
        });

        // Fonctions de gestion du modal de suppression
        function confirmDelete(userId, userName) {
            const modal = document.getElementById('deleteModal');
            const confirmButton = document.getElementById('confirmDeleteButton');
            const confirmText = document.getElementById('deleteConfirmText');
            
            confirmText.textContent = `Êtes-vous sûr de vouloir supprimer l'utilisateur ${userName} ? Cette action est irréversible.`;
            modal.classList.remove('hidden');
            confirmButton.href = 'delete?id=' + userId;
            
            // Animation d'entrée
            modal.style.opacity = '0';
            requestAnimationFrame(() => {
                modal.style.opacity = '1';
                modal.style.transition = 'opacity 0.3s ease-out';
            });
        }

        function hideDeleteModal() {
            const modal = document.getElementById('deleteModal');
            modal.style.opacity = '0';
            setTimeout(() => {
                modal.classList.add('hidden');
            }, 300);
        }

        // Fermer le modal en cliquant en dehors
        document.getElementById('deleteModal').addEventListener('click', function(e) {
            if (e.target === this) {
                hideDeleteModal();
            }
        });
    </script>
</body>
</html>