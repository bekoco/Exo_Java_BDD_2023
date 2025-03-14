<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Boucles</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les boucles</h1>
<form action="#" method="post">
    <label for="inputValeur">Saisir le nombre d'étoiles : </label>
    <input type="text" id="inputValeur" name="valeur">
    <input type="submit" value="Afficher">
</form>

<%-- Récupération de la valeur saisie par l'utilisateur --%>
<% String valeur = request.getParameter("valeur"); %>
    
<%-- Vérification de l'existence de la valeur --%>
<% if (valeur != null && !valeur.isEmpty()) { %>

<%-- Boucle for pour afficher une ligne d'étoiles --%>
    <%int cpt = Integer.parseInt(valeur); %>
    <p>
    <% for (int i = 1; i <= cpt; i++) { %>
       <%= "*" %>
    <% } %>
    </p>

<h2>Exercice 1 : Le carré d'étoiles</h2>
<p>Ecrire le code afin de produire un carré d'étoile</p>
<p>Exemple si l'utilisateur saisie le valeur 5</p>
<p>*****</br>*****</br>*****</br>*****</br>*****</p>

<h2>Exercice 2 : Triangle rectangle gauche</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la gauche</p>
<p>Exemple si l'utilisateur saisie le valeur 5</p>
<p>*</br>**</br>***</br>****</br>*****</p>

<h2>Exercice 3 : Triangle rectangle inversé</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la gauche</p>
<p>Exemple si l'utilisateur saisie le valeur 5</p>
<p>*****</br>****</br>***</br>**</br>*</p>

<h2>Exercice 4 : Triangle rectangle 2</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la droite</p>
<p>Exemple si l'utilisateur saisie le valeur 5</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**</br>&nbsp;&nbsp;&nbsp;&nbsp;***</br>&nbsp;&nbsp;****</br>*****</p>

<h2>Exercice 5 : Triangle isocele</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la droite</p>
<p>Exemple si l'utilisateur saisie le valeur 5</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;*</br>&nbsp;&nbsp;&nbsp;**</br>&nbsp;&nbsp;***</br>&nbsp;****</br>*****</p>

<h2>Exercice 6 : Le demi losange</h2>
<p>Ecrire le code afin de produire un losange</p>
<p>Exemple si l'utilisateur saisie le valeur 5</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**</br>&nbsp;&nbsp;&nbsp;&nbsp;***</br>&nbsp;&nbsp;****</br>*****</p>
<p>*****</br>&nbsp;&nbsp;****</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*</p>

<h2>Exercice 7 : La table de multiplication</h2>
<p>Ecrire le code afin de créser une table de multiplication</p>
<p>Exemple si l'utilisateur saisie le valeur 5</p>
<p>5 x 1 = 5</p>
<p>5 x 2 = 10</p>
<p>5 x 3 = 15</p>
<p>5 x 4 = 20</p>
<p>5 x 5 = 25</p>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exercices sur les chaines et les boucles</title>
</head>
<body bgcolor="white">
    <h1>Exercices sur les chaines de caractères</h1>
    <form action="#" method="post">
        <p>
            Saisir une chaine (du texte avec 6 caractères minimum) : 
            <input type="text" id="inputValeur" name="chaine">
        </p>
        <p>
            <input type="submit" value="Afficher Chaines">
        </p>
    </form>
    
    <% 
        // Récupération de la chaîne saisie
        String chaine = request.getParameter("chaine");
        if (chaine != null) {
            if (chaine.length() < 6) {
    %>
                <p>Veuillez saisir une chaine avec au moins 6 caractères.</p>
    <%
            } else {
    %>
                <!-- Affichage des réponses pour les exercices sur les chaines -->
                <p>La longueur de votre chaîne est de <%= chaine.length() %> caractères</p>
                <p>Le 3ème caractère de votre chaine est la lettre <%= chaine.charAt(2) %></p>
                <p>Une sous chaine de votre texte (de l'index 2 à 5) : <%= chaine.substring(2, 6) %></p>
                <p>Votre premier "e" est en : <%= chaine.indexOf('e') %></p>
                
                <h2>Exercice 1 : Combien de 'e' dans notre chaine de charactères ?</h2>
                <%
                    int countE = 0;
                    for (int i = 0; i < chaine.length(); i++) {
                        char c = chaine.charAt(i);
                        if (c == 'e' || c == 'E') {
                            countE++;
                        }
                    }
                %>
                <p>Il y a <%= countE %> lettre(s) 'e' dans votre chaine.</p>
                
                <h2>Exercice 2 : Affichage vertical</h2>
                <%
                    for (int i = 0; i < chaine.length(); i++) {
                %>
                        <p><%= chaine.charAt(i) %></p>
                <%
                    }
                %>
                
                <h2>Exercice 3 : Retour à la ligne (sur chaque espace)</h2>
                <%
                    String[] mots = chaine.split(" ");
                    for (int i = 0; i < mots.length; i++) {
                %>
                        <p><%= mots[i] %></p>
                <%
                    }
                %>
                
                <h2>Exercice 4 : Afficher une lettre sur deux</h2>
                <%
                    StringBuilder lettreSurDeux = new StringBuilder();
                    for (int i = 0; i < chaine.length(); i += 2) {
                        lettreSurDeux.append(chaine.charAt(i));
                    }
                %>
                <p><%= lettreSurDeux.toString() %></p>
                
                <h2>Exercice 5 : La phrase en verlant (inversion de la chaîne)</h2>
                <%
                    String reversed = new StringBuilder(chaine).reverse().toString();
                %>
                <p><%= reversed %></p>
                
                <h2>Exercice 6 : Consonnes et voyelles</h2>
                <%
                    int vowels = 0;
                    int consonants = 0;
                    String vowelsList = "aeiouyAEIOUY";
                    for (int i = 0; i < chaine.length(); i++) {
                        char c = chaine.charAt(i);
                        if (Character.isLetter(c)) {
                            if (vowelsList.indexOf(c) != -1) {
                                vowels++;
                            } else {
                                consonants++;
                            }
                        }
                    }
                %>
                <p>Il y a <%= vowels %> voyelle(s) et <%= consonants %> consonne(s) dans votre texte.</p>
    <%
            }
        }
    %>
    
    <hr>
    
    <h1>Exercices sur les boucles</h1>
    <form action="#" method="post">
        <p>
            Saisir un nombre : 
            <input type="number" name="nombre">
        </p>
        <p>
            <input type="submit" value="Afficher Boucles">
        </p>
    </form>
    
    <%
        String nbStr = request.getParameter("nombre");
        if (nbStr != null && !nbStr.isEmpty()) {
            int n = Integer.parseInt(nbStr);
    %>
            <h2>Exercice 1 : Le carré d'étoiles</h2>
            <%
                for (int i = 0; i < n; i++) {
                    for (int j = 0; j < n; j++) {
                        out.print("*");
                    }
                    out.println("<br>");
                }
            %>
            
            <h2>Exercice 2 : Triangle rectangle gauche</h2>
            <%
                for (int i = 1; i <= n; i++) {
                    for (int j = 1; j <= i; j++) {
                        out.print("*");
                    }
                    out.println("<br>");
                }
            %>
            
            <h2>Exercice 3 : Triangle rectangle inversé</h2>
            <%
                for (int i = n; i >= 1; i--) {
                    for (int j = 1; j <= i; j++) {
                        out.print("*");
                    }
                    out.println("<br>");
                }
            %>
            
            <h2>Exercice 4 : Triangle rectangle 2 (aligné à droite, double espaces)</h2>
            <%
                for (int i = 1; i <= n; i++) {
                    for (int s = 1; s <= (n - i) * 2; s++) {
                        out.print("&nbsp;");
                    }
                    for (int j = 1; j <= i; j++) {
                        out.print("*");
                    }
                    out.println("<br>");
                }
            %>
            
            <h2>Exercice 5 : Triangle isocèle (aligné à droite, espaces simples)</h2>
            <%
                for (int i = 1; i <= n; i++) {
                    for (int s = 1; s <= (n - i); s++) {
                        out.print("&nbsp;");
                    }
                    for (int j = 1; j <= i; j++) {
                        out.print("*");
                    }
                    out.println("<br>");
                }
            %>
            
            <h2>Exercice 6 : Le demi losange</h2>
            <%
                // Partie supérieure
                for (int i = 1; i <= n; i++) {
                    for (int s = 1; s <= (n - i) * 2; s++) {
                        out.print("&nbsp;");
                    }
                    for (int j = 1; j <= i; j++) {
                        out.print("*");
                    }
                    out.println("<br>");
                }
                // Partie inférieure
                for (int i = n; i >= 1; i--) {
                    for (int s = 1; s <= (n - i) * 2; s++) {
                        out.print("&nbsp;");
                    }
                    for (int j = 1; j <= i; j++) {
                        out.print("*");
                    }
                    out.println("<br>");
                }
            %>
            
            <h2>Exercice 7 : La table de multiplication</h2>
            <%
                for (int i = 1; i <= n; i++) {
                    out.println(n + " x " + i + " = " + (n * i) + "<br>");
                }
            %>
    <%
        }
    %>
    
    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>


<% } %>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
