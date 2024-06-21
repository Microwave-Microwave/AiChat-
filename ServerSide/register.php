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
        die(json_encode(["success" => false, "message" => "Connection failed: " . $conn->connect_error]));
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        $user = $_POST['username'];
        $pass = $_POST['password'];
        $confirm_pass = $_POST['confirm_password'];

        if ($pass !== $confirm_pass)
        {
            echo json_encode(["success" => false, "message" => "Passwords do not match"]);
            $conn->close();
            exit();
        }

        // Check if username already exists
        $stmt = $conn->prepare("SELECT id FROM users WHERE username = ?");
        $stmt->bind_param("s", $user);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0)
        {
            echo json_encode(["success" => false, "message" => "Username already taken"]);
            $stmt->close();
            $conn->close();
            exit();
        }

        $stmt->close();

        // Insert new user
        $stmt = $conn->prepare("INSERT INTO users (username, password) VALUES (?, ?)");
        $stmt->bind_param("ss", $user, $pass);

        if ($stmt->execute())
        {
            echo json_encode(["success" => true, "message" => "Registration successful"]);
        }
        else
        {
            echo json_encode(["success" => false, "message" => "Registration failed: " . $stmt->error]);
        }

        $stmt->close();
        $conn->close();
    }
    else
    {
        echo json_encode(["success" => false, "message" => "Invalid request method"]);
    }
?>