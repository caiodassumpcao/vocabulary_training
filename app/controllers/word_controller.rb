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
      flash[:confirmation_message] = "Parabéns! Sua resposta está correta."
    else
      flash[:alert] = "Resposta incorreta. Tente novamente."
    end

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("flash_messages", partial: "shared/flash_messages") }
      format.html { redirect_to root_path }
    end
  end
  private

  def user_answer_params
    params.require(:user_answer).permit(:answer, :word_id)
  end
end
