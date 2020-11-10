class BucketListsController < ApplicationController

    def index
        if user_signed_in?
        @bucketlists = BucketList.all
        else
            redirect_to new_user_session_path
        end
    end

    def new
        @bucketlist = BucketList.new
    end

    def create
        @bucketlist = BucketList.new
        if @bucketlist.save
            redirect_to @bucketlist
        else
            render :new
        end
    end

    def edit
        @bucketlist = BucketList.find(params[:id])
    end

    def update

    end
end
