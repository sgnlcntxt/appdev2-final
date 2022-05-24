class CreateHatches < ActiveRecord::Migration[6.0]
  def change
    create_table :hatches do |t|
      t.integer :bug_id
      t.date :start_date
      t.string :end_date
      t.integer :waterbody_id
      t.string :minimum_size
      t.string :maximum_size

      t.timestamps
    end
  end
end
