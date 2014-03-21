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

    self.empty? ? (raise ArgumentError, 'Empty string') :   # Проверяем не пустая ли строка
    self.downcase_str.sort.each { |v| str_hash[v] += 1 }    # Из массива в хеш записываем
    source_arr = str_hash.to_a                              # букву и кол-во ее повторов
    even_arr = source_arr.select { |i, k| k%2 == 0 }        # Выбираем четное кол-во наборов букв
    odd_arr = source_arr.select { |i, k| k%2 == 1 }         # Выбираем нечетное кол-во наборов букв
    (even_arr.size >= 0 && odd_arr.size < 2) ? true : false # Если четные наборы  больше или равны нулю
  end                                                       # а нечетные наборы в ед. кол-ве либо отсутствуют
end                                                         # Это палиндром! - Все остальное - нет!
