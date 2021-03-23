class Order < ApplicationRecord
  has_one :record_address
  has_one :address
  
end
