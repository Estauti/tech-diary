class Discovery < ApplicationRecord
  MAX_CHARACTERS = 150.freeze
  
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates_presence_of :text
  validates_length_of :text, within: 1..MAX_CHARACTERS
end
