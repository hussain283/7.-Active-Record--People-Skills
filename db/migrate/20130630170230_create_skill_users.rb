class CreateSkillUsers < ActiveRecord::Migration
  def change

    create_table :skill_users do |t|
      t.integer :proficiency, default: 0
      t.references :user
      t.references :skill
    end
  end
end
