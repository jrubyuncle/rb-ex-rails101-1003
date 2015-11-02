module PostsHelper
  def render_post_content(post)
    simple_format(truncate(post.content))
  end
end
