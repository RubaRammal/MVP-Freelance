<?php
/**
 * Jobskee - open source job board
 *
 * @author      Elinore Tenorio <elinore.tenorio@gmail.com>
 * @license     MIT
 * @url         http://www.jobskee.com
 */

/*
 * Load the configuration file
 */
require 'config.php';

/*
 * Load category and city values
 */
/*
* load user permissions
*/
if(reqularUserIsValid()){
    $user_group = R::load('user_group',$_SESSION['user_group_id']);
    $user_permissions=$user_group['permission'];
 }

if(reqularUserIsValid() && $_SESSION['permission']['jobPoster'] == False){
    $user_id = USER::getUserIdByEmail($_SESSION['email']);
    $categories = Categories::findUserCategories($user_id);
}else{
    $categories = Categories::findCategories();
}
$cities = Cities::findCities();


/*
 * Load all existing controllers
 */
foreach (glob(CONTROLLER_PATH . "*.php") as $controller) {
    require_once $controller;
}

/*
 * Homepage
 * Front page controller
 */
$app->get('/(:page)', function ($page=null) use ($app) {
    
    global $categories;
    global $lang;
    
    if (isset($page) && $page != '') {
        $content = R::findOne('pages', ' url=:url ', array(':url'=>$page));
        if ($content && $content->id) {
            
            // show page information
            $seo_title = $content->name .' | '. APP_NAME;
            $seo_desc = excerpt($content->description);
            $seo_url = BASE_URL . $page;

            $app->render(THEME_PATH . 'page.php', 
                    array('lang' => $lang,
                        'seo_url'=>$seo_url, 
                        'seo_title'=>$seo_title, 
                        'seo_desc'=>$seo_desc, 
                        'content'=>$content));
        } else {
            $app->flash('danger', $lang->t('alert|page_not_found'));
            $app->redirect(BASE_URL, 404);
        }
    } else {
        
        // show list of job
        $seo_title = APP_NAME;
        $seo_desc = APP_DESC;
        $seo_url = BASE_URL;
    
        $j = new Jobs();
        foreach ($categories as $cat) {
            if(reqularUserIsValid() && $_SESSION['permission']['jobPoster'] == True){
                $user_id = USER::getUserIdByEmail($_SESSION['email']);
                $jobs[$cat->id] = $j->getUserJobs($user_id,ACTIVE, $cat->id, 0, HOME_LIMIT);
            }else{
                $jobs[$cat->id] = $j->getJobs(ACTIVE, $cat->id, 0, HOME_LIMIT);
            }
        }
        
        $app->render(THEME_PATH . 'home.php', 
                    array('lang' => $lang,
                        'seo_url'=>$seo_url, 
                        'seo_title'=>$seo_title, 
                        'seo_desc'=>$seo_desc, 
                        'jobs'=>$jobs));
    }
});

// Run app
$app->run();