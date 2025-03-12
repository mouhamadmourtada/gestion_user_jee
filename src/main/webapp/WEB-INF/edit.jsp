<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Modifier un utilisateur</title>
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
<body class="bg-gradient-to-br from-indigo-50 to-indigo-100 min-h-screen py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md mx-auto">
        <!-- Message d'erreur global -->
        <% if(request.getAttribute("errorMessage") != null) { %>
            <div class="mb-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative form-animation" role="alert">
                <strong class="font-bold">Erreur!</strong>
                <span class="block sm:inline"><%= request.getAttribute("errorMessage") %></span>
            </div>
        <% } %>

        <div class="bg-white rounded-xl shadow-2xl overflow-hidden form-animation">
            <div class="px-6 py-4 bg-gradient-to-r from-indigo-600 to-indigo-800">
                <h2 class="text-2xl font-bold text-white flex items-center">
                    <i class="fas fa-user-edit mr-3"></i>
                    Modifier un utilisateur
                </h2>
            </div>
            
            <form action="edit" method="post" class="px-6 py-6 space-y-6">
                <input type="hidden" name="id" value="<%= ((sn.esp.dgi.dic3.mcarred.gestion_user.beans.Utilisateur)request.getAttribute("utilisateur")).getId() %>">
                
                <div class="space-y-6">
                    <div>
                        <label for="nom" class="block text-sm font-medium text-gray-700 mb-1">
                            <i class="fas fa-user mr-2"></i>Nom
                        </label>
                        <input type="text" id="nom" name="nom" required
                               class="input-field mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400
                                      focus:outline-none focus:border-indigo-500 focus:ring-1 focus:ring-indigo-500"
                               value="<%= ((sn.esp.dgi.dic3.mcarred.gestion_user.beans.Utilisateur)request.getAttribute("utilisateur")).getNom() %>">
                        <% if(request.getAttribute("form") != null && ((sn.esp.dgi.dic3.mcarred.gestion_user.forms.UtilisateurForm)request.getAttribute("form")).getErreurs().get("nom") != null) { %>
                            <p class="mt-1 text-sm text-red-600 flex items-center">
                                <i class="fas fa-exclamation-circle mr-2"></i>
                                <%= ((sn.esp.dgi.dic3.mcarred.gestion_user.forms.UtilisateurForm)request.getAttribute("form")).getErreurs().get("nom") %>
                            </p>
                        <% } %>
                    </div>

                    <div>
                        <label for="prenom" class="block text-sm font-medium text-gray-700 mb-1">
                            <i class="fas fa-user mr-2"></i>Prénom
                        </label>
                        <input type="text" id="prenom" name="prenom" required
                               class="input-field mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400
                                      focus:outline-none focus:border-indigo-500 focus:ring-1 focus:ring-indigo-500"
                               value="<%= ((sn.esp.dgi.dic3.mcarred.gestion_user.beans.Utilisateur)request.getAttribute("utilisateur")).getPrenom() %>">
                        <% if(request.getAttribute("form") != null && ((sn.esp.dgi.dic3.mcarred.gestion_user.forms.UtilisateurForm)request.getAttribute("form")).getErreurs().get("prenom") != null) { %>
                            <p class="mt-1 text-sm text-red-600 flex items-center">
                                <i class="fas fa-exclamation-circle mr-2"></i>
                                <%= ((sn.esp.dgi.dic3.mcarred.gestion_user.forms.UtilisateurForm)request.getAttribute("form")).getErreurs().get("prenom") %>
                            </p>
                        <% } %>
                    </div>

                    <div>
                        <label for="login" class="block text-sm font-medium text-gray-700 mb-1">
                            <i class="fas fa-at mr-2"></i>Login
                        </label>
                        <input type="text" id="login" name="login" required
                               class="input-field mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400
                                      focus:outline-none focus:border-indigo-500 focus:ring-1 focus:ring-indigo-500"
                               value="<%= ((sn.esp.dgi.dic3.mcarred.gestion_user.beans.Utilisateur)request.getAttribute("utilisateur")).getLogin() %>">
                        <% if(request.getAttribute("form") != null && ((sn.esp.dgi.dic3.mcarred.gestion_user.forms.UtilisateurForm)request.getAttribute("form")).getErreurs().get("login") != null) { %>
                            <p class="mt-1 text-sm text-red-600 flex items-center">
                                <i class="fas fa-exclamation-circle mr-2"></i>
                                <%= ((sn.esp.dgi.dic3.mcarred.gestion_user.forms.UtilisateurForm)request.getAttribute("form")).getErreurs().get("login") %>
                            </p>
                        <% } %>
                    </div>

                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-700 mb-1">
                            <i class="fas fa-lock mr-2"></i>Mot de passe
                        </label>
                        <input type="password" id="password" name="password" required
                               class="input-field mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400
                                      focus:outline-none focus:border-indigo-500 focus:ring-1 focus:ring-indigo-500"
                               value="<%= ((sn.esp.dgi.dic3.mcarred.gestion_user.beans.Utilisateur)request.getAttribute("utilisateur")).getPassword() %>">
                        <% if(request.getAttribute("form") != null && ((sn.esp.dgi.dic3.mcarred.gestion_user.forms.UtilisateurForm)request.getAttribute("form")).getErreurs().get("password") != null) { %>
                            <p class="mt-1 text-sm text-red-600 flex items-center">
                                <i class="fas fa-exclamation-circle mr-2"></i>
                                <%= ((sn.esp.dgi.dic3.mcarred.gestion_user.forms.UtilisateurForm)request.getAttribute("form")).getErreurs().get("password") %>
                            </p>
                        <% } %>
                    </div>
                </div>

                <div class="flex justify-end space-x-3 pt-6">
                    <a href="list" class="inline-flex items-center px-4 py-2 border border-gray-300 rounded-md text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition-colors duration-300">
                        <i class="fas fa-arrow-left mr-2"></i>
                        Retour
                    </a>
                    <button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition-colors duration-300">
                        <i class="fas fa-save mr-2"></i>
                        Modifier
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>