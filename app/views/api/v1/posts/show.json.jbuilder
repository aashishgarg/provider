json.post do |json|
  json.partial! 'post', post: @post
end