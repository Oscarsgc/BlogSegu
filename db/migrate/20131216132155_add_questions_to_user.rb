class AddQuestionsToUser < ActiveRecord::Migration
  def change
    add_column :users, :AQuestion, :text
    add_column :users, :BQuestion, :text
    add_column :users, :Cquestion, :text
  end
end
