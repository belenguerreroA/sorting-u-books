<!-- The first include should be config.php -->
<?php require_once('config.php') ?>
<!-- config.php should be here as the first include  -->

<?php require_once( ROOT_PATH . '/includes/public_functions.php') ?>
<?php require_once( ROOT_PATH . '/includes/registration_login.php') ?>

<?php
if(isset($_POST['records-limit'])){
	$_SESSION['records-limit'] = $_POST['records-limit'];
}
  
$limit = isset($_SESSION['records-limit']) ? $_SESSION['records-limit'] : 15;
$page = (isset($_GET['page']) && is_numeric($_GET['page']) ) ? $_GET['page'] : 1;
$g_incl = (isset($_GET['g_include'])) ? $_GET['g_include'] : "";
$g_excl = (isset($_GET['g_exclude'])) ? $_GET['g_exclude'] : "";

$paginationStart = ($page - 1) * $limit;

$books = getBooks($paginationStart, $limit,$g_incl,$g_excl);

// Get total records
$countBooks = countBooks($g_incl,$g_excl);

$allRecrods = $countBooks;

// Calculate total pages
$totoalPages = ceil($allRecrods / $limit);
// Prev + Next
$prev = $page - 1;
$next = $page + 1;

?>

<?php require_once( ROOT_PATH . '/includes/head_section.php') ?>
	<title>Sort</title>
</head>
<body>
	<!-- offcanvas -->
	<?php include( ROOT_PATH . '/includes/offcanvas.php') ?>

	


	<div class="p-5 bg-primary text-white text-center">
	  <h1>Home</h1>
	  <p>books</p> 
	</div>
	<!-- navbar -->
	<?php include( ROOT_PATH . '/includes/navbar.php') ?>

			

	<div class="container mt-5">
		<!-- banner -->
		<?php #include( ROOT_PATH . '/includes/banner.php') ?>
		
		<?php include( ROOT_PATH . '/includes/filters_html.php') ?>		


		<div class="content">

			<div class="row">
				<div class="col">
					<h2 class="content-title">Books</h2>
				</div>
				<div class="col-auto justify-content-end">
					<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvas">Filters</button>
				</div>
				
			</div>

			<hr>

			<?php include( ROOT_PATH . '/includes/filters_active_html.php') ?>	

			<div class="grid-books">
			<?php
			foreach ($books as $book): ?>
				<?php
				// var_dump($book);
				?>					
				<!-- <div class="col-sm-3"> -->
					<div class="card">
						<div class="card-body">
							<h6 class="card-title"><?php echo ($book["url"]) ? "<a href='".$book["url"]."' target='_blank'>".$book["name"]."</a>" : $book["name"]; ?></h6>
							<!-- <p class="card-text">Some example text. Some example text.</p>
							<a href="#" target="_blank" class="card-link">Card link</a>
							<a href="#" class="card-link">Another link</a> -->
						</div>
					</div>
				<!-- </div> -->
			<?php endforeach ?>
			</div>
			<hr>
			<div class="row">
				<!-- Pagination -->
				<?php 
				$pagePrev = $page - 1;
				$pageNext = $page + 1;
				?>

				<nav class="d-flex justify-content-center">
					<ul class="pagination justify-content-center_ m-0" style="overflow: auto;">
						<?php 
						echo '<li class="page-item '. (($page <= 1) ? 'disabled' : '') .'"><a class="page-link" href="'.(($page <= 1) ? '#' : '?page='.$prev) .'">Prev</a></li>';
						echo '<li class="page-item '. (($page == 1) ? 'active' : '') .'"><a class="page-link" href="index.php?page=1"> 1 </a></li>';
						
						if($prev > 1) { 
							if($page != 3) {
								echo '<li class="page-item"><div class="page-link disabled"> ... </div></li>';
							}
							echo '<li class="page-item"><a class="page-link" href="index.php?page='.$prev.'"> '.$prev.'</a></li>';
						}	

						if($page != 1 && $page != $totoalPages) {
							echo '<li class="page-item active"><a class="page-link" href="index.php?page='.$page.'"> '.$page.' </a></li>';
						}

						if($next < $totoalPages) { 
							echo '<li class="page-item"><a class="page-link" href="index.php?page='.$next.'"> '.$next.'</a></li>';
							if($page != ($totoalPages - 2)) { 
								echo '<li class="page-item"><div class="page-link disabled"> ... </div></li>';
							} 
						}

						if($totoalPages != 1) {
							echo '<li class="page-item '. (($page == $totoalPages) ? 'active' : '') .'"><a class="page-link" href="index.php?page='. $totoalPages .'"> '. $totoalPages .' </a></li>';
						}
						echo '<li class="page-item '. (($page >= $totoalPages) ? 'disabled' : '') .'"><a class="page-link" href="'. (($page >= $totoalPages) ? '#' : '?page='.$next) .'">Next</a></li>';
						?>
					</ul>
				</nav>
			</div>
		</div>
	</div>

	<!-- footer -->
	<?php include( ROOT_PATH . '/includes/footer.php') ?>