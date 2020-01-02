class CreateDiscoveries < ActiveRecord::Migration[6.0]
  def change
    create_table :discoveries do |t|
      t.text :text, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
