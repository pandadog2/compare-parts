class PartName < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'SM_OUTER' },
    { id: 3, name: 'SM_INNER' },
    { id: 4, name: 'ROOF' },
    { id: 5, name: 'RI' },
    { id: 6, name: 'WH' },
    { id: 7, name: 'LWRBACK' },
    { id: 8, name: 'APRON' }
  ]

  include ActiveHash::Associations
  has_many :parts
  
end
