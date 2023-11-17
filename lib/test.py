from faker import Faker
from json import dump
from string import ascii_letters
from random import sample,randint

fake = Faker()

l = []

with open() as fp:
    for _ in range(100):  # Generating 10 fake products
        
        product_id = ""

        while True:
            product_id = "".join(["#",*sample(ascii_letters,5)])
            if not product_id in [item["product_key"] for item in l]:
                break

        product_name = ""
        
        while True:
            product_name = fake.word()
            if not product_name in [item["product_name"] for item in l]:
                break
        
        product_description = ""

        
        while True:
            product_description = fake.text()
            if not product_description in [item["product_description"] for item in l]:
                break

        product_real_price = 0
        product_augmented_price = 0
        
        while True:
            product_real_price = fake.random_number(digits=4)
            product_augmented_price = fake.random_number(digits=4)
            if product_augmented_price > product_real_price:
                break        

        product_picture = []

        OFSNotification = randint(30,60)

        