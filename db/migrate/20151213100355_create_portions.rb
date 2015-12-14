class CreatePortions < ActiveRecord::Migration
  def change
    create_table :portions do |t|
      t.text :hebrow_name
      t.text :arabic_name
      t.text :english_name 
      t.text :meaning     
      t.integer :first_sentence_id
      t.integer :last_sentence_id
      t.string :book
      t.string :slug
    end
  end
end
