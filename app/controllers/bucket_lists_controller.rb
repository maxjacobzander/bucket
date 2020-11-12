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
        @bucketlist = current_user.bucket_lists.build(bucket_params)
        @bucketlist.goal_id = null
        if @bucketlist.save
            redirect_to bucket_list_path(@bucketlist)
        else
            render :new
        end
    end

    def edit
        @bucketlist = BucketList.find(params[:id])
    end

    def update

    end

    private

    def bucket_params
        params.require(:bucket_list).permit(:name)
    end
end
