class TimeCalculator
  
  KNOWN_FORMATS = %w[year month day hour min sec]
  FORMATTED_FORMAT = {
    'year' => '%Y',
    'month' => '%m',
    'day' => '%d',
    'hour' => '%H',
    'min' => '%M',
    'sec' => '%S'
  }.freeze  

  def initialize(formats)
    @formats = formats.split(',')
    @format_time = ''
  end

  def valid? #все ли параметры верны
    return true if @formats.select { |i| i == KNOWN_FORMATS }
  end

  def unknown_formats #список неверных форматов
    valid?
  end

  def formatted_time #отформатированное время
    @formats.each { |t| @format_time += "#{FORMATTED_FORMAT[t]}-" }
    Time.now.strftime(@format_time).chop! + "\n"
    #вариант с (join) выдает ошибку | а с (.chop! + "\n") все нормально
  end

end