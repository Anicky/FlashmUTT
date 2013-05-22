<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>FlashmUtt</title>
    </head>
    <body>
        <?php
        if (isset($_GET['id'])) {
            if ($_GET['id'] != null) {
                require_once("fonctions.php");
                require_once("bdd_config.php");
                $cle_secrete = "h1e3Ege$";
                $chaine = decrypter($cle_secrete, $_GET['id']);
                $parametres = json_decode($chaine, true);
                $commerce_nom = "";
                $requete = "SELECT nom FROM commerces WHERE id = ?";
                $reponse = $bdd->prepare($requete);
                $reponse->bindValue(1, $parametres['commerce'], PDO::PARAM_STR);
                $reponse->execute();
                $donnees = $reponse->fetch();
                if ($donnees != null) {
                    $commerce_nom = $donnees['nom'];
                }
                $reponse->closeCursor();
                echo "Commerce : <strong>" . $commerce_nom . "</strong><br /><br />Articles : <br />";
                ?>
                <ul>
                    <?php
                    foreach ($parametres['articles'] as $article) {
                        foreach ($article as $article_nom => $article_cout) {
                            ?>
                            <li><?php echo $article_nom . " (Coût : " . $article_cout . " €)"; ?></li>
                            <?php
                        }
                    }
                    ?>
                </ul>
                <?php
            } else {
                echo "Erreur : paramètre \"id\" vide.";
            }
        } else {
            echo "Erreur : paramètre \"id\" manquant.";
        }
        ?>
    </body>
</html>