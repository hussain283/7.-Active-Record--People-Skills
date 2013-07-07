class User < ActiveRecord::Base

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, :format => { :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/, :message => "Invalid Email" }

  has_many :skill_users
  has_many :skills, through: :skill_users

  def proficiency_for(skill)
    self.skill_users.find_by_skill_id(skill.id).proficiency rescue 0
  end

  def set_proficiency_for(skill,level)
    self.skill_users.find_by_skill_id(skill.id).update_attributes(proficiency: level) rescue nil
  end
end
