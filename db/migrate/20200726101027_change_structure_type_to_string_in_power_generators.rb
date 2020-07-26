class ChangeStructureTypeToStringInPowerGenerators < ActiveRecord::Migration[5.2]
  def change
    change_column :power_generators, :structure_type, :string
  end
end
