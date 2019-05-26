import random
diceRoll1 = random.randint(1,6)
diceRoll2 = random.randint(1,6)
print(diceRoll1, diceRoll2)
diceRoll1 += 1
diceRoll2 += 1
dicePossibilities= [[0 for i in range(diceRoll1)] for j in range(diceRoll2)]
for i in range(diceRoll2):
    for j in range(diceRoll1):
        dicePossibilities[i][j] = i+j
        print(dicePossibilities[i][j],"\t", end=" ")
    print("")
