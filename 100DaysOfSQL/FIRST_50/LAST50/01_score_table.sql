/*
You are given a table icc_world_cup that records the results of several cricket matches. Each row contains the names of two teams (Team_1 and Team_2) and the winner of the match (Winner).

Write a SQL query to generate a summary table for each team that shows:

The total number of matches played by the team
The total number of matches won by the team
The total number of matches lost by the team
The output should list each team, the number of matches played, won, and lost, sorted by the number of matches won in descending order.

*/

drop table if exists score_table;
create table score_table (
Team_1 varchar(20),
Teame_2 varchar(20),
Winner varchar(20)
);