class AddGenreToPerformer < ActiveRecord::Migration[5.2]
  def change
    add_reference :performers, :genres, foreign_key: true
    add_reference :genres, :performers, foreign_key: true
  end
end
