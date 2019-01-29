class ApplicationController < ActionController::Base
    include DeviseWhitelist
    include SetSource
    include CurrentUserConcern

end
# the controller that all of our controllers are going to inherit from
