<!-- Include header -->
<?php include 'header.php'; ?>

<!-- Inclure l'entête -->
<?php include 'header.php'; ?>

<!-- Obtenir la liste des tâches dans l'API Firestore -->
<?php
    require 'vendor/autoload.php';
    use Google\Cloud\Firestore\FirestoreClient;
    // Excellent !
    $db = new FirestoreClient([
        'projectId' => 'copilot-tests'
    ]);
    $tasks = $db->collection('tasks')->documents();
?>

<!-- Produire un gabarit Twig pour la liste des tâches -->
<?php
    $loader = new \Twig\Loader\FilesystemLoader('templates');
    $twig = new \Twig\Environment($loader);
    echo $twig->render('tasks.html', [
        'tasks' => $tasks
    ]);
?>
<!-- Pas mal, mais juste du autocomplete... -->

<!-- Include footer -->
<?php include 'footer.php'; ?>

<!-- Haha il se répète ... -->


<!-- Tableau associatif contenant les métadonnées des pages Web -->
<?php
    $pages = [
        'index' => [
            'title' => 'Accueil',
            'description' => 'Bienvenue sur le site de Copilot Tests !'
        ],
        'tasks' => [
            'title' => 'Tâches',
            'description' => 'Liste des tâches à faire'
        ]
    ];


    // Fonction pour calculer le total du panier d'achats
    function total($items) {
        $total = 0;
        foreach ($items as $item) {
            $total += $item['price'] * $item['quantity'];
        }
        return $total;
    }

    // Convertir entre deux devises
    function convert($amount, $from, $to) {
        $rates = [
            'EUR' => 1,
            'USD' => 1.1,
            'GBP' => 0.9
        ];
        return $amount * $rates[$from] / $rates[$to];
    }
    // Cool mais simplet

    // Fonction pour obtenir le nom du mois
    function monthName($month) {
        $months = [
            '01' => 'Janvier',
            '02' => 'Février',
            '03' => 'Mars',
            '04' => 'Avril',
            '05' => 'Mai',
            '06' => 'Juin',
            '07' => 'Juillet',
            '08' => 'Août',
            '09' => 'Septembre',
            '10' => 'Octobre',
            '11' => 'Novembre',
            '12' => 'Décembre'
        ];
        return $months[$month];
    }
    // Excellent !
    // Hahaha : il suggère les requêtes, y répond, et se donne une note Excellent ;-)
?>
<!-- Excellent !!! -->

