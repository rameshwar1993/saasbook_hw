class AddIndices < ActiveRecord::Migration
  def change
    add_index :reviews, :movie_id, :name => "movie_id_ix"
    add_index :reviews, :moviegoer_id, :name => "moviegoer_id_ix"
  end
end
