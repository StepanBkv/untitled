#1.7 Дан целочисленный массив.Необходимо осуществить
#циклический сдвиг элементов массива вправо на две позиции.
# 1.19 Дан целочисленный массив.
# Необходимо осуществить циклический сдвиг элементов массива вправо на одну позицию.
# 7, 19, 31, 43, 55
def shift_num lst, k = 1
  lst.pop(k).reverse.each { |i| lst.unshift(i) }
  #lst.rotate(k)
  lst
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
  lst.sort!.uniq.map { |i| lst.count(i) }.zip(lst.uniq).sort.reverse.map { |i| [i[1]] * i[0] }.each { |i| i.each { |j| lst1.push(j)  } }
  lst1
end

print arrange_list lst = [4,3,4,32,34,12,3,5,213,5,2,3,21,4,2,32,5]

