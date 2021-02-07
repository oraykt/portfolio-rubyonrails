module PagesHelper
  def twitter_link_parser tweet
    link_regex = %r{
      \b
      (
        (?: [a-z][\w-]+:
         (?: /{1,3} | [a-z0-9%] ) |
          www\d{0,3}[.] |
          [a-z0-9.\-]+[.][a-z]{2,4}/
        )
        (?:
         [^\s()<>]+ | \(([^\s()<>]+|(\([^\s()<>]+\)))*\)
        )+
        (?:
          \(([^\s()<>]+|(\([^\s()<>]+\)))*\) |
          [^\s`!()\[\]{};:'".,<>?«»“”‘’]
        )
      )
    }ix

    tweet.gsub(link_regex) do |url|
      "<a href='#{url}' target='_blank'>#{url}</a>"
    end.html_safe

    # username = '/^[A-Za-z0-9_]{1,15}$/'
    #
    # tweet.gsub(username) do | username |
    #   "<a href='http://twitter.com/#{username}'>@#{username}</a>"
    # end
    # byebug
    # tweet.html_safe
  end
end
