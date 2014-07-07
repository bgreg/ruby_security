class MainStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def issue_message_button(st)
    st.frame = {t: 80, w: st.super_width, h: 30}
    st.centered = :horizontal
    st.text = '15 High Priority ..'
    st.color = color.red
    st.font = font.medium
  end

  def alert_label(st)
    st.frame = {t: 250, w: 230, h: 30 }
    st.centered = :horizontal
    st.color = color.black
    st.font = font.medium
    st.text = "Enable Notifications?"
  end

  def alert(st) # 40 px below label
    st.frame = {t: 290, w: st.super_width, h: 30 }
    st.centered = :horizontal
  end
end
