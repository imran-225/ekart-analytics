

INSERT OVERWRITE TABLE perfect_returns_l3_fact

select
max(T1.seller_type) as seller_type,
T1.vendor_tracking_id as vendor_tracking_id,
max(T1.ekl_shipment_type) as ekl_shipment_type,
max(T1.ekl_fin_zone) as ekl_fin_zone,
max(T1.reverse_shipment_type) as reverse_shipment_type,
max(T1.shipment_create_at_date_key) as shipment_create_at_date_key,
max(T1.p2d_without_cd_breach) as p2d_without_cd_breach,
max(T1.p2d_without_cd_breach_old) as p2d_without_cd_breach_old,
max(T1.p2d_breach) as p2d_breach,
max(T1.damage_breach) as damage_breach,
max(T1.misshipment_breach) as misshipment_breach,
max(T1.missing_product_breach) as missing_product_breach,
max(T1.e2e_breach) as e2e_breach,
max(T1.customer_contact_breach) as customer_contact_breach,
max(T1.perfect_return) as perfect_return,
max(T1.rto_create_date_key) as rto_create_date_key,
max(T1.fsd_first_dh_received_date_key) as fsd_first_dh_received_date_key,
max(T1.delivery_date_key) as delivery_date_key,
max(T1.return_promise_date_key) as return_promise_date_key,
max(T1.shipment_current_status) as shipment_current_status,
max(T1.analytic_business_unit) as analytic_business_unit,
max(T1.analytic_category) as analytic_category,
max(T1.analytic_sub_category) as analytic_sub_category,
max(T1.analytic_super_category) as analytic_super_category,
max(T1.analytic_vertical) as analytic_vertical,
max(T1.brand) as brand,
max(T1.destination_city) as destination_city,
max(T1.destination_state) as destination_state,
max(T1.destination_zone) as destination_zone,
max(T1.first_recvd_dh_name) as first_recvd_dh_name,
max(T1.first_recvd_mh_name) as first_recvd_mh_name,
max(T1.last_recvd_dh_name) as last_recvd_dh_name,
max(T1.last_recvd_mh_name) as last_recvd_mh_name,
max(T1.reverse_pickup_hub_name) as reverse_pickup_hub_name,
max(T1.reverse_pickup_hub_type) as reverse_pickup_hub_type,
max(T1.reverse_pickup_hub_zone) as reverse_pickup_hub_zone,
max(T1.seller_city) as seller_city,
max(T1.seller_name) as seller_name,
max(T1.shipment_first_consignment_co_loader) as shipment_first_consignment_co_loader,
max(T1.shipment_last_consignment_co_loader) as shipment_last_consignment_co_loader,
max(T1.source_city) as source_city,
max(T1.source_state) as source_state,
max(T1.source_zone) as source_zone,
max(T1.no_of_attempts) as no_of_attempts,
max(T1.no_of_attempts_customer_dependency) as no_of_attempts_customer_dependency,
max(T1.no_of_attempts_ekl_dependency) as no_of_attempts_ekl_dependency,
max(T1.rvp_first_pickup_attempt_date_key) as rvp_first_pickup_attempt_date_key,
max(T1.rvp_first_pickup_attempt_datetime) as rvp_first_pickup_attempt_datetime,
max(T1.rvp_pending_flag) as rvp_pending_flag,
max(T1.rvp_pickup_complete_days) as rvp_pickup_complete_days,
max(T1.rvp_pickup_completed_date_key) as rvp_pickup_completed_date_key,
max(T1.rvp_pickup_completed_datetime) as rvp_pickup_completed_datetime,
max(T1.rvp_pickup_pending_days) as rvp_pickup_pending_days,
max(T1.rvp_schedule_date_key) as rvp_schedule_date_key,
max(T1.rvp_schedule_datetime) as rvp_schedule_datetime,
max(T1.p2d_breach_bucket) as p2d_breach_bucket,
max(T1.first_dh_outscan_date_key) as first_dh_outscan_date_key,
max(T1.first_mh_tc_outscan_date_key) as first_mh_tc_outscan_date_key,
max(T1.first_mh_tc_receive_date_key) as first_mh_tc_receive_date_key,
max(T1.fsd_last_dh_received_date_key) as fsd_last_dh_received_date_key,
max(T1.last_dh_outscan_date_key) as last_dh_outscan_date_key,
max(T1.last_mh_tc_outscan_date_key) as last_mh_tc_outscan_date_key,
max(T1.last_mh_tc_receive_date_key) as last_mh_tc_receive_date_key,
max(T1.first_dh_outscan_time_key) as first_dh_outscan_time_key,
max(T1.first_mh_tc_outscan_time_key) as first_mh_tc_outscan_time_key,
max(T1.rto_first_received_date_key) as rto_first_received_date_key,
max(T1.shipment_delivery_date_key) as shipment_delivery_date_key,
max(T1.complete_date_key) as complete_date_key,
max(T1.number_of_hops) as number_of_hops,
max(T1.qcd_detailed_pv_qc_verif_reason) as qcd_detailed_pv_qc_verif_reason,
max(T1.qcd_detailed_pv_qc_verif_sub_reason) as qcd_detailed_pv_qc_verif_sub_reason,
max(T1.qcd_initial_pv_qc_verif_reason) as qcd_initial_pv_qc_verif_reason,
max(T1.qcd_initial_pv_qc_verif_sub_reason) as qcd_initial_pv_qc_verif_sub_reason,
max(T1.customer_contact_date_key) as customer_contact_date_key,
max(T1.customer_contact_issue) as customer_contact_issue,
max(T1.customer_dependency_flag) as customer_dependency_flag,
max(T1.return_item_reason) as return_item_reason,
max(T1.return_item_sub_reason) as return_item_sub_reason,
max(T1.return_reason) as return_reason,
max(T1.return_status) as return_status,
max(T1.shipment_carrier) as shipment_carrier,
max(T1.shipment_dg_flag) as shipment_dg_flag,
max(T1.surface_mandatory_flag) as surface_mandatory_flag,
max(T1.e2e_breach_with_ofd_brefore_promise) as e2e_breach_with_ofd_brefore_promise,
max(T1.fsd_number_of_ofd_attempts) as fsd_number_of_ofd_attempts,
max(T1.fkl_current_status) as fkl_current_status,
max(T1.breach_count) as breach_count,
max(T1.total_return) as total_return


from bigfoot_external_neo.scp_ekl__perfect_returns_l3_hive_fact as T1

where T1.return_status not in ('scheduled','undelivered','cancelled','cancel_requested')
group by T1.vendor_tracking_id;