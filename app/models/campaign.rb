class Campaign < ActiveRecord::Base
  attr_accessible :info, :time_end, :time_start

  validates :info, :time_end, :time_start, :presence => {:message => 'can\'t be blank'}
end
