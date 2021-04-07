class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :state
      t.decimal :total
      t.string :token
      t.string :type
      #t.references :paymentable, polymorphic: true

      t.timestamps
    end
  end
end
