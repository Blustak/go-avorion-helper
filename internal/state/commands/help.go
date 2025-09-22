package commands

import (
    "fmt"

    "github.com/Blustak/go-avorion-helper/internal/state"
)

type HelpCommand struct{}

func (h *HelpCommand) Name() string {
    return "help"
}

func (h *HelpCommand) Help() string {
    return "print this"
}

func (h *HelpCommand) Do(s *state.State) error {
    fmt.Println("Usage: <command> [options...]")
    for _, c := range s.Commands {
        fmt.Printf("% -10s:%s\n",c.Name(),c.Help())
    }
    fmt.Println("When adding entries, all fields are seperated by commas. entries are seperated by spaces.")
    fmt.Println("Example: addSystem 10,20,bigboy 20,30 39,42,small_lad - adds 3 systems to the database")
    return nil
}

func (h *HelpCommand) ParseArgs(s []string) error {
    return nil //help does not parse args
}
