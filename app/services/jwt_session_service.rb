class JWTSessionService
  def self.execute(payload)
    JWTSessions::Session.new(payload: payload)
  end
end