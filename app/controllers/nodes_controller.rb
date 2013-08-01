class NodesController < ApplicationController
  before_filter :ajax_required

  def update
    @node = Node.find(params[:id])
    document = @node.document
    unless @node.update_attributes(params[:node])
      render "error", locals: { error: "Unable to update node!" }
    end
  end

  def create
    document = Document.find_by_slug(params[:slug])
    @node = document.nodes.new(params[:node])
    if @node.valid?
      @node.save!
    else
      render partial: "error", locals: { error: "Unable to create node!" }
    end
  end

  def destroy
    @node = Node.find(params[:id])
    @node.destroy
  rescue
    render partial: "error", locals: { error: "Unable to delete node!" }
  end
end
