module Exercise
  module Arrays
    class << self
      def replace(array)
        max_element = array[0]
        1.upto(array.length - 1) do |i|
          max_element = array[i] if array[i] > max_element
        end
        array.map do |element|
          element.positive? ? max_element : element
        end
      end

      def search(array, query, low_index = 0, high_index = array.size - 1)
        return -1 if low_index > high_index

        middle_index = (low_index + high_index) / 2
        return middle_index if query == array[middle_index]

        if query < array[middle_index]
          search(array, query, low_index, middle_index - 1)
        else
          search(array, query, middle_index + 1, high_index)
        end
      end
    end
  end
end
