with source as (

    select * from {{source('dbt_project','employee')}}
)

select * from source;

-- emp_info as (
--     select emp_id,emp_name,dept_id
--     from emp_source
--     join {{ source('dbt_schema', 'department')}} using (dept_id)
--   ORDER BY incremental_salesorder.create_date
-- )
