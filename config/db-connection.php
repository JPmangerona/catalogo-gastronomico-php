<?php

// No Docker, as variáveis de ambiente são definidas no docker-compose.yml
// No ambiente local, ele usará os valores padrão definidos abaixo.
$host = getenv('DB_HOST') ?: getenv('MYSQLHOST') ?: 'localhost';
$port = getenv('DB_PORT') ?: getenv('MYSQLPORT') ?: '3306';
$dbname = getenv('DB_NAME') ?: getenv('MYSQLDATABASE') ?: 'catalogo_gastronomico';
$user = getenv('DB_USER') ?: getenv('MYSQLUSER') ?: 'root';
$password = getenv('DB_PASSWORD') ?: getenv('MYSQLPASSWORD') ?: 'password';

try {
    $pdo = new PDO("mysql:host=$host;port=$port;dbname=$dbname;charset=utf8mb4", $user, $password);
    // Configura o PDO para lançar exceções em caso de erro
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Seed automático do usuário administrador caso a tabela exista e esteja vazia
    try {
        $checkTable = $pdo->query("SELECT 1 FROM usuarios LIMIT 1");
        if ($checkTable !== false) {
            $countStmt = $pdo->query("SELECT COUNT(*) FROM usuarios");
            if ($countStmt->fetchColumn() == 0) {
                $adminEmail = getenv('ADMIN_EMAIL') ?: 'teste@teste.com';
                $adminPassword = getenv('ADMIN_PASSWORD') ?: '123456';
                $hash = password_hash($adminPassword, PASSWORD_ARGON2ID);

                $insert = $pdo->prepare("INSERT INTO usuarios (email, senha) VALUES (?, ?)");
                $insert->execute([$adminEmail, $hash]);
            }
        }
    } catch (PDOException $e) {
        // Tabela usuarios ainda não existe ou não foi inicializada, ignora o seed
    }

} catch (PDOException $e) {
    echo "Erro na conexão com o banco de dados: " . $e->getMessage();
    exit;
}
