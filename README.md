## user

| Column  |  Type  |            Options          |
|---------|--------|-----------------------------|
| name		|string  |null:false                   |
|kana_name|string  |null:false                   |
|email    |string  |null:false,unique: true      |
|nickname |string  |null:false,unique: true      |
|birthday |datetime|null:false                   |
|address  |string  |null:false                   |

### Association
- belong_to: product 
- belong_to: product_

## product

|   Column    |  Type  |            Options          |
|-------------|--------|-----------------------------|
|image			  |image   |null:false                   |
|product_name |stiring |null:false                   |
|explanation  |text    |null:false                   |
|category			|integer |null:false                   |
|status				|integer |null:false                   |
|burden				|integer |null:false                   |
|money				|integer |null:false                   |
|source				|integer |null:false                   |
|days				  |datetime|null:false                   |
### Association
- has_many: user
- has_one: product_purchase

## product_purchase

   Column    |  Type  |            Options          |
|--------------|--------|-----------------------------|
|card_num			 |integer |null:false                   |
|card_mon      |integer |null:false                   |
|sec_cord      |integer |null:false                   |
|postal_code	 |integer |null:false                   |
|prefectures	 |integer |null:false                   |
|municipalities|text    |null:false                   |
|phone_number	 |integer |null:false                   |
|address			 |text    |null:false                   |
|building name |text     |null:false                   |
### Association
- has_many: user
- belong_to: product
