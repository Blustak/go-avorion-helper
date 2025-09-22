-- name: AddSystem :one
INSERT INTO systems(name,x,y) VALUES(
    @system_name,
    @system_x,
    @system_y
) RETURNING *;

-- name: GetAllSystems :many
SELECT * FROM systems;
