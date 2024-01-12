class CommentsController < ApplicationController
    http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
    
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)

        respond_to do |format|
            if @comment.save
                NotifMailer.new_comment_notif(@comment.commenter, @article.author_email, @comment.body).deliver_now
                
                format.html { redirect_to(article_path(@article), notice: 'Successfully notified the author.') }
                format.json { render json: @comment, status: :created, location: @comment }
            else
                format.html { render action: 'new' }
                format.json { render json: @article.comments.errors, status: :unprocessable_entity }
            end
        end
        
    end
    
    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
