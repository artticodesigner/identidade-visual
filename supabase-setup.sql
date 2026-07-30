-- Cole isso inteiro no SQL Editor do Supabase (painel do projeto > SQL Editor > New query > Run)

create table public.clientes (
  id uuid primary key default gen_random_uuid(),
  brand text not null,
  name text not null,
  status text not null default 'nao_tem',
  note text default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Mantém updated_at correto a cada alteração
create or replace function public.set_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

create trigger clientes_set_updated_at
  before update on public.clientes
  for each row execute function public.set_updated_at();

-- Segurança: como é uma ferramenta interna sem login, liberamos leitura/escrita
-- pra quem tiver o link (a chave "anon" já limita isso a essa tabela específica).
alter table public.clientes enable row level security;

create policy "public read" on public.clientes for select using (true);
create policy "public insert" on public.clientes for insert with check (true);
create policy "public update" on public.clientes for update using (true);
create policy "public delete" on public.clientes for delete using (true);

-- Habilita atualização em tempo real (todo mundo vê a mudança na hora)
alter publication supabase_realtime add table public.clientes;
