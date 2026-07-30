-- Rode isso no SQL Editor do Supabase. Adiciona a coluna que guarda o link da pasta
-- de logos de cada cliente no Google Drive (opcional — fica em branco até ser preenchida).

alter table public.clientes add column if not exists drive_url text;
