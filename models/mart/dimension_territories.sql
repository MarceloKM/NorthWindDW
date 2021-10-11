{{ config(materialized='table') }}

with
    region as (
        select *
        from {{ ref('stg_regions')}}
    )
    , territory as (
        select *
        from {{ ref('stg_dterritories')}}
    )


select * from territory
left join region on territory.region_id = region.region_id
