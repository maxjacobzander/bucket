class GoalsController < ApplicationController

    def index
        @goals = Goal.all
    end

    def new
        @goal = Goal.new(goal_params)
        if @goal.save
            redirect_to @goal
        else
            render :new
        end
    end
end
