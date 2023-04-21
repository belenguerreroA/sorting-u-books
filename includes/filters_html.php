<?php
$tree = buildTree();
$htmlTree = buildHtmlTree($tree);
?>

<div class="formmm">
	<!-- <form action="<?php //echo BASE_URL . 'index.php?g_include='.$g_incl_p.'&g_exclude='.$g_excl_p; ?>" method="post"> -->
	<form id="filters" action="<?php echo BASE_URL . 'index.php'; ?>" method="get">
		<?php echo "<div class='tree'>". $htmlTree ."</div>"; ?>
		<input type="hidden" id="f-genre-include" name="g_include" value="<?php echo $g_incl; ?>">
		<input type="hidden" id="f-genre-exclude" name="g_exclude" value="<?php echo $g_excl; ?>">
		<button class="btn btn-primary" type="submit">Apply</button>
	</form>

	<!-- babies <i class="bi bi-suit-heart-fill"></i> <br>
	women only <i class="bi bi-asterisk"></i> <br>
	shared <i class="bi bi-plus-circle"></i> <br>
	related work exist <i class="bi bi-plus-circle-dotted"></i> <br>
	warning <i class="bi bi-exclamation-circle"></i> <br>
	not read <i class="bi bi-eye-slash"></i> <br>
	abandoned <i class="bi bi-x-octagon"></i>
	<p>category</p>
	<p>type</p>
	<p>number</p> -->
	
</div>
