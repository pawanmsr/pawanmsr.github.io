# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-bhautiki"
  spec.version       = "0.0.1"
  spec.authors       = ["Pawan Mishra"]
  spec.email         = ["pawanmsr@outlook.com"]

  spec.summary       = "Physics inspired feature-rich Jekyll theme with Math support."
  spec.homepage      = "https://github.com/pawanmsr/jekyll-bhautiki"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_data|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.3"
end
