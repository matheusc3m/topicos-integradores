### API de uma aplicação de contatos.

Endpoints:

"url": "http://localhost:3001/api"

Listar Contatos

GET

{{ base_url  }}/contacts?page=3

Cadastrar Contato

POST

{{ base_url  }}/contacts

Exibir Contato

Atualizar Contato

PUT

{{ base_url  }}/contacts/5d4091325fae9424747f2ef0

Excluir Contato 

DELETE

{{ base_url  }}/contacts/5d4091325fae9424747f2ef0

### Dependências:

npm install express

npm install -D nodemon

Para utilizar o nodemon criar no package.json, dentro de "scripts":

"dev": "nodemon server.js"

npm install require-dir

npm install mongoose-paginate

npm install cors

npm run dev


