-- PARAMÈTRES RESTAURANT Tip Top
CREATE TABLE IF NOT EXISTS public.parametres (
  id             INTEGER PRIMARY KEY DEFAULT 1 CHECK (id = 1),
  nom_restaurant TEXT DEFAULT 'Tip Top',
  logo_url       TEXT,
  adresse        TEXT DEFAULT 'Kinshasa Mall, Avenue 24 Novembre, Kinshasa',
  telephone      TEXT DEFAULT '+243 814 364 433',
  whatsapp       TEXT DEFAULT '243814364433',
  horaires       TEXT DEFAULT 'Tous les jours 10h00 - 22h00',
  updated_at     TIMESTAMPTZ DEFAULT NOW()
);
INSERT INTO public.parametres (id, nom_restaurant, adresse, telephone, whatsapp, horaires)
VALUES (1, 'Tip Top', 'Kinshasa Mall, Avenue 24 Novembre, Kinshasa', '+243 814 364 433', '243814364433', 'Tous les jours 10h00 - 22h00')
ON CONFLICT (id) DO NOTHING;
CREATE TRIGGER trg_parametres_updated_at BEFORE UPDATE ON public.parametres FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();
ALTER TABLE public.parametres ENABLE ROW LEVEL SECURITY;
CREATE POLICY "param_select" ON public.parametres FOR SELECT USING (true);
CREATE POLICY "param_update" ON public.parametres FOR UPDATE USING (auth.uid() IN (SELECT id FROM public.admin_profiles));
SELECT 'Tip Top — paramètres OK' AS status;
