class AddPlatformRefToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :platform, null: false, foreign_key: true
  end
end
