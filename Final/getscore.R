getscore <- function(filename="FinalExam.Rmd"){
  
  files <- dir()
  if(filename %in% files){
    tmp <- readLines(filename)
    tmp1 <- grep("## Question", tmp, value=TRUE)
    tmp2 <- sapply(tmp1, function(x) strsplit(x, "[{]|[}]")[[1]][2])
    names(tmp2) <- 1:25
   # if(length(grep("[a-d]", tmp2))<25){
   #  message <- "Not all questions Answered"
   # } else{
      tmp3 <-              c(Q1="a",
                             Q2="a",
                             Q3="b",
                             Q4="d",
                             Q5="c",
                             Q6="b",
                             Q7="d",
                             Q8="c",
                             Q9="c",
                             Q10="c",
                             Q11="a",
                             Q12="b",
                             Q13="a",
                             Q14="b",
                             Q15="b",
                             Q16="b",
                             Q17="d",
                             Q18="a",
                             Q19="c",
                             Q20="b",
                             Q21="c",
                             Q22="b",
                             Q23="c",
                             Q24="b",
                             Q25="c")
      
      message <- paste(sum(tmp3 == tmp2), "correct")

      View(Results<-data.frame(Key=tmp3,YourAnswer=tmp2,Credit=(tmp3==tmp2)))
  } else{
    message <- "Your Exam not found. Please type getscore(\"FilePathToYourFile\")."
  }
  message
}