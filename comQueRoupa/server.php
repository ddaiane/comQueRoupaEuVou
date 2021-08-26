
<?php
    /**
     * código original de Rodrigo Prestes Machado
     * adaptado por Daiane Marcon
     * 
     * licensed under a
     * Creative Commons Attribution 4.0 International License.
     * You should have received a copy of the license along with this
     * work. If not, see <http://creativecommons.org/licenses/by/4.0/>.
     *
    */
    
    // gets the operation
    $op = $_GET["op"];
    switch ($op) {
        case 'create':
            echo fnCreate();
            break;
        case 'read':
            echo fnRead();
            break;
         case 'update':
            echo fnUpdate();
            break;
         case 'delete':
            echo fnDelete();
            break;
        case 'search':
            echo fnSearch();
        default:
            break;
    }

    //insere no banco de dados
    function fnCreate(){
        $tipo = $_GET["tipo"];
        $salto = $_GET["salto"];
        $cor = $_GET["cor"];
        $imagem = $_GET["imagem"];
        $clima = $_GET["clima"];
        $lavar = $_GET["lavar"];
        $manutencao = $_GET["manutencao"];
        $disponivel = $_GET["disponivel"];
            $connection = connect();
            $sql = "INSERT INTO `CLOTHES` (`tipo`, `salto`, `cor`, `imagem`, `clima`, `lavar`, `manutencao`, `disponivel`)
            VALUES ('$tipo', $salto, '$cor', '$imagem', '$clima', $lavar, $manutencao, $disponivel)";
            $result = mysqli_query($connection, $sql);
            $idNew = mysqli_insert_id($connection);
            disconnect($connection);
        return ($result === true ? 1 : 0);
    }

    /*/
     * lê dados do bd
     */
    function fnRead(){
        $connection = connect();
        $sql = "SELECT * FROM CLOTHES";
        $result = mysqli_query($connection, $sql);
        $json = generateJson($result);
        disconnect($connection);
        return $json;
    }

    
    /*/
     * atualiza entradas no bd
     */
    function fnUpdate(){
        $id = $_GET["id"];
        $lavar = $_GET["lavar"];
        $manutencao = $_GET["manutencao"];
        $disponivel = $_GET["disponivel"];
        
            $connection = connect();
            $sql = "UPDATE CLOTHES SET LAVAR=$lavar, MANUTENCAO=$manutencao, DISPONIVEL=$disponivel WHERE id='$id'";
            $result = mysqli_query($connection, $sql);
            disconnect($connection);
        
        return  ($result == true ?  1 : 0);
    }

    
    /*/
     * deleta entradas do bd
     */
    function fnDelete(){
        $id = $_GET["id"];
        $result = false;
        if ($id != ""){
            $connection = connect();
            $sql = "DELETE FROM CLOTHES WHERE CLOTHES.id='$id'";
            $result = mysqli_query($connection, $sql);
            disconnect($connection);
        }
        echo ($id);    
    }

    
    /*/
     * pesquisa no bd e retorna dados com base em uma coluna e um valor desejado nessa coluna
     */
    function fnSearch(){
        $tag = $_GET["tag"];
        $busca = $_GET["busca"];
        $connection = connect();
        $sql = "SELECT * FROM CLOTHES WHERE $tag = '" . $busca . "'";
        $result = mysqli_query($connection, $sql);
        $json = generateJson($result);
        disconnect($connection);
        return $json;
    }

    /**
     * gera o json
     */
    function generateJson($result){
        $json = "";
        while ($line = mysqli_fetch_array($result, MYSQLI_ASSOC)){
            $id = isset($line["id"]) ? $line["id"] : null;
            $tipo = isset($line["tipo"]) ? $line["tipo"] : null;
            $salto = isset($line["salto"]) ? $line["salto"] : null;
            $cor = isset($line["cor"]) ? $line["cor"] : null;
            $imagem = isset($line["imagem"]) ? $line["imagem"] : null;
            $clima = isset($line["clima"]) ? $line["clima"] : null;
            $lavar = isset($line["lavar"]) ? $line["lavar"] : null;
            $manutencao = isset($line["manutencao"]) ? $line["manutencao"] : null;
            $disponivel = isset($line["disponivel"]) ? $line["disponivel"] : null;

            $json .= "{\"id\":\"".$id."\",
                    \"tipo\":\"".$tipo."\", 
                    \"salto\":\"".$salto."\", 
                    \"cor\":\"".$cor."\",
                    \"imagem\":\"".$imagem."\",
                    \"clima\":\"".$clima."\",
                    \"lavar\":\"".$lavar."\",
                    \"manutencao\":\"".$manutencao."\",
                    \"disponivel\":\"".$disponivel."\"
                     },";
        }
        $json = substr($json, 0, strlen($json) - 1);
        $json = "[" . $json. "]";
        return $json;
    }
    /**
     * conecta no banco de dados mySQL
     */
    function connect(){
        $connection = mysqli_connect("db", "crud", "crud");
        mysqli_select_db($connection, "crud");
        return $connection;
    }

    /**
     * desconecta do banco de dados mySQL
     */
    function disconnect($connection){
        mysqli_close($connection);
    }
?>