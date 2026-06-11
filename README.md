# Catálogo Gastronômico

Monolito feito em PHP, fiz um catalogo menu para demonstrar os produtos de uma doceria, o diferencial que nela você tem um painel Admin para atualizar as fotos e preços de produtos.

Na página inicial você pode já ver os produtos cadastrados.

Para fazer o CRUD que foi solictado você deve colocar no navegador a rota "/admin" e fazer login com as credenciais abaixo:

- **E-mail**: `teste@teste.com` (Padrão para desenvolvimento local)
- **Senha**: `123456` (Padrão para desenvolvimento local)

Obs: quando for adicionar um novo produto, se não for colocado imagem ele recebe a imagem padrão


## Como Rodar o Projeto

Siga os passos abaixo:

1. No terminal, na raiz do projeto, execute:
```bash
docker compose up -d --build
```
3. Após o build, acesse a aplicação em seu navegador:
   **[http://localhost:8080](http://localhost:8080)**

## Acesso ao Painel Admin

O banco de dados é inicializado automaticamente com as tabelas necessárias. Na primeira execução, se a tabela de usuários estiver vazia, a aplicação cria um usuário administrador usando as variáveis de ambiente:

*   **Localmente**:
    - **E-mail**: `teste@teste.com`
    - **Senha**: `123456`
*   **Em Produção (Railway)**:
    Basta definir as variáveis de ambiente abaixo no painel do Railway para definir as credenciais do seu tio de forma segura:
    - `ADMIN_EMAIL`: O e-mail dele.
    - `ADMIN_PASSWORD`: A senha que ele usará.

### Criando novos usuários manualmente
Você pode criar novos usuários via CLI executando o comando abaixo (com o container rodando):
```bash
docker exec -it mvc_app php bin/create-user.php novo@email.com sua-senha
```
## 🛠️ Tecnologias Utilizadas

- **Backend**: PHP 8.2+
- **Database**: MySQL 8.0
- **Padrão de Projeto**: MVC (Model-View-Controller)
- **Segurança**: 
  - Hashing de senhas com `Argon2id`.
  - Controle de sessão centralizado via Front Controller.
  - Prevenção de SQL Injection com PDO Prepared Statements.
- **Infraestrutura**: Docker & Docker Compose.

---

## 📂 Estrutura de Pastas

- `public/`: Ponto de entrada (`index.php`) e arquivos estáticos (CSS, JS, Imagens).
- `src/Controller/`: Lógica de controle das requisições.
- `src/Model/`: Representação dos dados.
- `src/Repository/`: Comunicação com o banco de dados.
- `src/View/`: Templates HTML.
- `config/`: Configuração de rotas dinâmicas.
