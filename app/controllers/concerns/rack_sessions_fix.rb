module RackSessionsFix
  extend ActiveSupport::Concern

  class FakeRackSession < Hash
    def enabled?
      false
    end

    def destroy; end
  end

  included do
    before_action :fix_rack_sessions
  end

  def fix_rack_sessions
    request.env['rack.session'] = FakeRackSession.new
  end
end