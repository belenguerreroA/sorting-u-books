<!-- The first include should be config.php -->
<?php require_once('config.php') ?>
<!-- config.php should be here as the first include  -->

<?php require_once( ROOT_PATH . '/includes/public_functions.php') ?>
<?php #require_once( ROOT_PATH . '/includes/registration_login.php') ?>

<?php
  if(isset($_POST['records-limit'])){
      $_SESSION['records-limit'] = $_POST['records-limit'];
  }
  
  $limit = isset($_SESSION['records-limit']) ? $_SESSION['records-limit'] : 12;
  $page = (isset($_GET['page']) && is_numeric($_GET['page']) ) ? $_GET['page'] : 1;
  $paginationStart = ($page - 1) * $limit;
  $books = getBooks($paginationStart, $limit);
  // Get total records
  $countBooks = countBooks();

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
	  <h1>My First Bootstrap 5 Page</h1>
	  <p>Resize this responsive page to see the effect!</p> 
	</div>
	<!-- navbar -->
	<?php include( ROOT_PATH . '/includes/navbar.php') ?>

			

	<div class="container mt-5">
		<!-- banner -->
		<?php #include( ROOT_PATH . '/includes/banner.php') ?>

		<div class="content">
			<!-- <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Library</li>
				</ol>
			</nav> -->

			<div class="row">
				<div class="col">
					<h2 class="content-title">Books</h2>
				</div>
				<div class="col-auto justify-content-end">
					<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvas">Filters</button>
				</div>
				
			</div>
			
				

			<hr>

			<div class="row">
			<?php
			foreach ($books as $book): ?>
				<?php
				// var_dump($book);
				?>					
				<div class="col-sm-3">
					<div class="card">
						<div class="card-body">
							<h6 class="card-title"><?php echo ($book["url"]) ? "<a href='".$book["url"]."' target='_blank'>".$book["name"]."</a>" : $book["name"]; ?></h6>
							<!-- <p class="card-text">Some example text. Some example text.</p>
							<a href="#" target="_blank" class="card-link">Card link</a>
							<a href="#" class="card-link">Another link</a> -->
						</div>
					</div>
				</div>
			<?php endforeach ?>
			</div>
			<hr>
			<div class="row">
				<?php
				// var_dump($totoalPages);
				// var_dump((int)$page);

				?>
				<!-- Pagination -->

				<nav >
					<ul class="pagination justify-content-center_ m-0" style="overflow: auto;">
						<li class="page-item <?php if($page <= 1){ echo 'disabled'; } ?>">
							<a class="page-link" href="<?php if($page <= 1){ echo '#'; } else { echo "?page=" . $prev; } ?>">Previous</a>
						</li>

						<?php for($i = 1; $i <= $totoalPages; $i++ ): ?>
						<li class="page-item <?php if($page == $i) {echo 'active'; } ?>">
							<a class="page-link" href="index.php?page=<?= $i; ?>"> <?= $i; ?> </a>
						</li>
						<?php endfor; ?>

						<li class="page-item <?php if($page >= $totoalPages) { echo 'disabled'; } ?>">
							<a class="page-link" href="<?php if($page >= $totoalPages){ echo '#'; } else {echo "?page=". $next; } ?>">Next</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>

	

	<script>
	$(document).ready(function () {
		$('#records-limit').change(function () {
			$('form').submit();
		})
	});
	</script>

	<!-- footer -->
	<?php include( ROOT_PATH . '/includes/footer.php') ?>