class NodesController < ApplicationController
  def index
    @nodes = Node.all
  end

  def new
    @node = Node.new
  end

  def edit
    @node = Node.find(params[:id])
  end

  def update
    @node = Node.find(params[:id])
    if @node.update_attributes(params[:node])
      redirect_to node_path(@node)
    else
      render action: "edit"
    end
  end

  def show
    @node = Node.find(params[:id])
  end

  def create
    @node = Node.new(params[:node])
    if @node.valid?
      @node.save!
      redirect_to nodes_url
    else
      render action: "new"
    end
  end

  def destroy
    @node = Node.find(params[:id])
    @node.destroy
    redirect_to nodes_path
  end
end
