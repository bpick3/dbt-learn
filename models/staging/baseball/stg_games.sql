select 
    gameId as game,
    seasonId as season,
    year,
    awayTeamName as away,
    awayFinalRuns as away_score,
    homeTeamName as home,
    homeFinalRuns as home_score,
    outcomeDescription as outcome

from bigquery-public-data.baseball.games_post_wide