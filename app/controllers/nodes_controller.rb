class NodesController < ApplicationController
  # before_filter :ajax_required, only: :create

  def update
    node = Node.find(params[:id])
    document = node.document
    if node.update_attributes(params[:node])
      redirect_to edit_document_url(document), notice: "Updated node!"
    else
      redirect_to edit_document_url(document), alert: "Unable to update node"
    end
  end

  def create
    document = Document.find_by_slug(params[:slug])
    node = document.nodes.new(params[:node])
    if node.valid?
      node.save!
      redirect_to edit_document_url(document), notice: "Created node!"
    else
      redirect_to edit_document_url(document), alert: "Unable to create node"
    end
  end

  def destroy
    node = Node.find(params[:id])
    document = node.document
    node.destroy
    redirect_to edit_document_url(document), notice: "Deleted node"
  end
end
