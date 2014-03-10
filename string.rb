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
    source_arr = str_hash.to_a                             # букву и кол-во ее повторов
    even_arr = source_arr.select { |i, k| k%2 == 0 }       # Выбираем четное кол-во наборов букв
    odd_arr = source_arr.select { |i, k| k%2 == 1 }        # Выбираем нечетное кол-во наборов букв
    odd_unit_arr = odd_arr.select { |i,k| k == 1 }         # Из нечетного - делаем 2 массива наборов
    odd_mult_arr = odd_arr.select { |i,k| k >1 }           # единичный и массив с кол-вом > 1

    if source_arr == even_arr && even_arr.size != 0  #   Сравниваем исходный массив с массивом, у которого
      puts 'Palindrome!'                             # выбраны только четные наборы букв. Если массивы равны
      return true                                    # и они не пустые -- это палиндром
    else
      o = odd_unit_arr.size
      m = odd_mult_arr.size
      case [o,m]                              #    Для нечетных наборов букв
          when [1,0]                          # Проверяем кол-во наборов единичных букв - если = 1 и
            puts 'Palindrome!'                # нет наборов с кол-вом > 1 -- это палиндром,
            return true
          when [0,1]                          # если кол-во единичных наборов = 0 и всего 1 набор
            puts 'Palindrome!'                # с кол-вом > 1 -- это палиндром.
            return true
          else                                # Все остальное - это не палиндром.
            puts 'Not a palindrome!'
            return false
      end
    end
  end
end
