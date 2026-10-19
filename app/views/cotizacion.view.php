<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head><script src="<?=ROOT?>/assets/js/color-modes.js"></script>
    <script src='<?=ROOT?>/assets/js/jquery-3.7.1.min.js'></script>
    <script type="text/javascript">
	function loadfile(event){
	var output=document.getElementById('preimage');
	output.src=URL.createObjectURL(event.target.files[0]);
  	};
    </script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.118.2">
    <title><?=$titulo?></title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sidebars/">
    <link rel="icon" type='image/x-icon' href="<?=ROOT?>/assets/images/favicon.png">
    

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

<link href="<?=ROOT?>/assets/css/bootstrap.min.css" rel="stylesheet" media='screen,print'>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      @media print{
        .page-break{
          page-break-after: always;
          break-after: page;
        }
        .no-print {
          display: none !important;
          }
      }

      .b-example-divider {
        width: 100%;
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }

      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }

      .bd-mode-toggle {
        z-index: 1500;
      }

      .bd-mode-toggle .dropdown-menu .active .bi {
        display: block !important;
      }
    </style>

<main class="d-flex flex-nowrap">
<div class="overflow-auto w-100" >

<div contenteditable="true" class='container-fluid w-100 mb-5' >
  <div class='container text-center'>
      <img src="<?=ROOT?>/assets/images/valma.jpeg" width=80%>
  </div>
  <div class='row mt-5'>
    <div class='col'>
      <h6><b>Contacto oficinas:</b> <i>4437884459</i></h6>
    </div>
    <div class='col text-end'>
      <h6><b>Fecha cotización: </b> <?=make_fecha($fecha)?></h6>
    </div>
  </div>
  <div class='row mb-3'>
    <div class='container-fluid' style="page-break-after: always">
    <table class='table table-striped'>
      <thead class='table-primary border text-center'>
        <tr><td colspan='4'><h5>Cotización Lote <?=$num?> Manzana <?=$manzana?></h5></td></tr>
      </thead>
      <tbody>
        <tr><td><b>Cliente: </b></td><td><?=$cliente?></td>
          <td><b>Contacto cliente: </b></td><td><?=$contacto_c?></td></tr>
        <tr><td><b>Gerente de ventas: </b></td><td><?=$vendedor?></td>     <td><b>Contacto gerente: </b></td><td><?=$contacto_v?></td></tr>
        <tr><td><b>Vendedor: </b></td><td><?=$agente?></td>     <td><b>Contacto vendedor: </b></td><td><?=$contacto_a?></td></tr>
        <tr><td><b>Fecha:</b></td><td colspan=3><?=make_fecha($hoy)?></td></tr> 
      </tbody>
    </table>
    </div>
  </div>

  <div class='row text-center mt-2'>
    <div class="col border">
      <img id='preimage' width=100% height="auto">
      <input class="no-print" type='file' id='image' name='archivo' onchange='loadfile(event)' required>
      <!--<img src='<?=ROOT?>/assets/images/Valma/<?=$archivo?>' 
width=100%> -->
    </div>
    <div class='col border text-center'>
      <table class='table'>
        <tr><td><b>#Lote:</b></td><td><?=$num?></td></tr>
        <tr><td><b>Manzana:</b></td><td><?=$manzana?></td></tr>
        <tr><td><b>Tipo de lote: </b></td><td><?=$tipo?></td></tr>
        <tr><td><b>Superficie m2:</b></td><td><?=$superficie?></td></tr>
        <tr><td><b>Precio/m2:</b></td><td><?=$costo_m2_lista?></td></tr>
        <tr><td><b>Precio de lista:</b></td><td><?=$precio?></td></tr>
      </table>
    </div>
  </div>
  <div class="page-break"></div>
  <div class='row mt-2 mb-5'>
    <div class='container-fluid' >
    <table class='table table-striped'>
      <thead class='table-primary border text-center'>
        <tr><td colspan='4'><h5>Esquema de pagos</h5></td></tr>
      </thead>
      <tbody>
        <tr><td><b>Forma de pago: </b></td>
          <?php
            if($esquema!='Contado'){
              echo "<td>".$esquema."</td><td><b>Precio/m2 financiado:</b></td><td>".money_fmt($costo_m2)."</td>";
            }else{
              echo "<td colspan='3'>".$esquema."</td>";
            }
          ?>
        </tr>     
        <tr><td><b>Enganche: </b></td><td><?=$enganche?></td><td><b>Interés: </b></td><td><?=$interes?>%</td></tr>
        <tr><td><b>Pago mensual: </b></td><td><?=$pago_m?></td>
          <td><b>Total mensualidades: </b></td><td><?=$mensualidades?></td></tr>
        <tr><td><b>Escrituración y entrega: </b></td><td><?=$finiquito?></td>
          <td><b>Precio total: </b></td><td><?=$precio_final?></td></tr>
      </tbody>
    </table>
    </div>
  </div>
  <div class='row mb-5'>

    <div class='container-fluid mb-5'>
    <table class='table table-striped'>
      <thead class='table-primary border text-center'>
        <tr><td colspan='4'><h5>Calendario de Pagos</h5></td></tr>
        <tr><td><b>No. de Pago</b></td><td><b>Fecha</b></td><td><b>Concepto</b></td><td><b>Importe</b></td></tr>
      </thead>
      <tbody class='text-center'>
        <?=$calendario?>
      </tbody>
    </table>
    </div>
  </div>

</div>

</div>

</main>
<script>
</script>
</body>

<script src="<?=ROOT?>/assets/js/bootstrap.bundle.min.js"></script>
<script src="<?=ROOT?>/assets/js/sidebars.js"></script></body>
</html>
