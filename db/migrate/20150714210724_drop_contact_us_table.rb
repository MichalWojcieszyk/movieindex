class DropContactUsTable < ActiveRecord::Migration
  def up
  	drop_table :contact_us
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
