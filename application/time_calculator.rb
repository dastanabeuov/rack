class TimeCalculator
  
  KNOWN_FORMATS = %w[year month day hour min sec]

  def initialize(formats)
    @formats = formats.split(',')
    @unknown_formats = []
    @format_time = '' 
  end

  def form_time_string
    valid?
    return unknown_formats if unknown_formats.any?
    formatted_time
  end

  def valid? #все ли параметры верны
    @formats.each { |t| @unknown_formats.push(t) unless KNOWN_FORMATS.include?(t) }
  end

  def unknown_formats #список неверных форматов
    @unknown_formats
  end

  def formatted_time #отформатированное время
    @formats.each { |t| @format_time += "#{ Time.now.strftime(t) }-" }
    @format_time.chop! + "\r\n"
  end

end