package commands

import (
	"context"
	"database/sql"
	"fmt"
	"strings"

	"github.com/Blustak/go-avorion-helper/internal/database"
	"github.com/Blustak/go-avorion-helper/internal/state"
)

type AddSystemCommand struct{
    database.AddSystemParams
}

func (c *AddSystemCommand) Name() string {
    return "addSystem"
}

func (c *AddSystemCommand) Help() string {
    return "<x,y[,name]> add system at x,y, with an optional name"   
}

func (c *AddSystemCommand) Do(s *state.State) error {
    system,err := s.Db.AddSystem(context.Background(),c.AddSystemParams)
    if err != nil {
        return err
    }
    fmt.Printf("added system %v\n",system)
    return nil
}

func (c *AddSystemCommand) ParseArgs(s []string) error {
    substrings := strings.Split(s[0],",")
    if len(substrings) <2 || len(substrings) >3 {
        return fmt.Errorf("error, bad input.")
    }
    var err error
    c.SystemX,c.SystemY,err = parseCoords(substrings[0],substrings[1])
    if err != nil {
        return err
    }
    if len(substrings) == 3 {
        c.SystemName = sql.NullString{String: substrings[2],Valid: true}
    } else {
        c.SystemName = sql.NullString{Valid:false}
    }
    return nil

}
