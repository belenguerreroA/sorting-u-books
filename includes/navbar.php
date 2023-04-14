<!-- <div class="navbar">
	<div class="logo_div">
		<a href="index.php"><h1>LifeBlog</h1></a>
	</div>
	<ul>
	  <li><a class="active" href="index.php">Home</a></li>
	  <li><a href="#news">News</a></li>
	  <li><a href="#contact">Contact</a></li>
	  <li><a href="#about">About</a></li>
	</ul>
</div> -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link active" href="#">Active</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
    <?php if (isset($_SESSION['user']['username'])) { ?>
		<div class="d-flex logged_in_info">
			<span>welcome <?php echo $_SESSION['user']['username'] ?></span>
			|
			<span><a href="logout.php">logout</a></span>
		</div>
	<?php }else{ ?>
		<div class="d-flex banner">
			<form action="<?php echo BASE_URL . 'index.php'; ?>" method="post" >	
				<div class="row">
					<div class="col-auto">
						<input class="form-control form-control-sm" type="text" name="username" value="<?php echo $username; ?>" placeholder="Username" style="max-width: 120px;">
					</div>
					<div class="col-auto">
						<input class="form-control form-control-sm" type="password" name="password" placeholder="Password" style="max-width: 120px;">
					</div>
					<div class="col col-auto">
						<button class="btn btn-primary btn-block btn-sm" type="submit" name="login_btn">Sign in</button>
					</div>
				</div>
				<div class="row">
					<div style="width: 60%; margin: 0px auto;">
						<?php include(ROOT_PATH . '/includes/errors.php') ?>
					</div>
				</div>
			</form>
		</div>
	<?php } ?>
  </div>
</nav>