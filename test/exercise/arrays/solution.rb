module Exercise
  module Arrays
    class << self
      def replace(array)
        max_element = find_maximum(array)
        array.map do |element|
          element.positive? ? max_element : element
        end
      end

      def find_maximum(array)
        max_element = array[0]
        array.each do |element|
          max_element = element if element > max_element
        end
        max_element
      end

      def search(array, query, low_index = 0, high_index = array.size - 1)
        return -1 if low_index > high_index || (query < array[low_index] || query > array[high_index])

        middle_index = (low_index + high_index) / 2
        return middle_index if query == array[middle_index]

        query < array[middle_index] ? search(array, query, low_index, middle_index - 1) : search(array, query, middle_index + 1, high_index)
      end
    end
  end
end
