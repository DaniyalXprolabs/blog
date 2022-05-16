class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.string :article
      t.string :refrences

      t.timestamps
    end
  end
end
