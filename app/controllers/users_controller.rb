class UsersController < ApplicationController
  def new
  end

  def create
    # Simula a criação de um usuário
    user_name = params[:user][:name]

    # Chamada do Sidekiq Job para enviar o e-mail de boas-vindas (essa linha envia o Job para o Redis)
    WelcomeEmailJob.perform_later(user_name)

    flash[:notice] = "Usuário criado com sucesso! Um e-mail de boas-vindas será enviado em breve."
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
