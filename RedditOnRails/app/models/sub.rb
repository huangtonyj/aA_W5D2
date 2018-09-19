# == Schema Information
#
# Table name: subs
#
#  id           :bigint(8)        not null, primary key
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  description  :text             not null
#  moderator_id :integer          not null
#

class Sub < ApplicationRecord

  validates :title, :description, uniqueness: true, presence: true

  belongs_to :moderator,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: :User

  has_many :sp_interfaces,
    primary_key: :id,
    foreign_key: :sub_id,
    class_name: :SpInterface

  has_many :posts,
    through: :sp_interfaces,
    source: :post

end
