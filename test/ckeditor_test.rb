require 'test_helper'

class CkeditorTest < ActiveSupport::TestCase
  def teardown
    Ckeditor4.picture_model = nil
    Ckeditor4.attachment_file_model = nil
  end

  test "truth" do
    assert_kind_of Module, Ckeditor4
  end

  test 'setup block yields self' do
    Ckeditor4.setup do |config|
      assert_equal Ckeditor4, config
    end
  end

  test 'default picture model' do
    assert_equal Ckeditor4.picture_model, Ckeditor4::Picture
  end

  test 'configuration specifying picture model' do
    Ckeditor4.setup do |config|
      config.picture_model = CustomPicture
    end
    assert_equal Ckeditor4.picture_model, CustomPicture
  end

  test 'configuration specifying picture model using block' do
    Ckeditor4.setup do |config|
      config.picture_model { CustomPicture }
    end
    assert_equal Ckeditor4.picture_model, CustomPicture
  end

  test 'picture model adapter' do
    assert_equal Ckeditor4.picture_adapter, Ckeditor4::Picture.to_adapter
  end

  test 'default attachment file model' do
    assert_equal Ckeditor4.attachment_file_model, Ckeditor4::AttachmentFile
  end

  test 'configuration specifying attachment file model' do
    Ckeditor4.setup do |config|
      config.attachment_file_model = CustomAttachmentFile
    end
    assert_equal Ckeditor4.attachment_file_model, CustomAttachmentFile
  end

  test 'configuration specifying attachment file model using block' do
    Ckeditor4.setup do |config|
      config.attachment_file_model { CustomAttachmentFile }
    end
    assert_equal Ckeditor4.attachment_file_model, CustomAttachmentFile
  end

  test 'attachment file model adapter' do
    assert_equal Ckeditor4.attachment_file_adapter,
      Ckeditor4::AttachmentFile.to_adapter
  end

  test 'languages ingnore list' do
    Ckeditor4.assets = nil
    Ckeditor4.assets_languages = ['en', 'uk']

    assert_equal Ckeditor4.assets.include?('ckeditor4/lang/ru.js'), false
    assert_equal Ckeditor4.assets.include?('ckeditor4/lang/uk.js'), true
    assert_equal Ckeditor4.assets.include?('ckeditor4/plugins/a11yhelp/dialogs/lang/bg.js'), false
    assert_equal Ckeditor4.assets.include?('ckeditor4/plugins/a11yhelp/dialogs/lang/uk.js'), true
  end

  test 'plugins ingnore list' do
    Ckeditor4.assets = nil
    Ckeditor4.assets_plugins = ['image']

    assert_equal Ckeditor4.assets.include?('ckeditor4/plugins/table/dialogs/table.js'), false
    assert_equal Ckeditor4.assets.include?('ckeditor4/plugins/image/dialogs/image.js'), true
  end

  test 'configuration specifying running ckeditor:nondigest task on assets:precompile' do
    assert_equal Ckeditor4.run_on_precompile?, true
    Ckeditor4.run_on_precompile = false
    assert_equal Ckeditor4.run_on_precompile?, false
  end

  class CustomPicture; end
  class CustomAttachmentFile; end
end
