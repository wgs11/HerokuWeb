module HerosHelper
  def increment_unlocks(hero)
    hero.increment!(:unlocks)
  end

  def get_unlocks(heros)
    have = 0
    heros.each do |hero|
      have = have + hero.unlocks
    end
    return have
  end

  def get_totals(heros)
    all = 0
    heros.each do |hero|
      all = all + hero.total
    end
    return all
  end

  def ratio(hero)
    begin
      ratio = Float(hero.unlocks) / Float(hero.total)
      return (ratio * 100).round
    rescue ActionView::TemplateError:: (NaN)
      return 50
    end
  end

  def get_ratio(heros)
    all = 0
    have = 0
    begin
      heros.each do |hero|
        all = all + hero.total
        have = have + hero.unlocks
      end
      ratio = Float(have) / Float(all)
      return (ratio * 100).round
    rescue ActionView::TemplateError:: (NaN)
      return 50
    end
  end
end