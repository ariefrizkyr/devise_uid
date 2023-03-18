class DeviseUidAddTo<%= table_name.camelize %> < ActiveRecord::Migration[<%= version %>]
  def change
    add_column :<%= table_name %>, :uid, :string
    add_index :<%= table_name %>, :uid, unique: true
  end
end
