package commands

import (
	"context"
	"fmt"

	"github.com/Blustak/go-avorion-helper/internal/state"
)

type GetAllSystemsCommand struct {}

func (c *GetAllSystemsCommand) Name() string {
    return "getAllSystems"
}

func (c *GetAllSystemsCommand) Help() string {
    return "get all systems currently in database"
}

func (c *GetAllSystemsCommand) Do(s *state.State) error {
    systems, err := s.Db.GetAllSystems(context.Background())
    if err != nil {
        return err
    }
    for _,system := range systems {
        var system_name string
        if system.Name.Valid {
            system_name = system.Name.String
        } else {
            system_name = ""
        }
        fmt.Printf("(%03d,%03d) %10s\n",system.X,system.Y,system_name)
    }
    return nil
}

func (c *GetAllSystemsCommand) ParseArgs(s []string) error {
    return nil
}
