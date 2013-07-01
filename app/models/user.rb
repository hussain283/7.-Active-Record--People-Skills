class User < ActiveRecord::Base

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, :format => { :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/, :message => "Invalid Email" }

  has_many :skill_users
  has_many :skills, through: :skill_users

  def proficiency_for(skill)
    skill_user = self.skill_users.where(skill_id: skill.id).first
    skill_user.blank? ? 0 : skill_user.proficiency
  end

  def set_proficiency_for(skill,level)
    skill_user = self.skill_users.where(skill_id: skill.id).first
    skill_user.update_attributes(proficiency: level)
  end
end
