# Incorporate the random library
import random

# Print Title
print("Let's Play Rock Paper Scissors!")

# Specify the three options
options = ["r", "p", "s"]

# Computer Selection
#computer_choice = random.choice(options)
computer_choice = "r"
print(f"the computer chose {computer_choice}")

# User Selection
# user_choice = input("Make your Choice: (r)ock, (p)aper, (s)cissors? ")
user_choice = "s"
print(f"you chose {user_choice}")

# Run Conditionals
if (user_choice == "r" and computer_choice == "r"):
    print("its a tie")
elif (user_choice == "s") and computer_choice == "r":
    print("rock crushes scissors - the computer wins")

else:
    print("follow directions")
