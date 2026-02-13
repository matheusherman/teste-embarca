# 📚 Biblioteca - Rails CRUD de Livros

Este é um projeto em **Ruby on Rails 8.1.2** que serve como exemplo de um CRUD simples de livros, com associação de usuário e enum de status.

---

## 🧪 Funcionalidades

API básica para gerenciar livros:

| Ação | Metodo | Endpoint |
|------|---------|----------|
| Listar todos | GET | `/books` |
| Ver um livro | GET | `/books/:id` |
| Criar livro | POST | `/books` |
| Atualizar livro | PATCH/PUT | `/books/:id` |
| Deletar livro | DELETE | `/books/:id` |

---

## 🧱 Estrutura

O modelo **Book** tem os campos:

| Atributo | Tipo | Observação |
|----------|------|------------|
| title | string | obrigatório |
| author | string | obrigatório |
| notes | text | opcional |
| status | integer | enum: `unread, reading, finished` |
| finished_on | date | obrigatório se status=finished |
| user_id | integer | relacionamento com User |

---

## 🚀 Como Rodar o Projeto

### Pré-requisitos

- Ruby 3.3.4
- Rails 8.1.2
- PostgreSQL ou outro DB configurado
- rbenv ou similar

---

### Instalação

1. Clone o repositório:

```bash
git clone https://github.com/matheusherman/teste-embarca.git
cd teste-embarca
````

2. Instale as dependências:

```bash
bundle install
```

3. Configure o banco de dados:

```bash
rails db:create
rails db:migrate
```

4. Rode o servidor:

```bash
rails server -b 127.0.0.1 -p 3000
```

---

## 📬 Exemplo de Requisições com Postman

### Criar Livro

```
POST /books
```

Body (JSON):

```json
{
  "book": {
    "title": "Clean Code",
    "author": "Robert C. Martin",
    "status": "reading",
    "user_id": 1
  }
}
```

---

### Atualizar Livro

```
PATCH /books/1
```

Body (JSON):

```json
{
  "book": {
    "status": "finished",
    "finished_on": "2026-02-13"
  }
}
```

