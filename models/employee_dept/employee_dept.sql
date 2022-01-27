{{ config(materialized='table') }}

with source_data as (
  select * from {{ source('employee_dept', 'employee') }} 
),
final as (select emp_id,emp_name,dept_id from source_data
inner join {{ source('employee_dept', 'department') }})
select * from final;