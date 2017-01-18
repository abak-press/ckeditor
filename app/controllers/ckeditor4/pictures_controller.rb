class Ckeditor4::PicturesController < Ckeditor4::ApplicationController

  def index
    @pictures = Ckeditor4.picture_adapter.find_all(ckeditor_pictures_scope)
    @pictures = Ckeditor4::Paginatable.new(@pictures).page(params[:page])

    respond_to do |format|
      format.html { render :layout => @pictures.first_page? }
    end
  end

  def create
    @picture = Ckeditor4.picture_model.new
    respond_with_asset(@picture)
  end

  def destroy
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to pictures_path }
      format.json { render :nothing => true, :status => 204 }
    end
  end

  protected

    def find_asset
      @picture = Ckeditor4.picture_adapter.get!(params[:id])
    end

    def authorize_resource
      model = (@picture || Ckeditor4.picture_model)
      @authorization_adapter.try(:authorize, params[:action], model)
    end
end
