## user

|     Column       |  Type  |            Options          |
|------------------|--------|-----------------------------|
|first_name        |string  |null:false                   |
|last_name         |string  |null:false                   |
|kana_first_name   |string  |null:false                   |
|kana_last_name    |string  |null:false                   |
|email             |string  |null:false,unique: true      |
|nickname          |string  |null:false,unique: true      |
|birthday          |date    |null:false                   |
|encrypted_password|string  |null:false                   |

### Association
- has_many: product 
- has_many: product_purchase
- has_many: product_history

## product

|     Column    |  Type  |            Options          |
|---------------|--------|-----------------------------|
|product_name   |stiring |null:false                   |
|explanation    |text    |null:false                   |
|category_id	  |integer |null:false                   |
|status_id		  |integer |null:false                   |
|burden_id		  |integer |null:false                   |
|price				  |integer |null:false                   |
|source_id		  |integer |null:false                   |
|shippingdays_id|datetime|null:false                   |

### Association
- belong_to: user
- has_one: product_purchase
- has_one: purchase_history

## purchase_history

|    Column    |  Type  |            Options          |
|--------------|--------|-----------------------------|
|postal_code	 |string  |null:false                   |
|prefectures_id|integer |null:false                   |
|municipalities|text    |null:false                   |
|address			 |text    |null:false                   |
|building_name |text    |                             |
|phone_number	 |string  |null:false                   |
### Association
- belong_to: user
- belong_to: product


## product_history

|    Column    |  Type   |  Options          |
|--------------|---------|-------------------|
|user       	 |reference|                   |
|product       |reference|                   |

### Association
- belong_to: user 
- belong_to: product