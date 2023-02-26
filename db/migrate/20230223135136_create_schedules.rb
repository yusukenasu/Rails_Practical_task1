class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.datetime :startday
      t.datetime :endday
      t.boolean :allday
      t.string :memo

      t.timestamps
    end
  end
end
