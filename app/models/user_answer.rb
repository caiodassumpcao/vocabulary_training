class UserAnswer < ApplicationRecord
  belongs_to :word

  validates :answer, presence: true

  before_validation :normalize_answer

  validate :correct_translation

  private

  def normalize_answer
    self.answer = answer.to_s.downcase.strip
  end

  def correct_translation
    return unless answer.present? && word.present?

    normalized_user_answer = normalize_string(answer)
    normalized_correct_answer = normalize_string(word.translate)

    errors.add(:answer, "não está correta") unless normalized_user_answer == normalized_correct_answer
  end

  def normalize_string(str)
    str.to_s.downcase.strip
  end
end
