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
    st.view.frame = CGRectMake(0, 0, st.super_width, st.super_height)
    st.view.contentSize = CGSizeMake(st.super_width, 1300)
    st.view.showsHorizontalScrollIndicator = false
    st.view.showsVerticalScrollIndicator = false
  end

  def release_date_label(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.background_color = color.light_gray
    st.frame = {t:0, w: st.super_width, h: 30}
    st.text = "Release date:"
    st.color = color.red
    st.font = font.small
  end
  def release_date_body(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp:1, w: st.super_width, h: 30}
    st.text = "#{Time.now}"
    st.color = color.black
    st.font = font.small
  end


  def last_revised_label(st)
    st.frame = {bp: 1, w: st.super_width, h: 30}
    st.text = "Last Revised:"
    st.background_color = color.light_gray
    st.color = color.red
    st.font = font.small
  end
  def last_revised_body(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 1, w: st.super_width, h: 30}
    st.text = "#{Time.now}"
    st.color = color.black
    st.font = font.small
  end

  def source_label(st)
    st.frame = {bp: 1, w: st.super_width, h: 30}
    st.text = "Source:"
    st.background_color = color.light_gray
    st.color = color.red
    st.font = font.small
  end
  def source_body(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 1, w: st.super_width, h: 30}
    st.text = "US-CERT/NIST"
    st.color = color.black
    st.font = font.small
  end

  def summary_label(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 1, w: st.super_width, h: 30}
    st.text = "Summary:"
    st.color = color.red
    st.font = font.small
    st.background_color = color.light_gray
  end
  def summary_body(st)
    st.text = "The Dragonfly gem 0.7 before 0.8.6 and 0.9.x before 0.9.13 for Ruby, when used with Ruby on Rails, allows remote attackers to execute arbitrary code via a crafted request."\
              "he Dragonfly gem 0.7 before 0.8.6 and 0.9.x before 0.9.13 for Ruby, when used with Ruby on Rails, allows remote attackers to execute arbitrary code via a crafted request."
    st.adjusts_font_size = true
    st.number_of_lines = 0
    st.view.minimumFontSize = 16
    # st.size_to_fit
    # todo: figure out adjusting text to size of string
    st.frame = {bp: 1, w: st.super_width , h: 300}
    st.color = color.black
    st.font = font.small
  end

  def cvss_severity_label(st)
    st.frame = {bp: 1, w: st.super_width, h: 30}
    st.text = "CVSS Severity:"
    st.background_color = color.light_gray
    st.color = color.red
    st.font = font.small
  end
  def cvss_severity_body(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 1, w: st.super_width, h: 30}
    st.text = "7.21"
    st.color = color.black
    st.font = font.small
  end

  def cvss_base_score_label(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 1, w: st.super_width, h: 30}
    st.text = "CVSS v2 Base Score: 7.2"
    st.background_color = color.light_gray
    st.color = color.red
    st.font = font.small
  end
  def cvss_base_score_body(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 1, w: st.super_width, h: 30}
    st.text = "7.2"
    st.color = color.black
    st.font = font.small
  end

  def impact_subscore_label(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 1, w: st.super_width, h: 30}
    st.text = "Impact subscore:"
    st.background_color = color.light_gray
    st.color = color.red
    st.font = font.small
  end
  def impact_subscore_body(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 1, w: st.super_width, h: 30}
    st.text = "6.2"
    st.color = color.black
    st.font = font.small
  end

  def explotability_subscore_label(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 1, w: st.super_width, h: 30}
    st.text = "Exploitability Subscore:"
    st.background_color = color.light_gray
    st.color = color.red
    st.font = font.small
  end
  def explotability_subscore_body(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 1, w: st.super_width, h: 30}
    st.text = "10.0"
    st.color = color.black
    st.font = font.small
  end

  def access_vector_label(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 1, w: st.super_width, h: 30}
    st.text = "Access Vector:"
    st.background_color = color.light_gray
    st.color = color.red
    st.font = font.small
  end
  def access_vector_body(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 1, w: st.super_width, h: 30}
    st.text = "Network Exploitable"
    st.color = color.black
    st.font = font.small
  end

  def access_complexity_label(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 1, w: st.super_width, h: 30}
    st.text = "Access Complexity: "
    st.background_color = color.light_gray
    st.color = color.red
    st.font = font.small
  end
  def access_complexity_body(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 1, w: st.super_width, h: 30}
    st.text = "Low"
    st.color = color.black
    st.font = font.small
  end

  def authentication_label(st)
    st.frame = {bp: 1, w: st.super_width, h: 30}
    st.text = "Authentication:"
    st.background_color = color.light_gray
    st.color = color.red
    st.font = font.small
  end
  def authentication_body(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {bp: 1, w: st.super_width, h: 30}
    st.text = "Not requiblack to exploit"
    st.color = color.black
    st.font = font.small
  end

  def impact_type_label(st)
    st.frame = {bp: 1, w: st.super_width, h: 30}
    st.text = "Impact Type:"
    st.background_color = color.light_gray
    st.color = color.red
    st.font = font.small
  end
  def impact_type_body(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.view.minimumFontSize = 16
    st.frame = {bp: 1, w: st.super_width, h: 300}
    st.text = "Allows unauthorized disclosure of information; Allows unauthorized modification; Allows disruption of service"
    st.color = color.black
    st.font = font.small
  end
end
