
page_contact = div(
  titlePanel("Contact"),
  
  p('This website is maintained by Anna Ly. If you find any bugs on this website, please contact 
    lya19@mcmaster.ca.'),
  
  tags$style("#project-grid {
                      display: grid;
                      grid-template-columns: 120px 1fr;
                      grid-gap: 10px;
                      }"),
  div(id = "project-grid",
      div(id = "AnnaImg", img(src = "me.jpg", style = 'border-radius: 50%', width = '120px')),
      div(h3('Anna Ly'),
          h4('Graduate Student, M.Sc. in Statistics at McMaster University'),
          p("I like reading otome isekai. Also I did my undergrad at UofT. 
            One day I want to make my own webtoon.", style = "color:#61646b"),
          tags$script(src = "https://kit.fontawesome.com/5e940c3ade.js"),
          tags$div(
            tags$i(class = "fa-brands fa-github"),
            tags$a(href="https://github.com/annahuynhly", "Github"), " | ",
            tags$i(class = "fa-brands fa-linkedin"),
            tags$a(href="https://www.linkedin.com/in/anna-ly-statistics-specialist/", "Linkedin"), " | ",
            tags$i(class = "fa-solid fa-graduation-cap"),
            tags$a(href="https://scholar.google.ca/citations?user=9w41oS8AAAAJ&hl=en", "Google Scholar")
          ),
      ),
  ), # End of Project Grid
)

page_credit = div(
  titlePanel("Credits"),
  tags$div(
    "I constructed this website using ",tags$a(href="https://www.r-project.org/about.html", "R."), "Specifically, I used the ", tags$a(href="https://shiny.rstudio.com/", "R Shiny "), "package. The website theme is flatly from ", tags$a(href="https://rstudio.github.io/shinythemes/", "shinythemes."),
  ),
  br(),
  tags$div("I used the following additonal Shiny packages: ", tags$a(href="https://cran.r-project.org/web/packages/shinycssloaders/index.html", "shinycssloaders"), " (for loading screens), ", tags$a(href="https://cran.r-project.org/web/packages/colourpicker/index.html", "colourpicker"), " (for users to manually select a colour).",
  ),
  br(),
  tags$div("I also used ", tags$a(href="https://cran.r-project.org/web/packages/tidyverse/index.html", "tidyverse"), " specifically ggplot2 to make the graphs."
  ),
  br(),
  tags$div("I also occasionally used ", tags$a(href="https://github.com/features/copilot","GitHub Copilot"), " to help me write code."
  ),
  br(),
  tags$div("The colour themes were self-chosen, except for \"Jack in, Execute!\" which is a reference to the ", tags$a(href="https://en.wikipedia.org/wiki/Mega_Man_Battle_Network", "Mega Man Battle Network Series.")
  )
)

page_contact_and_credits = div(
  titlePanel("Contact & Credits"),
  tabsetPanel(type = "tabs",
              tabPanel("Credit", page_credit),
              tabPanel("Contact", page_contact),
  )
)

