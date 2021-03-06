class ApplicationController < ActionController::Base

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, prepend: true
  before_action :set_paper_trail_whodunnit


  def index
    user = current_user

    if user and user.is_volunteer?
      @activities = Activity.next_activities
    else
      @activities = Activity.next_activities(exclude_internal=true)
    end

  end

  def about

  end


  private

    def user_not_authorized
      flash[:alert] = 'Você não tem autorização para realizar esta ação.'
      redirect_to(request.referrer || root_path)
    end

end
