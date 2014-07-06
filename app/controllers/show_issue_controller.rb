class ShowIssueController < UIViewController

  def viewDidLoad
    super
    self.title = "CVE-2013-1756"

    rmq.stylesheet = ShowIssueControllerStylesheet
    rmq(self.view).apply_style :root_view

    @scroll_view = rmq.append(UIScrollView, :scroll_view).get
    append_labels
  end

  def append_labels
    labels = [ :release_date_label,
               :release_date_body,
               :last_revised,
               :source,
               :summary,
               :cvss_severity,
               :cvss_base_score,
               :impact_subscore,
               :explotability_subscore,
               :cvss_metrics,
               :access_vector,
               :access_complexity,
               :authentication,
               :impact_type ]

    labels.each {|label| rmq(@scroll_view).append(UILabel, label) }
  end
end
