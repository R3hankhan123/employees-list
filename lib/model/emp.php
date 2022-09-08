//to be  implemented on server end
<?php
$servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "employees";
    $table = "emp_data";
    $conn = new mysqli($servername, $username, $password, $dbname);
    if($conn->connect_error){
        die("Connection Failed: " . $conn->connect_error);
        return;
    }
    $sql = "SELECT * from $table ORDER BY Emp_ID ";
    $db_data = array();
    $result = $conn->query($sql);
    if($result->num_rows > 0){
        while($row = $result->fetch_assoc()){
            $db_data[] = $row;
        }

        echo json_encode($db_data);
    }else{
        echo "error";
    }
    $conn->close();
    
    return;
 
?>