class AddVariousMissingFieldsOnPlantCountings < ActiveRecord::Migration
  def change
    add_column :plant_countings, :number, :string
  end
end
