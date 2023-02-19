## replit link -> https://replit.com/@aphavika/Ordering-PizzaChatbot?v=1

## Pizza house chatbot
## Ordering pizza

# element
Pizza_df <- data.frame(id = c(1,2,3),
                      menu = c("Hawaiian","Veggie", "Pepperoni"),
                      M_price = c(12, 10, 12),
                      L_price = c(15,12,15))

Drink_df <- data.frame(id = c(0,1,2,3),
                      drink = c("Do drink","Water", "Soda","Juice"),
                      price = c(0,2,3,4))
# order
Piz_order <- NULL
Piz_size <- NULL
Piz_amount <- NULL
Piz_sum <- NULL
Drink_order <- NULL
Drink_amount  <- NULL

# Greeting
print("What kind of person doesn’t like pizza? .... A weirdough.")
print("Welcome to Weirdough Pizza House")

print("What's your name?")
Name <- readLines("stdin", n=1)
print(paste("Hi", Name, "Please tell us your contact number"))
Tel <- readLines("stdin", n=1)
print("What is your delivery address?")
Ad <- readLines("stdin", n=1)

print("Start your order !") 

# Dialogue 1 Pizza
control1 <- 0
while(control1 == 0){ 
  print(Pizza_df)
  print("please select your pizza id")
  q1 <- readLines("stdin", n = 1) 
  if(q1 %in% 1:3 ){
    Piz_order <- Pizza_df[[q1,2]]
} else 
   if (q1 != 1 &
      q1 != 2 &
      q1 != 3){
     print("Wrong input, please re-enter the site")
     control1 <- 1
   break}

  print("please select the pizza size 1: M , 2: L")
  q2 <- readLines("stdin", n = 1)
  q2 <- as.numeric(q2)
  if(q2 %in% 1:2 ){
    Piz_order <- Pizza_df[[q1,2]]
    Piz_size <- Pizza_df[[q1,(q2+2)]] 
} else 
   {
    print("Wrong input, please re-enter the site")
    control1 <- 1
   break}

  print("please select the amount")
  q3 <- readLines("stdin", n = 1)
  if(q3 %in% 1:99 ){
    Piz_order <- Pizza_df[[q1,2]]
    Piz_size <- Pizza_df[[q1,(q2+2)]]
    Piz_amount <- as.numeric(q3)
    Piz_sum <- Piz_size * Piz_amount
    print(paste("Your pizza order: ", Piz_amount, Piz_order))
    print(paste("Total pizza price: ",Piz_sum))
    break
} else 
   {
    print("Wrong input, please re-enter the site")
    control1 <- 1
   break}
}

# Dialogue 2 
while(control1 == 0){ 
  print(Drink_df)
  print("please select your drink id")
  q4 <- readLines("stdin", n = 1) 
  q4 <- as.numeric(q4)
  if(q4 %in% 1:3 ){
    Drink_order1 <- Drink_df[[(q4+1),2]]
    Drink_order2 <- Drink_df[[(q4+1),3]]
} else 
   if (q4 != 1 &
      q4 != 2 &
      q4 != 3 &
      q4 != 0){
    print("Wrong input, please re-enter the site")
    control1 <- 1
   break
} else 
   if (q4 == 0){
    Drink_order1 <- Drink_df[[(q4+1),2]]
    Drink_order2 <- Drink_df[[(q4+1),3]]
    Drink_sum <- 0
    print("Your drink order: No drink")
   break}
  
  print("please select the amount")
  q5 <- readLines("stdin", n = 1)
  if(q5 %in% 1:99 ){
    Drink_amount <- as.numeric(q5)
    Drink_sum <- Drink_order2 * Drink_amount
    print(paste("Your drink order: ", Drink_amount, Drink_order1))
    print(paste("Total drinl price: ",Drink_sum))
    Total <- Piz_sum + Drink_sum
    break
} else 
   {
    print("Wrong input, please re-enter the site")
    control1 <- 1
   break}
}

# Order Summary
if(control1 == 0){
  print("______________YOUR ORDER SUMMARY______________")
  print(paste("Name: ",Name))
  print(paste("Contact number: ",Tel))
  print(paste("Delivery address: ",Ad))
  print(paste("Pizza order: ", Piz_order,"pizza ",Piz_amount, "Total: ",Piz_sum,"$"))
  print(paste("Drink order: ", Drink_order1,Drink_order2, "Total: ",Drink_sum, "$"))
  print(paste("Total price:",Total, "$" ))
  print("__________________Thank You___________________")
} else 
{"Sorry for the inconvenience"}
