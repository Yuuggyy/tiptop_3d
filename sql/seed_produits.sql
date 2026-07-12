-- ── SEED PRODUITS : Tip Top ──────────────────────────────
INSERT INTO public.restaurants (nom, slug)
VALUES ('Tip Top', 'tiptop')
ON CONFLICT (slug) DO NOTHING;

DO $$
DECLARE rid UUID;
BEGIN
  SELECT id INTO rid FROM public.restaurants WHERE slug = 'tiptop';
  INSERT INTO public.produits (restaurant_id, nom, description, prix, categorie, disponible) VALUES
    (rid, 'Porc Braise', 'Ngolo braise au feu, epices locales', 12.00, 'Braises et Grillades', true),
    (rid, 'Ailes de Poulet Braisees', '12 ailes marinees, braisees', 10.00, 'Braises et Grillades', true),
    (rid, 'Tilapia Frit', 'Tilapia entier frit, citron, piment', 11.00, 'Braises et Grillades', true),
    (rid, 'Ngolo Braise', 'Porc entier braise, sauce epicee', 12.00, 'Braises et Grillades', true),
    (rid, 'Poulet Saucisse', 'Saucisse de poulet grillee', 9.00, 'Braises et Grillades', true),
    (rid, 'Capitaine Grille', 'Grand poisson du fleuve, citron, herbes', 14.00, 'Braises et Grillades', true),
    (rid, 'Poulet Mayo', 'Poulet froid, mayonnaise maison', 8.00, 'Plats', true),
    (rid, 'Spaghetti Bolognaise', 'Pates, sauce bolognaise maison', 9.00, 'Plats', true),
    (rid, 'Riz au Gras au Poulet', 'Riz jaune, poulet, epices', 10.00, 'Plats', true),
    (rid, 'Poulet Braise et Frites', 'Demi-poulet braise, frites dorees', 13.00, 'Plats', true),
    (rid, 'Buffet Complet du Jour', 'Entree + plat + dessert au choix', 15.00, 'Buffet du Jour', true),
    (rid, 'Buffet Famille', 'Formule 4 personnes - assortiment complet', 50.00, 'Buffet du Jour', true),
    (rid, 'Riz Jaune', NULL, 3.00, 'Accompagnements', true),
    (rid, 'Plantain Frit', NULL, 3.00, 'Accompagnements', true),
    (rid, 'Salade', 'Salade de legumes frais', 3.00, 'Accompagnements', true),
    (rid, 'Frites Maison', NULL, 3.50, 'Accompagnements', true),
    (rid, 'Biere Primus 65cl', NULL, 4.00, 'Boissons', true),
    (rid, 'Coca Cola 33cl', NULL, 2.50, 'Boissons', true),
    (rid, 'Jus Frais', 'Mangue, passion, ananas', 3.00, 'Boissons', true),
    (rid, 'Eau Minerale', '75cl', 2.00, 'Boissons', true)
  ON CONFLICT DO NOTHING;
END $$;
