-- Création d'une vue pour simplifier l'analyse dans Power BI
CREATE OR REPLACE VIEW vue_performance_logistique AS
SELECT 
    destination,
    origine,
    COUNT(*) as total_expeditions,
    ROUND(AVG(cout_transport), 2) as cout_moyen,
    SUM(poids_kg) as poids_total_kg,
    ROUND(
        (COUNT(*) FILTER (WHERE statut_livraison = 'En retard')::numeric / COUNT(*)) * 100, 
        2
    ) as taux_retard_pourcentage
FROM expeditions
GROUP BY destination, origine;

-- Vérification
SELECT * FROM vue_performance_logistique;