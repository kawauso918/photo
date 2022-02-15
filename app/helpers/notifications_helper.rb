module NotificationsHelper
  def notification_form(notification)
    @comment=nil
    visiter=link_to notification.visiter.name, notification.visiter, style:"font-weight: bold;"
    your_post=link_to 'あなたの投稿', notification.favorite, style:"font-weight: bold;", remote: true
    case notification.action
      when "follow" then
        "#{visiter}があなたをフォローしました"
      when "favorite" then
        "#{visiter}が#{your_post}にいいね！しました"
      when "comment" then
        @comment=Comment.find_by(id:notification.comment_id)&.content
        "#{visiter}が#{your_post}にコメントしました"
    end
  end
  # 未確認の通知があることを知らせる
  def unchecked_notifications
    @notifications=current_user.passive_notifications.where(checked: false)
  end

end