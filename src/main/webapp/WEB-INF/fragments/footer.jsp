<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
</div>
    <!-- Footer avec copyright -->
    <footer class="fixed bottom-0 w-full bg-white shadow-lg">
        <div class="max-w-7xl mx-auto py-4 px-4">
            <p class="text-center text-gray-600 text-sm">
                &copy; <fmt:formatDate value="${now}" pattern="yyyy"/> MCARRED. Tous droits réservés.
            </p>
        </div>
    </footer>
</body>
</html>