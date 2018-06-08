class CreateTaskapps < ActiveRecord::Migration[5.0]
  def change
    create_table :taskapps do |t|
      t.string :content, :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
