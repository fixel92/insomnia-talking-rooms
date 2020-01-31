class User < ApplicationRecord
  before_create :generate_nickname

  scope :is_online,  -> { where online: true }

  private

  def generate_nickname
    self.nickname = Faker::Name.first_name.downcase
  end
end
