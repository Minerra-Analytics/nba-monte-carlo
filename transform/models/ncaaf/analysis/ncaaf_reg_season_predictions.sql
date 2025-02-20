SELECT 
    game_id,
    home_team,
    Home.team AS home_short,
    home_team_elo_rating,
    visiting_team,
    Visitor.team AS vis_short,
    visiting_team_elo_rating,
    home_team_win_probability,
    winning_team,
    include_actuals,
    COUNT(*) AS occurances,
    {{ american_odds( 'home_team_win_probability/10000' ) }} AS american_odds
FROM {{ ref( 'ncaaf_reg_season_simulator' ) }} S
LEFT JOIN {{ ref( 'ncaaf_ratings' ) }} Home ON Home.team = S.home_team
LEFT JOIN {{ ref( 'ncaaf_ratings' ) }} Visitor ON Visitor.team = S.visiting_team
GROUP BY ALL



