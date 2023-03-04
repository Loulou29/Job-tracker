# install.packages("rvest") #web scraping
# install.packages("dplyr") #data manipulations

library(rvest)

web <- read_html("data/job_posts_in_html.html") %>% 
  html_elements("#Jobs :nth-child(1)")  #describe: 

job_title = web %>% html_elements("a") %>% html_text() #describe:
job_title = job_title[8:length(job_title)] #describe: 

job_link = web %>% html_element("a") %>% html_attr('href') #describe: 
job_link_vec = c()
for (link in unique(job_link[!is.na(job_link)])){
  if (!grepl(link, "uottawa", fixed = TRUE)){
    job_link_vec = c(job_link_vec,link)
  }
}
  
dat = c()
for (i in 1:7){
  col = web %>% html_elements(paste0(".col-md-12:nth-child(",i,")")) %>% html_text()
  dat = cbind(dat,col)
}

dat = data.frame(dat)
dat = cbind(job_title,job_link_vec, dat) #data.frame with job title, url and other desc about the jobs

clean <- function(x){
  x= gsub(" ","",x)
  x= gsub("\n","",x)
  return(x)
}

library(dplyr)
data = dat %>% mutate_all(clean)
str(data)

var_names = c("Job Title" , "URL","Organization","Mobility","Location",
              "Term","Duration","Expires","Programs")
names(data) = var_names

counter = 1
for (keyword in var_names){
  data[,counter] = gsub(keyword,"",data[,counter])
  counter= counter +1
}

View(data)
write.csv(data,"C:/Users/henry/Downloads/coop_jobs_20221212.csv",row.names = FALSE)