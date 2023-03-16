require './decorator'

class Capitalize_Decorator < Decorator

    def correct_name
        @nameable.correct_name.capitalize
    end
end