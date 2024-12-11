<?php
require_once 'db.php';
session_start();
?>
<?php
if (isset($_GET['docente'])) {
    $docente = $_GET['docente'];
    $ridId = $_GET['ridId'];

    $sql = "SELECT * FROM docente WHERE id = :docente";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':docente', $docente);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    $Nome = $result['nome'];
    $Nome = strtoupper($Nome);

    $_SESSION['DocenteId'] = $docente;
    $_SESSION['DocenteNome'] = $Nome;
    $_SESSION['RidId'] = $ridId;
}
?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RID</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.datatables.net/v/bs5/dt-2.0.8/b-3.0.2/datatables.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet">
</head>

<style>
    body {
        font-size: 20px;
    }

    input,
    select {
        font-size: 20px;
    }
</style>

<body>
    <div class="container">
        <form action="#" id="selectDocente">
            <input type="number" name="docente" id="docente" placeholder="Docente" style="width: 70px;">
            <input type="number" name="ridId" id="ridId" placeholder="RidId" style="width: 100px;">
            <input type="button" value="Selecionar" id="btnSendSelectDocente">
            <input type="submit" hidden />
        </form>

        <?php echo "RID " . $_SESSION['RidId'] . " para Docente: " . $_SESSION['DocenteNome']; ?>
        <br>
        <br>
        <br>
        <br>

        <form action="#">
            <label for="atividade">Selecione a atividade:</label>
            <select name="atividade" id="atividade" onchange="getSubcategories()">
                <option value="">Selecione...</option>
                <option value="ENSINO">ENSINO</option>
                <option value="PESQUISA">PESQUISA</option>
                <option value="EXTENSAO">EXTENSAO</option>
                <option value="ADMINISTRATIVA">ADMINISTRATIVA</option>
                <option value="CAPACITACAO">CAPACITACAO</option>
            </select>
        </form>

        <form action="#">
            <label for="subcategoria">Selecione a subcategoria:</label>
            <select name="subcategoria" id="subcategoria" onchange="getItems()">
                <option value="">Selecione...</option>
            </select>
        </form>

        <form action="#">
            <label for="item">Selecione o item:</label>
            <select name="item" id="item" onchange="getItem()">
                <option value="">Selecione...</option>
            </select>
        </form>

        <form action="#" id="saveQtd">
            <input type="text" name="quantidade" id="quantidade" placeholder="Qtd" style="width: 60px;" autocomplete="off">
            * <span id="multiplicador"></span>
            <input type="button" value="Adicionar" id="btnSaveQtd">
            <input type="submit" hidden />
        </form>

        <div class="row">
            <div class="col-md-4 mx-auto">
                <table id="summary" class="table">
                    <thead>
                        <tr>
                            <th>Categoria</th>
                            <th>Pontuação</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>

        <table id="datatable" class="table">
            <thead>
                <tr>
                    <th>Categoria</th>
                    <th>SubCategoria</th>
                    <th>Atividade</th>
                    <th>Informado</th>
                    <th>Multiplicador</th>
                    <th>Limite</th>
                    <th>Pontuacao</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/v/bs5/dt-2.0.8/b-3.0.2/datatables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script>
        function getSubcategories() {
            document.getElementById("subcategoria").innerHTML = "";
            document.getElementById("item").innerHTML = "";

            var activity = document.getElementById("atividade").value;
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "rid.php?activity=" + activity, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var subcategories = JSON.parse(xhr.responseText);
                    var subcategorySelect = document.getElementById("subcategoria");
                    subcategorySelect.innerHTML = "";

                    var option = document.createElement("option");
                    option.value = "";
                    option.text = "Selecione...";
                    subcategorySelect.appendChild(option);

                    for (var i = 0; i < subcategories.length; i++) {
                        var option = document.createElement("option");
                        option.value = subcategories[i].id;
                        option.text = subcategories[i].subcategoria;
                        subcategorySelect.appendChild(option);
                    }
                }
            };
            xhr.send();
        }


        function getItems() {
            document.getElementById("item").innerHTML = "";

            var subcategory = document.getElementById("subcategoria").value;
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "rid.php?subcategory=" + subcategory, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var items = JSON.parse(xhr.responseText);
                    var itemSelect = document.getElementById("item");
                    itemSelect.innerHTML = "";

                    var option = document.createElement("option");
                    option.value = "";
                    option.text = "Selecione...";
                    itemSelect.appendChild(option);

                    for (var i = 0; i < items.length; i++) {
                        var option = document.createElement("option");
                        option.value = items[i].id;
                        option.text = items[i].descricao;
                        itemSelect.appendChild(option);
                    }
                }
            };
            xhr.send();
        }

        function getItem() {
            var item = document.getElementById("item").value;
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "rid.php?item=" + item, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var item = JSON.parse(xhr.responseText);
                    document.getElementById("multiplicador").innerHTML = item.multiplicador;
                    document.getElementById("quantidade").focus();
                }
            };
            xhr.send();
        }

        function SaveQtd() {
            var quantidade = document.getElementById("quantidade").value;
            var itemId = document.getElementById("item").value;

            var xhr = new XMLHttpRequest();
            xhr.open("GET", "rid.php?quantidade=" + quantidade + "&itemId=" + itemId, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    //Clear all fields
                    document.getElementById("quantidade").value = "";
                    document.getElementById("multiplicador").innerHTML = "";
                    $('#summary').DataTable().ajax.reload();
                    $('#datatable').DataTable().ajax.reload();
                    toastr.success("Registro inserido com sucesso!");
                }
            };
            xhr.send();
        }

        function SelectDocente() {
            var docente = document.getElementById("docente").value;
            var ridId = document.getElementById("ridId").value;

            var xhr = new XMLHttpRequest();
            xhr.open("GET", "index.php?docente=" + docente + "&ridId=" + ridId, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    location.reload();
                }
            };
            xhr.send();
        }

        $(document).ready(function() {

            $("#selectDocente").submit(function(e) {
                e.preventDefault();
                SelectDocente();
            });

            $("#btnSendSelectDocente").click(function() {
                SelectDocente();
            });

            $("#saveQtd").submit(function(e) {
                e.preventDefault();
                SaveQtd();
            });

            $("#btnSaveQtd").click(function() {
                SaveQtd();
            });

            new DataTable('#datatable', {
                ajax: 'rid.php?action=getRecords',
                ordering: false,
                paging: false,
                info: false,
                lengthChange: false,
                searching: false
            });

            new DataTable('#summary', {
                ajax: 'rid.php?action=getSummary',
                ordering: false,
                paging: false,
                info: false,
                lengthChange: false,
                searching: false
            });
        });
    </script>
</body>

</html>