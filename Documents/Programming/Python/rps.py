import random

def rpsCompare(user, computer):
    # check tie
    if (user == computer):
        return "Tie"

    if (user == "Rock"):
        if (computer == "Paper"):
            return "Defeat"
        else:
            return "Victory"
    
    if (user == "Paper"):
        if (computer == "Rock"):
            return "Victory"
        else:
            return "Defeat"
    
    if (user == "Scissors"):
        if (computer == "Paper"):
            return "Victory"
        else:
            return "Defeat"

def checkValid(user, op):
    if (op == 1):
        if (user == '1' or user == '2' or user == '3' or user == 'r' or user == 's' or user == 'p'):
            return 1
        else:
            return 0
    if (op == 2):
        if (user == 'y' or user == 'n'):
            return 1
        else:
            return 0

def getUserInput(op):
    # loop till valid answer
    while True:
        # rps check
        if (op == 1):
            user = input('Rock(1)\tPaper(2)\tScissors(3) ?\n')
            if (checkValid(user, 1) == 1):
                break;
        if (op == 2):
            user = input('Wish to continue? Y/N\n')
            if (checkValid(user, 2) == 1):
                return user

    if (user == 'r' or user == '1'):
        user = 'Rock';
    elif (user == 'p' or user == '2'):
        user = 'Paper';
    else:
        user = "Scissors";
    return user



gameOn = 1
op = ["Rock", "Paper", "Scissors"]
matchinfo = [[]]
score = []
score.append(0)
# game loop
while gameOn:

    # user input
    user = getUserInput(1)
    # computer input
    ai = op[random.randint(0,2)]

    # compare
    score.append(rpsCompare(user, ai))
    if (score[len(score)-1] == "Victory"):
        score[0] += 1
    matchinfo.append([user, ai])

    # print results
    print("")
    print("User\t\tComputer")
    print(matchinfo[len(matchinfo)-1][0],"\t\t", matchinfo[len(matchinfo)-1][1])
    print("\t ", end=" ")
    print(score[len(score)-1])
    print("Total Score = ", score[0])
    print("Number of Matches = ", len(score)-1)
    print("")

    # get user input for play again
    user = getUserInput(2)
    if (user == 'n'):
        gameOn = 0


