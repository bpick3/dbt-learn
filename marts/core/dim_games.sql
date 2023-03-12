with games as (

    select * from {{ ref('stg_games') }}

),

schedules as (

    select * from {{ ref('stg_schedules') }}

),

game_schedules as (

    select
        gameId,

        min(startTime) as start_time,
        sum(attendance) as attendance,
        sum(duration/60.0) as hours

    from schedules

    group by 1

),

final as (

    select  
        games.gameId,
        games.awayTeamName,
        games.homeTeamName,
        games.start_time,
        games.duration
    
    from games

    left join game_schedules using (gameId)

)

select * from final 