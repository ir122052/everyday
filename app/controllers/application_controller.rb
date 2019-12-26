class ApplicationController < ActionController::Base

    include SessionsHelper

    private
    
    def require_user_logged_in
        unless logged_in?
        redirect_to login_url
        end
    end
    
    def count(task)
        date = Date.today
        @month_sum = @tasks.where(start_time: [date.beginning_of_month..date.end_of_month]).sum(:amount)
        @last_month_sum = @tasks.where(start_time: [date.prev_month.beginning_of_month..date.prev_month.end_of_month]).sum(:amount)
    end
end