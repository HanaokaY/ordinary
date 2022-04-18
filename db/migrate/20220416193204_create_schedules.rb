class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :name
      t.text :text
      t.date :date

      t.timestamps
    end
  end
end
