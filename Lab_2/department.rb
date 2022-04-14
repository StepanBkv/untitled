class Department
  attr_accessor :name
  attr_reader :phone
  @@count_object = 0
  @@departmnet_array = []

  def initialize name, phone, duty
    @name = name
    self.phone = phone
    @@count_object += 1
    @duty = duty
    @@departmnet_array.push(self)
  end

  def phone= (phone)
    if valid_phone phone
      @phone = phone
    else
      raise("Некорректный номер телефона!")
    end
  end

  def Department.get_count_object
    @@count_object
  end

  def Department.get_department_array
    @@departmnet_array
  end
  def duty
    @duty
  end
  def duty= str
    @duty.push(str)
  end

  def duty_dedicated= count
    @duty_dedicated = count
  end

  def deleted_duty_dedicated
    @duty[@duty_dedicated] = nil
    @duty.compact!
    if !@duty.empty? and @duty_dedicated != 0
      @duty_dedicated -= 1
    else
      @duty_dedicated == nil
    end
  end

  def text_duty_dedicated
    @duty[@duty_dedicated]
  end

  def text_duty_dedicated= (str)
    @duty[@duty_dedicated] = str
  end

  def show_duty_all
    self.to_s(@duty) { |i| i + ", "}
  end

  def to_s string_array
    sum_string = ""
    count = 0
    for i in string_array
      if block_given?
        if (string_array.size) - 1 != count
          sum_string += yield i
        else
          sum_string += i
        end
      else
        sum_string += i
      end
      count += 1
    end
    sum_string
  end

  def show_data
    self.to_s([@name, @phone]) { |i| i + " " }
  end

  def valid_phone phone
    (phone =~ /(8){1}[0-9]{10}/ and phone.size == 11) |
      (phone =~ /\+7{1}[0-9]{10}/ and phone.size == 12) |
      (phone =~ /[0-9]{10}/ and phone.size == 10)
  end

  def Department.valid_phone phone
    (phone =~ /(8){1}[0-9]{10}/ and phone.size == 11) |
      (phone =~ /\+7{1}[0-9]{10}/ and phone.size == 12) |
      (phone =~ /[0-9]{10}/ and phone.size == 10)
  end

  def Department.phone=(phone)
    if valid_phone phone
      @phone = phone
    else
      raise("Некорректный номер телефона!")
    end
  end
end

def read_from_txt file_name
  f = File.new(file_name)
  lst = f.read.split("\n")
  f.close
  #lst.map { |i| Department.new(i.split[0], i.split[1])}
  departmnet_array = []
  for i in lst
    departmet = Department.new(i.split[0], i.split[1], (i.split('duty: ')[1].split(", ")))
    departmnet_array.push(departmet)
  end
  departmnet_array
end

def write_to_txt department_array, file_name
  f = File.open(file_name, "w+")
  for i in department_array
    f.write("#{i.show_data} duty: #{i.show_duty_all}\n")
  end
  f.close
end

Department_array = read_from_txt "department_file"
print Department_array
print Department_array[0].duty
Department_array[0].duty = "Фрилансер"
print Department_array[0].duty
write_to_txt(Department_array, "department_file")
