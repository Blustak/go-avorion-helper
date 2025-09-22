package state

import (
	"database/sql"
	"errors"

	"github.com/Blustak/go-avorion-helper/internal/database"
)

type Command interface{
    Name() string
    Help() string
    Do(s *State) error
    ParseArgs(args []string) error
}

type State struct {
    Db *database.Queries
    Commands map[string]Command
}

func NewState(dbFilePath string) (*State,error) {
    sql_db,err := sql.Open("sqlite3",dbFilePath)
    if err != nil {
        return nil,err
    }
    db := database.New(sql_db)
    commands := make(map[string]Command)
    return &State{
        Db:db,
        Commands: commands,
    }, nil
}


func (s *State) RegisterCommand(c Command) error {
    if _,ok := s.Commands[c.Name()]; ok {
        return errors.New("command already exists")
    }
    s.Commands[c.Name()] = c
    return nil
}

func (s *State) Do(args []string) error {
    if len(args) < 1 {
        return errors.New("not enough arguments passed")
    }
    if c,ok := s.Commands[args[0]]; ok {
        if err := c.ParseArgs(args[1:]); err != nil {
            return err
        }
        if err := c.Do(s); err != nil {
            return err
        }
    } else {
        return errors.New("couldn't find command")
    }
    return nil
}
