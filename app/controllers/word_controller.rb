class WordController < ApplicationController
  def index
    @words = Word.all
    @random_word = Word.order("RANDOM()").first
    @user_answer = UserAnswer.new
    @confirmation_message = flash[:confirmation_message]
  end

  def check_answer
    @user_answer = UserAnswer.new(user_answer_params)

    if @user_answer.save && @user_answer.correct_translation?
      flash[:notice] = "Resposta correta! Parabéns!"
    else
      flash[:alert] = "Resposta incorreta. Tente novamente."
    end

    redirect_to root_path
  end

  private

  def user_answer_params
    params.require(:user_answer).permit(:answer, :word_id)
  end
end
