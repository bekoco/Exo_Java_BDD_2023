<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>

<%! 
    // Classe interne pour représenter une tâche
    public class MyClass {
        String nameTache;

        public MyClass(String name) {
            nameTache = name;
        }

        public String getNameTache() {
            return nameTache;
        }
    }
%>

<html>
<head>
    <title>Gestionnaire de tâches</title>
</head>
<body bgcolor="white">
    <h1>Ajouter une tâche</h1>
    
    <form action="taches.jsp" method="post">
        <label for="inputValeur">Nom de la tâche :</label>
        <input type="text" id="inputValeur" name="valeur" required>
        <input type="submit" value="Enregistrer">
    </form>

    <hr>

<%
    // Récupération ou création de la liste de tâches en session
    ArrayList<MyClass> listeTaches = (ArrayList<MyClass>) session.getAttribute("listeTaches");

    if (listeTaches == null) {
        listeTaches = new ArrayList<>();
        session.setAttribute("listeTaches", listeTaches);
    }

    // Ajout d'une nouvelle tâche si formulaire soumis
    String valeur = request.getParameter("valeur");

    if (valeur != null && !valeur.isEmpty()) {
        MyClass nouvelleTache = new MyClass(valeur);
        listeTaches.add(nouvelleTache);
    }

    // Affichage des tâches
    if (!listeTaches.isEmpty()) {
%>
        <h2>Liste des tâches :</h2>
        <ul>
        <%
            for (MyClass t : listeTaches) {
        %>
                <li><%= t.getNameTache() %></li>
        <%
            }
        %>
        </ul>
<%
    } else {
%>
        <p>Aucune tâche enregistrée pour le moment.</p>
<%
    }
%>

</body>
</html>
