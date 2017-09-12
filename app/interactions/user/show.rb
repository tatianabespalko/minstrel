class User::Show < BaseInteraction
  def execute
    current_user
  end
end