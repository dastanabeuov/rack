class TimeCalculator

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
  end

  def valid? #все ли параметры верны
    return true if @formats.select { |format| FORMATTED_VERSION.keys.include?(format) }
  end

  def unknown_formats #список неверных форматов
    unknown_formats = @formats.select { |format| format != FORMATTED_VERSION.keys }
  end

  def formatted_time #отформатированное время
    format_time = @formats.map { |format| FORMATTED_VERSION[format] }.join('-')
    Time.now.strftime(format_time)
  end

end