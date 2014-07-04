class ShowIssueController < UIViewController

  def viewDidLoad
    super
    self.title = "CVE-2013-1756"

    rmq.stylesheet = ShowIssueControllerStylesheet
    rmq(self.view).apply_style :root_view

    @scroll_view = rmq.append(UIScrollView, :scroll_view).get
    setup_scroll_view
    append_labels
  end

  def setup_scroll_view
    scroll_view_frame_size =
      CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
    content_size =
      CGSizeMake(self.view.frame.size.width, 1000)

    @scroll_view.frame = scroll_view_frame_size
    @scroll_view.pagingEnabled = true
    @scroll_view.backgroundColor = UIColor.whiteColor
    @scroll_view.contentSize = content_size
    @scroll_view.showsHorizontalScrollIndicator = false
    @scroll_view.showsVerticalScrollIndicator = false
  end

  def append_labels
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
