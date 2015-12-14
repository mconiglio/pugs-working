class Users::RegistrationsController < Devise::RegistrationsController
    def created
        super
        @result = Geocoder.search(resource.current_sign_in_ip).first
        resource.location = [@result.city, @result.state].compact.join(', ')
    end
    
end