 class Portion <ActiveRecord::Base
  include Sluggable
  sluggable_column :english_name
 
  def self.all_ordered
    Portion.where(book: 'genesis').order(:first_sentence_id) + Portion.where(book: 'exodus').order(:first_sentence_id)
  end

  def ordered_sentences
    first_sentence = Sentence.find(first_sentence_id)
    last_sentence = Sentence.find(last_sentence_id)
    if first_sentence.chapter != last_sentence.chapter
      sentences = first_sentence.chapter.ordered_sentences[first_sentence.order-1..0]
      chapter = first_sentence.chapter.next
      while chapter != last_sentence.chapter
        sentences += chapter.ordered_sentences
        chapter = chapter.next
      end
      sentences += last_sentence.chapter.ordered_sentences[0..last_sentence.order-1]
    else
      sentences = first_sentence.chapter.ordered_sentences[first_sentence.order-1..last_sentence.order-1]
    end
    return sentences
  end

  def next
    Portion.first
    #Portion.where(book: book).where(order: order + 1).first || 
      #((book == 'genesis') ? Chapter.where(book: 'exodus').where(order: 1).first : Chapter.where(book: 'genesis').where(order: 1).first) 
  end

  def prev
    Portion.first
    #Chapter.where(book: book).where(order: order - 1).first || 
    #((book == 'genesis') ? Chapter.where(book: 'exodus').where(order: 40).first : Chapter.where(book: 'genesis').where(order: 50).first) 
  end

  def self.book_chapters(book)
    Chapter.where(book: book).order(:order)
  end

end