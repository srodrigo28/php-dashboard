<?php

// classes dashboard
class Dashboard{
    public $data_inicio;
    public $data_fim;
    public $numeroVendas;
    public $totalVendas;

    public function __get($atributo){
        return $this-> $atributo;
    }

    public function __set($atributo, $valor){
        $this->$atributo = $valor;
        return $this;
    }
}

// conexão com o banco de dados
class Conexao {
    private $host = 'localhost';
    private $dbname = 'dashboard';
    private $user = 'root';
    private $pass = '';

    public function conectar(){
        try{
            $conexao = new PDO(
                "mysql:host=$this->host;dbname=$this->dbname",
                $this->user,
                $this->pass

                
            );
            $conexao->exec('set charset utf8');
            return $conexao;
        }catch(Exception $e){
            echo '<p>' . $e->getMessage() . '</p>';
        }
    }
}

// querys Bd
class Bd{
    private $conexao;
    private $dashboard;

    public function __construct(Conexao $conexao, Dashboard $dashboard){
        $this->conexao = $conexao->conectar();
        $this->dashboard = $dashboard;
        
    }
    public function getNumeroVendas(){
        $query = '
            SELECT
                COUNT(*) as numero_vendas
            FROM
                tb_vendas
            WHERE
                data_venda BETWEEN :data_inicio AND :data_fim';

        $stmt = $this->conexao->prepare($query);
        $stmt->bindValue(':data_inicio', $this-> dashboard -> __get('data_inicio'));
        $stmt->bindValue(':data_fim',    $this-> dashboard -> __get('data_fim'));
        $stmt->execute();

        return $stmt->fetch(PDO::FETCH_OBJ)->numero_vendas;
    }
    public function getTotalVendas(){
        $query = '
            SELECT
                SUM(total) as total_vendas
            FROM
                tb_vendas
            WHERE
                data_venda BETWEEN :data_inicio AND :data_fim';

        $stmt = $this->conexao->prepare($query);
        $stmt->bindValue(':data_inicio', $this-> dashboard -> __get('data_inicio'));
        $stmt->bindValue(':data_fim',    $this-> dashboard -> __get('data_fim'));
        $stmt->execute();

        return $stmt->fetch(PDO::FETCH_OBJ)->total_vendas;
    }
}

// testando as classes e criando instanciar das classes
$dashboard = new Dashboard();
$conexao = new Conexao();

$dashboard-> __set('data_inicio', '2018-10-01');
$dashboard-> __set('data_fim',    '2018-10-31');

$bd = new Bd($conexao, $dashboard);

$dashboard-> __set('numeroVendas', $bd->getNumeroVendas());
$dashboard-> __set('totalVendas', $bd->getTotalVendas());
print_r($dashboard);