class XmlFilesController < ApplicationController
  def index
    @xml_files = XmlFile.all
  end

  def new
    @xml_file = XmlFile.new
  end

  def edit
    @xml_file = XmlFile.find(params[:id])
  end

  def update
    @xml_file = XmlFile.find(params[:id])
    if @xml_file.update_attributes(params[:xml_file])
      redirect_to xml_file_path(@xml_file)
    else
      render action: "edit"
    end
  end

  def show
    @xml_file = XmlFile.find(params[:id])
  end

  def create
    @xml_file = XmlFile.new(params[:xml_file])
    if @xml_file.valid?
      @xml_file.save!
      redirect_to xml_files_url
    else
      render action: "new"
    end
  end

  def destroy
    @xml_file = XmlFile.find(params[:id])
    @xml_file.destroy
    redirect_to xml_files_path
  end
end
