use mysql::*;
use mysql::prelude::*;
use serde::Serialize;

#[derive(Debug, Serialize)]


pub fn get_connection() -> Result<PooledConn> {
    let database_url = "mysql://root:root@localhost:3306/suporte_database";
    let pool = Pool::new(database_url)?;
    pool.get_conn()
}
