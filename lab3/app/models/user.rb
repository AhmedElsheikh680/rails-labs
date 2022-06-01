class User < ApplicationRecord
    has_secure_password
    has_many :posts
    validates :email , :name, presence: true
    validates :name , format: { with: /\A[a-z\s]+\Z/ , message: 'must be characters only'}
    validates :email , format: { with: /\A^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$\Z/ , message: 'invalid'}
    validates :email , uniqueness: true
    # validates :password, confirmation: true
end
