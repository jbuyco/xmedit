class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def edit
    @document = Document.find(params[:id])
    @nodes = @document.nodes.ordered
  end

  def show
    @document = Document.find_by_slug(params[:slug])
    @nodes = @document.nodes.ordered
  end

  def create
    @document = Document.new(params[:document])
    if @document.valid?
      @document.save!
      redirect_to edit_document_url(@document)
    else
      redirect_to root_url, alert: "Unable to create new document"
    end
  end
end
