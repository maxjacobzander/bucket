class GoalsController < ApplicationController

    def index
        @goals = Goal.all
    end

    def new
        @goal = Goal.new
    end

    def create
        @goal = Goal.new(goal_params)
        if @goal.save
            redirect_to @goal
        else
            render :new
        end
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
