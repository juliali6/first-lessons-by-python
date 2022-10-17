number = int(input("Enter number: "))

if number % 4 == 0 and number % 100 != 0 or number % 400 == 0:
    print("Високосный год")
else:
    print("Не високосный год")
