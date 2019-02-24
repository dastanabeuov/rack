class TimeCalculator
  
  #мне более понятнее покамись так. стану опытным учту обязательно!
  FORMATTED_VERSION = {
    'year' => '%Y',
    'month' => '%m',
    'day' => '%d',
    'hour' => '%H',
    'min' => '%M',
    'sec' => '%S'
  }.freeze  

  def initialize(formats)
    @formats = formats.split(',')
    #@format_time = ''
  end

  def valid? #все ли параметры верны
    return true if @formats.select { |i| i == FORMATTED_VERSION.keys.all? }
  end

  def unknown_formats #список неверных форматов
    @unknown_formats = []
    @formats.each do |f| 
      @unknown_formats.push(f) unless FORMATTED_VERSION.keys.include?(t)
    end
  end

  def formatted_time #отформатированное время
    #@formats.each { |t| @format_time += "#{FORMATTED_VERSION[t]}-" }
    #Time.now.strftime(@format_time).chop! + "\n"
    @formats.map { |format| FORMATTED_VERSION[format] }.join('-')
    Time.now.strftime(@formats)
  end

end