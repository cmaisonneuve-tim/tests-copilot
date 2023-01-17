-- Base de données pour représenter un site web de commerce électronique

-- Création de la base de données
CREATE DATABASE IF NOT EXISTS copilot;
USE copilot;

-- Création de la table des utilisateurs
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

-- Création de la table des produits
CREATE TABLE IF NOT EXISTS products (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    price FLOAT NOT NULL,
    PRIMARY KEY (id)
);

-- Création de la table des commandes
CREATE TABLE IF NOT EXISTS orders (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Création de la table des catégories

CREATE TABLE IF NOT EXISTS categories (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

-- Création de la table des produits par catégories

CREATE TABLE IF NOT EXISTS products_categories (
    id INT NOT NULL AUTO_INCREMENT,
    product_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Création de la table des commentaires

CREATE TABLE IF NOT EXISTS comments (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    content VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Création de la table des avis

CREATE TABLE IF NOT EXISTS reviews (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    rating INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Création de la table des promotions

CREATE TABLE IF NOT EXISTS promotions (
    id INT NOT NULL AUTO_INCREMENT,
    product_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    discount INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Création de la table des images

CREATE TABLE IF NOT EXISTS images (
    id INT NOT NULL AUTO_INCREMENT,
    product_id INT NOT NULL,
    url VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Création de la table des favoris

CREATE TABLE IF NOT EXISTS favorites (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Création de la table des paniers

CREATE TABLE IF NOT EXISTS carts (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Création de la table des adresses

CREATE TABLE IF NOT EXISTS addresses (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    zip_code VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Création de la table des modes de paiement

CREATE TABLE IF NOT EXISTS payment_methods (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

-- Création de la table des modes de livraison

CREATE TABLE IF NOT EXISTS delivery_methods (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

-- Création de la table des commandes

CREATE TABLE IF NOT EXISTS orders (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    payment_method_id INT NOT NULL,
    delivery_method_id INT NOT NULL,
    address_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_methods(id),
    FOREIGN KEY (delivery_method_id) REFERENCES delivery_methods(id),
    FOREIGN KEY (address_id) REFERENCES addresses(id)
);

-- Création de la table des promotions

CREATE TABLE IF NOT EXISTS promotions (
    id INT NOT NULL AUTO_INCREMENT,
    product_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    discount INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- OK ça commence à tourner en rond malheureusement... je considère tout cet effort inutile...

-- Écrire une requête SQL qui retourne le nombre de produits groupés par catégorie
-- Hum... j'essaie en anglais...

-- Return the number of products grouped by category
-- SELECT COUNT(*) FROM products GROUP BY category_id;
-- OK, mais ça ne retourne pas le nom de la catégorie, juste le nombre de produits par catégorie !!!!!

-- Return the number of products grouped by name of category
-- Pas bon, un simple JOIN !!!

-- Essayons autre chose : 
-- Return all products having more than 1 image
-- SELECT * FROM products WHERE id IN (SELECT product_id FROM images GROUP BY product_id HAVING COUNT(*) > 1);
-- NICE !!!

-- Return info about products and images
-- SELECT * FROM products JOIN images ON products.id = images.product_id;
-- Enfin !

-- Insert a new product
-- INSERT INTO products (name, description, price, category_id) VALUES ('T-shirt', 'Un t-shirt', 10, 1);

-- Mettre à jour les produits dont le prix dépasse 10 pour l'augmenter de 30%
-- UPDATE products SET price = price * 1.3 WHERE price > 10;
-- OK!

-- Supprimer tous les produits qui ne sont dans aucun panier d'achats
-- DELETE FROM products WHERE id NOT IN (SELECT product_id FROM carts);
-- COOL!

-- Ajouter une contrainte sur la table des catégories pour permettre de supprimer une catégorie même si elle a des produits
-- ALTER TABLE products DROP FOREIGN KEY products_ibfk_1;
-- Hahaha, ça enlève la relation entre les tables !!!
-- ALTER TABLE products ADD CONSTRAINT products_ibfk_1 FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE;
-- OK, ça marche ! En faite, c'était bon : la première ligne enlève la relation, 
-- mais la seconde la recrée avec la contrainte ON DELETE CASCADE !!! OMG le commentaire
-- est impeccable (il a été généré automatiquement par.... copilot !!! revoir le gif... ;-))


