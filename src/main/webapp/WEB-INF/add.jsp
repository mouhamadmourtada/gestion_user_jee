<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="title" value="Ajouter un utilisateur" scope="request" />
<jsp:include page="fragments/header.jsp">
    <jsp:param name="title" value="${title}" />
</jsp:include>

<div class="max-w-md mx-auto">
    <!-- Message d'erreur global -->
    <c:if test="${not empty errorMessage}">
        <div class="mb-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative form-animation" role="alert">
            <strong class="font-bold">Erreur!</strong>
            <span class="block sm:inline"><c:out value="${errorMessage}"/></span>
        </div>
    </c:if>

    <div class="bg-white rounded-xl shadow-2xl overflow-hidden form-animation">
        <div class="px-6 py-4 bg-gradient-to-r from-blue-600 to-blue-800">
            <h2 class="text-2xl font-bold text-white flex items-center">
                <i class="fas fa-user-plus mr-3"></i>
                Ajouter un utilisateur
            </h2>
        </div>
        
        <form action="add" method="post" class="px-6 py-6 space-y-6">
            <div class="space-y-6">
                <div>
                    <label for="nom" class="block text-sm font-medium text-gray-700 mb-1">
                        <i class="fas fa-user mr-2"></i>Nom
                    </label>
                    <input type="text" id="nom" name="nom" required
                           class="input-field mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400
                                  focus:outline-none focus:border-blue-500 focus:ring-1 focus:ring-blue-500"
                           value="<c:out value="${utilisateur.nom}"/>">
                    <c:if test="${not empty form.erreurs['nom']}">
                        <p class="mt-1 text-sm text-red-600 flex items-center">
                            <i class="fas fa-exclamation-circle mr-2"></i>
                            <c:out value="${form.erreurs['nom']}"/>
                        </p>
                    </c:if>
                </div>

                <div>
                    <label for="prenom" class="block text-sm font-medium text-gray-700 mb-1">
                        <i class="fas fa-user mr-2"></i>Prénom
                    </label>
                    <input type="text" id="prenom" name="prenom" required
                           class="input-field mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400
                                  focus:outline-none focus:border-blue-500 focus:ring-1 focus:ring-blue-500"
                           value="<c:out value="${utilisateur.prenom}"/>">
                    <c:if test="${not empty form.erreurs['prenom']}">
                        <p class="mt-1 text-sm text-red-600 flex items-center">
                            <i class="fas fa-exclamation-circle mr-2"></i>
                            <c:out value="${form.erreurs['prenom']}"/>
                        </p>
                    </c:if>
                </div>

                <div>
                    <label for="login" class="block text-sm font-medium text-gray-700 mb-1">
                        <i class="fas fa-at mr-2"></i>Login
                    </label>
                    <input type="text" id="login" name="login" required
                           class="input-field mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400
                                  focus:outline-none focus:border-blue-500 focus:ring-1 focus:ring-blue-500"
                           value="<c:out value="${utilisateur.login}"/>">
                    <c:if test="${not empty form.erreurs['login']}">
                        <p class="mt-1 text-sm text-red-600 flex items-center">
                            <i class="fas fa-exclamation-circle mr-2"></i>
                            <c:out value="${form.erreurs['login']}"/>
                        </p>
                    </c:if>
                </div>

                <div>
                    <label for="password" class="block text-sm font-medium text-gray-700 mb-1">
                        <i class="fas fa-lock mr-2"></i>Mot de passe
                    </label>
                    <input type="password" id="password" name="password" required
                           class="input-field mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400
                                  focus:outline-none focus:border-blue-500 focus:ring-1 focus:ring-blue-500">
                    <c:if test="${not empty form.erreurs['password']}">
                        <p class="mt-1 text-sm text-red-600 flex items-center">
                            <i class="fas fa-exclamation-circle mr-2"></i>
                            <c:out value="${form.erreurs['password']}"/>
                        </p>
                    </c:if>
                </div>

                <div>
                    <label for="passwordBis" class="block text-sm font-medium text-gray-700 mb-1">
                        <i class="fas fa-lock mr-2"></i>Confirmer le mot de passe
                    </label>
                    <input type="password" id="passwordBis" name="passwordBis" required
                           class="input-field mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md text-sm shadow-sm placeholder-gray-400
                                  focus:outline-none focus:border-blue-500 focus:ring-1 focus:ring-blue-500">
                    <c:if test="${not empty form.erreurs['passwordBis']}">
                        <p class="mt-1 text-sm text-red-600 flex items-center">
                            <i class="fas fa-exclamation-circle mr-2"></i>
                            <c:out value="${form.erreurs['passwordBis']}"/>
                        </p>
                    </c:if>
                </div>
            </div>

            <div class="flex justify-end space-x-3 pt-6">
                <a href="list" class="inline-flex items-center px-4 py-2 border border-gray-300 rounded-md text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-colors duration-300">
                    <i class="fas fa-arrow-left mr-2"></i>
                    Retour
                </a>
                <button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-colors duration-300">
                    <i class="fas fa-save mr-2"></i>
                    Ajouter
                </button>
            </div>
        </form>
    </div>
</div>

<jsp:include page="fragments/footer.jsp" />
</body>
</html>