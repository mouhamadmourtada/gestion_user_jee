<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="title" value="Mon Profil" scope="request" />
<jsp:include page="fragments/header.jsp">
    <jsp:param name="title" value="${title}" />
</jsp:include>

<div class="max-w-3xl mx-auto">
    <div class="bg-white shadow-xl rounded-lg overflow-hidden">
        <div class="bg-gradient-to-r from-blue-600 to-blue-800 px-6 py-8">
            <div class="flex items-center">
                <div class="h-24 w-24 rounded-full bg-white flex items-center justify-center border-4 border-white shadow-lg">
                    <span class="text-blue-600 text-4xl font-bold">
                        ${fn:substring(utilisateur.prenom, 0, 1)}${fn:substring(utilisateur.nom, 0, 1)}
                    </span>
                </div>
                <div class="ml-6">
                    <h1 class="text-3xl font-bold text-white">
                        ${utilisateur.prenom} ${utilisateur.nom}
                    </h1>
                    <p class="text-blue-100 mt-1">
                        <i class="fas fa-user mr-2"></i>${utilisateur.login}
                    </p>
                </div>
            </div>
        </div>

        <div class="p-6">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="space-y-4">
                    <div>
                        <h3 class="text-sm font-medium text-gray-500">Nom</h3>
                        <p class="mt-1 text-lg text-gray-900">${utilisateur.nom}</p>
                    </div>
                    <div>
                        <h3 class="text-sm font-medium text-gray-500">Prénom</h3>
                        <p class="mt-1 text-lg text-gray-900">${utilisateur.prenom}</p>
                    </div>
                </div>
                <div class="space-y-4">
                    <div>
                        <h3 class="text-sm font-medium text-gray-500">Login</h3>
                        <p class="mt-1 text-lg text-gray-900">${utilisateur.login}</p>
                    </div>
                    <div>
                        <h3 class="text-sm font-medium text-gray-500">Rôle</h3>
                        <p class="mt-1 text-lg text-gray-900">Utilisateur</p>
                    </div>
                </div>
            </div>

            <div class="mt-8 flex justify-end">
                <a href="accueil" class="inline-flex items-center px-4 py-2 border border-gray-300 rounded-md text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-colors duration-300">
                    <i class="fas fa-arrow-left mr-2"></i>
                    Retour à l'accueil
                </a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="fragments/footer.jsp" />