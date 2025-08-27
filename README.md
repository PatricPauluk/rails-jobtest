# Rails JobTest

Esta é uma aplicação Ruby on Rails de exemplo que demonstra o uso de jobs assíncronos com Sidekiq. Você insere seu nome e ele "simula" como se fosse enviar um email.

## Requisitos

- Ruby (ver versão em `.ruby-version`)
- Redis (para processamento dos jobs com Sidekiq)
- Docker (opcional, para facilitar o setup)
- Sidekiq

## Instalação

1. Instale as dependências:
   ```sh
   bundle install
   ```

2. Inicie o Redis:
   ```sh
   redis-server
   ```

3. Inicie o Sidekiq:
   ```sh
   bundle exec sidekiq
   ```

4. Inicie o servidor Rails:
   ```sh
   rails server
   ```

## Funcionalidades

- Ao criar um usuário, um job é enfileirado para enviar um e-mail de boas-vindas (simulado).
- O job [`WelcomeEmailJob`](app/sidekiq/welcome_email_job.rb) é responsável por simular o envio do e-mail.

## Estrutura

- Controlador: [`UsersController`](app/controllers/users_controller.rb)
- Job Sidekiq: [`WelcomeEmailJob`](app/sidekiq/welcome_email_job.rb)
- View de cadastro: [`new.html.erb`](app/views/users/new.html.erb)

## Como funciona

1. O usuário acessa a página de cadastro ([`new.html.erb`](app/views/users/new.html.erb)).
2. Ao submeter o formulário, o controlador [`UsersController`](app/controllers/users_controller.rb) cria o usuário e enfileira o job.
3. O job [`WelcomeEmailJob`](app/sidekiq/welcome_email_job.rb) simula o envio do e-mail.

## Observações

- O envio de e-mail é apenas simulado com `puts` e `sleep`.
- Certifique-se de que o Redis está rodando antes de iniciar o Sidekiq.

## Licença

Este projeto é apenas para fins de demonstração.