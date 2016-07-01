class BookmarksSearchBuilder < SearchBuilder
  self.default_processor_chain += [:rewrite_bookmarks_search]

    #HACK next two methods are a hack for problems in the puppet VM tomcat/solr
    def rewrite_bookmarks_search(solr_parameters, user_parameters)
      solr_parameters[:q] = "id:(#{ Array(user_parameters[:q][:id]).map { |x| solr_escape(x) }.join(' OR ')})"
    end

    def solr_escape val, options={}
      options[:quote] ||= '"'
      unless val =~ /^[a-zA-Z0-9$_\-\^]+$/
        val = options[:quote] +
          # Yes, we need crazy escaping here, to deal with regexp esc too!
          val.gsub("'", "\\\\\'").gsub('"', "\\\\\"") +
          options[:quote]
      end
      return val
    end


end
