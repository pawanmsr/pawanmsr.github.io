# Ruby task automation
# test and production
require 'yaml'
require 'jekyll'
require 'faraday'
require 'faraday/retry'
# development and test
require 'sass-embedded'

# constants
SOURCE = './'
DESTINATION = './_site'
CONFIGURATION = '_config.yml'
LOCAL_HOST = 'http://127.0.0.1:4000/'
SASS_MAIN = 'assets/css/bhautiki.scss'
# end constants

site_config = YAML.load_file(CONFIGURATION)
host_url = site_config['url'].strip
if host_url.empty?
    host_url = LOCAL_HOST
end

task :default do
    config = Jekyll.configuration({ 
        'source' => SOURCE, 
        'destination' => DESTINATION,
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
