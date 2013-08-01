class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def edit
    @document = Document.find(params[:id])
    @nodes = @document.nodes
  end

  def update
    @document = Document.find(params[:id])
    if @document.update_attributes(params[:document])
      redirect_to document_url(@document)
    else
      render action: "edit"
    end
  end

  def show
    @document = Document.find_by_slug(params[:slug])
    @nodes = @document.nodes
  end

  def create
    @document = Document.new(params[:document])
    if @document.valid?
      @document.save!
      redirect_to edit_document_url(@document)
    else
      render action: "new"
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to documents_url
  end
end
