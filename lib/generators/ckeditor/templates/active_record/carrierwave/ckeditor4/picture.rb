class Ckeditor4::Picture < Ckeditor4::Asset
  mount_uploader :data, CkeditorPictureUploader, :mount_on => :data_file_name

  def url_content
    url(:content)
  end
end
