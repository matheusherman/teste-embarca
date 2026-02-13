class User < ApplicationRecord
  #relacionamentos
  has_many :books, dependent: :destroy
end
