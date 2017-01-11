class ActiveSupport::TestCase
  setup do
    Post.delete_all
    Ckeditor4::Asset.delete_all
  end
end
