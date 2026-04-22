# 🎪 Sistema de Gestão de Eventos

Projeto de modelagem de banco de dados para gerenciamento de eventos com shows, artistas, clientes, ingressos e pagamentos.

**Autora:** Ana Carolina Salles

---

## 📋 Descrição

A gestão de eventos envolve diversas atividades como cadastro de participantes, organização de shows, venda de ingressos e controle de pagamentos. Este projeto propõe um banco de dados relacional para organizar essas informações, garantir o controle de capacidade do evento, registrar transações financeiras e facilitar a administração geral do sistema.

---

## 🗂️ Entidades

| Entidade | Descrição |
|---|---|
| **Pessoa** | Entidade genérica com nome, telefone, e-mail e endereço. Base para Cliente e Artista |
| **Cliente** | Especialização de Pessoa. Possui CPF e data de cadastro |
| **Artista** | Especialização de Pessoa. Possui nome artístico e estilo musical |
| **Evento** | Evento principal com nome, data, local e capacidade total |
| **Show** | Apresentação dentro de um evento. Possui palco, horário e duração |
| **Compra** | Transação realizada por um cliente. Possui canal de vendas, data e valor |
| **Pagamento** | Registro do pagamento de uma compra. Possui valor, data e método |
| **Ingresso** | Acesso do cliente ao evento. Possui tipo, valor final e status |
| **Setor** | Área do evento (ex: pista, camarote). Possui capacidade e preço base |

---

## 🔗 Relacionamentos

| Relacionamento | Entidades | Descrição |
|---|---|---|
| **Realiza** | Cliente → Compra | Um cliente pode realizar uma ou várias compras |
| **Gera** | Compra → Pagamento | Uma compra gera um pagamento correspondente |
| **Contém** | Compra → Ingresso | Uma compra pode conter um ou mais ingressos |
| **Participa** | Cliente ↔ Show | Cliente participa de um show (possui data de presença e avaliação) |
| **Apresenta** | Artista → Show | Um artista realiza uma apresentação |
| **Inclui** | Evento → Show | Um evento pode incluir vários shows |
| **Possui** | Evento → Setor | Um evento pode possuir diferentes setores |
| **Categoriza** | Ingresso → Setor | Cada ingresso pertence a um setor específico |

---

## 📐 Modelos

### Diagrama Entidade-Relacionamento (DER)
[Visualizar DER](https://drive.google.com/file/d/152lojgkbuW4BVeknPOOt3s3o1U4ft3U4/view?usp=sharing)

### Modelo Relacional
[Visualizar Modelo Relacional](https://drive.google.com/file/d/1fXUf9SFv86q-qdfCK2l5Z9VbQEXh3Obx/view?usp=sharing)

---

## 🧱 Estrutura do Banco de Dados

```sql
Pessoa (ID_pessoa, nome, email, telefone, rua, numero, cidade, cep)
Cliente (ID_pessoa FK, cpf, data_cadastro)
Artista (ID_pessoa FK, nome_artistico, estilo_musical)
Evento (ID_evento, nome, data, local, capacidade_total)
Show (ID_show, palco, horario_inicio, duracao, ID_evento FK)
Setor (ID_setor, nome_setor, capacidade, preco_base, ID_evento FK)
Compra (ID_compra, canal_vendas, data_compra, valor_compra, ID_pessoa FK)
Pagamento (ID_pagamento, valor_pago, data_pagamento, metodo, status, ID_compra FK)
Ingresso (ID_ingresso, tipo, valor_final, status, ID_compra FK, ID_setor FK)
Apresenta (ID_show FK, ID_pessoa FK)
Participa (ID_evento FK, ID_pessoa FK, data_presenca, avaliacao)
```

---

## 🛠️ Tecnologias Utilizadas

- Modelagem Entidade-Relacionamento (ER)
- Modelo Relacional
- SQL
- PostgreSQL — banco de dados relacional utilizado para implementação

---

## 👩‍💻 Autora

**Ana Carolina Salles**  
Estudante de Ciência de Dados e IA — Centro Universitário FEI  
[LinkedIn](https://www.linkedin.com/in/ana-carolina-salles-965458314/) · [GitHub](https://github.com/anacarolinacsalles)
