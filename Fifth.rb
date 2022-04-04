#1.7 Дан целочисленный массив.Необходимо осуществить
#циклический сдвиг элементов массива вправо на две позиции.
# 1.19 Дан целочисленный массив.
# Необходимо осуществить циклический сдвиг элементов массива вправо на одну позицию.
# 7, 19, 31, 43, 55
def shift_num lst, k = 1
  lst.pop(k).reverse.each { |i| lst.unshift(i) }
  #lst.rotate(k)
end

#print shift_num lst = [1, 2, 3, 4, 23, 5, 6], 7

#1.31 Дан целочисленный массив. Найти количество чётных элементов.

def even_size lst
  lst.select { |even| even % 2 == 0 }.size
end

#print even_size lst = [1,2,4,2,5,7,8,10]

#1.43 Дан целочисленный массив. Необходимо найти количество
#минимальных элементов.

def min_size lst
  lst.select { |i| i == lst.min }.size
end

#print min_size lst = [1,2,1,4,1,2,5,1,7,8,1,10]

#1.55. Для введенного списка построить новый список, который получен из
#начального упорядочиванием по количеству встречаемости
#элемента, То есть из списка [5,6,2,2,3,3,3,5,5,5] необходимо получить список
#[5,5,5,5,3,3,3,2,2,6].

def arrange_list lst
  lst1 = []
  # сначала создаём уникльный список, потом делаем такой же, но сколько повторяется каждый элемент в списке
  # далее создаём zip  в котором ключ - это количество повторений, сортируем и переворачиваем, чтобы максимальный был впереди
  # потом умножаем значение на ключ и у нас получается список списков
  # который потом с помощью each закидываем в новый список, и у нас получается  необходимый список
  # наверное реализация слишком сложная, но проще не придумал
  lst.sort!.uniq.map { |i| lst.count(i) }.zip(lst.uniq).sort.reverse.map { |i| [i[1]] * i[0] }.each { |i| i.each { |j| lst1.push(j)  } }
  lst1
end

#print arrange_list lst = [4,3,4,32,34,12,3,5,213,5,2,3,21,4,2,32,5]

puts "Какую функцию вы хотите выполнить? \n 1. Сдвиг элементов массива вправо на 2.\n 2. Сдвиг элементов массива вправо на 1.
 3. Найти количество мин. эл. \n 4. Построить новый список, который получен из
нач. упорядоч. по кол-ву встречаемости. \n 5. Найти количество чётных элементов."
print "Введите: "
fun = gets.chomp.strip.to_i
puts "Откуда читать файл? \n 1. С клавиатуры \n 2. Из файла"
print "Введите: "
ls = gets.chomp.strip.to_i

case ls
when 1
  lst = gets.chomp.strip.split(',').map(&:to_i)

when 2
  print "Введите название файла: "
  file_name = gets.chomp.strip
  f = File.new(file_name)
  lst = f.read.split(',').map(&:to_i)
  f.close
end

case fun
when 1
  puts shift_num lst, k = 2
when 2
  puts shift_num lst
when 3
  puts min_size lst
when 4
  puts arrange_list lst
when 5
  puts even_size lst
end