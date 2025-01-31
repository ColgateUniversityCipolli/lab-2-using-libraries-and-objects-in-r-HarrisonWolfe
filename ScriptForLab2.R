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
#Removing .wav/splitting up everything/isolating the song
for(i in 1:length(files)){
  track[i] = str_sub(files[i], 1, length(files[i])-6)
  split.tracks = c(split.tracks, str_split_1(track[i], "-"))
  song[i] = split.tracks[3*i]
}
song

album=c()
artist=c()
#Putting the artist in one vector and putting album in another
for(i in 1:length(file.paths)){
  artist = c(artist, str_split_i(file.paths[i], "/", 2))
  album = c(album, str_split_i(file.paths[i], "/", 3))
}

output = c()
#Throwing everything together into an outpute file
for(i in 1:14){
  output = c(output, paste(artist[i], "-", album[i], "-", song[i], ".json", sep=""))
}

output

#Naming the thingy
command.thing = "streaming_extractor_music.exe"

#Makes the vector of the codes
for(i in 1:length(output)){
  code.to.process[i] = paste(command.thing, " ", '"', files[i], '"', " ", '"', output[i], '"', sep="")
}

  
  #Puts the codes in the batfile thingy majig 
  writeLines(code.to.process, con = "batfile.txt")
  

  
  
  
  
  
  
  