<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link <?php echo(($_SERVER['REQUEST_URI'] == "/") ? 'active' : '') . ((strpos($_SERVER['REQUEST_URI'], 'index.php') !== false) ? 'active' : '') ?>" href="/">Home</a>
      </li>
	  <?php
	  if (isset($_SESSION['user']['username'])) {
		echo '<li class="nav-item"><a class="nav-link '.(($_SERVER['REQUEST_URI'] == "/admin/dashboard.php") ? "active" : "") .'" href="'.BASE_URL .'admin/dashboard.php">Admin</a></li>';
	  }
	  ?>
    </ul>
    <?php if (isset($_SESSION['user']['username'])) { ?>
		<div class="d-flex logged_in_info">
			<span>Welcome <?php echo $_SESSION['user']['username'] ?></span>
			&nbsp;|&nbsp;
			<span><a href="logout.php">logout</a></span>
		</div>
	<?php }else{ ?>
		<div class="d-flex banner">
			<form action="<?php echo BASE_URL . 'index.php'; ?>" method="post" >	
				<div class="row-login">
					<div class="">
						<input class="form-control form-control-sm" type="text" name="username" value="<?php echo $username; ?>" placeholder="Username" >
					</div>
					<div class="">
						<input class="form-control form-control-sm" type="password" name="password" placeholder="Password" >
					</div>
					<div class="">
						<button class="btn btn-primary btn-sm" type="submit" name="login_btn">Sign in</button>
					</div>
					<div class="msg-login text-center">
						<?php include(ROOT_PATH . '/includes/errors.php') ?>
					</div>
				</div>
			</form>
		</div>
	<?php } ?>
  </div>
</nav>