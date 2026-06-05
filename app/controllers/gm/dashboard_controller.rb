module Gm
  class DashboardController < ApplicationController
    def index
      # dashboard data can be prepared here
      @active_quests_count = Quest.where(published: true).count
    end
  end
end
