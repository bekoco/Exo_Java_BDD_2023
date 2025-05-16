<%@ page contentType="text/plain; charset=UTF-8" %>
<%
    // Déclaration de la chaîne
    String bonjour = "salut la compagnie";

    // Mise en majuscules
    String bonjourMajuscule = bonjour.toUpperCase();

    // Méthode pour mettre uniquement la première lettre en majuscule
    String capitalizeFirstLetter(String texte) {
        if (texte == null || texte.isEmpty()) return texte;
        return texte.substring(0, 1).toUpperCase() + texte.substring(1);
    }

    String bonjourCapitalize = capitalizeFirstLetter(bonjour);
%>

Message original :
<%= bonjour %>

Message en majuscule :
<%= bonjourMajuscule %>

Message avec la première lettre en majuscule :
<%= bonjourCapitalize %>
