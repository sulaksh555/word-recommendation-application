library(shiny)
library(tm)

bigrams<-readRDS(file="bigrams.RData")
trigrams<-readRDS(file="trigrams.RData")
quadgrams<-readRDS(file="quadgrams.RData")
msg<-""

# A function to devise a recommendation for an input phrase

recommend<-function(phrase) {
    # Perform data wrangling
    phrase<-tolower(phrase)
    phrase<-stripWhitespace(phrase)
    phrase<-removePunctuation(phrase)
    phrase<-removeNumbers(phrase)
    
    words<-strsplit(x=phrase, split=" ")[[1]]
    
    if(length(words)>=3) {
        words<-tail(words, n=3)
        
        if(identical(x=character(length=0), y=head(quadgrams[quadgrams$unigram==words[1] & quadgrams$bigram==words[2] & quadgrams$trigram==words[3], 4], 1))) {
            recommend(paste(words[2], words[3], sep=" "))
        } else {
            head(quadgrams[quadgrams$unigram==words[1] & quadgrams$bigram==words[2] & quadgrams$trigram==words[3], 4], 1)
        }
    } else if(length(words)==2) {
        words<-tail(words, n=2)
        
        if(identical(x=character(length=0), y=head(trigrams[trigrams$unigram==words[1] & trigrams$bigram==words[2], 3], 1))) {
            recommend(words[2])
        } else {
            head(trigrams[trigrams$unigram==words[1] & trigrams$bigram==words[2], 3], 1)
        }
    } else {
        words<-tail(words, n=1)
        if(identical(x=character(length=0), y=head(bigrams[bigrams$unigram==words[1], 2], 1))) {
            head("the", n=1)
        } else {
            head(bigrams[bigrams$unigram==words[1], 2], 1)
        }
    }
}

shinyServer(function(input, output) {
    output$recommendation<-renderText({
        result<-recommend(input$inputPhrase)
        result
    })
})
