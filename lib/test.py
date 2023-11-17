from faker import Faker
from json import dump
from string import ascii_letters
from random import sample, randint

fake = Faker()

l = []

with open("test.json", "w") as fp:
    for _ in range(100):  # Generating 10 fake products
        product_id = ""

        while True:
            product_id = "".join(["#", *sample(ascii_letters, 5)]).upper()
            if not product_id in [item["product_id"] for item in l]:
                break

        product_name = ""

        while True:
            product_name = fake.word().title()
            if not product_name in [item["product_name"] for item in l]:
                break

        product_description = ""

        while True:
            product_description = fake.text()
            if not product_description in [item["product_description"] for item in l]:
                break

        product_price = 0
        product_sell_price = 0

        while True:
            product_price = randint(1, 100)
            product_sell_price = randint(1, 100)
            if product_sell_price > product_price:
                break

        product_picture = []

        OFSNotification = randint(30, 60)

        product_qunatity = randint(65, 380)

        discount = 0

        status = "IN STOCK"

        entry_date = "01/09/2023"

        product_category = ""

        while True:
            product_category = fake.name()
            if not product_category in [item["product_category"] for item in l]:
                break

        product_brand = ""

        while True:
            product_brand = fake.name()
            if not product_brand in [item["product_brand"] for item in l]:
                break

        l.append(
            {
                "product_id": product_id,
                "product_name": product_name,
                "product_description": product_description,
                "product_price": product_price,
                "product_sell_price": product_sell_price,
                "product_picture": product_picture,
                "seuil": OFSNotification,
                "product_quantity": product_qunatity,
                "product_discount": discount,
                "product_status": status,
                "product_date": entry_date,
                "product_category": product_category,
                "product_brand": product_brand,
            }
        )

    dump(l, fp)