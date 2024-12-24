check:
	cargo test
	cargo clippy -- -D warnings
	cargo fmt
	cargo tarpaulin --verbose --workspace

watch:
	cargo watch -x check -x test -x run

start_db:
	./scripts/init_db.sh

stop_db:
	docker stop newsletter

migrate:
	SKIP_DOCKER=true ./scripts/init_db.sh

up: start_db watch