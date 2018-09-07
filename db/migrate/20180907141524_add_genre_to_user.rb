class AddGenreToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :genres, :user, foreign_key: true
  end
end
