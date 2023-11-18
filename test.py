from faker import Faker
from json import dump
from string import ascii_letters, digits
from random import sample, randint,choices,choice
from isbnlib import EAN13,is_isbn13

fake = Faker()

l = []

with open("./assets/test.json", "w") as fp:
    categories = [fake.word() for _ in range(10)]
    brands = [fake.word() for _ in range(10)]
    for _ in range(100): 
        print(_)
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

        product_category = choice(categories)

        
        product_brand = choice(brands)

        SKU = ""
        while True:
            SKU = "".join(sample(ascii_letters + digits, 8)).upper()
            if not SKU in [item["product_sku"] for item in l]:
                break

        UPC_A = ""
        while True:
            UPC_A = "".join(choices(digits,k= 12))
            if not UPC_A in [item["product_upc_a"] for item in l]:
                break

        EAN = ""
        while True:
            EAN = "".join( choices(digits,k= 13))
            if not EAN in [item["product_ean"] for item in l]:
                break

        ISBN = ""

        while True:
            ISBN = EAN13("".join(choices(digits,k= 13)))
            if not ISBN in [item["product_isbn"] for item in l]:
                break

        currency = "TND"

        metadata = {
            "size": fake.random_element(["XS", "S", "M", "L", "XL"]),
            "color": fake.color_name(),
            "weight": fake.random_number(digits=2),
            "dimensions": {
                "length": fake.random_number(digits=2),
                "width": fake.random_number(digits=2),
                "height": fake.random_number(digits=2),
            },
            "material": fake.word(),
            "style": fake.word(),
            "variants": fake.random_elements(
                elements=("Variant1", "Variant2", "Variant3"), length=3
            ),
            "product_features": fake.sentences(nb=3),
            "product_specifications": fake.sentences(nb=5),
            "reviews_and_ratings": {
                "average_rating": fake.pyfloat(
                    left_digits=1, right_digits=1, positive=True
                ),
                "number_of_reviews": fake.random_int(min=10, max=100),
            },
            "related_products": [fake.word() for __ in range(3)],
            "cross-sell_or_up-sell_products": [fake.word() for __ in range(2)],
        }

        l.append(
            {
                "product_id": product_id,
                "product_name": product_name,
                "product_description": product_description,
                "product_price": product_price,
                "product_sell_price": product_sell_price,
                "product_pictures": product_picture,
                "product_seuil": OFSNotification,
                "product_quantity": product_qunatity,
                "product_discount": discount,
                "product_status": status,
                "product_date": entry_date,
                "product_category": product_category,
                "product_brand": product_brand,
                "product_sku": SKU,
                "product_upc_a": UPC_A,
                "product_ean": EAN,
                "product_isbn": ISBN,
                "product_currency": currency,
                "product_metadata": metadata,
            }
        )

    dump(l, fp)
