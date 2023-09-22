<?php
// Remove star and add your CORS link below
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

// Connect to your database creadentials below
$db = new PDO('mysql:host=localhost;dbname=shortlink', 'root', '');

function generateShortCode($length = 6) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $shortCode = '';
    for ($i = 0; $i < $length; $i++) {
        $shortCode .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $shortCode;
}

// Handle redirection if query string found 'short' word
if (isset($_GET['short'])) {
    $shortCode = $_GET['short'];
    
    // Look up the long URL in the database
    $query = $db->prepare("SELECT long_url FROM url_storage WHERE short_code = ?");
    $query->execute([$shortCode]);
    $result = $query->fetch(PDO::FETCH_ASSOC);

    if ($result) {
        $longURL = $result['long_url'];
        header("Location: $longURL", true, 301);
        exit;
    } else {
        // Handle validation the case where the short URL does not exist
        echo "Short URL not found.";
    }
} elseif ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    $data = json_decode(file_get_contents('php://input'));
    $longURL = $data->longUrl;
    
    $shortCode = generateShortCode();
    $query = $db->prepare("INSERT INTO url_storage (short_code, long_url) VALUES (?, ?)");
    $query->execute([$shortCode, $longURL]);
    
    $shortUrl = "http://localhost/short-link?short=$shortCode";
    echo json_encode(['shortUrl' => $shortUrl]);
}

?>
