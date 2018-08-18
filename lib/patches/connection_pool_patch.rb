module ConnectionPoolPatch
  def self.included(base)
    base.establish_connection(DJ_DATABASE)

    def base.after_fork
      establish_connection(DJ_DATABASE)
    end
  end
end
