class NotifMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def new_comment_notif(commenter, receiver, body)
        @commenter = commenter
        @comment = body
        @receiver = receiver

        mail(to: @receiver, subject: 'New Comment on your Blog Post!')
    end
end
