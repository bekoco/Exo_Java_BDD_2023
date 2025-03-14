<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Les chaines</title>
</head>
<body bgcolor="white">
    <h1>Exercices sur les chaines de charactères</h1>
    <form action="#" method="post">
        <p>Saisir une chaine (Du texte avec 6 caractères minimum) : 
            <input type="text" id="inputValeur" name="chaine">
        </p>
        <p><input type="submit" value="Afficher"></p>
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
                <!-- Affichage des opérations de base -->
                <p>La longueur de votre chaîne est de <%= chaine.length() %> caractères</p>
                <p>Le 3ème caractère de votre chaine est la lettre <%= chaine.charAt(2) %></p>
                <p>Une sous chaine de votre texte (de l'index 2 à 5) : <%= chaine.substring(2, 6) %></p>
                <p>Votre premier "e" est en : <%= chaine.indexOf('e') %></p>
                
                <!-- Exercice 1 : Compter le nombre de 'e' -->
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
                
                <!-- Exercice 2 : Affichage vertical -->
                <h2>Exercice 2 : Affichage vertical</h2>
                <%
                    for (int i = 0; i < chaine.length(); i++) {
                %>
                        <p><%= chaine.charAt(i) %></p>
                <%
                    }
                %>
                
                <!-- Exercice 3 : Retour à la ligne sur chaque espace -->
                <h2>Exercice 3 : Retour à la ligne</h2>
                <%
                    String[] mots = chaine.split(" ");
                    for (int i = 0; i < mots.length; i++) {
                %>
                        <p><%= mots[i] %></p>
                <%
                    }
                %>
                
                <!-- Exercice 4 : Afficher une lettre sur deux -->
                <h2>Exercice 4 : Afficher une lettre sur deux</h2>
                <%
                    StringBuilder lettreSurDeux = new StringBuilder();
                    for (int i = 0; i < chaine.length(); i += 2) {
                        lettreSurDeux.append(chaine.charAt(i));
                    }
                %>
                <p><%= lettreSurDeux.toString() %></p>
                
                <!-- Exercice 5 : La phrase en verlant (inversion de la chaîne) -->
                <h2>Exercice 5 : La phrase en verlant</h2>
                <%
                    String reversed = new StringBuilder(chaine).reverse().toString();
                %>
                <p><%= reversed %></p>
                
                <!-- Exercice 6 : Consonnes et voyelles -->
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
    
    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
