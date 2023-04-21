<?php
$genres = getGenres();
?>
<?php if($g_incl || $g_excl) { ?>
<div class="filters-active ">
    <div class='card_'>
        <div class='card-body_'>
            <small>filters: </small>

            <?php
            $active_g_incl = ($g_incl) ? explode(",", $g_incl) : "";
            $active_g_excl = ($g_excl) ? explode(",", $g_excl) : "";
            // var_dump($active_g_incl);

            if($active_g_incl) {
                // echo "include: <br>";
                foreach($active_g_incl as $a_g_incl) {
                    // echo "<span class='badge bg-info'>" . $genres[$a_g_incl] . "</span>";
                    echo "<span class='border border-info rounded small cursor-default'>&nbsp;" . $genres[$a_g_incl] . "&nbsp;</span>";
                }
            }

            if($active_g_excl) {
                // echo "exclude: <br>";
                foreach($active_g_excl as $a_g_excl) {
                    echo "<span class='border border-danger rounded small cursor-default'>&nbsp;" . $genres[$a_g_excl] . "&nbsp;</span>";
                }
            }
            ?>
        </div>
    </div>
</div>
<?php } ?>
