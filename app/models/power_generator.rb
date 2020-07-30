class PowerGenerator < ApplicationRecord
  #before_commit :calculate_cubed_weight!
  has_many :freights
  validates :name, :description, :image_url, :manufacturer, :price, :kwp, presence: true
  validates :height, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 40 }
  validates :width, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :lenght, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 200 }
  validates :weight, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 3000 }

  scope :search, ->(query) { where('name LIKE ?', "%#{query.upcase}%")
                                .or(where(structure_type: query))
                                .or(where(manufacturer: query.upcase)) }

  # enum structure_type: %i[ #Nao vejo necessidade de enum por enquanto,
  #   metalico                estrutura do gerador nao muda.  
  #   ceramico
  #   fibrocimento
  #   laje
  #   solo
  #   trapezoidal
  # ]

  def calculate_cubed_weight
    self.cubed_weight = lenght * width * height * 300
  end
  
end
