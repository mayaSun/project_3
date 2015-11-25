 class Chapter <ActiveRecord::Base
  include Sluggable
  sluggable_column :sluggable
 
  has_many :sentences

  def sluggable
    book + '-' + order.to_s
  end

  def set_sentences(params = {})
    set_sentence_language('hebrow', params[:hebrow])
    set_sentence_language('aramic', params[:aramic])
    set_sentence_language('arabic', params[:arabic])
    set_sentence_language('english', params[:english])
  end

  def set_sentence_language(language, text)
    order = 1
    text.split(%r{[1-9]{1}.}).each do |sentence|
      if sentence.length > 5
        db_sentence = Sentence.where(chapter_id: id).where(order: order).first
        if !db_sentence
          Sentence.create(chapter_id: id, order: order , language.to_sym => sentence)
        else
          db_sentence.update(language.to_sym => sentence)
        end
        order = order + 1
      end
    end
  end

  def self.all_ordered
    Chapter.where(book: 'genesis').order(:order) + Chapter.where(book: 'exudos').order(:order)
  end

  def ordered_sentences
    sentences.order(:order)
  end

  def next
    Chapter.where(book: book).where(order: order + 1).first || 
      ((book == 'genesis') ? Chapter.where(book: 'exudos').where(order: 1).first : Chapter.where(book: 'genesis').where(order: 1).first) 
  end

  def prev
    Chapter.where(book: book).where(order: order - 1).first || 
    ((book == 'genesis') ? Chapter.where(book: 'exudos').where(order: 40).first : Chapter.where(book: 'genesis').where(order: 50).first) 
  end


end