class PortionsController <ApplicationController

  before_action  :ensure_admin, only: [:index, :new, :create, :edit, :update, :destroy]

  def show
    @portion = Portion.find_by(slug: params[:id])
  end

  def index
    @portions = Portion.all
  end

  def new
    @portion = Portion.new
  end

  def create
    @portion = Portion.new(portion_params)
    if @portion.save
      first_sentence = Sentence.get_sentence(@portion.book, params[:first_chapter], params[:first_sentence])  
      last_sentence = Sentence.get_sentence(@portion.book, params[:last_chapter], params[:last_sentence])   
      if !first_sentence 
        @portion.delete
        flash[:error] = "הפסוק הראשון לא נמצא אנה בדוק את הנתונים שהוזנו"
        render :new
      elsif !last_sentence
        @portion.delete
        flash[:error] = "הפסוק האחרון לא נמצא אנה בדוק את הנתונים שהוזנו"
        render :new
      else
        @portion.update_attributes(first_sentence_id: first_sentence.id, last_sentence_id: last_sentence.id)
        flash[:notice] = "#{@portion.slug} was added"
        redirect_to portions_path
      end
    else
      flash[:error] = "The portion #{@portion.slug} was NOT added"
      @portions = portion.all
      render :new
    end  
  end

  def edit
    @portion = Portion.find_by(slug: params[:id])
  end

  def update
    @portion = Portion.find_by(slug: params[:id])
    if @portion.update(portion_params)
      first_sentence = Sentence.get_sentence(@portion.book, params[:first_chapter], params[:first_sentence])  
      last_sentence = Sentence.get_sentence(@portion.book, params[:last_chapter], params[:last_sentence])   
      if first_sentence
        @portion.update_attributes(first_sentence_id: first_sentence.id)
      end
      if last_sentence
        @portion.update_attributes(last_sentence_id: last_sentence.id)
      end
      redirect_to portions_path
    else
      flash[:error] = "The portion #{@portion.slug} was NOT added"
      @portions = portion.all
      render :edit
    end 
  end

  def destroy
    portion = Portion.find_by(slug: params[:id])
    portion.destroy
    redirect_to portions_path
  end

  def set_download_variables
    @portion = Portion.find_by(slug: params[:id])
    respond_to do |format|
      format.html {render 'set_download_veriables', :layout => false  } 
      format.js
    end 
  end

  def download
    @portion = Portion.find_by(slug: params[:id]) 
    @versions = params[:versions]
    if params[:sentences] == 'all'
      @sentences = @portion.ordered_sentences
    else 
      from = params[:from_sentence].to_i - 1
      to = params[:to_sentence].to_i - 1
      if from >= to
        to = @portion.sentences.count - 1
      end
      @sentences = @portion.ordered_sentences[from..to]     
    end
    if !@versions
      @versions = ['arabic']
    end
    @orientation = params[:orientation]
    template = '/portions/download_' + @versions.count.to_s + '_version'
    render pdf: "file_name", template: template, layout: '/layouts/pdf-layout.html.haml', orientation: @orientation
  end


  def select_portion
    @portion = Portion.find_by(slug: params[:choosen_portion])
    render :show
  end

  private

  def portion_params
    params.require(:portion).permit(:hebrow_name, :arabic_name, :english_name, :book, :meaning)
  end

  def ensure_admin
    if is_admin?
      redirect_to root_path
    end
  end

end