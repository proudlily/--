package main

import (
	"fmt"
	"os"
)

func main() {
	argsWithProg := os.Args
	fmt.Println("argsWithProg", argsWithProg)

	argsWithoutProg := os.Args[1:]
	fmt.Println("argsWithoutProg", argsWithoutProg)

	arg := os.Args[3]
	fmt.Println("arg", arg)
}
