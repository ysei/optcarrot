require 'rbconfig'

class IO
  if File.exists?("/proc/#{$$}/fd")
    def stty(*args)
      `stty #{args.join(' ')} < /proc/#{$$}/fd/#{fileno}`
    end
  else
    def stty(*args)
      `stty #{args.join(' ')}`
    end
  end

  def raw!(*)
    stty('raw -echo')
  end

  def cooked!(*)
    stty('-raw')
  end
end
