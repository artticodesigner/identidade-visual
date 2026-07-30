-- Rode isso no SQL Editor do Supabase depois de já ter rodado supabase-setup.sql e seed-data.sql.
-- Isso troca as permissões de escrita: qualquer pessoa com o link continua VENDO os dados
-- (select livre), mas só quem estiver logado (com a senha) consegue adicionar, editar ou remover.

drop policy if exists "public insert" on public.clientes;
drop policy if exists "public update" on public.clientes;
drop policy if exists "public delete" on public.clientes;

create policy "authenticated insert" on public.clientes
  for insert to authenticated with check (true);

create policy "authenticated update" on public.clientes
  for update to authenticated using (true);

create policy "authenticated delete" on public.clientes
  for delete to authenticated using (true);

-- A policy "public read" (select) continua como está — leitura sempre liberada pra quem tem o link.
