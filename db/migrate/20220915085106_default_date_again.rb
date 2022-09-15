class DefaultDateAgain < ActiveRecord::Migration[7.0]
  def change
    change_column_default :articles, :date, from: nil, to: Date.new(1999,9,9)
  end
end
