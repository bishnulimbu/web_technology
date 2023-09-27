<?php
session_start();

$_SESSION['username'] = 'DELLuser';

$username = $_SESSION['username'];
echo "Username: $username<br>";

// Remove a specific session variable
unset($_SESSION['username']);

session_destroy();

if (isset($_SESSION['username'])) {
    echo "Username still exists in the session.";
} else {
    echo "Session and session variables have been removed.";
}
?>
