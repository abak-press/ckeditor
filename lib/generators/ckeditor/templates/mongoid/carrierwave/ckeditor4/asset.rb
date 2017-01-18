class Ckeditor4::Asset
  include Ckeditor4::Orm::Mongoid::AssetBase

  delegate :url, :current_path, :size, :content_type, :filename, :to => :data

  validates_presence_of :data
end
