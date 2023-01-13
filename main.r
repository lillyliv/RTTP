print("Starting RTTP")

ServString <- "RTTP"
ServData <- "hello world from RTTP"

server <- function(){
  while(TRUE){
    writeLines("Listening...")
    con <- socketConnection(host="localhost", port = 80, blocking=FALSE,
                            server=TRUE, open="r+")
    data <- readLines(con, 1)
    print(data)
    response <- toupper(data) 
    writeLines(paste("HTTP/1.1 200 OK\nStatus: 200 OK\nServer: ", ServString, "\nContent-Type: text/html\nContent-Length: ", nchar(ServData)+1, "\nAccept-Ranges: bytes\nConnection: close\n\n", ServData), con) 
    close(con)
  }
}
server()
