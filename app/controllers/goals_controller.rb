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
        else
            @goal = Goal.new(goal_params)
        end
        if @goal.save
            redirect_to @goal
        else
            render :new
        end
    end

    def show
        @goal = Goal.find(params[:id])
    end

    def edit
        @goal = Goal.find(params:[:id])
    end

    def update
        
    end

    private

    def goal_params
        params.require(:goal).permit(:name)
    end
end
