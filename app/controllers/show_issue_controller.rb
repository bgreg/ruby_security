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
               :last_revised_label,
               :last_revised_body,
               :source_label,
               :source_body,
               :summary_label,
               :summary_body,
               :cvss_severity_label,
               :cvss_severity_body,
               :cvss_base_score_label,
               :cvss_base_score_body,
               :impact_subscore_label,
               :impact_subscore_body,
               :explotability_subscore_label,
               :explotability_subscore_body,
               :access_vector_label,
               :access_vector_body,
               :access_complexity_label,
               :access_complexity_body,
               :authentication_label,
               :authentication_body,
               :impact_type_label,
               :impact_type_body ]

    labels.each {|label| rmq(@scroll_view).append(UILabel, label) }
  end
end
