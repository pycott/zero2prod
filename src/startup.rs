use crate::routes::{health_check, subscriptions};
use actix_web::dev::Server;
use actix_web::{web, App, HttpServer};
use sqlx::{Pool, Postgres};
use std::net::TcpListener;

pub fn run(listener: TcpListener, db_pool: Pool<Postgres>) -> Result<Server, std::io::Error> {
    let db_pool = web::Data::new(db_pool);

    let server = HttpServer::new(move || {
        App::new()
            .route("/health_check", web::get().to(health_check))
            .route("/subscriptions", web::post().to(subscriptions))
            .app_data(db_pool.clone())
    })
    .listen(listener)?
    .run();
    Ok(server)
}