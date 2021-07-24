class Material < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '材質A' },
    { id: 3, name: '材質B' },
    { id: 4, name: '材質C' },
    { id: 5, name: '材質D' },
    { id: 6, name: '材質E' },
    { id: 7, name: '材質F' },
    { id: 8, name: '材質G' }
  ]

  include ActiveHash::Associations
  has_many :parts
  
end
