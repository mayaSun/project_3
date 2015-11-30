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

  def calculate_sentence_height_download_2_version(sentence)
    if sentence.max_length < 60
      'one-line'
    elsif sentence.max_length < 120
      'two-lines'
    else
      'three-lines'
    end
  end

  def calculate_sentence_height_download_3_version(sentence)
    if sentence.max_length < 40
      'one-line'
    elsif sentence.max_length < 80
      'two-lines'
    else
      'three-lines'
    end
  end

  def calculate_sentence_height_download_4_version(sentence)
    if sentence.max_length < 30
      'one-line'
    elsif sentence.max_length < 60
      'two-lines'
    elsif sentence.max_length < 90
      'three-lines'
    else
      'four-lines'
    end
  end

  def is_english(language)
    if language == 'english'
      'english'
    else
      'not-english'
    end
  end

  def display_book_name(book, language)
    case book
      when 'genesis'
        case language
          when 'hebrow'
            return 'בראשית'
          when 'aramic'
            return 'בראשית'
          when 'arabic'
            return 'وفصل'
          when 'english'
            return 'Genesis'          
        end
      when 'exodus'
        case language
          when 'hebrow'
            return 'שמות'
          when 'aramic'  
            return 'שמות'
          when 'arabic'
            return 'وفصل'
          when 'english'
            return 'Exodus'          
        end
    end
  end

  def display_book_chapter(book, chapter, language)
    case language
      when 'hebrow'
        return 'ספר ' + display_book_name(book, language) + ' פרק ' + chapter.to_s
      when 'aramic'  
        return 'ספר ' + display_book_name(book, language) + ' פרק ' + chapter.to_s        
      when 'english'  
        return 'Book of ' + display_book_name(book, language) + ' chapter ' + chapter.to_s   
      when 'arabic'  
        return 'وفصل ' + display_book_name(book, language) + ' وفصل ' + chapter.to_s 
    end  
  end

  def pull_left_or_right
    if session[:locale] == 'en'
      'pull-left english small-letter'
    else
      'pull-right'
    end
  end

end
