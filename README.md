## user

| Column  |  Type  |            Options          |
|---------|--------|-----------------------------|
| name		|string  |null:false                   |
|kana_name|string  |null:false                   |
|email    |string  |null:false,unique: true      |
|nickname |string  |null:false,unique: true      |
|birthday |datetime|null:false                   |
|password |string  |null:false                   |

### Association
- has_many: product 
- has_many: product_purchase
- belong_to: product_history

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
- belong_to: purchase_history

## product_purchase

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
|user_id    	 |reference|                   |
|product_id    |reference|                   |

### Association
- has_many: user 
- has_one: product