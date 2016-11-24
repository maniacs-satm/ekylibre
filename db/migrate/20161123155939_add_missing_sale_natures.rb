class AddMissingSaleNatures < ActiveRecord::Migration
  def change
    # Create missing sale nature 
    execute 'INSERT INTO sale_natures (active, catalog_id)'

    # Use existing sale nature to define it on missing sale
    execute 'UPDATE sales SET nature_id = sn.id FROM sale_natures AS sn WHERE sn.by_default AND COALESCE(s.nature_id, 0) NOT IN (SELECT id FROM sale_natures)'

    # Force presence of nature_id
    change_column_null :sales, :nature_id, false
  end
end
