class AdvancedSearch < ApplicationRecord
  def search_generators

    power_generators = PowerGenerator.all

    power_generators = power_generators.where(["name LIKE?", "%#{keywords}%"]) if keywords.present?
    power_generators = power_generators.where(["structure_type LIKE ?",structure_type]) if structure_type.present?
    power_generators = power_generators.where(["manufacturer LIKE ?",manufacturer]) if manufacturer.present?
    power_generators = power_generators.where(["price >= ?", min_price]) if min_price.present?
    power_generators = power_generators.where(["price <= ?", max_price]) if max_price.present?
    power_generators = power_generators.where(["kwp = ?", kwp]) if kwp.present?

    return power_generators
  end
end
