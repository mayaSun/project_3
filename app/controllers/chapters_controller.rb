class ChaptersController <ApplicationController

  before_action  :ensure_admin, only: 

  def show
    @chapter = Chapter.find_by(slug: params[:id])
  end

  def index
    @chapters = Chapter.all
  end

  def new
    @chapter = Chapter.new
  end

  def create 
    @chapter = Chapter.new(chapter_params)
    if @chapter.save
      @chapter.set_sentences(hebrow: params[:hebrow], aramic: params[:aramic], arabic: params[:arabic], english: params[:english])
      flash[:notice] = "#{@chapter.slug} was added"
      redirect_to chapters_path
    else
      flash[:error] = "The chapter #{@chapter.slug} was NOT added"
      @chapters = chapter.all
      render :new
    end  
  end

  def edit
    @chapter = Chapter.find_by(slug: params[:id])
  end

  def update
    @chapter = Chapter.find_by(slug: params[:id])
    if @chapter.update(chapter_params)
      @chapter.set_sentences(hebrow: params[:hebrow], aramic: params[:aramic], arabic: params[:arabic], english: params[:english])
      flash[:notice] = "#{@chapter.slug} was updated"
      redirect_to chapters_path
    else
      flash[:error] = "#{@chapter.slug} was NOT updated"
      render :edit
    end
  end

  def destroy
    chapter = Chapter.find_by(slug: params[:id])
    chapter.sentences.each do |sentence|
      sentence.delete
    end
    chapter.destroy
    redirect_to chapters_path
  end

  def set_download_variables
    @chapter = Chapter.find_by(slug: params[:id])
    respond_to do |format|
      format.html {render 'set_download_veriables', :layout => false  } 
      format.js
    end 
  end

  def download
    @chapter = Chapter.find_by(slug: params[:id]) 
    @versions = params[:versions]
    if !@versions
      flash[:error] = "you must select languages"
    else
      template = '/chapters/download_' + params[:versions].count.to_s + '_version'
      render pdf: "file_name", template: template,layout: '/layouts/pdf-layout.html.haml', orientation: 'Landscape'
    end
  end

  def chapter_select
    render partial: 'chapter_select'
  end

  def select_chapter
    @chapter = Chapter.where(book: params[:choosen_book]).where(order: params[:choosen_chapter]).first
    render :show
  end

  private

  def chapter_params
    params.require(:chapter).permit(:book, :order, :meaning, :audio_hebrow, :audio_arabic)
  end

  def ensure_admin
    if is_admin?
      redirect_to root_path
    end
  end

end