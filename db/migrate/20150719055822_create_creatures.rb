class CreateCreatures < ActiveRecord::Migration
  def change
    create_table :creatures do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end

=begin

{:id => false} will not create a primary key in our database

TABLE COLUMN TYPES

binary
boolean (BOOLEAN in squl)
date (DATE in sql)
datetime
decimal
float
integer (INT in sql)
string (VARCHAR in sql)
text (TEXT in sql)
time

=end