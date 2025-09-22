package main

import (
	"fmt"
	"os"

	"github.com/Blustak/go-avorion-helper/internal/state"
	"github.com/Blustak/go-avorion-helper/internal/state/commands"
	_ "github.com/mattn/go-sqlite3"
)


func main() {
    workingDir,err := os.Getwd()
    if err != nil {
        panic("couldn't get cwd")
    }
    progState,err := state.NewState(fmt.Sprintf("%s/data/data.db",workingDir))
    if err != nil {
        fmt.Printf("error: %v\n",err)
        panic("couldn't initialise state")
    }
    setDefaultCommands(progState)
    if err := progState.Do(os.Args[1:]); err != nil {
        fmt.Printf("error: %v\n",err)
        panic("couldn't execute command")
    }
}

func setDefaultCommands(s *state.State) {
    s.Commands = make(map[string]state.Command)
    s.RegisterCommand(&commands.HelpCommand{})
    s.RegisterCommand(&commands.AddSystemCommand{})
    s.RegisterCommand(&commands.GetAllSystemsCommand{})
}
