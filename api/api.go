package main

import (
	_ "github.com/SudoQ/tenordb"
	"github.com/go-martini/martini"
	"fmt"
	//"github.com/martini-contrib/cors"
	"log"
	"net/http"
	"os"
)

func foo(params martini.Params)(int, string) {
	resp := fmt.Sprintf("Type: %s, Root: %s, Pattern: %s", params["type"], params["root"], params["pattern"])
	return 200, resp
}

func main() {
	m := martini.Classic()
	/*
	m.Use(cors.Allow(&cors.Options{
			AllowOrigins: []string{"http://*:8080"},
			AllowMethods: []string{"GET", "POST"},
	}))
	*/
	m.Get("/:type/:root/:pattern", foo)
	env_port := os.Getenv("TENORDB_API_PORT")
	if env_port == "" {
			env_port = "3031"
	}
	port := fmt.Sprintf(":%s", env_port)
	log.Fatal(http.ListenAndServe(port, m))
}
