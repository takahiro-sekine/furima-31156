## user

|     Column       |  Type  |            Options          |
|------------------|--------|-----------------------------|
|first_name        |string  |null:false                   |
|last_name         |string  |null:false                   |
|kana_first_name   |string  |null:false                   |
|kana_last_name    |string  |null:false                   |
|email             |string  |null:false,unique: true      |
|nickname          |string  |null:false                   |
|birthday          |date    |null:false                   |
|encrypted_password|string  |null:false                   |

### Association
- has_many: item
- has_many: order


## item

|     Column     |  Type  |            Options          |
|----------------|--------|-----------------------------|
|product_name    |string  |null:false                   |
|explanation     |text    |null:false                   |
|category_id	   |integer |null:false                   |
|status_id		   |integer |null:false                   |
|burden_id		   |integer |null:false                   |
|price				   |integer |null:false                   |
|source_id		   |integer |null:false                   |
|shipping_days_id|integer |null:false                   |

### Association
- belong_to: user
- has_one: order

## address

|    Column    |  Type   |            Options          |
|--------------|---------|-----------------------------|
|postal_code	 |string   |null:false                   |
|prefectures_id|integer  |null:false                   |
|municipalities|text     |null:false                   |
|house_number	 |text     |null:false                   |
|building_name |text     |                             |
|phone_number	 |string   |null:false                   |
|order         |reference|null:false, foreign_key: true|
### Association
- belong_to: order


## order

|    Column    |  Type   |              Options          |
|--------------|---------|-------------------------------|
|user       	 |reference|null:false, foreign_key: true  |
|item          |reference|null:false, foreign_key: true  |

### Association
- belong_to: user 
- belong_to: item
- has_one: address