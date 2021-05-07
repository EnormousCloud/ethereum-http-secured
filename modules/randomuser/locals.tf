locals {
    username = random_string.username.result
    password = random_string.password.result
    password_hash = htpasswd_password.hash.apr1
}