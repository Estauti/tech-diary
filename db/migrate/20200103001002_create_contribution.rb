class CreateContribution < ActiveRecord::Migration[6.0]
  def change
    create_table :contributions do |t|
      t.references :discovery, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
