class Skill < ActiveRecord::Base

  validates :name, :context, presence: true
  validates :name, :context, uniqueness: true

  has_many :skill_users
  has_many :users, through: :skill_users

  def user_with_proficiency(level)
    self.skill_users.where(proficiency: level).first.user
  end
end
