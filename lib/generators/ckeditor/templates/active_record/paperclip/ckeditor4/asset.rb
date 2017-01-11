class Ckeditor4::Asset < ActiveRecord::Base
  include Ckeditor4::Orm::ActiveRecord::AssetBase
  include Ckeditor4::Backend::Paperclip
end
