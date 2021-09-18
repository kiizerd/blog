# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :article

  validates :author, :body, presence: true
end
