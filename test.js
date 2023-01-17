// Structure de données pour produits dans un panier d'achats
// Bloqué ben raide ! J'abandonne !

// Tableau des produits dans le panier d'achats
var panier = [
    {nom: "Pommes", prix: 1.00, quantite: 2},
    {nom: "Poires", prix: 1.50, quantite: 3},
    {nom: "Bananes", prix: 1.25, quantite: 1},
    {nom: "Pêches", prix: 1.75, quantite: 2}
];

// Calculer le sous-total du panier
var sousTotal = 0;
for (var i = 0; i < panier.length; i++) {
    sousTotal += panier[i].prix * panier[i].quantite;
}
//  Pas mal ! Mais maintenant utiliser une méthode déclarative pour faire la même chose.

// Utiliser reduce() pour faire la même chose
var sousTotal = panier.reduce(function (total, produit) {
    return total + produit.prix * produit.quantite;
}, 0);
// Impecc !!!!!

// Écrire une fonction qui retourne la date formatée en français
function formatDate(date) {
    var mois = date.getMonth() + 1;
    var jour = date.getDate();
    var annee = date.getFullYear();
    return
        jour + "/" + mois + "/" + annee;
}

// Écrire une fonction qui trie le panier d'achats en ordre de prix ascendant
function trierPanier(panier) {
    panier.sort(function (a, b) {
        return a.prix - b.prix;
    });
}
// YES!



