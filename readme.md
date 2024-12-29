run compiler and other tasks automatically

```bash
cargo watch -x check

cargo watch -x check -x test -x run
```

linter

```bash
# will compute code coverage for your application code, ignoring your test functions.
cargo tarpaulin --ignore-tests
```

linter

```bash
cargo clippy
# for CI
cargo clippy -- -D warnings
```

formatting

```bash
cargo fmt
# for CI
cargo fmt -- --check
```

security check

```bash
cargo audit
```

find unused deps

```bash
cargo +nightly udeps
```

logs in tests

```bash
TEST_LOG=true cargo test health_check_works | bunyan
```