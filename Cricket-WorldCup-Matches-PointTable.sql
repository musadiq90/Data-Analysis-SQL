/* Formatted on 10/24/2023 2:07:34 PM (QP5 v5.381) */
CREATE TABLE OFSBASEL.ICC_WORLD_CUP
(
    MATCH_NO    INTEGER,
    TEAM_1      VARCHAR2 (20 BYTE),
    TEAM_2      VARCHAR2 (20 BYTE),
    WINNER      VARCHAR2 (20 BYTE)
);

COMMIT;

  SELECT *
    FROM ICC_WORLD_CUP
ORDER BY MATCH_NO DESC;


--INSERT DATA INTO TABLE 
--

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (22,
             'PAK',
             'AFG',
             'AFG');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (21,
             'IND',
             'NZ',
             'IND');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (20,
             'SA',
             'ENG',
             'SA');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (19,
             'NED',
             'SL',
             'SL');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (18,
             'PAK',
             'AUS',
             'AUS');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (17,
             'BAN',
             'IND',
             'IND');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (16,
             'NZ',
             'AFG',
             'NZ');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (15,
             'NED',
             'SA',
             'NED');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (14,
             'SL',
             'AUS',
             'AUS');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (13,
             'AFG',
             'ENG',
             'AFG');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (12,
             'PAK',
             'IND',
             'IND');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (11,
             'BAN',
             'NZ',
             'NZ');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (10,
             'SA',
             'AUS',
             'SA');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (9,
             'AFG',
             'IND',
             'IND');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (8,
             'SL',
             'PAK',
             'PAK');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (7,
             'ENG',
             'BAN',
             'ENG');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (6,
             'NZ',
             'NED',
             'NZ');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (5,
             'AUS',
             'IND',
             'IND');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (4,
             'SA',
             'SL',
             'SA');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (3,
             'AFG',
             'BAN',
             'BAN');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (2,
             'PAK',
             'NED',
             'PAK');

INSERT INTO ICC_WORLD_CUP (MATCH_NO,
                           TEAM_1,
                           TEAM_2,
                           WINNER)
     VALUES (1,
             'ENG',
             'NZ',
             'NZ');

COMMIT;



--CTE to check the Final Table


WITH
    CTE
    AS
        ((  SELECT TEAM_1       AS TEAMS,
                   COUNT (*)    AS TOTAL_MATCH,
                   SUM (
                       CASE
                           WHEN WINNER = TEAM_1 THEN 2
                           WHEN WINNER = 'DRAW' THEN 2
                           ELSE 0
                       END)     AS POINTS
              FROM ICC_WORLD_CUP
          GROUP BY TEAM_1)
         UNION ALL
         (  SELECT TEAM_2       AS TEAMS,
                   COUNT (*)    AS TOTAL_MATCH,
                   SUM (
                       CASE
                           WHEN WINNER = TEAM_2 THEN 2
                           WHEN WINNER = 'DRAW' THEN 2
                           ELSE 0
                       END)     AS POINTS
              FROM ICC_WORLD_CUP
          GROUP BY TEAM_2))
  SELECT TEAMS,
         SUM (TOTAL_MATCH)                    AS TOTAL_MATCH,
         SUM (POINTS / 2)                     AS WINS,
         SUM (TOTAL_MATCH - (POINTS / 2))     AS LOSSES,
         SUM (POINTS)                         AS POINTS
    FROM CTE
GROUP BY TEAMS
ORDER BY WINS DESC, POINTS DESC