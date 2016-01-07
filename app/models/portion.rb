 class Portion <ActiveRecord::Base
  include Sluggable
  sluggable_column :english_name
 
  def self.all_ordered
    Portion.where(book: 'genesis').order(:first_sentence_id) + Portion.where(book: 'exodus').order(:first_sentence_id)
  end

  def ordered_sentences
    first_sentence = Sentence.find(first_sentence_id)
    last_sentence = Sentence.find(last_sentence_id)
    sentences = [{}]
    if first_sentence.chapter != last_sentence.chapter
      i=0
      sentences[i]["order"] = first_sentence.chapter.order 
      sentences[i]["sentences"] = first_sentence.chapter.ordered_sentences[first_sentence.order-1..0]
      chapter = first_sentence.chapter.next
      while chapter != last_sentence.chapter
        i = i+1
        sentences[i]["order"] = chapter.order 
        sentences[i]["sentences"] = chapter.ordered_sentences
        chapter = chapter.next
      end
      i = i+1
      sentences[i]["order"] = last_sentence.chapter.order
      sentences[i]["sentences"] = last_sentence.chapter.ordered_sentences[0..last_sentence.order-1]
    else
      sentences[0]["order"] = first_sentence.chapter.order
      sentences[0]["sentences"] = first_sentence.chapter.ordered_sentences[first_sentence.order-1..last_sentence.order-1]
    end
    return sentences
  end

  def next
    index = Portion.all_ordered.find_index(self)
    Portion.all_ordered[index+1] || Portion.all_ordered.first
    
  end

  def prev
    index = Portion.all_ordered.find_index(self)
    Portion.all_ordered[index-1] || Portion.all_ordered.last
  end

  def self.book_chapters(book)
    Chapter.where(book: book).order(:order)
  end

end