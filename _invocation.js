/**
 * Retourne le nombre d'heures entre deux dates
 * @param {Date} date1
 * @param {Date} date2
 * @returns {number}
 * 
 */
function getHoursBetweenDates(date1, date2) {
    return Math.abs(date1 - date2) / 36e5;
}
// Ça semble être bon ;-)

// OK, deuxième méthode...
// On commence par écrire le code...

function totalDuPanierAvecTaxes(panier) {
    return panier.reduce((total, produit) => total + produit.prix * produit.quantite, 0) * 1.15;
}
// GÉNIAL 

// OK, troisième méthode... OMG : commentaire magique, avez-vous vu ?

// Cette fois-ci, on écrit ce que l'on veut en commentaire, et on appuie sur Ctrl+Enter !

/**
 * Retourne le jour de la semaine de la fête de Noel à n'importe quelle année
 * @param {number} annee
 * @returns {string}
 */
function jourDeNoel(annee) {
    const date = new Date(annee, 11, 25);
    return date.toLocaleDateString('fr-FR', { weekday: 'long' });
}
// GÉNIAL : effectivement merci Copilot !!!!!
// Remarquez que ce code donne le nom du jour de la semaine en français !!!!








