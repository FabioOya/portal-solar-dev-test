class AddPowerGeneratorRefToFreights < ActiveRecord::Migration[5.2]
  def change
    add_reference :freights, :power_generator, foreign_key: true
  end
end
