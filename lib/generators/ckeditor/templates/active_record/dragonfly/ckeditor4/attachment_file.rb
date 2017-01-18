class Ckeditor4::AttachmentFile < Ckeditor4::Asset
  validates_property :ext, :of => :data, :in => attachment_file_types unless attachment_file_types.empty?

  def url_thumb
    Ckeditor4::Utils.filethumb(filename)
  end
end
