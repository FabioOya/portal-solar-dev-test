class AddAttributesLongitudeLatitudeToFreight < ActiveRecord::Migration[5.2]
  def change
    add_column :freights, :longitude, :float
    add_column :freights, :latitude, :float
  end
end
