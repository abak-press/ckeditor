class Ckeditor4::Asset < ActiveRecord::Base
  include Ckeditor4::Orm::ActiveRecord::AssetBase
  include Ckeditor4::Backend::Dragonfly

  dragonfly_accessor :data, app: :ckeditor
  validates_presence_of :data
end
