require 'jekyll/scholar'

module Jekyll
  class Scholar
    # Ruby's sort is not stable: equal years can change order across platforms.
    # Keep Scholar's configured ordering, then preserve the BibTeX source order.
    module StableBibliographySort
      def sort(unsorted)
        return super if skip_sort?

        unsorted.each_with_index.sort do |(left, left_index), (right, right_index)|
          comparison = sort_keys.map.with_index do |key, index|
            left_value = left[key] || BibTeX::Value.new
            right_value = right[key] || BibTeX::Value.new
            if (sort_order[index] || sort_order.last) =~ /^(desc|reverse)/i
              right_value <=> left_value
            else
              left_value <=> right_value
            end
          end.find { |value| value != 0 } || 0

          comparison.zero? ? left_index <=> right_index : comparison
        end.map(&:first)
      end
    end

    Utilities.prepend(StableBibliographySort)
  end
end
