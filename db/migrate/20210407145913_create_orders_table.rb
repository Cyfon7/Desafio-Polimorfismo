class CreateOrdersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :number
      t.decimal :total
      t.string :state
      t.references :user, foreign_key: true

      t.timestamp
    end

    add_reference :payments, :order, index: true
  end

end
