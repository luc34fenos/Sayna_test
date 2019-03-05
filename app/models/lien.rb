class Lien < ApplicationRecord
  	
  	belongs_to :liste
  	belongs_to :student
  	
end
