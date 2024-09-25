
use_colours = reactive({
  if(input$colour_scheme_type == "manual"){
    c(convert_to_hex(input$comp_mani_colour), convert_to_hex(input$comp_sask_colour))
  } else {
    COLOUR_TRANSLATION[[input$colour_scheme_type]]
  }
})

individual_barplot_value = reactive({ #(GitHub Copilot helped with the skeleton)
  individual_barplot(dataset = GRAPHING_DATASET, 
                     type = input$select_region, 
                     crop_id = input$select_crop, 
                     colour = convert_to_hex(input$ind_colour))
})

individual_lineplot_value = reactive({ #(GitHub Copilot helped with the skeleton)
  individual_lineplot(dataset = GRAPHING_DATASET, 
                     type = input$select_region, 
                     crop_id = input$select_crop, 
                     colour = convert_to_hex(input$ind_colour))
})

comparison_barplot_value = reactive({ #(GitHub Copilot helped with the skeleton)
  comparison_barplot(dataset = GRAPHING_DATASET,
                     crop_id = input$select_crop,
                     colours = use_colours())
})

comparison_lineplot_value = reactive({ #(GitHub Copilot helped with the skeleton)
  comparison_lineplot(dataset = GRAPHING_DATASET,
                      crop_id = input$select_crop,
                      colours = use_colours())
})

# Making the comparison plots (GitHub Copilot helped with the skeleton)
output$comparison_crop_plot = renderPlot({
  if(input$type_graph == 1){ # Stacked Bar Plot case
    comparison_barplot_value()
  } else if (input$type_graph == 2){ # Line Plot case
    comparison_lineplot_value()
  }
})

# Making the comparison plots (GitHub Copilot helped with the skeleton)
output$individual_crop_plot = renderPlot({
  if(input$type_graph == 1){
    # Stacked Bar Plot case
    individual_barplot_value()
  } else if (input$type_graph == 2){
    # Line Plot case
    individual_lineplot_value()
  } 
})
