class Admin::DelayedJobsController < Admin::BaseController
  def index
    @jobs = Delayed::Job.page(params[:page]).order("run_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jobs }
    end
  end

end
