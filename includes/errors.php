<?php if (count($errors) > 0) : ?>
  <div class="" >
  	<?php foreach ($errors as $error) : ?>
  	  <span class="text-danger small"><?php echo $error ?></span>
  	<?php endforeach ?>
  </div>
<?php endif ?>