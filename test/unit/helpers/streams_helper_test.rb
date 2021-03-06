require_relative '../../test_helper'

class StreamsHelperTest < ActionView::TestCase
  include ApplicationHelper

  context 'stream_item_content' do
    should 'be html_safe for messages' do
      @message = Message.create!(person: people(:tim), group: groups(:morgan), subject: 'Foo', body: 'Bar')
      @stream_item = StreamItem.last
      assert_equal @message, @stream_item.streamable
      assert stream_item_content(@stream_item).html_safe?
    end

    should 'be html_safe for pictures' do
      @album = Album.create!(owner: people(:tim), name: 'Foo')
      @picture = @album.pictures.create!(person: people(:tim), photo: File.open(Rails.root.join('test/fixtures/files/image.jpg')))
      @stream_item = StreamItem.last
      assert_equal @album, @stream_item.streamable
      assert stream_item_content(@stream_item).html_safe?
    end
  end
end
