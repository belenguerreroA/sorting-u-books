<?php
$tree = buildTree();
$htmlTree = buildHtmlTree($tree);
$htmlType = buildHtmlType();
$htmlWarnings = buildHtmlWarnings();
$htmlDetails = buildHtmlDetails();
?>

<div class="form">
	<!-- <form action="<?php //echo BASE_URL . 'index.php?g_include='.$g_incl_p.'&g_exclude='.$g_excl_p; ?>" method="post"> -->
	<form id="filters" action="<?php echo BASE_URL . 'index.php'; ?>" method="get">
		<div class="row">
			<div class="col-auto"><button class="btn btn-primary btn-apply" type="submit">Apply</button></div>
			<div class="col-2"><button class="btn btn-secondary btn-reset"><i class="bi bi-arrow-counterclockwise"></i></button></div>
		</div>
		
		
		<h6>Genre:</h6>
		<?php echo "<div class='tree'>". $htmlTree ."</div>"; ?>
		<div class="tree">
			<ul>
				<li data-id="t-1">
					<span data-id="t-1" class="f-option pointer list-style caret-right"><i class="bi bi-circle-fill"></i><i class="bi bi-caret-right-fill"></i><i class="bi bi-caret-down-fill"></i></span>
					<h6>Type:</h6>
					<?php echo $htmlType; ?>
				</li>

				<li data-id="w-1">
					<span data-id="w-1" class="f-option pointer list-style caret-right"><i class="bi bi-circle-fill"></i><i class="bi bi-caret-right-fill"></i><i class="bi bi-caret-down-fill"></i></span>
					<h6>Warnings:</h6>
					<?php echo $htmlWarnings; ?>
				</li>

				<li data-id="d-1">
					<span data-id="d-1" class="f-option pointer list-style caret-right"><i class="bi bi-circle-fill"></i><i class="bi bi-caret-right-fill"></i><i class="bi bi-caret-down-fill"></i></span>
					<h6>Details:</h6>
					<?php echo $htmlDetails; ?>
				</li>
			</ul>
		</div>

		<input type="hidden" id="f-genre-include" name="g_include" value="<?php echo $g_incl; ?>">
		<input type="hidden" id="f-genre-exclude" name="g_exclude" value="<?php echo $g_excl; ?>">

		<input type="hidden" id="f-type-include" name="type_include" value="<?php echo $t_incl; ?>">
		<input type="hidden" id="f-type-exclude" name="type_exclude" value="<?php echo $t_excl; ?>">

		<input type="hidden" id="f-warning-include" name="w_include" value="<?php echo $w_incl; ?>">
		<input type="hidden" id="f-warning-exclude" name="w_exclude" value="<?php echo $w_excl; ?>">

		<input type="hidden" id="f-detail-include" name="d_include" value="<?php echo $d_incl; ?>">
		<input type="hidden" id="f-detail-exclude" name="d_exclude" value="<?php echo $d_excl; ?>">

	</form>

	
	
</div>
