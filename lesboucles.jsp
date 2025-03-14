<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Boucles</title>
</head>
<body bgcolor="white">
<h1>Exercices sur les boucles</h1>

<form action="lesboucles.jsp" method="post">
    <label for="inputValeur">Saisir le nombre d'étoiles : </label>
    <input type="text" id="inputValeur" name="valeur">
    <input type="submit" value="Afficher">
</form>

<%-- Récupération de la valeur saisie par l'utilisateur --%>
<% 
    String valeur = request.getParameter("valeur"); 
    if (valeur != null && !valeur.isEmpty()) {
        int cpt = Integer.parseInt(valeur);
%>

<h2>Exercice 1 : Le carré d'étoiles</h2>
<p>Ecrire le code afin de produire un carré d'étoile</p>
<p>Exemple si l'utilisateur saisie la valeur 5</p>
<p>
<%-- Boucle pour afficher le carré d'étoiles --%>
    <% for (int i = 0; i < cpt; i++) { %>
        <%= "*".repeat(cpt) %><br>
    <% } %>
</p>

<h2>Exercice 2 : Triangle rectangle gauche</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la gauche</p>
<p>Exemple si l'utilisateur saisie la valeur 5</p>
<p>
<%-- Boucle pour afficher un triangle rectangle gauche --%>
    <% for (int i = 1; i <= cpt; i++) { %>
        <%= "*".repeat(i) %><br>
    <% } %>
</p>

<h2>Exercice 3 : Triangle rectangle inversé</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la gauche</p>
<p>Exemple si l'utilisateur saisie la valeur 5</p>
<p>
<%-- Boucle pour afficher un triangle rectangle inversé --%>
    <% for (int i = cpt; i >= 1; i--) { %>
        <%= "*".repeat(i) %><br>
    <% } %>
</p>

<h2>Exercice 4 : Triangle rectangle 2</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la droite</p>
<p>Exemple si l'utilisateur saisie la valeur 5</p>
<p>
<%-- Boucle pour afficher un triangle rectangle droit --%>
    <% for (int i = 1; i <= cpt; i++) { %>
        <%= " ".repeat(cpt - i) %><%= "*".repeat(i) %><br>
    <% } %>
</p>

<h2>Exercice 5 : Triangle isocele</h2>
<p>Ecrire le code afin de produire un triangle isocele</p>
<p>Exemple si l'utilisateur saisie la valeur 5</p>
<p>
<%-- Boucle pour afficher un triangle isocele --%>
    <% for (int i = 1; i <= cpt; i++) { %>
        <%= " ".repeat(cpt - i) %><%= "*".repeat(2 * i - 1) %><br>
    <% } %>
</p>

<h2>Exercice 6 : Le demi losange</h2>
<p>Ecrire le code afin de produire un losange</p>
<p>Exemple si l'utilisateur saisie la valeur 5</p>
<p>
<%-- Boucles pour afficher le demi-losange --%>
    <% for (int i = 1; i <= cpt; i++) { %>
        <%= " ".repeat(cpt - i) %><%= "*".repeat(2 * i - 1) %><br>
    <% } %>
    <% for (int i = cpt - 1; i >= 1; i--) { %>
        <%= " ".repeat(cpt - i) %><%= "*".repeat(2 * i - 1) %><br>
    <% } %>
</p>

<h2>Exercice 7 : La table de multiplication</h2>
<p>Ecrire le code afin de créer une table de multiplication</p>
<p>Exemple si l'utilisateur saisie la valeur 5</p>
<p>
<%-- Boucle pour afficher la table de multiplication --%>
    <% for (int i = 1; i <= cpt; i++) { %>
        <%= cpt + " x " + i + " = " + (cpt * i) %><br>
    <% } %>
</p>

<% } %>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
