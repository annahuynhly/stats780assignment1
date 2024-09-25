
convert_to_hex = function(hex_colour){
  #' Ensures the hex codes are in the correct format for plot building.
  hex_colour = gsub(" ", "", hex_colour)
  first_char = substr(hex_colour, 1, 1)
  if(first_char != "#"){
    return(paste("#", hex_colour, sep = ""))
  } else {
    return(hex_colour)
  }
}

comparison_barplot = function(dataset, crop_id, colours = c("#0092d6", "#da1a1a")){
  #' Making a comparison barplot between Manitoba and Saskatchewan.
  #' @param dataset is the data.frame containing the data.
  #' @param crop_id is the name of the crop. For example, "Soybeans".
  #' @param colours a vector where the first value represents Manitoba and the second represents 
  #' Saskatchewan.
  production_type = paste0(crop_id, "_Production")
  title_name = paste0("Stacked Bar Plot of ", crop_id ," Production from Manitoba and Saskatchewan")
  # (GitHub Copilot helped with the skeleton)
  ggplot(dataset, aes(x = factor(Year), y = !!sym(production_type), fill = Region)) +
    geom_bar(stat = "identity") + 
    labs(title = title_name, x = "Year", 
         y = paste0("Amount of Plots Used for ", crop_id, " Production")) +
    theme_minimal() +       
    scale_fill_manual(values = colours[c(1, 2)])
}

comparison_lineplot = function(dataset, crop_id, colours = c("#0092d6", "#da1a1a")){
  #' Placing two lines on one chat for both Manitoba and Saskatchewan.
  #' @param dataset is the data.frame containing the data.
  #' @param crop_id is the name of the crop. For example, "Soybeans".
  #' @param colours a vector where the first value represents Manitoba and the second represents 
  #' Saskatchewan.
  production_type = paste0(crop_id, "_Production")
  title_name = paste0("Line Plots of ", crop_id ," Production from Manitoba and Saskatchewan")
  # (GitHub Copilot helped with the skeleton)
  ggplot(dataset, aes(x = Year, y = !!sym(production_type), color = Region)) +
    geom_line(linewidth = 1) +   
    geom_point(size = 3) +      
    labs(title = title_name, x = "Year", 
         y = paste0("Amount of Plots Used for ", crop_id, " Production")) +  
    scale_color_manual(values = colours[c(1, 2)]) +
    theme_minimal()       
}

individual_barplot = function(dataset, type, crop_id, colour = c("#0092d6")){
  #' Constructing an individual bar plot for one of the provinces (of choice.)
  #' @param dataset is the data.frame containing the data.
  #' @param type refers to the province. Either "Manitoba" or "Saskatchewan".
  #' @param crop_id is the name of the crop. For example, "Soybeans".
  #' @param colours a vector where the first value represents Manitoba and the second represents 
  #' Saskatchewan.
  production_type = paste0(crop_id, "_Production")
  
  if(type == "Manitoba"){
    graph_title = paste0("Stacked Bar Plot of ", crop_id, " Production from Manitoba")
    individual_data = subset(dataset, Region == "Manitoba")
  } else if (type == "Saskatchewan"){
    graph_title = paste0("Stacked Bar Plot of ", crop_id, " Production from Saskatchewan")
    individual_data = subset(dataset, Region == "Saskatchewan")
  }
  # (GitHub Copilot helped with the skeleton)
  ggplot(individual_data, aes(x = factor(Year), y = !!sym(production_type))) +
    geom_bar(stat = "identity", fill = colour[1]) + 
    labs(title = graph_title, x = "Year", 
         y = paste0("Amount of Plots Used for ", crop_id, " Production")) + 
    theme_minimal()       
}

individual_lineplot = function(dataset, type, crop_id, colour = c("#0092d6")){
  #' Constructing an individual line plot for one of the provinces (of choice.)
  #' @param dataset is the data.frame containing the data.
  #' @param type refers to the province. Either "Manitoba" or "Saskatchewan".
  #' @param crop_id is the name of the crop. For example, "Soybeans".
  #' @param colours a vector where the first value represents Manitoba and the second represents 
  #' Saskatchewan.
  production_type = paste0(crop_id, "_Production")
  
  if(type == "Manitoba"){
    graph_title = paste0("Line Plot of ", crop_id, " Production from Manitoba")
    individual_data = subset(dataset, Region == "Manitoba")
  } else if (type == "Saskatchewan"){
    graph_title = paste0("Line Plot of ", crop_id, " Production from Saskatchewan")
    individual_data = subset(dataset, Region == "Saskatchewan")
  }
  # (GitHub Copilot helped with the skeleton)
  ggplot(individual_data, aes(x = Year, y = !!sym(production_type))) +
    geom_line(linewidth = 1, color = colour[1]) +   
    geom_point(size = 3, color = colour[1]) +     
    labs(title = graph_title, x = "Year", 
         y = paste0("Amount of Plots Used for ", crop_id, " Production")) + 
    theme_minimal()       
}
