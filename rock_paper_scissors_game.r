## replit link -> https://replit.com/@aphavika/RRock-Paper-Scissors-Game?v=1

## let's play PaoYingChub
## play unlimit times
## summary the play result

# loop control
times <- 0
user_win <- 0
bot_win <- 0
tie <- 0

# greeting
print("This is PaoYingChub Game")
print("Hi, What's your name ?")
user_name <- readLines("stdin", n=1)
print(paste("Hi", user_name, "start game enters 0"))
start <- readLines("stdin", n=1)
while (start == 0){
  print("How to play?:  enter 1: rock, 2: paper, 3: scissors")
  print("To quit: enter 4")
  user_play <- readLines("stdin", n=1)
  bot_play <- sample(c(1,2,3), size =1)

  ## play
  if (user_play == bot_play){
    print(paste("user:",user_play, "vs bot:",bot_play))
    print(" result: tie")
    
    tie <- tie +1
  } else 
    if(user_play == 1 & bot_play == 2 |
      user_play == 2 & bot_play == 3 |
      user_play == 3 & bot_play == 1){
      print(paste("user:",user_play, "vs bot:",bot_play))
      print("result: lose") 
      
      bot_win <- bot_win +1
      }
      else if (user_play == 2 & bot_play == 1 |
      user_play == 3 & bot_play == 2 |
      user_play == 1 & bot_play == 3){
      print(paste("user:",user_play, "vs bot:",bot_play))
      print("result: win") 
      
      user_win <- user_win +1
      }
  ## break
  if (user_play == 4){
    print("play result")
    print(paste("player win:", user_win))
    print(paste("bot win:", bot_win))
    print(paste("tie:",tie))
    print("----------------BYE BYE------------------")
    break
  
  }
  
}
