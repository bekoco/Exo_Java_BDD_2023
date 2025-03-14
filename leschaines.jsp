<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les chaines</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les chaines de caractères</h1>
<form action="#" method="post">
    <p>Saisir une chaîne (Du texte avec 6 caractères minimum) : <input type="text" id="inputValeur" name="chaine">
    <p><input type="submit" value="Afficher">
</form>

<%-- Récupération des valeurs --%>
<% 
    String chaine = request.getParameter("chaine"); 
    if (chaine != null && chaine.length() >= 6) {
%>

<h2>Exercice 1 : Combien de 'e' dans notre chaîne de caractères ?</h2>
<% 
    int countE = 0;
    for (int i = 0; i < chaine.length(); i++) {
        if (chaine.charAt(i) == 'e') {
            countE++;
        }
    }
%>
<p>Le nombre de 'e' dans votre chaîne est : <%= countE %></p>

<h2>Exercice 2 : Affichage verticale</h2>
<p>
<% 
    for (int i = 0; i < chaine.length(); i++) {
        out.println(chaine.charAt(i) + "<br>");
    }
%>
</p>

<h2>Exercice 3 : Retour à la ligne</h2>
<p>
<% 
    String[] mots = chaine.split(" ");
    for (String mot : mots) {
        out.println(mot + "<br>");
    }
%>
</p>

<h2>Exercice 4 : Afficher une lettre sur deux</h2>
<p>
<% 
    StringBuilder result = new StringBuilder();
    for (int i = 0; i < chaine.length(); i += 2) {
        result.append(chaine.charAt(i));
    }
    out.print(result.toString());
%>
</p>

<h2>Exercice 5 : La phrase en verlant</h2>
<p>
<% 
    StringBuilder reverse = new StringBuilder(chaine);
    out.print(reverse.reverse().toString());
%>
</p>

<h2>Exercice 6 : Consonnes et voyelles</h2>
<% 
    int voyelles = 0;
    int consonnes = 0;
    for (int i = 0; i < chaine.length(); i++) {
        char c = Character.toLowerCase(chaine.charAt(i));
        if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u') {
            voyelles++;
        } else if (Character.isLetter(c)) {
            consonnes++;
        }
    }
%>
<p>Voyelles : <%= voyelles %></p>
<p>Consonnes : <%= consonnes %></p>

<% } else { %>
    <p>Veuillez entrer une chaîne d'au moins 6 caractères.</p>
<% } %>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
