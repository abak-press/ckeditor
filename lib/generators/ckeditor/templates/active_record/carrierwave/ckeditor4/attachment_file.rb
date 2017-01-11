class Ckeditor4::AttachmentFile < Ckeditor4::Asset
  mount_uploader :data, CkeditorAttachmentFileUploader, :mount_on => :data_file_name

  def url_thumb
    @url_thumb ||= Ckeditor4::Utils.filethumb(filename)
  end
end
