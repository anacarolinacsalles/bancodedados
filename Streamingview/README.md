# 🎬 FEItv - StreamingView

Plataforma de informações sobre vídeos como filmes e séries, desenvolvida em Python com persistência de dados em arquivos .txt. Inspirada em plataformas de streaming como YouTube e Netflix.

**Autora:** Ana Carolina Salles  
**Disciplina:** CCP110 – Fundamentos de Algoritmos  
**Instituição:** Centro Universitário FEI

---

## 📋 Descrição

O FEItv permite que usuários cadastrados busquem informações sobre vídeos, curtam conteúdos e gerenciem listas de favoritos personalizadas. Todos os dados são persistidos em arquivos `.txt`, garantindo que nenhuma informação seja perdida ao encerrar o programa.

---

## ⚙️ Funcionalidades

### 👤 Usuário
- Cadastro de novo usuário com verificação de duplicatas
- Login com validação de credenciais
- Busca de vídeo por nome (case-insensitive)
- Curtir e descurtir vídeos
- Gerenciamento de favoritos:
  - Criar, visualizar, renomear e excluir listas
  - Adicionar e remover vídeos de uma lista

---

## 🗂️ Estrutura do Projeto

```
📦 feitv
 ┣ 📄 feitv.py          — código principal do sistema
 ┣ 📄 usuarios.txt      — dados dos usuários cadastrados
 ┣ 📄 videos.txt        — catálogo de vídeos disponíveis
 ┣ 📄 curtidas.txt      — registro de curtidas por usuário
 ┣ 📄 favoritos.txt     — listas de favoritos por usuário
 ┗ 📄 README.md
```

---

## 📁 Formato dos Arquivos

Os dados são armazenados separados por `|`:

```
usuarios.txt  → Ana Carolina|1234
videos.txt    → 1|Vincenzo|Suspense|2021|Um advogado mafioso retorna à Coreia.
curtidas.txt  → Ana Carolina|2
favoritos.txt → Ana Carolina|doramas|2,5
```

---

## 🛠️ Tecnologias Utilizadas

- Python 3
- Arquivos .txt para persistência de dados
- Módulo `os` para verificação e criação de arquivos

---

## 🚀 Como Executar

1. Clone o repositório:
```bash
git clone https://github.com/anacarolinacsalles/feitv.git
```
2. Acesse a pasta do projeto:
```bash
cd feitv
```
3. Execute o programa:
```bash
python feitv.py
```
Os arquivos `.txt` serão criados automaticamente na primeira execução. 😊
---

## 🎬 Vídeos de Exemplo

O sistema já inicia com 5 vídeos pré-cadastrados:

| ID | Título | Gênero | Ano |
|---|---|---|---|
| 1 | Pretendente Surpresa | Romance | 2024 |
| 2 | Vincenzo | Suspense | 2021 |
| 3 | Startup | Drama | 2020 |
| 4 | O Jogo da Imitação | Guerra | 2015 |
| 5 | Holo Meu Amor | Romance | 2020 |

---

## Resultado_Terminal:
Código rodando perfeitamente no terminal. E prints dos dados cadastrados e inseridos.

## 👩‍💻 Autora

**Ana Carolina Salles**  
Estudante de Ciência de Dados e IA — Centro Universitário FEI  
[LinkedIn](https://www.linkedin.com/in/ana-carolina-salles-965458314/) · [GitHub](https://github.com/anacarolinacsalles)
