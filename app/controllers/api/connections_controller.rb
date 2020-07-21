class Api::ConnectionsController < ApplicationController

  def index
    # we should always strive to take advantage of associations especially in the use of creating our backend
        # it makes no difference it we append #all or not, they are just methods for utilizing active record thru rails
            # its as if we are adding a SELECT * even though Active Record inserts it by default
    @connections = current_user.connections.all
    render "api/connections/index"
  end

  def create
        # To the future a/A student reading this code for help...... If you need me to explain the code to you i can be easily reached at dfbourdier@gmail.com 
            # You will figure this out, just email me with the subject line: "a/A student needing help with MapmyRun Clone"
        # created both ways so simulate two connections, thats why we create while indexing into strong_params
      @connection1 = Connection.new({requester: strong_params[:requester], requestee: strong_params[:requestee]}) 
      @connection2 = Connection.new({requester: strong_params[:requestee], requestee: strong_params[:requester]}) 

      if @connection1.save && @connection2.save
        render "api/connections/show"
      else
          render json: @connection1.errors.full_messages, status: 422
      end
  end

  def destroy
        # parans is referring to the http request that the rails controller receives from the router OR more accurately;
            # our url we are receiving from our api util's ajax request for connection deletion located at connection_api_util.js
    @connection1 = current_user.connections.find(params[:id])
    @connection2 = Connection.find_by( { requester: @connection1['requestee'] } )

      if @connection1 && @connection2
        # i had to destroy the second connection first else an error would have shown 
            # for trying to reference the first destroyed connection
        @connection2.destroy
        @connection1.destroy
      else
          render json: ["Error deleting connection"], status: 422
      end 
  end

    private 

    def strong_params
        params.require(:connection).permit(:requester, :requestee)
    end


end
