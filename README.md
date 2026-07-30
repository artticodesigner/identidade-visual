# Identidade Visual — Clientes (Tastto / Arttico)

Painel compartilhado pra classificar a disponibilidade de identidade visual dos clientes.
Diferente da versão em Artifact, esse aqui guarda tudo no Supabase — todo mundo que abrir o
link vê a mesma lista em tempo real, e só quem fizer login com a senha consegue editar.

O `index.html` não tem nenhum dado de cliente escrito nele — só o programa. Os dados reais
vivem só no banco (Supabase), populados uma vez via `seed-data.sql` (que fica fora do
repositório, veja abaixo).

## Configurar (uma vez só)

1. **Criar o projeto no Supabase** — ✅ já feito

2. **Criar a tabela** — ✅ já feito
   - No SQL Editor, você já rodou [`supabase-setup.sql`](supabase-setup.sql), que criou a tabela
     `clientes`, as permissões de acesso e ligou a atualização em tempo real.

3. **Popular com os dados reais** — ✅ já feito
   - Você já rodou `seed-data.sql` (fica só no seu computador, nunca vai pro GitHub).

4. **Chaves de acesso** — ✅ já preenchidas no `index.html`

5. **Criar a conta de login compartilhada**
   - No painel do Supabase, vá em **Authentication** → **Users** → **Add user** (ou "Invite user",
     dependendo da versão).
   - Em **Email**, coloque exatamente `equipe@identidade-visual.local` (esse valor já está
     escrito no `index.html`, na variável `AUTH_EMAIL` — se quiser usar outro e-mail, troque nos
     dois lugares).
   - Em **Password**, defina a senha que só a equipe vai saber.
   - Marque a opção **"Auto Confirm User"** (ou equivalente) se aparecer, pra não precisar
     confirmar por e-mail.

6. **Travar as permissões de escrita**
   - No **SQL Editor**, cole o conteúdo de [`auth-setup.sql`](auth-setup.sql) e clique em **Run**.
   - Isso faz a leitura continuar liberada pra quem tem o link, mas adicionar/editar/remover só
     funciona pra quem estiver logado com a senha.

7. **Publicar no GitHub Pages** — ✅ já feito
   - A página está em: `https://artticodesigner.github.io/identidade-visual/`

Esse link é o que você compartilha com a equipe. Qualquer pessoa que abrir vê os dados em tempo
real; pra editar, clica em **"Entrar"** no topo da página e digita a senha.

## Sobre segurança

Diferente da primeira versão, agora a permissão de escrita é garantida pelo próprio banco de
dados (Supabase), não só pela tela — mesmo que alguém tente editar por fora da página (por
exemplo, chamando a API direto), o Supabase recusa se a pessoa não estiver logada. É uma senha
única e compartilhada pra toda a equipe (não é login individual por pessoa) — simples de usar,
mas também simples de trocar: se um dia precisar revogar o acesso de alguém, é só trocar essa
senha em **Authentication → Users** no Supabase, e reenviar a nova senha pra quem deve continuar
tendo acesso.

Ainda assim, **não divulgue esse link publicamente** — qualquer pessoa com ele consegue ver os
dados dos clientes, mesmo sem conseguir editar.
