-- 1. Afficher la liste des noms des focaccias par ordre alphabétique croissant,
SELECT name FROM focaccia ORDER BY name ASC;

-- 2. Afficher le nombre total d'ingrédients,
SELECT COUNT(*) AS total_ingredients FROM ingredient;

-- 3. Afficher le prix moyen des focaccias,
SELECT AVG(prix) AS prix_moyen FROM focaccia;

-- 4. Afficher la liste des boissons avec leur marque, triée par nom de boisson,
SELECT boisson.nom AS nom_boisson, marque.nom AS nom_marque FROM boisson LEFT JOIN marque ON boisson.id_marque = marque.id_marque ORDER BY boisson.nom ASC;

-- 5. Afficher la liste des ingrédients pour une Raclaccia,
SELECT ingredient.nom FROM comprend JOIN focaccia ON comprend.id_focaccia = focaccia.id_focaccia JOIN ingredient ON comprend.id_ingredient = ingredient.id_ingredient WHERE focaccia.nom = 'Raclaccia';

-- 6. Afficher le nom et le nombre d'ingrédients pour chaque foccacia,
SELECT focaccia.nom, COUNT(comprend.id_ingredient) AS nombre_ingredientsFROM focaccia LEFT JOIN comprend ON focaccia.id_focaccia = comprend.id_focaccia GROUP BY focaccia.nom;

-- 7. Afficher le nom de la focaccia qui a le plus d'ingrédients,
SELECT focaccia.nom FROM focaccia JOIN comprend ON focaccia.id_focaccia = comprend.id_focaccia GROUP BY focaccia.nom ORDER BY COUNT(comprend.id_ingredient) DESC LIMIT 1;

-- 8. Afficher la liste des focaccia qui contiennent de l'ail,
SELECT focaccia.nom FROM comprend JOIN focaccia ON comprend.id_focaccia = focaccia.id_focaccia JOIN ingredient ON comprend.id_ingredient = ingredient.id_ingredient WHERE ingredient.nom = 'ail';

-- 9. Afficher la liste des ingrédients inutilisés,
SELECT ingredient.nom FROM ingredient LEFT JOIN comprend ON ingredient.id_ingredient = comprend.id_ingredient WHERE comprend.id_focaccia IS NULL;

-- 10. Afficher la liste des focaccia qui n'ont pas de champignons.
SELECT focaccia.nom FROM focaccia WHERE focaccia.id_focaccia NOT IN (
    SELECT id_focaccia
    FROM comprend
    JOIN ingredient ON comprend.id_ingredient = ingredient.id_ingredient
    WHERE ingredient.nom = 'champignons'
);
