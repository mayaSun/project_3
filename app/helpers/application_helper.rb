module ApplicationHelper

  def calculate_sentence_height(sentence)
    if sentence.max_length < 40
      'one-line'
    elsif sentence.max_length < 80
      'two-lines'
    elsif sentence.max_length < 120
      'three-lines'
    elsif sentence.max_length < 160
      'four-lines'
    else
      'five-lines'
    end
  end

  def calculate_sentence_height_download_2_version(sentence, orientation)
    if orientation == 'Landscape'
      if sentence.max_length < 70
        'one-line'
      elsif sentence.max_length < 140
        'two-lines'
      elsif sentence.max_length < 280
        'three-lines'
      elsif sentence.max_length < 350
        'four-lines'
      else
        'five-lines'
      end
    else
      if sentence.max_length < 50
        'one-line'
      elsif sentence.max_length < 100
        'two-lines'
      elsif sentence.max_length < 150
        'three-lines'
      elsif sentence.max_length < 200
        'four-lines'
      else
        'five-lines'
      end
    end
  end

  def calculate_sentence_height_download_3_version(sentence, orientation)
    if orientation == 'Landscape'
      if sentence.max_length < 40
        'one-line'
      elsif sentence.max_length < 80
        'two-lines'
      elsif sentence.max_length < 120
        'three-lines'
      elsif sentence.max_length < 160
        'four-lines'
      else
        'five-lines'
      end
    else
      if sentence.max_length < 35
        'one-line'
      elsif sentence.max_length < 70
        'two-lines'
      elsif sentence.max_length < 105
        'three-lines'
      elsif sentence.max_length < 140
        'four-lines'
      else
        'five-lines'
      end
    end
  end

  def calculate_sentence_height_download_4_version(sentence, orientation)
    if orientation == 'Landscape'
      if sentence.max_length < 35
        'one-line'
      elsif sentence.max_length < 70
        'two-lines'
      elsif sentence.max_length < 105
        'three-lines'
      elsif sentence.max_length < 140
        'four-lines'
      else
        'five-lines'
      end
    else
      if sentence.max_length < 28
        'one-line'
      elsif sentence.max_length < 60
        'two-lines'
      elsif sentence.max_length < 56
        'three-lines'
      elsif sentence.max_length < 84
        'four-lines'
      else
        'five-lines'
      end
    end
  end

  def header_text_class_by_orientation(orientation)
    if orientation == 'Landscape'
      'landscape-header-text'
    else
      'portrait-header-text'
    end
  end

  def header_class_by_orientation(orientation)
    if orientation == 'Landscape'
      'landscape-header'
    else
      'portrait-header'
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

  def nav_tabs_english? 
    if session[:locale] == 'en'  
      'nav-tabs-english'
    end
  end

  def portions_for_select
    if session[:locale] == 'en'  
      Portion.all_ordered.map{ |portion| [portion.english_name, portion.slug]}
    elsif session[:locale] == 'he'
      Portion.all_ordered.map{ |portion| [portion.hebrow_name, portion.slug]}
    else
      Portion.all_ordered.map{ |portion| [portion.arabic_name, portion.slug]}
    end 
  end

  def portion_name(portion)
    if session[:locale] == 'en'  
      portion.english_name
    elsif session[:locale] == 'he'
      portion.hebrow_name
    else
      portion.arabic_name
    end 
  end

end
