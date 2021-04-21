class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :name
      t.string :url
      t.references :imageable, polymorphic: true

      t.timestamps
    end

    #create_table :digitals do |t|
    #  t.timestamps
    #end

    #create_table :physicals do |t|
    #  t.timestamps
    #end
  end
end
