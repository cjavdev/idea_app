# == Schema Information
#
# Table name: ideas
#
#  id          :integer          not null, primary key
#  description :text             not null
#  author_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Idea < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
end
