class MainStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  #
  # Removed
  #
  def issue_message_button(st)
    st.frame    = { w: st.super_width, h: 50, t: 10, centered: :both}
    st.text     = '0 New CVE\'s'
    st.color    = color.red
    st.font     = font.medium
  end
end
