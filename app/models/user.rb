class User < ApplicationRecord
  has_many :wishes

  before_validation :downcase_email

  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
