-- xss contiene la differenza tra massimo e minimo di ogni sottolista ed eventuali liste vuote devono essere ignorate
-- diffMaxMin [[1,2,3],[4,5],[],[10,7,8]] = [2,1,3]
diffMaxMin :: [[Int]] -> [Int]
diffMaxMin xss = [maximum x - minimum x | x<-xss, not (null x)]

testaCodaUguali :: [[Int]] -> [[Int]]
testaCodaUguali xs = [x | x<-xs, not (null x), head x == last x]
