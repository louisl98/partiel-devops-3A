package main

import (
	"log"
	"net/http"
	"os"
	"wsf/devops/handler"
)

func main() {

	myHandler := handler.NewHandler()

	server := &http.Server{
		Addr:    ":8080",
		Handler: myHandler,
	}

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	log.Fatal(server.ListenAndServe())
}
