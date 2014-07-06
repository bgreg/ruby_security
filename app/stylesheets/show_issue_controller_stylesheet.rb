class ShowIssueControllerStylesheet < ApplicationStylesheet
  # Add your view stylesheets here. You can then override styles if needed, example:
  # include FooStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
     st.background_color = color.white
  end

  def scroll_view(st)
    st.scroll_enabled = true
    st.content_inset =UIEdgeInsetsMake(2,2,2,2)
    st.paging = true
    st.background_color = color.white
    st.view.frame =
      CGRectMake(0, 0, st.super_width, st.super_height)
    st.view.contentSize =
      CGSizeMake(st.super_width, 1000)
    st.view.showsHorizontalScrollIndicator = false
    st.view.showsVerticalScrollIndicator = false
  end

  def release_date_label(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {t: 0, w: st.super_width, h: 30}
    st.text = "Release date:"
    st.color = color.red
    st.font = font.small
  end

  def release_date_body(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {t: 60, w: st.super_width, h: 30}
    st.text = "#{Time.now}"
    st.color = color.black
    st.font = font.small
  end

  def last_revised(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 10, w: st.super_width, h: 30}
    st.text = "Last Revised: #{Time.now}"
    st.color = color.black
    st.font = font.small
  end

  def source(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 10, w: st.super_width, h: 30}
    st.text = "Source: US-CERT/NIST"
    st.color = color.black
    st.font = font.small
  end

  def summary(st)
    st.text = "Summary: The Dragonfly gem 0.7 before 0.8.6 and 0.9.x before 0.9.13 for Ruby, when used with Ruby on Rails, allows remote attackers to execute arbitrary code via a crafted request."\
              "Summary: The Dragonfly gem 0.7 before 0.8.6 and 0.9.x before 0.9.13 for Ruby, when used with Ruby on Rails, allows remote attackers to execute arbitrary code via a crafted request."
    st.adjusts_font_size = true
    st.number_of_lines = 0
    st.view.minimumFontSize = 16
    # st.size_to_fit
    # todo: figure out adjusting text to size of string
    st.frame = {bp: 10, w: st.super_width , h: 300}
    st.color = color.black
    st.font = font.small
  end

  def cvss_severity(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 10, w: st.super_width, h: 30}
    st.text = "CVSS Severity"
    st.color = color.black
    st.font = font.small
  end

  def cvss_base_score(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 10, w: st.super_width, h: 30}
    st.text = "CVSS v2 Base Score: 7.2"
    st.color = color.black
    st.font = font.small
  end

  def impact_subscore(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 10, w: st.super_width, h: 30}
    st.text = "Impact subscore: 6.2"
    st.color = color.black
    st.font = font.small
  end

  def explotability_subscore(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 10, w: st.super_width, h: 30}
    st.text = "Exploitability Subscore: 10.0"
    st.color = color.black
    st.font = font.small
  end

  def cvss_metrics(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 10, w: st.super_width, h: 30}
    st.text = "CVSS Metrics"
    st.color = color.black
    st.font = font.small
  end

  def access_vector(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 10, w: st.super_width, h: 30}
    st.text = "Access Vector: Network Exploitable"
    st.color = color.black
    st.font = font.small
  end

  def access_complexity(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 10, w: st.super_width, h: 30}
    st.text = "Access Complexity: Low"
    st.color = color.black
    st.font = font.small
  end

  def authentication(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 10, w: st.super_width, h: 30}
    st.text = "Authentication: Not requiblack to exploit"
    st.color = color.black
    st.font = font.small
  end

  def impact_type(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 10, w: st.super_width, h: 30}
    st.text = "Impact Type: Allows unauthorized disclosure of information; Allows unauthorized modification; Allows disruption of service"
    st.color = color.black
    st.font = font.small
  end
end
