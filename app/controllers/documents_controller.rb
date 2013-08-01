class DocumentController < ApplicationController
  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])
    if @document.update_attributes(params[:document])
      redirect_to document_path(@document)
    else
      render action: "edit"
    end
  end

  def show
    @document = Document.find(params[:id])
  end

  def create
    @document = Document.new(params[:document])
    if @document.valid?
      @document.save!
      redirect_to documents_url
    else
      render action: "new"
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to documents_path
  end
end
