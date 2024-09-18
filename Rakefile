# Ruby task automation
# It's like make but replace m with r.

# test and production
require 'yaml'
require 'jekyll'
require 'faraday'
require 'faraday/retry'
# development and test
require 'sass-embedded'
require 'fileutils'

# constants
SOURCE = './'
DESTINATION = './_site'
CONFIGURATION = '_config.yml'
LOCAL_HOST = 'http://127.0.0.1:4000/'
MAIN_SASS = '_sass/main.sass'
DEBUG_SASS = '_site/pre-build/debug.css'
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

task :sass do
    # result contains css, loaded urls and source maps
    result = Sass.compile(MAIN_SASS,
        source_map: true, source_map_include_sources: true,
        verbose: true) # let the depreciations galore

    directory_name = File.dirname(DEBUG_SASS)
    unless File.directory?(directory_name)
        FileUtils.mkdir_p(directory_name)
        # p creates directory hierarchy
    end

    # TODO: is that right?
    stdout = $stdout # Not the best way.
    File.open(DEBUG_SASS, 'w') do |file|
        $stdout = file
        puts result.css
    end
    $stdout = stdout
    
    puts result.loaded_urls
    puts result.source_map
end
