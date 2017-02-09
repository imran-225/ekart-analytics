INSERT OVERWRITE TABLE fc_inventory_item_l0_hive_fact
select
final_table.warehouse_company as warehouse_company,
final_table.inventory_item_id as nventory_item_id,
final_table.inventory_item_storage_location_type as inventory_item_storage_location_type,
final_table.inventory_item_atp as inventory_item_atp,
final_table.inventory_item_created_timestamp as inventory_item_created_timestamp,
final_table.inventory_item_created_date_key as inventory_item_created_date_key,
final_table.inventory_item_created_time_key as inventory_item_created_time_key,
final_table.inventory_item_grn_id as inventory_item_grn_id,
final_table.inventory_item_is_in_transit as inventory_item_is_in_transit,
final_table.inventory_item_quantity as inventory_item_quantity,
final_table.inventory_item_storage_location_id as inventory_item_storage_location_id,
final_table.inventory_item_updated_at as inventory_item_updated_at,
final_table.inventory_item_updated_at_date_key as inventory_item_updated_at_date_key,
final_table.inventory_item_updated_at_time_key as inventory_item_updated_at_time_key,
final_table.inventory_item_warehouse_id as inventory_item_warehouse_id,
final_table.inventory_item_wh_serial_number_id as inventory_item_wh_serial_number_id,
final_table.inventory_item_wid as inventory_item_wid,
final_table.inventory_item_age_since_received as inventory_item_age_since_received,
final_table.inventory_item_age_since_last_updated as inventory_item_age_since_last_updated,
final_table.inventory_item_is_large_warehouse as inventory_item_is_large_warehouse,
final_table.product_key as product_key,
final_table.product_fsn as product_fsn,
final_table.product_listing_id as product_listing_id,
final_table.extra as extra,
final_table.product_id  as product_id,
final_table.inventory_item_storage_location_id_key as inventory_item_storage_location_id_key,
final_table.warehouse_dim_key as warehouse_dim_key,
final_table.wsn_display_id as wsn_display_id
from
(
select 'wsr' as warehouse_company,
i.entityid as inventory_item_id,
i.data.area as inventory_item_storage_location_type,
i.data.atp as inventory_item_atp,
i.data.created_at as inventory_item_created_timestamp,
lookup_date(i.data.created_at) as inventory_item_created_date_key,
lookup_time(i.data.created_at) as inventory_item_created_time_key,
i.data.grn_id as inventory_item_grn_id,
if(i.data.in_transit=TRUE,1,0) as inventory_item_is_in_transit,
i.data.quantity as inventory_item_quantity,
i.data.storage_location_id as inventory_item_storage_location_id,
i.data.updated_at as inventory_item_updated_at,
lookup_date(i.data.updated_at) as inventory_item_updated_at_date_key,
lookup_time(i.data.updated_at) as inventory_item_updated_at_time_key,
i.data.warehouse_id as inventory_item_warehouse_id,
i.data.wh_serial_number_id as inventory_item_wh_serial_number_id,
i.data.wid as inventory_item_wid,
datediff(from_unixtime(unix_timestamp()),to_date(i.data.created_at)) as inventory_item_age_since_received,
datediff(from_unixtime(unix_timestamp()),to_date(i.data.updated_at)) as inventory_item_age_since_last_updated,
if(i.data.warehouse_id like '%0_L',1,0) as inventory_item_is_large_warehouse,
lookupkey('product_detail_product_id',concat(p.entityid,'wsr')) as product_key,
p.data.fsn as product_fsn,
p.data.listing_id as product_listing_id,
1 as extra,
p.entityid as product_id,
lookupkey('storage_location_storage_id',concat(i.data.storage_location_id,'wsr'))  as inventory_item_storage_location_id_key,
lookupkey('warehouse_id',i.data.warehouse_id) as warehouse_dim_key,
i.data.wsn_display_id as wsn_display_id
from bigfoot_snapshot.dart_wsr_scp_warehouse_inventory_item_3_view_total i
LEFT OUTER JOIN bigfoot_snapshot.dart_wsr_scp_warehouse_product_detail_3_view_total  p
ON i.data.wid = p.data.wid 
Union all
select 'fki' as warehouse_company,
i2.entityid as inventory_item_id,
i2.data.area as inventory_item_storage_location_type,
i2.data.atp as inventory_item_atp,
i2.data.created_at as inventory_item_created_timestamp,
lookup_date(i2.data.created_at) as inventory_item_created_date_key,
lookup_time(i2.data.created_at) as inventory_item_created_time_key,
i2.data.grn_id as inventory_item_grn_id,
if(i2.data.in_transit=TRUE,1,0) as inventory_item_is_in_transit,
i2.data.quantity as inventory_item_quantity,
i2.data.storage_location_id as inventory_item_storage_location_id,
i2.data.updated_at as inventory_item_updated_at,
lookup_date(i2.data.updated_at) as inventory_item_updated_at_date_key,
lookup_time(i2.data.updated_at) as inventory_item_updated_at_time_key,
i2.data.warehouse_id as inventory_item_warehouse_id,
i2.data.wh_serial_number_id as inventory_item_wh_serial_number_id,
i2.data.wid as inventory_item_wid,
datediff(from_unixtime(unix_timestamp()),to_date(i2.data.created_at)) as inventory_item_age_since_received,
datediff(from_unixtime(unix_timestamp()),to_date(i2.data.updated_at)) as inventory_item_age_since_last_updated,
if(i2.data.warehouse_id like '%0_L',1,0) as inventory_item_is_large_warehouse,
lookupkey('product_detail_product_id',concat(p2.entityid,'fki')) as product_key,
p2.data.fsn as product_fsn,
p2.data.listing_id as product_listing_id,
1 as extra,
p2.entityid as product_id,
lookupkey('storage_location_storage_id',concat(i2.data.storage_location_id,'fki'))  as inventory_item_storage_location_id_key,
lookupkey('warehouse_id',i2.data.warehouse_id) as warehouse_dim_key,
i2.data.wsn_display_id as wsn_display_id
from bigfoot_snapshot.dart_fki_scp_warehouse_inventory_item_3_view_total i2 
left outer join bigfoot_snapshot.dart_fki_scp_warehouse_product_detail_2_view_total p2
on i2.data.wid=p2.data.wid 
) final_table
;
