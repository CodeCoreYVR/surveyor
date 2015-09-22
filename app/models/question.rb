class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, reject_if:     :all_blank,
                                          allow_destroy: true

  validates :answers, presence: true

  validate :has_at_least_two_answers

  private

  def has_at_least_two_answers
    errors.add(:base, "Must have at least two answers") if answers.size < 2
  end

end
