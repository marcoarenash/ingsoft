class Proyect < ActiveRecord::Base
  has_many :bmcs, dependent: :destroy
  has_many :pvs, dependent: :destroy
  has_many :tvs, dependent: :destroy
  belongs_to :user

  validates :titulo, :presence => {:message => "Usted debe ingresar un título"}, length: {minimum: 2, maximum: 50, :message => "El título debe tener entre 2 y 50 caracteres"}
  validates :descripcion, :presence => {:message => "Usted debe ingresar una descripción"}, length: {minimum: 2, maximum: 4000, :message => "La descripción debe tener entre 2 y 4000 caracteres"}
end
