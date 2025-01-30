install.packages("stringr")
library(stringr)

list.dirs("Music")

direct = list.dirs("Music") #Saving as a vector 
str_count(direct, pattern = "/") #Finding the subdirectories 

subdirectnums = c(3, 4, 5, 6, 8, 9, 10) #The number of lines that have subdirectories
direct[subdirectnums] #Vector of subdirect 
subdirectories = direct[subdirectnums] #Saving new vector of sub




files = c()
song.name = c()

for(x in subdirectories){
  song.name = list.files(x)
  for(i in 1:length(song.name)){
    files = c(files, song.name[i])
  }
}

files

str.count(files, pattern = "wav")

code.to.process = c() #Empty Vecotr 
file.paths = c()

#Putting the thingys together
for(y in 1:length(files)){
  file.paths[y] = paste(subdirectories[ceiling(0.5*y)],"/",files[y], sep="")
  
}

file.paths
track = c()
split.tracks=c()
song=c()
#Removing .wav
for(i in 1:length(files)){
  track[i] = str_sub(files[i], 1, length(files[i])-6)
  split.tracks = c(split.tracks, str_split_1(track[i], "-"))
  song[i] = split.tracks[3*i]
}
song





  
  
  