class ChangeDoneDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :todos, :done, from: nil, to: 'false'
  end
end
