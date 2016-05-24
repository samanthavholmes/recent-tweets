class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string     :text
      t.date       :date_tweeeted_on
      t.references :user

      t.timestamps null: false
    end
  end
end
