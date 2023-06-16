module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return to_enum unless block_given?
        return self if size.zero?

        block.call(first)
        self.class.new(self[1..]).my_each(&block)
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        return to_enum unless block_given?

        my_reduce(self.class.new) { |acc, element| acc << block.call(element) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(self.class.new) { |acc, element| element.nil? ? acc : acc << element }
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        return acc if size.zero?

        acc = acc.nil? ? first : block.call(acc, first)
        self.class.new(self[1..]).my_reduce(acc, &block)
      end
    end
  end
end
