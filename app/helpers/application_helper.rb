module ApplicationHelper
    def environment_rails
        if Rails.env.development?
            "Development"
        elsif Rais.env.production?
            "Production"
        else
            "test"
        end
    end
end
