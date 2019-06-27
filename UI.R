bootstrapPage(
  
  selectInput(inputId = "n_breaks",
              label = "Number of Bins (approximate):",
              choices = c(10, 20, 35, 50, 75, 100),
              selected = 20),
  
  checkboxInput(inputId = "individual_obs",
                label = strong("Show Individual Observations"),
                value = FALSE),
  
  checkboxInput(inputId = "density",
                label = strong("Show Density (estimate)"),
                value = FALSE),
  
  plotOutput(outputId = "main_plot", height = "300px"),
  
  # Display this only if the density is shown
  conditionalPanel(condition = "input.density == true",
                   sliderInput(inputId = "bw_adjust",
                               label = "Bandwidth adjustment:",
                               min = 0.1, max = 16, value = 1, step = 0.2)
  )
  
)