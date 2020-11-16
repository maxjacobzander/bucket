class BucketListsController < ApplicationController

    def index
        if user_signed_in?
        @bucketlists = BucketList.all
        else
            redirect_to new_user_session_path
        end
    end

    def new
        if user_signed_in?
            @bucketlist = BucketList.new
            @goal = @bucketlist.goals.build
        else
            redirect_to new_user_session_path
        end
    end

    def create
        @bucketlist = BucketList.new
        @goal = @bucketlist.goals.build
        @bucketlist.name = params[:bucket_list][:name]
        @goal.name = params[:bucket_list][:goals_attributes][:"0"][:name]
        @goal.user_id = current_user.id
        if @bucketlist.save && @goal.save
            redirect_to bucket_list_path(@bucketlist)
        else
            render :new
        end        
    end

    def show
        @bucketlist = BucketList.find(params[:id])
    end

    def edit
        @bucketlist = BucketList.find(params[:id])
    end

    def update
        @bucketlist = BucketList.find(params[:id])

        @bucketlist.update(bucket_params)
         
        if @bucketlist.save
            redirect_to @bucketlist
        else
            render :edit
        end
    end

    def destroy
        @bucketlist = BucketList.find(params[:id])
        @bucketlist.destroy
        flash.alert = "Bucket Deleted"
        redirect_to bucket_lists_path
    end

    private

    def bucket_params
        params.require(:bucket_list).permit(:name, goals_attributes: [:name])
    end
end
