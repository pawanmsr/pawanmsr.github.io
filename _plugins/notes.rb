# require ""

# Runs before site generation.
module Notes
    # Mapped to feather.
    ICONS = {
        "NOTE" => "anchor",
        "TIP" => "coffee",
        "IMPORTANT" => "compass",
        "WARNING" => "alert-triangle",
        "CAUTION" => "alert-circle"
    }.freeze
    
    # Markup generator for notes.
    class NotesGenerator < Jekyll::Generator
        safe true

        PEN = /\h*>[ \t]*/ # TODO: Fix [ \t] with \h
        TYPE = /!(NOTE|TIP|IMPORTANT|WARNING|CAUTION)/
        EXPRESSION = /^(#{PEN.source}\n?)*\[#{TYPE.source}\](.*)\n(\h*>.*\n?)*/
        
        # Collect posts.
        # Find notes in post.
        # Sort notes data.
        # Reorganize data.
        # Texture and presentation.
        def generate(site)
            instantiate(site)
            site.documents.each do |document|
                apply(document)
            end
        end

        def instantiate(site)
            @converter = site.find_converter_instance(Jekyll::Converters::Markdown)
        end

        def apply(document)
            document.content.gsub!(EXPRESSION) do |_|
                pen = Regexp.last_match(1)
                type = Regexp.last_match(2).strip
                header = Regexp.last_match(3).strip
                scribble = Regexp.last_match(4).gsub(PEN, '').strip

                name = type.downcase
                if header.empty?
                    header = name.capitalize
                end

                "<div class='notes'>" \
                "<h6 id='#{header}'>" \
                "<i class='#{name}' data-feather='#{ICONS[type]}'></i>" \
                "<span>#{header}</span></h6>" \
                "<p>#{@converter.convert(scribble)}</p>" \
                "</div>"
            end
        end
    end
end
