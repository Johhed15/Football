
# Football Viz
library(dplyr)
library(plotly)

# Now merge player_stats_data with players_data
players_combined <- players_data %>%
  left_join(players_stats_data, by = c("player_id", "team_id")) 

  
players_combined_match <- matches_data %>%  select(match_id,league_id, season) %>%
  left_join(players_combined,by = c("match_id"))

final_data <- teams_data %>%
  left_join(players_combined_match,by = c("team_id"))


viz_players <- function(league,xaxis,yaxis, Season, plot_type){

    if (!(Season %in% final_data$season)){
      print('Try an other season')
      stop()
    } 
    

    # Filtering the data
    players <- final_data %>%
      filter(season == Season, league_id == league) %>%
      group_by(player_id, player_name, team_name) %>% select(-c(league_id))%>% 
      summarize(across(c(where(is.numeric) ),sum)) 
   
    outlier_u_x <- mean(players[[xaxis]]) + 5 * sd(players[[xaxis]]) # getting extreme outliers
    outlier_l_x <- mean(players[[xaxis]]) - 5 * sd(players[[xaxis]])
    
    outlier_u_y <- mean(players[[yaxis]]) + 5 * sd(players[[yaxis]])
    outlier_l_y <- mean(players[[yaxis]]) - 5 * sd(players[[yaxis]])
    
    # adding them to the df
    players$outliers <- ifelse(players[[xaxis]]>outlier_u_x |players[[yaxis]]>outlier_u_y |
                                   players[[xaxis]] < outlier_l_x | players[[yaxis]]< outlier_l_y,1,0)
    if (league==5){
      league = 'Ligue 1'
    }
    # creating the plot
    plot_ly(players, x = ~get(xaxis), y = ~get(yaxis),
            text = ~paste("Player:",player_name,"<br>",
              "Team:", team_name, "<br>"),
            type = "scatter", mode = "markers",
            marker=list(color = ~factor(outliers), colorscale='Portland',
                      size = 10, line = list(color = 'white', width = 0.5),
                      opacity = 0.8, symbol = 'circle'),
            hoverinfo = "text") %>%
      layout(title = paste("Players from", league, " in season", Season),
             xaxis = list(title = xaxis),
             yaxis = list(title = yaxis),
             # Grid layout
             grid = list(rows = 2, columns = 2,
                         subplots = list(list(c(1, 2), c(3, 4))),
                         roworder = "top to bottom"),
             showlegend = FALSE)
  
  
  
  
}


Season = '2022/2023'
league = 5
yaxis='xG'
xaxis= 'xAG'

viz_players(league,xaxis,yaxis,Season)

