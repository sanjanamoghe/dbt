{{ config(materialized='table') }}

with source_data as (
  select * from {{ source('employee_dept', 'employee') }} 
),
final as (select emp_id,emp_name,{{ source('employee_dept', 'department') }}.dept_id,{{ source('employee_dept', 'department') }}.dept_name from source_data
 join {{ source('employee_dept', 'department') }} using (dept_id))
select * from final