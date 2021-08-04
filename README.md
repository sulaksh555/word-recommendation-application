# word-recommendation-application

This is a repository containing the files that helped create my word recommendation application. The code for the application was written in R across a UI file and a server file. These files implement an n-gram model with backoff, drawing from a set of most common bigrams, trigrams and quadgrams obtained from my natural language corpus. These files were then pushed to a web application hosted on shinyapps.io under my account. The full list of files present in the repository includes:

1. ui.R - defines the user interface for the application
2. server.R - performs operations on the inputs gathered by the user interface and renders the word recommendation as a text output
3. bigrams.RData - data file containing the most common bigrams in my corpus
4. trigrams.RData - data file containing the most common trigrams in my corpus
5. quadgrams.RData - data file containing the most common quadgrams in my corpus

The link to my web application is: https://sulaksh555.shinyapps.io/swiftkey-word-recs/
