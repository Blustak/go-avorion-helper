BIN_NAME = go-avorion-helper
BIN_DIR = bin

DB_PATH = data/data.db
DB_DRIVER = "sqlite3"

$(BIN_DIR)/$(BIN_NAME): clean
	$(MAKE) build

.PHONY: build
build: up generate
	go build -o $(BIN_DIR)/$(BIN_NAME)

.PHONY: generate
generate:
	sqlc generate

.PHONY: test
test: build
	go test ./...

.PHONY: run
run:
	@go run .


.PHONY: up
up:
	cd sql/schema && goose $(DB_DRIVER) ../../$(DB_PATH) up

.PHONY: down
down:
	cd sql/schema && goose $(DB_DRIVER) ../../$(DB_PATH) down

.PHONY: reset
reset:
	cd sql/schema && goose $(DB_DRIVER) ../../$(DB_PATH) reset

.PHONY: clean
clean: reset
	rm -r $(BIN_DIR) && mkdir bin
	${[[ -e $(BIN_NAME) ]] && rm $(BIN_NAME)}
