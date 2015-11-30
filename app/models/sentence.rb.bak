class Sentence <ActiveRecord::Base
  belongs_to :chapter

  def max_length 
    [hebrow ? hebrow.gsub(/[^א-ת,.\ ]/, '').length : 0, aramic ? aramic.gsub(/[^א-ת,.\ ]/, '').length : 0, arabic ? arabic.length : 0].max
  end
end