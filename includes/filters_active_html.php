
<?php if($g_incl || $g_excl) { ?>
<div class="filters-active ">
    <div class='card_'>
        <div class='card-body_'>
            <small>filters: </small>

            <?php
            $active_g_incl = ($g_incl) ? explode(",", $g_incl) : "";
            $active_g_excl = ($g_excl) ? explode(",", $g_excl) : "";
            $active_t_incl = ($t_incl) ? explode(",", $t_incl) : "";
            $active_t_excl = ($t_excl) ? explode(",", $t_excl) : "";
            $active_w_incl = ($w_incl) ? explode(",", $w_incl) : "";
            $active_w_excl = ($w_excl) ? explode(",", $w_excl) : "";
            $active_d_incl = ($d_incl) ? explode(",", $d_incl) : "";
            $active_d_excl = ($d_excl) ? explode(",", $d_excl) : "";

            if($active_g_incl) {
                foreach($active_g_incl as $a_g_incl) {
                    echo "<span class='border border-info rounded small cursor-default'>&nbsp;" . $genres[$a_g_incl] . "&nbsp;</span>";
                }
            }
            if($active_t_incl) {
                foreach($active_t_incl as $a_t_incl) {
                    echo "<span class='border border-info rounded small cursor-default'>&nbsp;" . $genres[$a_t_incl] . "&nbsp;</span>";
                }
            }
            if($active_w_incl) {
                foreach($active_w_incl as $a_w_incl) {
                    echo "<span class='border border-info rounded small cursor-default'>&nbsp;" . $genres[$a_w_incl] . "&nbsp;</span>";
                }
            }
            if($active_d_incl) {
                foreach($active_d_incl as $a_d_incl) {
                    echo "<span class='border border-info rounded small cursor-default'>&nbsp;" . $genres[$a_d_incl] . "&nbsp;</span>";
                }
            }

            if($active_g_excl) {
                foreach($active_g_excl as $a_g_excl) {
                    echo "<span class='border border-danger rounded small cursor-default'>&nbsp;" . $genres[$a_g_excl] . "&nbsp;</span>";
                }
            }
            if($active_t_excl) {
                foreach($active_t_excl as $a_t_excl) {
                    echo "<span class='border border-danger rounded small cursor-default'>&nbsp;" . $genres[$a_t_excl] . "&nbsp;</span>";
                }
            }
            if($active_w_excl) {
                foreach($active_w_excl as $a_w_excl) {
                    echo "<span class='border border-danger rounded small cursor-default'>&nbsp;" . $genres[$a_w_excl] . "&nbsp;</span>";
                }
            }
            if($active_d_excl) {
                foreach($active_d_excl as $a_d_excl) {
                    echo "<span class='border border-danger rounded small cursor-default'>&nbsp;" . $genres[$a_d_excl] . "&nbsp;</span>";
                }
            }
            ?>
        </div>
    </div>
</div>
<?php } ?>
