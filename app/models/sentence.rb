class Sentence <ActiveRecord::Base
  belongs_to :chapter

  def max_length 
    [hebrow ? hebrow.gsub(/[^א-ת,.\ ]/, '').length : 0, aramic ? aramic.gsub(/[^א-ת,.\ ]/, '').length : 0, arabic ? arabic.length : 0].max
  end

  def self.get_sentence(book,chapter_order,order)
    chapter = Chapter.where(book: book).where(order: chapter_order).first
    if chapter
      Sentence.where(chapter_id: chapter.id).where(order: order).first
    else
      nil
    end
  end 

end