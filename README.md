# Identidade Visual — Clientes (Tastto / Arttico)

Painel compartilhado pra classificar a disponibilidade de identidade visual dos clientes.
Diferente da versão em Artifact, esse aqui guarda tudo no Supabase — todo mundo que abrir o
link vê e edita a mesma lista, em tempo real.

O `index.html` não tem nenhum dado de cliente escrito nele — só o programa. Os dados reais
vivem só no banco (Supabase), populados uma vez via `seed-data.sql` (que fica fora do
repositório, veja abaixo).

## Configurar (uma vez só)

1. **Criar o projeto no Supabase**
   - Acesse [supabase.com](https://supabase.com) e crie uma conta gratuita (dá pra entrar com GitHub ou Google).
   - Clique em "New project", dê um nome (ex: `identidade-visual`), escolha uma senha de banco
     (guarde num lugar seguro, mas ela não é usada no código) e uma região perto do Brasil (ex: São Paulo).
   - Espere ~2 minutos o projeto terminar de provisionar.

2. **Criar a tabela** — ✅ já feito
   - No SQL Editor, você já rodou [`supabase-setup.sql`](supabase-setup.sql), que criou a tabela
     `clientes`, as permissões de acesso e ligou a atualização em tempo real.

3. **Popular com os dados reais**
   - Ainda no SQL Editor, abra uma **New query**, cole o conteúdo de `seed-data.sql`
     (esse arquivo fica só no seu computador, nunca vai pro GitHub) e clique em **Run**.
   - Isso insere de uma vez os clientes das duas auditorias (Tastto e Arttico) na tabela.

4. **Chaves de acesso** — ✅ já preenchidas no `index.html`

5. **Criar seu próprio repositório no GitHub**
   - `dobralabs/ccos-ratos` é o repositório público do curso — não é o lugar certo pra isso.
   - Crie um repositório novo na sua própria conta/organização do GitHub (pode ser público,
     já que o código não carrega mais nenhum dado de cliente).
   - Suba a pasta `identidade-visual/` (com `index.html`, `supabase-setup.sql`, este `README.md`)
     pra esse repositório novo. **Não suba o `seed-data.sql`** — ele já está no `.gitignore`.

6. **Publicar no GitHub Pages**
   - No repositório novo, vá em **Settings** → **Pages**.
   - Em "Source", escolha **Deploy from a branch** → branch `main` (ou a branch principal) →
     pasta `/ (root)` → **Save**.
   - Depois de 1-2 minutos, a página fica em algo como:
     `https://SEU-USUARIO.github.io/SEU-REPOSITORIO/identidade-visual/`

Esse link é o que você compartilha com a equipe — todo mundo que abrir vai ver e editar os
mesmos dados, com atualização automática (sem precisar recarregar a página).

## Sobre segurança

Como é uma ferramenta interna sem tela de login, qualquer pessoa com o link (e a chave
`anon`/`publishable`, que fica visível no código-fonte da página — isso é esperado, é assim que
o Supabase funciona) consegue ler e editar os dados dessa tabela específica. Isso é aceitável
pra um painel de controle interno de baixo risco como esse, mas **não divulgue esse link
publicamente**. Se um dia precisar de controle de acesso (login, permissões por pessoa), dá pra
evoluir usando a autenticação do próprio Supabase — é um passo a mais que não fiz aqui pra
manter simples.
