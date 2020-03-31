module ApplicationHelper

    def locale
        I18n.locale == :en ? "English" : "Português do Brasil"
    end

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
