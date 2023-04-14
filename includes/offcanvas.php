<?php
$genres = getGenres();
?>
<div class="offcanvas offcanvas-end" id="offcanvas">
	<div class="offcanvas-header">
		<h1 class="offcanvas-title">Filters</h1>
		<button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
	</div>
	<div class="offcanvas-body">
		<?php //var_dump($genres["name"]); ?>
		<?php
		foreach($genres as $genre) {
			echo $genre["id"]." - ". $genre["name"]."<br>";
		}
		?>
		<p>category</p>
		<p>type</p>
		<p>number</p>
		<button class="btn btn-primary" type="button">Apply</button>
	</div>
</div>