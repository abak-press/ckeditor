class Ckeditor4::Asset
  include Ckeditor4::Orm::Mongoid::AssetBase
  include Mongoid::Paperclip
  include Ckeditor4::Backend::Paperclip
end
