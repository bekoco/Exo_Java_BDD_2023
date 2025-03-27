<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>

<%!
    public class MyTask {
        private String titre;
        private String description;
        private String echeance;
        private boolean terminee;

        public MyTask(String titre, String description, String echeance) {
            this.titre = titre;
            this.description = description;
            this.echeance = echeance;
            this.terminee = false;
        }

        public String getTitre() { return titre; }
        public String getDescription() { return description; }
        public String getEcheance() { return echeance; }
        public boolean isTerminee() { return terminee; }
        public void setTerminee(boolean terminee) { this.terminee = terminee; }
    }
%>

<html>
<head>
    <title>Gestionnaire de Tâches</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        form {
            display: inline;
        }
    </style>
</head>
<body bgcolor="white">
    <h1>Ajouter une tâche</h1>

    <form action="taches.jsp" method="post">
        <label for="titre">Titre :</label><br>
        <input type="text" id="titre" name="titre" required><br><br>

        <label for="description">Description :</label><br>
        <textarea id="description" name="description" rows="3" cols="40" required></textarea><br><br>

        <label for="echeance">Date d'échéance :</label><br>
        <input type="date" id="echeance" name="echeance" required><br><br>

        <input type="submit" value="Ajouter">
    </form>

    <hr>

<%
    ArrayList<MyTask> listeTaches = (ArrayList<MyTask>) session.getAttribute("listeTaches");

    if (listeTaches == null) {
        listeTaches = new ArrayList<>();
        session.setAttribute("listeTaches", listeTaches);
    }

    // Création d'une tâche
    String titre = request.getParameter("titre");
    String description = request.getParameter("description");
    String echeance = request.getParameter("echeance");

    if (titre != null && description != null && echeance != null &&
        !titre.isEmpty() && !description.isEmpty() && !echeance.isEmpty()) {
        listeTaches.add(new MyTask(titre, description, echeance));
    }

    // Suppression
    String deleteIndexStr = request.getParameter("deleteIndex");
    if (deleteIndexStr != null) {
        int index = Integer.parseInt(deleteIndexStr);
        if (index >= 0 && index < listeTaches.size()) {
            listeTaches.remove(index);
        }
    }

    // Marquer comme terminée
    String terminerIndexStr = request.getParameter("terminerIndex");
    if (terminerIndexStr != null) {
        int index = Integer.parseInt(terminerIndexStr);
        if (index >= 0 && index < listeTaches.size()) {
            listeTaches.get(index).setTerminee(true);
        }
    }

    if (!listeTaches.isEmpty()) {
%>
    <h2>Liste des tâches</h2>
    <table>
        <tr>
            <th>#</th>
            <th>Titre</th>
            <th>Description</th>
            <th>Date d'échéance</th>
            <th>Statut</th>
            <th>Actions</th>
        </tr>
<%
        for (int i = 0; i < listeTaches.size(); i++) {
            MyTask t = listeTaches.get(i);
%>
        <tr>
            <td><%= i + 1 %></td>
            <td><%= t.getTitre() %></td>
            <td><%= t.getDescription() %></td>
            <td><%= t.getEcheance() %></td>
            <td><%= t.isTerminee() ? "Terminée" : "En cours" %></td>
            <td>
                <form method="post" action="taches.jsp">
                    <input type="hidden" name="deleteIndex" value="<%= i %>">
                    <input type="submit" value="Supprimer">
                </form>

                <% if (!t.isTerminee()) { %>
                <form method="post" action="taches.jsp">
                    <input type="hidden" name="terminerIndex" value="<%= i %>">
                    <input type="submit" value="Terminer">
                </form>
                <% } %>
            </td>
        </tr>
<%
        }
%>
    </table>
<%
    } else {
%>
    <p>Aucune tâche enregistrée.</p>
<%
    }
%>

</body>
</html>
