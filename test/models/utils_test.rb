require 'test_helper'

class UtilsTest < ActiveSupport::TestCase
  test 'exists filethumb' do
    %w(avi doc docx exe gz htm jpg mp3 mpg pdf psd rar swf tar txt wmv xlsx zip).each do |ext|
      assert_equal "ckeditor4/filebrowser/images/thumbs/#{ext}.gif", Ckeditor4::Utils.filethumb("somefile.#{ext}")
    end

    assert_equal "ckeditor4/filebrowser/images/thumbs/unknown.gif", Ckeditor4::Utils.filethumb("somefile.ddd")
  end

  test 'wrong filethumb' do
    assert_equal "ckeditor4/filebrowser/images/thumbs/unknown.gif", Ckeditor4::Utils.filethumb("somefile.ddd")
    assert_equal "ckeditor4/filebrowser/images/thumbs/unknown.gif", Ckeditor4::Utils.filethumb("somefile")
    assert_equal "ckeditor4/filebrowser/images/thumbs/unknown.gif", Ckeditor4::Utils.filethumb("")
    assert_equal "ckeditor4/filebrowser/images/thumbs/unknown.gif", Ckeditor4::Utils.filethumb(nil)
  end
end
