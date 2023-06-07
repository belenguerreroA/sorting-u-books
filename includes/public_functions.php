<?php
function getBooks($paginationStart, $limit, $g_incl="",$g_excl="", $t_incl="",$t_excl="", $w_incl="",$w_excl="", $d_incl="",$d_excl="") {
	global $conn;
	$g_in 		= ($g_incl) ? "AND t4.genre_id IN (".$g_incl.")" : ""; 
	$g_not_in 	= ($g_excl) ? "AND t4.genre_id IN (".$g_excl.")" : "";
	$t_in 		= ($t_incl) ? "AND t3.type_id IN (".$t_incl.")" : "";
	$t_not_in 	= ($t_excl) ? "AND t3.type_id IN (".$t_excl.")" : "";
	$w_in 		= ($w_incl) ? "AND t6.detail_id IN (".$w_incl.")" : "";
	$w_not_in 	= ($w_excl) ? "AND t6.detail_id IN (".$w_excl.")" : "";
	$t_in 		= ($t_incl) ? "AND t3.type_id IN (".$t_incl.")" : "";
	$t_not_in 	= ($t_excl) ? "AND t3.type_id IN (".$t_excl.")" : "";
	$d_ 		= ($g_excl) ? "AND t3.not_read_all ='1'" : "";

	$sql = "SELECT GROUP_CONCAT(DISTINCT t2.genre_id) AS genres, GROUP_CONCAT(DISTINCT t5.detail_id) AS 'warnings', t1.id, t1.type_id, t1.name, 
	t1.author, t1.n_series, t1.shared_universe, t1.has_related, t1.warning, t1.not_read_all, t1.available, 
	t1.m_wo, t1.science_babies, t1.url 
	FROM books t1 
	JOIN book_genre t2 ON t1.id = t2.book_id 
	JOIN book_detail t5 ON t1.id = t5.book_id
	WHERE t1.deleted=0 
	AND t2.book_id IN (
		SELECT t3.id 
		FROM books t3 
		JOIN book_genre t4 ON t3.id = t4.book_id 
		JOIN book_detail t6 ON t3.id = t6.book_id
		WHERE t3.deleted=0 ".$g_in." ".$t_in." ".$w_in."
		GROUP BY t4.book_id
	) 
	AND t2.book_id NOT IN (
		SELECT t3.id 
		FROM books t3 
		JOIN book_genre t4 ON t3.id = t4.book_id 
		JOIN book_detail t6 ON t3.id = t6.book_id
		WHERE t3.deleted=0 ".$g_not_in." ".$t_not_in." ".$w_not_in."
		GROUP BY t4.book_id
	) 
	GROUP BY t2.book_id ORDER BY t1.id ASC LIMIT ".$paginationStart.",".$limit;
	var_dump($sql);
	
	$result = mysqli_query($conn, $sql);
	$datas = mysqli_fetch_all($result, MYSQLI_ASSOC);
	$final_datas = array();
	foreach ($datas as $data) {
		array_push($final_datas, $data);
	}
	return $final_datas;
}

function countBooks($g_incl="",$g_excl="",$t_incl="",$t_excl="", $w_incl="",$w_excl="", $d_incl="",$d_excl="") {
	global $conn;
	$g_in 		= ($g_incl) ? "AND t4.genre_id IN (".$g_incl.")" : ""; 
	$g_not_in 	= ($g_excl) ? "AND t4.genre_id NOT IN (".$g_excl.")" : "";
	$t_in 		= ($t_incl) ? "AND t3.type_id IN (".$t_incl.")" : "";
	$t_not_in 	= ($t_excl) ? "AND t3.type_id NOT IN (".$t_excl.")" : "";
	$w_in 		= ($w_incl) ? "AND t6.detail_id IN (".$w_incl.")" : "";
	$w_not_in 	= ($w_excl) ? "AND t6.detail_id NOT IN (".$w_excl.")" : "";
	$t_in 		= ($t_incl) ? "AND t3.type_id IN (".$t_incl.")" : "";
	$t_not_in 	= ($t_excl) ? "AND t3.type_id NOT IN (".$t_excl.")" : "";
	$d_ 		= ($g_excl) ? "AND t3.not_read_all ='1'" : "";
	$sql = "SELECT COUNT(*) as count FROM (
		SELECT (t3.id)
		FROM books t3 
		JOIN book_genre t4 ON t3.id = t4.book_id 
		JOIN book_detail t6 ON t3.id = t6.book_id
		WHERE t3.deleted=0 ".$g_in." ".$g_not_in." ".$t_in." ".$t_not_in." ".$w_in." ".$w_not_in."
		GROUP BY t4.book_id
	) tot";
	$result = mysqli_query($conn, $sql);
	$count = mysqli_fetch_assoc($result);
	return $count['count'];

}

function getGenres() {
	global $conn;
	$sql = "SELECT id, name FROM genre;";
	$result = mysqli_query($conn, $sql);
	$datas = mysqli_fetch_all($result, MYSQLI_ASSOC);
	$final_datas = array();
	foreach ($datas as $data) {
		$final_datas[$data["id"]] = $data["name"];
	}
	return $final_datas;
}

function getGenreParent($id) {
	global $conn;
	$sql = "SELECT id, name FROM genre;";
	$result = mysqli_query($conn, $sql);
	$datas = mysqli_fetch_all($result, MYSQLI_ASSOC);
	$final_datas = array();
	foreach ($datas as $data) {
		$final_datas[$data["id"]] = $data["name"];
	}
	return $final_datas;
}

function buildTree() {
	global $conn;
	$sql = "SELECT t2.id AS id, t2.name AS cat, t3.id AS parent_id, t3.name AS parent, t1.direct FROM genre_tree t1 LEFT JOIN genre t2 ON t1.genre_id = t2.id LEFT JOIN genre t3 ON t1.parent = t3.id;";
	$result = mysqli_query($conn, $sql);
	$datas = mysqli_fetch_all($result, MYSQLI_ASSOC);
	$items = array();
	foreach ($datas as $data) {
		array_push($items, $data);
	}

    $children = array();

    foreach($items as &$item) {
		$children[(int)$item['parent_id']][] = &$item;
	}

    foreach($items as &$item) {
		if (isset($children[$item['id']])) {
		    $item['children'] = $children[$item['id']];
		}
	}
   
    return $children[0]; // Root only.
}

function buildHtmlTree($arr, $pId='') {
	$html = '<ul parent-id="'.$pId.'">'.PHP_EOL;
	foreach ($arr as $v) {
		$html .= "<li class='".(($v["direct"] == 1) ? "direct" : "")."' data-id='".$v["id"]."' data-direct='".$v["direct"]."'>
		<span data-id='".$v["id"]."' class='f-option pointer list-style ".((array_key_exists('children', $v)) ? 'caret-right' : 'circle')."'><i class='bi bi-circle-fill'></i><i class='bi bi-caret-right-fill'></i><i class='bi bi-caret-down-fill'></i></span>
		<button type='button' data-id='".$v["id"]."' class='btn btn-small btn-f-option btn-g btn-outline-secondary none'><span>".$v["cat"]."</span><i class='bi bi-check'></i><i class='bi bi-dash'></i></button>";

		if (array_key_exists('children', $v)) {
			$html .= buildHtmlTree($v['children'], $v["id"]);
			$html .= '</li>'.PHP_EOL;
		}
	}
	$html .= '</ul>'.PHP_EOL;

	return $html;
}

function buildHtmlType() {
	global $conn;
	$sql = "SELECT id, name FROM type;";
	$result = mysqli_query($conn, $sql);
	$datas = mysqli_fetch_all($result, MYSQLI_ASSOC);

	$html = '<ul parent-id="t-1">'.PHP_EOL;
	foreach ($datas as $data) {	
		$html .= "<li type-id='".$data["id"]."'>
		<button type='button' type-id='".$data["id"]."' class='btn btn-small btn-f-option btn-t btn-outline-secondary none'><span>".$data["name"]."</span><i class='bi bi-check'></i><i class='bi bi-dash'></i></button>";
		$html .= '</li>'.PHP_EOL;
	}
	$html .= '</ul>'.PHP_EOL;

	return $html;
}


function buildHtmlDetails() {
	global $conn;
	$sql = "SELECT id, name FROM book_parameters WHERE searchable = 1;";
	$result = mysqli_query($conn, $sql);
	$datas = mysqli_fetch_all($result, MYSQLI_ASSOC);

	$html = '<ul parent-id="d-1">'.PHP_EOL;
	foreach ($datas as $data) {	
		$id = $data["id"];
		$bi_class = ($id == "10") ? "bi-suit-heart-fill" : (($id == "9") ? "bi-asterisk" : (($id == "4") ? "bi-plus-circle" : (($id == "5") ? "bi-plus-circle-dotted" : (($id == "6") ? "bi-exclamation-circle" : (($id == "7") ? "bi-eye-slash" : (($id == "8") ? "bi-x-octagon" : ""))))));
		$html .= "<li detail-id='".$data["id"]."'>
		<button type='button' detail-id='".$data["id"]."' class='btn btn-small btn-f-option btn-d btn-outline-secondary none'><span><i class='bi ".$bi_class." small'></i> ".$data["name"]."</span><i class='bi bi-check'></i><i class='bi bi-dash'></i></button>";
		$html .= '</li>'.PHP_EOL;
	}
	$html .= '</ul>'.PHP_EOL;

	return $html;
}

function buildHtmlWarnings() {
	global $conn;
	$sql = "SELECT id, name FROM detail;";
	$result = mysqli_query($conn, $sql);
	$datas = mysqli_fetch_all($result, MYSQLI_ASSOC);

	$html = '<ul parent-id="w-1">'.PHP_EOL;
	foreach ($datas as $data) {	
		$html .= "<li warning-id='".$data["id"]."'>
		<button type='button' warning-id='".$data["id"]."' class='btn btn-small btn-f-option btn-w btn-outline-secondary none'><span><i class='bi bi-circle-fill warning-".$data["id"]." small'></i> ".$data["name"]."</span><i class='bi bi-check'></i><i class='bi bi-dash'></i></button>";
		$html .= '</li>'.PHP_EOL;
	}
	$html .= '</ul>'.PHP_EOL;

	return $html;
}

function getLastChild($ids) {
	global $conn;
	$sql = "SELECT t1.id as id, t1.name, t2.parent, t2.direct as direct FROM genre t1
	join genre_tree t2 on t1.id = t2.genre_id  
	WHERE t1.id in (".$ids.")";
	$result = mysqli_query($conn, $sql);
	$datas = mysqli_fetch_all($result, MYSQLI_ASSOC);
	$final_datas = [];
	$i = 0;

	foreach ($datas as $data) {
		$final_datas[] = ["id" => $data["id"], "direct" => $data["direct"]];
	}

	$wo_childs = [];
	foreach($final_datas as $f_data) {
		$sql_2 = "SELECT t1.id FROM genre t1
				join genre_tree t2 on t1.id = t2.genre_id  
				WHERE t1.id in (".$ids.") and t2.parent in (".(int)$f_data["id"].");";
		$result_2 = mysqli_query($conn, $sql_2);
		$datas_2 = mysqli_fetch_all($result_2, MYSQLI_ASSOC);
		if(count($datas_2) == 0) {
			$wo_childs[] = ["id" => $f_data["id"], "direct" => $f_data["direct"]];
		}
	}
	return $wo_childs;
}

function getParents($id, $parents = []) {
	// var li = $('.tree li[data-id='+id+']');

	// if(!parents.length) {
	// 	var parents = [];
	// } else {
	// 	parents = parents;
	// }
	
	// arr = [];
	// li.parent().each(function() {
	// 	if($(this).attr('parent-id')) {
	// 		arr.push($(this).attr('parent-id'));
	// 		parents.push($(this).attr('parent-id'));
	// 	}
			
	// });
	
	// $.each(arr, function(i,value) {
	// 	if ($('.tree ul[parent-id='+value+']').length) {
	// 		getParents(value, parents);
	// 	}
	// });

	// return parents;
}

function getTypes() {
	global $conn;
	$sql = "SELECT id, name FROM type;";
	$result = mysqli_query($conn, $sql);
	$datas = mysqli_fetch_all($result, MYSQLI_ASSOC);
	$final_datas = array();
	foreach ($datas as $data) {
		$final_datas[$data["id"]] = $data["name"];
	}
	return $final_datas;
}

function getDetails() {
	global $conn;
	$sql = "SELECT id, name FROM detail;";
	$result = mysqli_query($conn, $sql);
	$datas = mysqli_fetch_all($result, MYSQLI_ASSOC);
	$final_datas = array();
	foreach ($datas as $data) {
		$final_datas[$data["id"]] = $data["name"];
	}
	return $final_datas;
}




function getPostTopic($post_id){
	global $conn;
	$sql = "SELECT * FROM topics WHERE id=
			(SELECT topic_id FROM post_topic WHERE post_id=$post_id) LIMIT 1";
	$result = mysqli_query($conn, $sql);
	$topic = mysqli_fetch_assoc($result);
	return $topic;
}
/* * * * * * * * * * * * * * * *
* Returns all posts under a topic
* * * * * * * * * * * * * * * * */
function getPublishedPostsByTopic($topic_id) {
	global $conn;
	$sql = "SELECT * FROM posts ps 
			WHERE ps.id IN 
			(SELECT pt.post_id FROM post_topic pt 
				WHERE pt.topic_id=$topic_id GROUP BY pt.post_id 
				HAVING COUNT(1) = 1)";
	$result = mysqli_query($conn, $sql);
	// fetch all posts as an associative array called $posts
	$posts = mysqli_fetch_all($result, MYSQLI_ASSOC);

	$final_posts = array();
	foreach ($posts as $post) {
		$post['topic'] = getPostTopic($post['id']); 
		array_push($final_posts, $post);
	}
	return $final_posts;
}
/* * * * * * * * * * * * * * * *
* Returns topic name by topic id
* * * * * * * * * * * * * * * * */
function getTopicNameById($id)
{
	global $conn;
	$sql = "SELECT name FROM topics WHERE id=$id";
	$result = mysqli_query($conn, $sql);
	$topic = mysqli_fetch_assoc($result);
	return $topic['name'];
}
/* * * * * * * * * * * * * * *
* Returns a single post
* * * * * * * * * * * * * * */
function getPost($slug){
	global $conn;
	// Get single post slug
	$post_slug = $_GET['post-slug'];
	$sql = "SELECT * FROM posts WHERE slug='$post_slug'";
	$result = mysqli_query($conn, $sql);

	// fetch query results as associative array.
	$post = mysqli_fetch_assoc($result);
	if ($post) {
		// get the topic to which this post belongs
		$post['topic'] = getPostTopic($post['id']);
	}
	return $post;
}
/* * * * * * * * * * * *
*  Returns all topics
* * * * * * * * * * * * */
function getAllTopics()
{
	global $conn;
	$sql = "SELECT * FROM topics";
	$result = mysqli_query($conn, $sql);
	$topics = mysqli_fetch_all($result, MYSQLI_ASSOC);
	return $topics;
}