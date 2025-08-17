class WelcomeEmailJob
  include Sidekiq::Job

  def perform(user_name)
    puts "Iniciando o envio de e-mail para #{user_name}..."
    sleep 5
    puts "E-mail de boas-vindas enviado para #{user_name} com sucesso!"
  end
end
