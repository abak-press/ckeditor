class Ckeditor4::Asset < ActiveRecord::Base
  include Ckeditor4::Orm::ActiveRecord::AssetBase

  delegate :url, :current_path, :content_type, :to => :data

  validates_presence_of :data
end
