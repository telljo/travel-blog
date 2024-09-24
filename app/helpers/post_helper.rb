module PostHelper
  def html_link_to(post)
    link_to post.address, trip_path(post.trip, anchor: "post_#{post.id}"), style: 'color: green', data: { turbo_frame: 'frame_id' }, target: '_top'
  end
end
