const express = require('express');
const mongoose = require('mongoose');
const requireDir = require('require-dir');
const cors = require('cors');

//iniciando o app
const app = express();
app.use(express.json());

app.use(cors());

//conexão com o banco de dados
mongoose.connect('mongodb://localhost:27017/topicos', { useNewUrlParser: true });
requireDir('./src/models');

//rotas
app.use('/api', require("./src/routes"));

app.listen(3001);