
page_home = div(
  titlePanel("Creating Graphs of Different Crops"),
  sidebarLayout(
    sidebarPanel(
      # GitHub Copilot helped with the skeleton for this section, particularly, the possible inputs.
      selectInput(inputId = "select_crop", 
                  label = "Select a crop!", 
                  choices = ALL_CROP_TYPES,
                  selected = "Soybeans"),
      
      selectInput(inputId = "type_graph", 
                  label = "Select a type of graph to analyze.", 
                  choices = list("Stacked Bar Plot" = 1, "Line Plot" = 2),
                  selected = 2),
      
      selectInput(inputId = "compare_type", label = "Choose whether you prefer a comparison plot 
                  between two provinces or individual graphs.",
                  choices = list("Comparison" = "comp", "Individual" = "ind")),
      
      # Functions for the individual plots
      conditionalPanel(
        condition = "input.compare_type == 'ind'",
        
        selectInput(inputId = "select_region", 
                    label = "Select a provice", 
                    choices = c("Saskatchewan", "Manitoba")),
        
        colourInput(inputId = "ind_colour",
                    label = "Choose a colour for the plot",
                    value = "6699FF"), 
      ),
      
      # Functions for the comparison plots
      conditionalPanel(
        condition = "input.compare_type == 'comp'",
        
        selectInput(inputId = "colour_scheme_type",
                    label = "What colour scheme would you prefer to use?",
                    choices = COLOUR_THEME_LIST,
                    selected = "manual"),
        
        conditionalPanel( 
          condition = "input.colour_scheme_type == 'manual'",
          # Let the user decide the colour for Sask 
          colourInput(inputId = "comp_sask_colour",
                      label = "Choose a colour to represent Saskatchewan",
                      value = "6699FF"), 
          # Let the user decide the colour for Mani
          colourInput(inputId = "comp_mani_colour",
                      label = "Choose a colour to represent Manitoba",
                      value = "05DEB2"), 
        ),
        
      ), # End of conditional Panel
      
    ), # End of sidebarPanel
    mainPanel(
      
      #verbatimTextOutput("debugging123"),
      
      conditionalPanel(
        condition = "input.compare_type == 'comp'",
        withSpinner(plotOutput("comparison_crop_plot"))
      ),
      
      conditionalPanel(
        condition = "input.compare_type == 'ind'",
        withSpinner(plotOutput("individual_crop_plot"))
      ),

    ) # End of mainPanel
  )
)
