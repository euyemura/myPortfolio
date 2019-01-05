class ApplicationController < ActionController::Base
    include DeviseWhitelist

end
# the controller that all of our controllers are going to inherit from
