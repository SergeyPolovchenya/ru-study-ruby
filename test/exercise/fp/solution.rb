module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        sorted_array = array.map do |film|
          film if film['country'].to_s.split(',').size >= 2 && film['rating_kinopoisk'].to_f.positive?
        end

        sorted_array.compact!
        sorted_array.reduce(0) { |sum, film| sum + film['rating_kinopoisk'].to_f } / sorted_array.size
      end

      def chars_count(films, threshold)
        sorted_array = films.map do |film|
          film if film['rating_kinopoisk'].to_f >= threshold
        end

        sorted_array.compact!
        sorted_array.reduce(0) { |sum, film| sum + film['name'].count('и') }
      end
    end
  end
end
