class CreateRepositories < ActiveRecord::Migration[6.1]
  def change
    create_table :repositories do |t|
      t.json :repositorie
      t.references :user, null: false, foreign_key: true
      t.integer :id_repo

      t.timestamps
    end
  end
end
