# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  content    :text             not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  vote_tally :integer          default(0), not null
#  url        :string
#

class Post < ApplicationRecord

  validates :title, :content, :author_id, presence: true

  has_many :sp_interfaces,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :SpInterface,
    inverse_of: :post

  has_many :subs,
    through: :sp_interfaces,
    source: :sub

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  has_many :votes,
    as: :votable

end
