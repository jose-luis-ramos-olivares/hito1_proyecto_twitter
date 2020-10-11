module Api
    class TweetsController < ApplicationController
        include ActionController::HttpAuthentication::Basic::ControllerMethods 
        http_basic_authenticate_with name: "hello", password: "world", except: :index
        before_action :set_tweet, only: [:show, :update, :destroy]
        skip_before_action :verify_authenticity_token

        class Tweet < ::Tweet
            def as_json(options = {})
                super.merge(like_count: likes.count, retweets_count: origin_tweet)
            end
        end

        respond_to :json

        def index
            respond_with Tweet.all 
        end

        def show
            respond_with Tweet.find(params[:id])
        end

        def create
            @tweet = Tweet.new(tweet_params)
            
            if @tweet.save
              render json: @tweet
            else
              render json: @tweet.errors
            end
        end

        def update
            respond_with Tweet.update(params[:id], params[:tweet])
        end

        def destroy
            respond_with Tweet.destroy(params[:id])
        end

        private

        def set_post
            @tweet = Tweet.find(params[:id])
        end

        def tweet_params
            params.require(:tweet).permit(:content, :user_id)
        end
    end
end