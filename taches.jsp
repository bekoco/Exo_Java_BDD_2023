<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>

<%!
    public class MyTask {
        private String titre;
        private String description;
        private boolean terminee;

        public MyTask(String titre, String description) {
            this.titre = titre;
            this.description = description;
            this.terminee = false;
        }

        public String getTitre() { return titre; }
        public String getDescription() { return description; }
        public boolean isTerminee() { return terminee; }
        public void setTerminee(boolean terminee) { this.terminee = terminee; }
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

        <input type="submit" value="Ajouter la tâche">
    </form>

    <hr>

<%
    ArrayList<MyTask> listeTaches = (ArrayList<MyTask>) session.getAttribute("listeTaches");

    if (listeTaches == null) {
        listeTaches = new ArrayList<>();
        session.setAttribute("listeTaches", listeTaches);
    }

    // Création d'une nouvelle tâche
    String titre = request.getParameter("titre");
    String description = request.getParameter("description");

    if (titre != null && description != null && !titre.isEmpty() && !description.isEmpty()) {
        MyTask nouvelleTache = new MyTask(titre, description);
        listeTaches.add(nouvelleTache);
    }

    // Suppression d'une tâche
    String deleteIndexStr = request.getParameter("deleteIndex");
    if (deleteIndexStr != null) {
        int index = Integer.parseInt(deleteIndexStr);
        if (index >= 0 && index < listeTaches.size()) {
            listeTaches.remove(index);
        }
    }

    // Mise à jour de l'état "Terminée"
    String updateIndexStr = request.getParameter("updateIndex");
    String checkboxValue = request.getParameter("terminee");
    if (updateIndexStr != null) {
        int index = Integer.parseInt(updateIndexStr);
        if (index >= 0 && index < listeTaches.size()) {
            listeTaches.get(index).setTerminee(checkboxValue != null);
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

            <form method="post" action="taches.jsp" style="display:inline;">
                <input type="hidden" name="updateIndex" value="<%= i %>">
                <label>
                    <input type="checkbox" name="terminee" <%= t.isTerminee() ? "checked" : "" %> onchange="this.form.submit()"> 
                    Tâche terminée ?
                </label>
            </form>

            <form method="post" action="taches.jsp" style="display:inline;">
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
