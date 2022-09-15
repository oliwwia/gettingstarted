class NoNullInDateColumnInArticlesTable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :articles, :date, false
  end
end
