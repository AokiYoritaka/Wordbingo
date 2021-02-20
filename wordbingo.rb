#ビンゴカードのサイズSを入力
S = gets.to_i
s_array = Array.new(S){ gets.split } 
s_array_flatten = s_array.flatten

#選ばれた単語の数Nと、選ばれた単語をN行入力
N = gets.to_i
n_array = Array.new(N){ gets.chomp }

s_size = Array.new(S * S)

n_array.each { |word|
    if mark = s_array_flatten.find_index(word)
        s_size[mark] = true
    end
}

card = s_size.each_slice(S).to_a

#縦・横・ななめのいずれか1列にあるSマスが揃って印（true）がついているかどうかを判定
Horizontal = card.any?(&:all?) 
Vertical = card.transpose.any?(&:all?)
diagonal_A = Array.new(S){|i| card[i][i]}.all?
diagonal_B = Array.new(S){|i| card[i][S-i-1]}.all?

#勝利条件を満たす場合yes、そうでなければnoを出力
if Horizontal or Vertical or diagonal_A or diagonal_B
    puts "yes"
else
    puts "no"
end