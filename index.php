<!-- The first include should be config.php -->
<?php require_once('config.php') ?>
<!-- config.php should be here as the first include  -->

<?php require_once( ROOT_PATH . '/includes/public_functions.php') ?>
<?php require_once( ROOT_PATH . '/includes/registration_login.php') ?>

<?php
if(isset($_POST['records-limit'])){
	$_SESSION['records-limit'] = $_POST['records-limit'];
}
  
$limit = isset($_SESSION['records-limit']) ? $_SESSION['records-limit'] : 16;
$page = (isset($_GET['page']) && is_numeric($_GET['page']) ) ? $_GET['page'] : 1;
$g_incl = (isset($_GET['g_include'])) ? $_GET['g_include'] : "";
$g_excl = (isset($_GET['g_exclude'])) ? $_GET['g_exclude'] : "";
$t_incl = (isset($_GET['t_include'])) ? $_GET['t_include'] : "";
$t_excl = (isset($_GET['t_exclude'])) ? $_GET['t_exclude'] : "";
$w_incl = (isset($_GET['w_include'])) ? $_GET['w_include'] : "";
$w_excl = (isset($_GET['w_exclude'])) ? $_GET['w_exclude'] : "";
$d_incl = (isset($_GET['d_include'])) ? $_GET['d_include'] : "";
$d_excl = (isset($_GET['d_exclude'])) ? $_GET['d_exclude'] : "";

$paginationStart = ($page - 1) * $limit;

$books = getBooks($paginationStart, $limit,$g_incl,$g_excl,$t_incl,$t_excl,$w_incl,$w_excl,$d_incl,$d_excl);
$genres = getGenres();
$types = getTypes();
$details = getDetails();

// Get total records
$countBooks = countBooks($g_incl,$g_excl,$t_incl,$t_excl,$w_incl,$w_excl,$d_incl,$d_excl);

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

	


	<div class="p-5 bg-primary text-white text-center d-none">
	  <h1>Home</h1>
	  <p>books</p> 
	</div>
	<!-- navbar -->
	<?php include( ROOT_PATH . '/includes/navbar.php') ?>

			

	<div class="container mt-4">
		<!-- banner -->
		<?php #include( ROOT_PATH . '/includes/banner.php') ?>
		
		<?php #include( ROOT_PATH . '/includes/filters_html.php') ?>		


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
			foreach ($books as $book) { 
				?>
				<div class="card book-data <?php echo "type-".$book["type_id"]; ?>" data-book-id="<?php echo $book["id"] ?>">
					<div class="card-header">
						<?php
						echo '<span title="'.htmlentities($types[$book["type_id"]]).'">'.$types[$book["type_id"]].'</span>';
						?>
					</div>
					<div class="card-body">
						<h6 class="card-title"><?php echo ($book["url"]) ? "<a href='".$book["url"]."' target='_blank'>".htmlentities($book["name"])."</a>" : htmlentities($book["name"],ENT_QUOTES,'UTF-8'); ?></h6>
						<?php
						$lastChilds = '';
						foreach(getLastChild($book['genres']) as $lc) {
							$lastChilds .= $lc['id'].',';
						}
						echo '<div class="branch"><input class="hdn-chs" type="hidden" id="hdn-chs-'.$book['id'].'" name="hdn-chs-'.$book['id'].'" value="'.$lastChilds.'"></div>';
						?>
					</div>
					<div class="card-footer d-flex">
						<div class="book-details">
							<?php
							echo ($book["n_series"]) ? '<span data-bs-toggle="tooltip" title="Number of full-length novels in the series" class="book-detail n-series border rounded cursor-default">'.$book["n_series"].'</span>' : '';
							echo ($book["shared_universe"] == "1") ? '<span data-bs-toggle="tooltip" title="Part of a shared-universe or similar" class="book-detail"><i class="bi bi-plus-circle"></i></span>' : '';
							echo ($book["has_related"] == "1") ? '<span data-bs-toggle="tooltip" title="Some related works exist, ie. short stories, web chapters etc." class="book-detail"><i class="bi bi-plus-circle-dotted"></i></span>' : '';
							echo ($book["warning"]) ? '<span data-bs-toggle="tooltip" title="Warning: series gets worse, turns het, or has other issues" class="book-detail"><i class="bi bi-exclamation-circle"></i></span>' : '';
							echo ($book["not_read_all"]) ? '<span data-bs-toggle="tooltip" title="Haven&apos;t read all of it so can&apos;t vouch for the content of all novels" class="book-detail"><i class="bi bi-eye-slash"></i></span>' : '';
							echo ($book["available"]) ? '<span data-bs-toggle="tooltip" title="Series might not be easily available or abandoned" class="book-detail"><i class="bi bi-x-octagon"></i></span>' : '';
							echo ($book["m_wo"]) ? '<span data-bs-toggle="tooltip" title="Matriarchies, women-only, etc." class="book-detail"><i class="bi bi-asterisk"></i></span>' : '';
							echo ($book["science_babies"]) ? '<span data-bs-toggle="tooltip" title="Science or magic babies" class="book-detail"><i class="bi bi-suit-heart-fill"></i></span>' : '';
							?>
						</div>
						<div class="book-warnings ml-auto align-self-center">
							<?php
							foreach(explode(",", $book["warnings"]) as $w) {
								echo '<i data-bs-toggle="tooltip" title="'.htmlentities($details[$w]).'" class="bi bi-circle-fill warning-'.$w.'"></i>';
							}
							?>
						</div>
						
					</div>
				</div>
			<?php } ?>
			</div>
			<hr>
			<div class="row">
				<div class="d-flex ">
				<?php 
				$nStart = ($books) ? $paginationStart+1 : 0;
				echo "Showing ". $nStart ." to ". ($paginationStart+count($books)) ." of ". $countBooks ." entries"; 
				?>
				</div>
				<!-- Pagination -->
				<nav class="d-flex justify-content-center">
					<ul class="pagination justify-content-center_ m-0" style="overflow: auto;">
						<?php 
						echo '<li class="page-item '. (($page <= 1) ? 'disabled' : '') .'"><button class="page-link" data-page="'.(($page <= 1) ? '#' : $prev) .'">Prev</button></li>';
						echo '<li class="page-item '. (($page == 1) ? 'active' : '') .'"><button class="page-link" data-page="1"> 1 </button></li>';
						
						if($prev > 1) { 
							if($page != 3) {
								echo '<li class="page-item"><div class="page-link disabled"> ... </div></li>';
							}
							echo '<li class="page-item"><button class="page-link" data-page="'.$prev.'"> '.$prev.'</button></li>';
						}	

						if($page != 1 && $page != $totoalPages) {
							echo '<li class="page-item active"><button class="page-link" data-page="'.$page.'"> '.$page.' </button></li>';
						}

						if($next < $totoalPages) { 
							echo '<li class="page-item"><button class="page-link" data-page="'.$next.'"> '.$next.'</button></li>';
							if($page != ($totoalPages - 2)) { 
								echo '<li class="page-item"><div class="page-link disabled"> ... </div></li>';
							} 
						}

						if($totoalPages > 1) {
							echo '<li class="page-item '. (($page == $totoalPages) ? 'active' : '') .'"><button class="page-link" data-page="'. $totoalPages .'"> '. $totoalPages .' </button></li>';
						}
						echo '<li class="page-item '. (($page >= $totoalPages) ? 'disabled' : '') .'"><button class="page-link" data-page="'. (($page >= $totoalPages) ? '#' : $next) .'">Next</button></li>';
						?>
					</ul>
				</nav>
			</div>
		</div>
	</div>

	<!-- footer -->
	<?php include( ROOT_PATH . '/includes/footer.php') ?>