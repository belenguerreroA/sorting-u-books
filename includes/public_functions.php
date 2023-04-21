<?php 
function getBooks($paginationStart, $limit, $g_incl="",$g_excl="") {
	// use global $conn object in function
	global $conn;
	// $sql = "SELECT * FROM books WHERE deleted=0 LIMIT ".$paginationStart.",".$limit;
	$g_in = ($g_incl) ? "AND t2.genre_id IN (".$g_incl.")" : ""; 
	$g_not_in = ($g_excl) ? "AND t2.genre_id NOT IN (".$g_excl.")" : "";
	$sql = "SELECT t2.genre_id, t1.id, t1.type_id, t1.name, t1.author, 
				   t1.n_series, t1.shared_universe, t1.has_related, t1.warning, 
				   t1.not_read_all, t1.available, t1.m_wo, t1.science_babies, t1.url 
			FROM books t1 
			JOIN book_genre t2 ON t1.id = t2.book_id 
			WHERE t1.deleted=0 ".$g_in." ". $g_not_in."ORDER BY t1.id ASC
			LIMIT ".$paginationStart.",".$limit;
	$result = mysqli_query($conn, $sql);
	$datas = mysqli_fetch_all($result, MYSQLI_ASSOC);
	$final_datas = array();
	foreach ($datas as $data) {
		array_push($final_datas, $data);
	}
	return $final_datas;
}

function countBooks($g_incl="",$g_excl="") {
	global $conn;
	$g_in = ($g_incl) ? "AND t2.genre_id IN (".$g_incl.")" : ""; 
	$g_not_in = ($g_excl) ? "AND t2.genre_id NOT IN (".$g_excl.")" : "";
	$sql = "SELECT count(t1.id) as count
			FROM books t1 
			JOIN book_genre t2 ON t1.id = t2.book_id 
			WHERE t1.deleted=0 ".$g_in." ". $g_not_in;
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

    foreach($items as &$item) $children[(int)$item['parent_id']][] = &$item;

    foreach($items as &$item) if (isset($children[$item['id']]))
            $item['children'] = $children[$item['id']];
   
    return $children[0]; // Root only.
}

function buildHtmlTree($arr, $pId='') {
	$html = '<ul parent-id="'.$pId.'">'.PHP_EOL;
	foreach ($arr as $v) {
		$html .= "<li class='".(($v["direct"] == 1) ? "direct" : "")."' data-id='".$v["id"]."' data-direct='".$v["direct"]."'>
		<span data-id='".$v["id"]."' class='f-option pointer list-style ".((array_key_exists('children', $v)) ? 'caret-right' : 'circle')."'><i class='bi bi-circle-fill'></i><i class='bi bi-caret-right-fill'></i><i class='bi bi-caret-down-fill'></i></span>
		<button type='button' data-id='".$v["id"]."' class='btn btn-small btn-f-option btn-outline-secondary none'><span>".$v["cat"]."</span><i class='bi bi-check'></i><i class='bi bi-dash'></i></button>";

		if (array_key_exists('children', $v)) {
			$html .= buildHtmlTree($v['children'], $v["id"]);
			$html .= '</li>'.PHP_EOL;
		}
	}
	$html .= '</ul>'.PHP_EOL;

	return $html;
}

function filter() {
	echo 'filt';
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