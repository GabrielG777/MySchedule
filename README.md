
---

# My Schedule - App de Tarefas em Flutter

Esse é um aplicativo simples feito para um teste, desenvolvido em Flutter. O objetivo principal foi mostrar um pouco do meu conhecimento com Flutter, utilizando algumas boas práticas e bibliotecas que gosto.

---

## Tecnologias e Bibliotecas

* Flutter
* Provider (para gerenciamento de estado)
* Intl (para formatação de datas e horas)
* flutter\_lints (para garantir um padrão de código limpo)

---

## Estrutura do Projeto

```
lib
├── controller
│   ├── task_controller.dart
│   └── theme_controller.dart
├── models
│   └── task.dart
├── pages
│   ├── pages_internas
│   │   └── add_task_page.dart
│   ├── dashBoard_page.dart
│   └── inicial_page.dart
├── utils
│   ├── app_controller.dart
│   └── app_theme.dart
└── main.dart
```

Eu costumo usar uma estrutura parecida em vários projetos no meu trabalho, que ajuda a organizar tudo direitinho.

---

## Funcionalidades do Aplicativo

* **Tela Inicial:** Apresenta uma mensagem de boas-vindas e um botão para acessar a Dashboard.
* **Dashboard:**

  * Possui um Drawer com opções: Home, Configurações e Logout.
  * Lista de tarefas ordenada por data e hora.
  * Botão para adicionar novas tarefas.
  * Botão para alternar entre tema claro e escuro.
  * Botão para excluir tarefas.
  * Ao clicar em uma tarefa, abre uma tela com os detalhes dela.
* **Adicionar Tarefa:**

  * Campos para nome e descrição da tarefa.
  * Seleção de data e hora para agendar a tarefa.

---

## Observações

* O projeto foi feito rapidamente, mas tentei expressar o máximo do meu conhecimento em Flutter.
* Para armazenar as tarefas, optei por manter tudo local e estático, sem usar banco de dados como SQLite (poderia ser uma alternativa futura).
* Usei a IA (ChatGPT) em pontos específicos para ajudar a construir algumas funcionalidades, especialmente a parte de gerenciamento local, pois estou acostumado com gerenciamento de dados em nuvem.
* Também usei a IA para ajudar a formatar esse README, inclusive!

---

## 🚀 Como rodar o projeto

### ▶️ Acessar pela Web (GitHub Pages)

Você pode testar o app diretamente pelo navegador, sem precisar instalar nada:

👉 [Clique aqui para acessar o app online](https://gabrielg777.github.io/MySchedule/)

---

### 💻 Rodar localmente

Caso queira rodar o projeto em sua máquina com Flutter:

1. Clone o repositório:

   ```bash
   git clone https://github.com/GabrielG777/MySchedule.git
   ```

2. Navegue até a pasta do projeto:

   ```bash
   cd nome-do-repositorio
   ```

3. Instale as dependências:

   ```bash
   flutter pub get
   ```

4. Rode o app:

   ```bash
   flutter run
   ```
---

## 🖼️ Imagens do App

### 🏠 Tela Inicial (`InicialPage`)

![InicialPage](image.png)

---

### 📊 Dashboard (`DashBoardPage`)

![Dashboard](image-1.png)

#### 📂 Drawer

![Drawer](image-2.png)

---

### ➕ Adicionar Tarefa (`AddTask`)

![AddTask](image-3.png)

#### 🕒 Selecionar Horário (`SelectTime`)

![SelectTime](image-4.png)

---

### 🌙 Modo Escuro com Tarefa

![Modo Escuro](image-5.png)

#### 📝 Pop-up de Descrição

![Pop-up](image-6.png)

---

### 📋 Tarefas Adicionais

![Tarefas Extras](image-7.png)

---

## Próximos passos

* Subir o projeto no GitHub Pages para demo online
* Implementar armazenamento local (SQLite ou Hive)
* Melhorar a UI e adicionar mais funcionalidades

---

Obrigado por conferir! Espero que tenha curtido.
Qualquer dúvida ou sugestão, só chamar. Até mais! (assim espero kkk)

---
