#coding utf-8
require "unicode"
class String

  def downcase
    Unicode::downcase(self)
  end

  def downcase_str
    self.gsub(' ', '').downcase.scan(/[a-zA-Zа-яА-Я]/)
  end

  def has_palindrome_anagram?

    str_hash = Hash.new(0)

    self.downcase_str.sort.each { |v| str_hash[v] += 1 }   # Из массива в хеш записываем
    shash_arr = str_hash.to_a                              # букву и кол-во ее повторов
    str_array = shash_arr.select { |i, k| k > 1 }          # Убираем единичные буквы
    sqr_array = shash_arr.select { |i, k| k == 1 }         # Выбираем единичные буквы
    swr_array = str_array.select { |i, k| k%2 == 1 }       # Выбираем нечетное кол-во букв

   # if shash_arr == str_array                         #   Сравниваем исходный массив с массивом, у которого
   #   puts 'palindrom'                                # убраны единичные буквы. Если массивы равны -
   #   return true                                     # это палиндром
   # elsif sqr_array.size < 2 && swr_array.size != 1   #   Проверяем кол-во единичных букв - если 1 -
   #   puts 'palindrom'                                # это палиндром. Проверяем кол-во групп нечетных букв
   #   return true                                     # в массиве - если не равно 1 - то палиндром
   # else                                              # Все остальное - это не палиндром.
   #   puts 'not palindrom'
   #   return false
   # end

    shash_arr == str_array || sqr_array.size < 2 && swr_array.size != 1

  end
end

