class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.belongs_to :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end
