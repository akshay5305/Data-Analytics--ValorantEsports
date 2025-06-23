use valorantesports;
CREATE VIEW vw_Tournament_Summary AS
SELECT
    Tournament,
    COUNT(DISTINCT Teams) AS Number_of_Teams,
    COUNT(DISTINCT Player) AS Number_of_Players
FROM
    players_stats
WHERE
    Tournament IN (
        'Champions Tour 2023: Lock-In Sao Paulo',
        'Champions Tour 2023: Pacific League',
        'Champions Tour 2023: EMEA League',
        'Champions Tour 2023: Americas League',
        'Champions Tour 2023: Masters Tokyo',
        'Valorant Champions 2023'
    )
GROUP BY
    Tournament;
    
select distinct player,`Match Type` from players_stats;
select DISTINCT Teams from players_stats
where  Tournament='Champions Tour 2023: Lock-In Sao Paulo' AND `Match Type`='Grand Final'
group by player,`Match Type` ;


select distinct player from players_stats
where Tournament='Champions Tour 2023: Lock-In Sao Paulo' AND `Match Type`='Grand Final'
AND teams='FNATIC' ;

SELECT Player, Teams
FROM players_stats
WHERE Tournament = 'Champions Tour 2023: Lock-In Sao Paulo'
  AND `Match Type` = 'Grand Final'
  AND Teams IN (
    SELECT DISTINCT Teams
    FROM players_stats
    WHERE Tournament = 'Champions Tour 2023: Lock-In Sao Paulo'
      AND `Match Type` = 'Grand Final'
  )
ORDER BY Teams, Player;

SELECT distinct( Teams) AS Header, Player
FROM players_stats
WHERE Tournament = 'Champions Tour 2023: Lock-In Sao Paulo'
  AND `Match Type` = 'Grand Final'
ORDER BY Teams, Player;

create view  contribution as
    SELECT
    Teams,
    CONCAT(Teams, ' ', Player) AS Player_,
    SUM(Kills) AS Total_Kills,
    SUM(Deaths) AS Total_Deaths,
    ROUND(SUM(Kills) * 1.0 / NULLIF(SUM(Deaths), 0), 2) AS KD_Ratio
FROM
    players_stats
WHERE
    Tournament = 'Champions Tour 2023: Lock-In Sao Paulo'
    AND `Match Type` = 'Grand Final'
    AND Stage = 'Playoffs'
GROUP BY
    Teams, Player
ORDER BY
    KD_Ratio DESC;

create view  TEAM_A as
select distinct teams from players_stats
where Tournament='Champions Tour 2023: Lock-In Sao Paulo' AND `Match Type`='Grand Final'
limit 1
 ;

Create view  TEAM_B as
select distinct teams from players_stats
where Tournament='Champions Tour 2023: Lock-In Sao Paulo' AND `Match Type`='Grand Final'
limit 1 offset 1
 ;
 


select DISTINCT `Match Type`,teams from players_stats
where Tournament='Champions Tour 2023: Lock-In Sao Paulo' ;


select `Match Type`
from players_stats
where Tournament='Champions Tour 2023: Lock-In Sao Paulo' ;

create view TEAMS as
select count(distinct teams) as Teams
from  players_stats
where Tournament='Champions Tour 2023: Lock-In Sao Paulo';

create view PLAYERS as
select count(distinct player) as Players
from  players_stats
where Tournament='Champions Tour 2023: Lock-In Sao Paulo';

create view  KILLS as
SELECT SUM(Kills) as Kills
FROM players_stats
WHERE Tournament = 'Champions Tour 2023: Lock-In Sao Paulo';

select DISTINCT Teams from players_stats
where Tournament='Champions Tour 2023: Pacific League' and stage='Playoffs';

create view Sao_Paulo as
select DISTINCT Tournament from players_stats 
where Tournament='Champions Tour 2023: Lock-In Sao Paulo' and stage='Playoffs';
create view Pacific_Leagues as
select DISTINCT Tournament from players_stats
where Tournament='Champions Tour 2023: Pacific League' and stage='Playoffs';
create view champs as
select distinct tournament as Teams
from  players_stats
where Tournament='Valorant Champions 2023';

create view winner as 
select distinct teams as Teams
from  players_stats
where Tournament='Valorant Champions 2023' and `Match Type`='Grand Final'
limit 1;


