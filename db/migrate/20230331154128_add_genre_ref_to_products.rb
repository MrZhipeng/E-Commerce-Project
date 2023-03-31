class AddGenreRefToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :genre, null: false, foreign_key: true
  end
end
