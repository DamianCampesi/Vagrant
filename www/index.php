<?php
require_once 'database.php';

$connection = Database::getConnection();

$query = "SELECT * FROM user";
$statement = $connection->prepare($query);
$statement->execute();
$data = $statement->get_result()->fetch_all(MYSQLI_ASSOC);
?>
    <h1>Contenuto tabella</h1>
<?php

for ($i = 0; $i < count($data); $i++) { ?>
    <p><?php echo $data[$i]['id'] . " " . $data[$i]['nome'] . " " . $data[$i]['cognome'] . " " . $data[$i]['telefono'] ?></p><?php
}