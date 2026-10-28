require 'minitest/autorun'
require 'jekyll/scholar'

plugin = File.expand_path('../_plugins/stable-bibliography-sort.rb', __dir__)
require plugin if File.file?(plugin)

class BibliographySortTest < Minitest::Test
  def sorter(sort_by = 'year', order = 'descending')
    Object.new.extend(Jekyll::Scholar::Utilities).tap do |instance|
      instance.instance_variable_set(:@config, 'sort_by' => sort_by, 'order' => order)
    end
  end

  def entries
    BibTeX::Bibliography.parse(<<~BIB).entries.values
      @article{psl, year={2024}, title={PSL}}
      @article{slk, year={2025}, title={SL@K}}
      @article{kl, year={2026}, title={KL-MOPD}}
      @article{astar, year={2026}, title={Astar}}
      @article{sprint, year={2026}, title={SPRINT}}
      @article{bear, year={2026}, title={BEAR}}
      @article{talos, year={2026}, title={Talos}}
    BIB
  end

  def test_year_descending_preserves_source_order_within_a_year
    assert_equal %w[kl astar sprint bear talos slk psl], sorter.sort(entries).map(&:key)
  end

  def test_configured_secondary_sort_still_applies
    assert_equal %w[astar bear kl sprint talos slk psl],
                 sorter(%w[year title], %w[descending ascending]).sort(entries).map(&:key)
  end

  def test_sort_none_preserves_input_order
    input = entries
    assert_same input, sorter('none').sort(input)
  end

  def test_cited_in_order_preserves_input_order
    instance = sorter
    instance.instance_variable_set(:@skip_sort, true)
    input = entries.reverse
    assert_same input, instance.sort(input)
  end
end
