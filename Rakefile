# Ruby task automation
require 'yaml'
require 'jekyll'
require 'faraday'
require 'faraday/retry'

site_config = YAML.load_file("_config.yml")
host_url = site_config['url'].strip
if host_url.empty?
    host_url = 'http://127.0.0.1:4000/'
end

task :default do
    config = Jekyll.configuration({ 
        'source' => './', 
        'destination' => './_site',
        'incremental' => true # set it to false to regenerate entirely
    })
    site = Jekyll::Site.new(config)
    Jekyll::Commands::Build.build site, config
end

task :test do
    conn = Faraday.new(url: host_url) do |faraday|
        retry_options = {
            max: 2,
            interval: 0.5,
            interval_randomness: 0.5,
            backoff_factor: 2,
            retry_statuses: [404],
            exceptions: Faraday::Retry::Middleware::DEFAULT_EXCEPTIONS +
                [Faraday::ClientError, Faraday::ServerError, Faraday::UnauthorizedError,
                    Faraday::ConnectionFailed, Faraday::ResourceNotFound]
        }

        faraday.request :retry, retry_options

        # ...
    end

    response = conn.get('/')
    raise CustomException if response.status == 503
end
