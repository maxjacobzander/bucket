class BucketListsController < ApplicationController

    def index
        @bucketlists = BucketList.all
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
