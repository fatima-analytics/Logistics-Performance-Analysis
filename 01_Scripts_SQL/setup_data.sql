-- Création de la table Produits
CREATE TABLE produits (
    product_id SERIAL PRIMARY KEY,
    nom_produit VARCHAR(100),
    categorie VARCHAR(50),
    cout_unitaire DECIMAL(10,2),
    prix_vente DECIMAL(10,2)
);

-- Création de la table Expéditions (Le coeur de la supply chain)
CREATE TABLE expeditions (
    shipment_id SERIAL PRIMARY KEY,
    date_expedition DATE,
    origine VARCHAR(50),
    destination VARCHAR(50),
    poids_kg DECIMAL(10,2),
    cout_transport DECIMAL(10,2),
    statut_livraison VARCHAR(20)
);

-- Génération massive de données (Exemple pour 50 000 lignes dans expeditions)
INSERT INTO expeditions (date_expedition, origine, destination, poids_kg, cout_transport, statut_livraison)
SELECT 
    current_date - (random() * 365)::integer,
    (ARRAY['Casablanca', 'Tanger', 'Agadir', 'Fès'])[floor(random()*4)+1],
    (ARRAY['Paris', 'Madrid', 'Londres', 'Berlin', 'Dubaï'])[floor(random()*5)+1],
    random() * 5000 + 100, -- Poids entre 100kg et 5100kg
    random() * 2000 + 500, -- Coût entre 500€ et 2500€
    (ARRAY['Livré', 'En retard', 'Annulé', 'En cours'])[floor(random()*4)+1]
FROM generate_series(1, 50000);