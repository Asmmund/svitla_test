require 'spec_helper'

describe Campaign do
   it { should validate_presence_of( :info ) }
   it { should validate_presence_of( :time_end ) }
   it { should validate_presence_of( :time_start ) }
end
