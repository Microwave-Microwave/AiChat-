<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "GET")
{
    if (isset($_SESSION['user_id']))
    {
        // User is logged in
        header('Content-Type: text/html');
        ?>
        <!DOCTYPE html>
        <html>
            <head>
                <title>Protected Page</title>
            </head>
            <body>
                <h2>Protected Page</h2>
                <p>This page is only accessible to logged-in users.</p>
                <p>Welcome, <?php echo htmlspecialchars($_SESSION['username']); ?>!</p>
                <a href="logout.php">Logout</a>
                <br>
                <a href="../ClientSide/index.php">Back to Home</a>
            </body>
        </html>
        <?php
    }
    else
    {
        // User is not logged in
        header('Content-Type: application/json');
        echo json_encode(["success" => false, "message" => "Not logged in"]);
    }
}
else
{
    header('Content-Type: application/json');
    echo json_encode(["success" => false, "message" => "Invalid request method"]);
}
?>