class ShowIssueController < UIViewController

  def initWithId(data)
    self.initWithNibName(nil, bundle: nil)
    @data = data
    self
  end

  def viewDidLoad
    super
    self.title = "A CVE"
    load_data
    rmq.stylesheet = ShowIssueControllerStylesheet
    rmq(self.view).apply_style(:root_view)
    @scroll_view = rmq.append(UIScrollView, :scroll_view).get
    append_labels
    update_data_tags
    build_references
  end

  def load_data
    @data = @data['exposure']
  end

  def update_data_tags
    puts @data.inspect
    rmq(:release_date_body).data(      @data['published']) # format better
    rmq(:summary_body).data(           @data['summary'])
    rmq(:cvss_base_score_body).data(   @data['cvss_v2_base_score'].to_s)
    rmq(:access_vector_body).data(     @data['access_vector'])
    rmq(:access_complexity_body).data( @data['access_complexity'])
    rmq(:cvss_severity_body).data(     @data['cvss_severity'])
    self.title = @data['cve_id']
  end

  def append_labels
    labels = [ 
      :release_date_label,
      :release_date_body,
      :cvss_severity_label,
      :cvss_severity_body,
      :summary_label,
      :summary_body,
      :cvss_base_score_label,
      :cvss_base_score_body,
      :access_vector_label,
      :access_vector_body,
      :access_complexity_label,
      :access_complexity_body,]
    labels.each{|label| rmq(@scroll_view).append(UILabel, label) }
  end

  def build_references
    rmq(@scroll_view).append(UILabel, :references_label)
    @data['references'].each{ |r,index|
      rmq(@scroll_view).append(UILabel, :references_body_source).data("Source: #{r['source']}")
      rmq(@scroll_view).append(UILabel, :references_body_url).data(r['url'])
    }
  end

end
