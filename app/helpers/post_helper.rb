# frozen_string_literal: true

module PostHelper
  def html_link_to(post)
    link_to post.title, trip_path(post.trip, anchor: "post_#{post.id}"), style: 'color: blue', data: { turbo_frame: 'frame_id' }, target: '_top'
  end
end
