class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.belongs_to :follower
      t.belongs_to :followed_person

      t.timestamps
    end
  end
end
