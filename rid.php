<?php
require_once 'db.php';
session_start();

if(isset($_GET['activity'])) {
    $activity = $_GET['activity'];
    $sql = "SELECT * FROM subcategories WHERE parentCategory = :activity ORDER BY orderNum ASC";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':activity', $activity);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($result);
}

if (isset($_GET['subcategory'])) {
    $subcategory = $_GET['subcategory'];
    $sql = "SELECT * FROM items WHERE subcategoria = :subcategory ORDER BY id ASC";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':subcategory', $subcategory);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($result);
}

if (isset($_GET['item'])) {
    $item = $_GET['item'];
    $sql = "SELECT * FROM items WHERE id = :item ORDER BY id ASC";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':item', $item);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    echo json_encode($result);
}

if (isset($_GET['quantidade']) && isset($_GET['itemId'])) {
    $Docente = $_SESSION['DocenteId'];
    $Rid = $_SESSION['RidId'];
    $itemId = $_GET['itemId'];
    $quantidade = $_GET['quantidade'];
    $sql = "INSERT INTO records (id, ridId, item, value) VALUES (NULL, :Rid, :itemId, :quantidade)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':Rid', $Rid);
    $stmt->bindParam(':itemId', $itemId);
    $stmt->bindParam(':quantidade', $quantidade);
    $stmt->execute();
    echo "Registro inserido com sucesso!";
}

if (isset($_GET['action']) && $_GET['action'] == 'getRecords') {
    $Docente = $_SESSION['DocenteId'];
    $Rid = $_SESSION['RidId'];

    $sql = "SELECT S.parentCategory AS Categoria, S.subcategoria AS SubCategoria, I.descricao AS Atividade, R.value AS Informado, I.multiplicador AS Multiplicador, I.limite AS Limite, I.tipo AS Tipo, ROUND((R.value * I.multiplicador), 2) AS PontuacaoBruta, ROUND(IF(((R.value * I.multiplicador) >= I.limite AND I.limite IS NOT NULL), I.limite, (R.value * I.multiplicador)), 2) AS Pontuacao FROM `records` AS R INNER JOIN items AS I ON R.item = I.id INNER JOIN subcategories AS S ON I.subcategoria = S.id WHERE R.ridId = :Rid ORDER BY R.id DESC";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':Rid', $Rid);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $allData = array();
    foreach ($result as $key => $value) {

        if($value['Tipo'] == 'EXISTENCIA') {
            if($value['Informado'] == 1) {
                $Informado = 'Sim';
            } else {
                $Informado = 'Não';
            }
        } else {
            $Informado = $value['Informado'];
        }

        $line = array(
            $value['Categoria'],
            $value['SubCategoria'],
            $value['Atividade'],
            $Informado,
            $value['Multiplicador'],
            $value['Limite'],
            $value['Pontuacao']
        );
        array_push($allData, $line);
    }

    $data = array(
        "data" => $allData
    );

    echo json_encode($data);
}

if (isset($_GET['action']) && $_GET['action'] == 'getSummary') {
    $Docente = $_SESSION['DocenteId'];
    $Rid = $_SESSION['RidId'];

    $sql = "WITH AllData AS (SELECT S.parentCategory AS Categoria, ROUND(IF(((R.value * I.multiplicador) >= I.limite AND I.limite IS NOT NULL), I.limite, (R.value * I.multiplicador)), 2) AS Pontuacao FROM `records` AS R INNER JOIN items AS I ON R.item = I.id INNER JOIN subcategories AS S ON I.subcategoria = S.id WHERE R.ridId = :Rid) SELECT Categoria, SUM(Pontuacao) AS Pontuacao FROM AllData GROUP BY Categoria";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':Rid', $Rid);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $allData = array();
    $Total = 0;
    foreach ($result as $key => $value) {
        $line = array(
            $value['Categoria'],
            $value['Pontuacao']
        );
        $Total += $value['Pontuacao'];
        array_push($allData, $line);
    }

    array_push($allData, array('Total', $Total));

    $data = array(
        "data" => $allData
    );

    echo json_encode($data);
}
