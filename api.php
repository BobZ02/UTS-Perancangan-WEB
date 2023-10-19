<?php
header("Content-Type: application/json");

$servername = "localhost";
$username = "camieux";
$password = "viperscum666";
$database = "bobzpersonal_db";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

$resultBiodata = $conn->query("SELECT * FROM biodata");
$resultPengalaman = $conn->query("SELECT * FROM pengalaman");
$resultMediaSosial = $conn->query("SELECT * FROM media_sosial");
$resultBlog = $conn->query("SELECT * FROM blog");

$dataBiodata = array();
while ($row = $resultBiodata->fetch_assoc()) {
    $dataBiodata[] = $row;
}

$dataPengalaman = array();
while ($row = $resultPengalaman->fetch_assoc()) {
    $dataPengalaman[] = $row;
}

$dataMediaSosial = array();
while ($row = $resultMediaSosial->fetch_assoc()) {
    $dataMediaSosial[] = $row;
}

$dataBlog = array();
while ($row = $resultBlog->fetch_assoc()) {
    $dataBlog[] = $row;
}

$data = array(
    'biodata' => $dataBiodata,
    'pengalaman' => $dataPengalaman,
    'media_sosial' => $dataMediaSosial,
    'blog' => $dataBlog
);

echo json_encode($data);

$conn->close();
?>
