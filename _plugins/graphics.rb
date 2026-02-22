module Graphics
    # Viewer and Physics

    class Viewer < Jekyll::Generator
        safe true

        GLB = /^\[GLB\]\((.*)\)/
        GLTF = /^\[GLTF\]\((.*)\)/ # TODO: later

        def generate(site)
            instantiate(site)

            site.documents.each do |document|
                glb(document)
            end
        end

        def instantiate(site)
            @converter = site.find_converter_instance(Jekyll::Converters::Markdown)
        end

        def glb(document)
            document.content.gsub!(GLB) do |_|
                uri = Regexp.last_match(1).strip()

                "<babylon-viewer class='graphics' source='#{uri}'>" \
                "</babylon-viewer>"
            end
        end 
    end

    class Physics
        # TODO
    end

end
