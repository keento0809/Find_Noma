module ApplicationHelper

  # ページタイトルが定義されていない場合は基本タイトル「FindNomaCafe」を
  # 返し、定義されている場合は基本タイトルに縦棒とページタイトルを追加して返す
  def full_title(page_title = '')
    base_title = "FindNomaCafe"
    if page_title.empty?
        base_title
    else
        page_title + " | " + base_title
    end
  end

  def logged_in?
    !current_user.nil?
  end
end
