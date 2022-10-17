ice_cream = int(input("Введите число шариков: "))

if ice_cream % 5 == 0 or ice_cream % 3 == 0 :
    print(f"Вы можете купить {ice_cream} шариков мороженого")
else:
    print(f"Вы не можете купить {ice_cream} шариков")