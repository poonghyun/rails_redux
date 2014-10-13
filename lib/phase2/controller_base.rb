module Phase2
  class ControllerBase
    attr_reader :req, :res

    # Setup the controller
    def initialize(req, res)
        @res = res
        @req = req
        @already_built_response = false
    end

    # Helper method to alias @already_built_response
    def already_built_response?
        @already_built_response
    end

    # Set the response status code and header
    def redirect_to(url)
        raise "already rendered" if already_built_response?
        @already_built_response = true
        self.res.status = 302
        self.res.header["location"] = url
    end

    # Populate the response with content.
    # Set the response's content type to the given type.
    # Raise an error if the developer tries to double render.
    def render_content(content, type)
        raise "already rendered" if already_built_response?
        @already_built_response = true
        self.res.content_type = type
        self.res.body = content
    end
  end
end
