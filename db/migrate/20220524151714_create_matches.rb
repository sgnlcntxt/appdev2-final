class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :fly_id
      t.integer :bug_id

      t.timestamps
    end
  end
end
