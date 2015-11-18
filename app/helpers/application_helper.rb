module ApplicationHelper

  def calculate_sentence_height(sentence)
    if sentence.max_length < 40
      'one-line'
    elsif sentence.max_length < 80
      'two-lines'
    else
      'three-lines'
    end
  end

  def display_book_name(book, language)
    case book
      when 'genesis'
        case language
          when 'he'
            return 'בראשית'
          when 'ar'
            return 'وفصل'
          when 'en'
            return 'Genesis'          
        end
      when 'Exodus'
        case language
          when 'he'
            return 'שמות'
          when 'ar'
            return 'وفصل'
          when 'en'
            return 'Exodus'          
        end
    end
  end
end
