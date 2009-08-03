module OmniFocus::Bugzilla
  VERSION = '1.0.0'

  def load_or_create_config
    path   = File.expand_path "~/.omnifocus-bugzilla.yml"
    config = YAML.load(File.read(path)) rescue nil

    unless config then
      config = {
        :username => "USERNAME",
        :bugzilla_url => "http://example.com/cgi-bin/buglist.cgi"
      }

      File.open(path, "w") { |f|
        YAML.dump(config, f)
      }

      abort "Created default config in #{path}. Go fill it out."
    end

    config
  end

  def populate_bugzilla_tasks
    config       = load_or_create_config
    bugzilla_url = config[:bugzilla_url]
    username     = config[:username]

    results = mechanize.get "#{bugzilla_url}?bug_status=UNCONFIRMED&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&emailassigned_to1=1&emailtype1=substring&email1=#{username}"

    bugs = results.root.xpath "//table[@class='bz_buglist']/tr[td]"
    bugs.each do |bug|
      bug_number = $1 if bug.inner_html =~ /show_bug.cgi\?id=(\d*)/
      ticket_id = "BZ##{bug_number}"

      if existing[ticket_id]
        project = existing[ticket_id]
        bug_db[project][ticket_id] = true
      else
        url = "http://bugs/show_bug.cgi?id=#{bug_number}"
        warn "url #{url}"
        details = Nokogiri.parse(mechanize.get("#{url}&ctype=xml").body)
        product = details.root.xpath('//product/text()').text.downcase
        title = details.root.xpath('//short_desc/text()').text
        component = details.root.xpath('//component/text()').text.downcase
        project = "#{product}-#{component}"

        bug_db[project][ticket_id] = ["#{ticket_id}: #{title}", url]
      end
    end
  end
end
