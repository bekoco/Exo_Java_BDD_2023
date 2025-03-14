<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les tableaux</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les tableaux</h1>
<form action="#" method="post">
    <p>Saisir au minimum 3 chiffres à la suite, exemple : 6 78 15 <input type="text" id="inputValeur" name="chaine">
    <p><input type="submit" value="Afficher">
</form>

<%-- Récupération des valeurs --%>
<% 
    String chaine = request.getParameter("chaine"); 
    if (chaine != null && !chaine.isEmpty()) {
        String[] tableauDeChiffres = chaine.split("\\s+");
%>
    <p>Le tableau contient <%= tableauDeChiffres.length %> valeurs</p>
    <% 
        for (int i = 0; i < tableauDeChiffres.length; i++) { 
    %>
        <p>Chiffre <%= i+1 %> : <%= Integer.parseInt(tableauDeChiffres[i]) %></p>
    <% 
        } 
    %>

<h2>Exercice 1 : Le carré de la première valeur</h2>
<% 
    int premierChiffre = Integer.parseInt(tableauDeChiffres[0]);
%>
<p>Le carré du premier chiffre (<%= premierChiffre %>) est : <%= premierChiffre * premierChiffre %></p>

<h2>Exercice 2 : La somme des 2 premières valeurs</h2>
<% 
    int sommePremiersChiffres = 0;
    if (tableauDeChiffres.length > 1) {
        sommePremiersChiffres = Integer.parseInt(tableauDeChiffres[0]) + Integer.parseInt(tableauDeChiffres[1]);
    }
%>
<p>La somme des deux premières valeurs est : <%= sommePremiersChiffres %></p>

<h2>Exercice 3 : La somme de toutes les valeurs</h2>
<% 
    int sommeTotale = 0;
    for (String chiffre : tableauDeChiffres) {
        sommeTotale += Integer.parseInt(chiffre);
    }
%>
<p>La somme de toutes les valeurs saisies est : <%= sommeTotale %></p>

<h2>Exercice 4 : La valeur maximale</h2>
<% 
    int max = Integer.parseInt(tableauDeChiffres[0]);
    for (String chiffre : tableauDeChiffres) {
        int val = Integer.parseInt(chiffre);
        if (val > max) {
            max = val;
        }
    }
%>
<p>La valeur maximale est : <%= max %></p>

<h2>Exercice 5 : La valeur minimale</h2>
<% 
    int min = Integer.parseInt(tableauDeChiffres[0]);
    for (String chiffre : tableauDeChiffres) {
        int val = Integer.parseInt(chiffre);
        if (val < min) {
            min = val;
        }
    }
%>
<p>La valeur minimale est : <%= min %></p>

<h2>Exercice 6 : La valeur la plus proche de 0</h2>
<% 
    int plusProcheDeZero = Integer.parseInt(tableauDeChiffres[0]);
    for (String chiffre : tableauDeChiffres) {
        int val = Integer.parseInt(chiffre);
        if (Math.abs(val) < Math.abs(plusProcheDeZero)) {
            plusProcheDeZero = val;
        }
    }
%>
<p>La valeur la plus proche de 0 est : <%= plusProcheDeZero %></p>

<h2>Exercice 7 : La valeur la plus proche de 0 (2° version)</h2>
<% 
    int plusProcheDeZero2 = Integer.parseInt(tableauDeChiffres[0]);
    for (String chiffre : tableauDeChiffres) {
        int val = Integer.parseInt(chiffre);
        if (Math.abs(val) < Math.abs(plusProcheDeZero2) || (Math.abs(val) == Math.abs(plusProcheDeZero2) && val > 0)) {
            plusProcheDeZero2 = val;
        }
    }
%>
<p>La valeur la plus proche de 0 (avec préférence pour le positif) est : <%= plusProcheDeZero2 %></p>

<% } %>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
