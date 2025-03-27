<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>

<%!
    public class MyTask {
        private String titre;
        private String description;
        private boolean terminee;

        public MyTask(String titre, String description, boolean terminee) {
            this.titre = titre;
            this.description = description;
            this.terminee = terminee;
        }

        public String getTitre() { return titre; }
        public String getDescription() { return description; }
        public boolean isTerminee() { return terminee; }
    }
%>

<html>
<head>
    <title>Gestionnaire de Tâches</title>
</head>
<body bgcolor="white">
    <h1>Ajouter une tâche</h1>

    <form action="taches.jsp" method="post">
        <label for="titre">Titre :</label><br>
        <input type="text" id="titre" name="titre" required><br><br>

        <label for="description">Description :</label><br>
        <textarea id="description" name="description" rows="4" cols="40" required></textarea><br><br>

        <label>
            <input type="checkbox" name="terminee"> Terminée ?
        </label><br><br>

        <input type="submit" value="Ajouter la tâche">
    </form>

    <hr>

<%
    ArrayList<MyTask> listeTaches = (ArrayList<MyTask>) session.getAttribute("listeTaches");

    if (listeTaches == null) {
        listeTaches = new ArrayList<>();
        session.setAttribute("listeTaches", listeTaches);
    }

    String titre = request.getParameter("titre");
    String description = request.getParameter("description");
    String termineeStr = request.getParameter("terminee");
    boolean terminee = termineeStr != null;

    if (titre != null && description != null && !titre.isEmpty() && !description.isEmpty()) {
        MyTask nouvelleTache = new MyTask(titre, description, terminee);
        listeTaches.add(nouvelleTache);
    }

    String deleteIndexStr = request.getParameter("deleteIndex");
    if (deleteIndexStr != null) {
        int index = Integer.parseInt(deleteIndexStr);
        if (index >= 0 && index < listeTaches.size()) {
            listeTaches.remove(index);
        }
    }

    if (!listeTaches.isEmpty()) {
%>
    <h2>Liste des tâches :</h2>
    <ul>
    <%
        for (int i = 0; i < listeTaches.size(); i++) {
            MyTask t = listeTaches.get(i);
    %>
        <li>
            <strong><%= t.getTitre() %></strong><br>
            <em><%= t.getDescription() %></em><br>
            <span>Terminée : <%= t.isTerminee() ? "✅ Oui" : "❌ Non" %></span><br><br>

            <form method="post" action="taches.jsp">
                <input type="hidden" name="deleteIndex" value="<%= i %>">
                <input type="submit" value="Supprimer">
            </form>
        </li>
        <br>
    <%
        }
    %>
    </ul>
<%
    } else {
%>
    <p>Aucune tâche enregistrée.</p>
<%
    }
%>

</body>
</html>
