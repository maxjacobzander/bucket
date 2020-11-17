class GoalsController < ApplicationController

    def index
        @goals = Goal.all
    end

    def new
        if params[:bucket_list_id]
            @bucketlist = BucketList.find(params[:bucket_list_id])
            @goal = @bucketlist.goals.build
        else
            @goal = Goal.new
        end
    end

    def create
        if params[:bucket_list_id]
            @bucketlist = BucketList.find(params[:bucket_list_id])
            @goal = @bucketlist.goals.build(goal_params)
            @goal.user_id = current_user.id
        else
            @goal = Goal.new(goal_params)
        end
        if @goal.save
            flash[:notice] = "Accomplish your goals! You can do it!"
            redirect_to @bucketlist
        else
            render :new
        end
    end

    def show
        @goal = Goal.find(params[:id])
        @bucketlist = BucketList.find_by_id(params[:bucket_list_id])
        if @goal.user_id != current_user.id
            redirect_to bucket_lists_path
        end
    end

    def edit
        @goal = Goal.find(params[:id])
        @bucketlist = BucketList.find_by_id(params[:bucket_list_id])
    end

    def update
        @goal = Goal.find(params[:id])
        @bucketlist = BucketList.find_by_id(params[:bucket_list_id])

        @goal.update(goal_params)

        if @goal.save
            redirect_to @bucketlist
        else
            render :edit
        end
    end

    def destroy
        @goal = Goal.find(params[:id])
        @bucketlist = BucketList.find_by_id(params[:bucket_list_id])
        @goal.destroy
        flash.alert = "Goal Deleted"
        redirect_to bucket_list_path(@bucketlist)
    end

    private

    def goal_params
        params.require(:goal).permit(:name, :user_id, :bucket_list_id, :accomplished)
    end
end
