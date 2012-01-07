require "sinatra-wardrobe/version"

module Sinatra
  module Wardrobe
    @@hats = []
    
    # just the array of Hash objects
    def hats
      @@hats
    end
    
    # this might not be necessary
    def hat_rack(list_type = 'ul')
      hatrack = "<#{ list_type }>"
      
      @@hats.each do |hat|
        hatrack << "<li><a href='#{ hat[:path] }'>#{ hat[:title] }</a></li>"
      end
      
      hatrack << "</#{ list_type }>"
    end
    
    # because it's a declaration!
    def suit_up!(options = {})
      options = {
        directories: ['./views'],
        extensions: ['.md'],
        excludes: ['layout.erb'],
        layout_engine: :erb
      }.merge(options)
      
      [:extensions, :excludes, :directories].each do |option|
        if options[option].is_a? String
          options[option] = [options[option]]
        end
      end
      
      directories_regexp = Regexp.new(options[:directories].join('|'))
      
      options[:directories].each do |dir|
        options[:extensions].each do |ext|
          Dir.glob("#{ dir }/**/*#{ ext }") do |file|
            file_name = file.gsub(directories_regexp, '')
          
            $stdout.puts "File found #{ file } and file_name is #{ file_name }"
          
            next if options[:excludes].include?(file_name.gsub(/\//, ''))
          
            file_route = file_name.gsub(ext, '')
            file_title = file_route.split('/').last
            file_title = file_title.gsub(/\-/, ' ').split(' ').each do |word|
              word.capitalize!
            end.join(' ')
          
            @@hats << { path: file_route, title: file_title, extension: ext }
          end
        end
      end
      
      # bind some GET requests
      @@hats.each do |link|
        get link[:path] do
          @title = link[:title]
          
          case link[:extension]
          when '.md', '.markdown'
            markdown link[:path].to_sym, layout_engine: options[:layout_engine]
          when '.erb'
            erb link[:path].to_sym, layout_engine: options[:layout_engine]
          end
        end
      end # /@@hats.each
    end # /suit_up!
  end # /Wardrobe
  
  register Wardrobe
end
