class BucketListsController < ApplicationController

    def index
        @bucketlists = BucketList.all
    end

    def new
        @bucketlist = BucketList.new
    end

    def create
        @bucketlist = Bucketlist.new
        if @bucketlist.save
            redirect_to @bucketlist
        else
            render :new
        end
    end

    def edit
        @bucketlist = 

    end

    def update

    end
end
