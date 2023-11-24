class UserAnswer < ApplicationRecord
  belongs_to :word

  validates :answer, presence: true

  before_validation :downcase_and_strip_answer

  def correct_translation?
    return false if word.blank?

    normalized_user_answer = normalize_string(answer)
    normalized_correct_answer = normalize_string(word.translate)

    normalized_user_answer == normalized_correct_answer
  end

  private

  def downcase_and_strip_answer
    self.answer = answer.downcase.strip if answer.present?
  end

  def normalize_string(str)
    str.downcase.strip if str.present?
  end
end