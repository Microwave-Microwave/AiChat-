<?php
    session_start();
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
    </head>
    <body>
        <h2>Welcome to the Home Page</h2>

        <?php
            #index.php nem postol semmit, csak egy hub, ezért nem kell biztonságosnak lennie.
            if (isset($_SESSION['username']))
            {
                #ha megvan username a session cookiekban (be vagy loggolva)
                echo "Logged in as: " . $_SESSION['username'] . "<br>";
                echo '<a href="../ServerSide/protected_page.php">Go to Protected Page</a><br>';
                echo '<a href="../ServerSide/logout.php">Logout</a><br>';
            }
            else
            {
                #Ha nem vagy beloggolva
                echo '<a href="register.html">Register</a><br>';
                echo '<a href="login.html">Login</a><br>';
            }
        ?>
    </body>
</html>
