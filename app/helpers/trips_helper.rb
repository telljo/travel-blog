module TripsHelper
  def generated_trip_points(trip)
    trip.posts.with_location.order(created_at: :desc).map do |post|
      {
        latitude: post.latitude,
        longitude: post.longitude,
        label: post.title,
        tooltip: html_link_to(post)
      }
    end.to_json
  end
end
