class ShowIssueController < UIViewController

  def viewDidLoad
    super
    self.title = "CVE-2013-1756"

    rmq.stylesheet = ShowIssueControllerStylesheet
    rmq(self.view).apply_style :root_view

    @scroll_view = rmq.append(UIScrollView, :scroll_view).get
    rmq(@scroll_view).append(UILabel, :release_date).get
    rmq(@scroll_view).append(UILabel, :last_revised).get
    rmq(@scroll_view).append(UILabel, :source).get

    rmq(@scroll_view).append(UILabel, :overview).get
      rmq(@scroll_view).append(UILabel, :summary).get

    rmq(@scroll_view).append(UILabel, :cvss_severity).get
      rmq(@scroll_view).append(UILabel, :cvss_base_score).get
      rmq(@scroll_view).append(UILabel, :impact_subscore).get
      rmq(@scroll_view).append(UILabel, :explotability_subscore).get

    rmq(@scroll_view).append(UILabel, :cvss_metrics).get
      rmq(@scroll_view).append(UILabel, :access_vector).get
      rmq(@scroll_view).append(UILabel, :access_complexity).get
      rmq(@scroll_view).append(UILabel, :authentication).get
      rmq(@scroll_view).append(UILabel, :impact_type).get
  end

end
