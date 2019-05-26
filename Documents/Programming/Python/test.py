import random
myList = []
k = 0
while True:
    while len(myList) < 5:
        a = random.randint(1, 38)
        if (k == 0):
            myList.append(int(a))
            k=1
        else:
            aux = 0
            for y in myList:
                if (y == a):
                    aux = 1
                    break;
            if (aux == 0):
                myList.append(int(a))
    print(myList)
    op = input("Continue? type n to exit\n")
    if (op == 'n'):
        break
    myList = []
    k = 0

