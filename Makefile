pre-commit:
	cargo fmt
	cargo clippy -- -D warnings
	cargo +nightly udeps
	cargo tarpaulin --ignore-tests
	cargo sqlx prepare --workspace -- --all-targets
	cargo test
	cargo audit

watch:
	cargo watch -x check -x test -x run

start_db:
	./scripts/init_db.sh

stop_db:
	docker stop newsletter

migrate:
	SKIP_DOCKER=true ./scripts/init_db.sh

up: start_db watch