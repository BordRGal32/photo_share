class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.belongs_to :user
      t.belongs_to :photo

      t.timestamps
    end
  end
end
