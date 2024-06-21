<?php
session_start();
header('Content-Type: application/json');

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "aichat";


//csak connnectol a dbasehez
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error)
{
    die(json_encode(["success" => false, "message" => "Connection failed"]));
}

if ($_SERVER["REQUEST_METHOD"] == "POST")
{
    $user = $_POST['username'];
    $pass = $_POST['password'];

    $stmt = $conn->prepare("SELECT id, password FROM users WHERE username = ?");
    $stmt->bind_param("s", $user);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1)
    {
        $row = $result->fetch_assoc();
        if ($pass === $row['password'])
        {
            $_SESSION['user_id'] = $row['id'];
            $_SESSION['username'] = $user;
            echo json_encode(["success" => true, "message" => "Login successful"]);
        }
        else
        {
            echo json_encode(["success" => false, "message" => "Invalid username or password"]);
        }
    }
    else
    {
        echo json_encode(["success" => false, "message" => "User not found"]);
    }

    $stmt->close();
    $conn->close();
}
else
{
    echo json_encode(["success" => false, "message" => "Invalid request method"]);
}
?>