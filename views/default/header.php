<?php global $categories, $cities; ?>
<!DOCTYPE html>
<html>
   <head>
    <title><?php _e($seo_title); ?></title>
    <meta name="author" content="<?php _e(APP_AUTHOR); ?>">
    <meta name="description" content="<?php _e($seo_desc); ?>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <!-- Bootstrap -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<?php _e(THEME_ASSETS); ?>css/bootstrap.css" rel="stylesheet">    
    <!-- <link href="<?php _e(THEME_ASSETS); ?>css/bootstrap-grid.min.css" rel="stylesheet">     -->
    <!-- <link href="<?php _e(THEME_ASSETS); ?>css/bootstrap-reboot.min.css" rel="stylesheet"> -->
    <link href="<?php _e(THEME_ASSETS); ?>css/theme.css" rel="stylesheet">
    <link rel="shortcut icon" href="<?php _e(THEME_ASSETS);; ?>ico/favicon.png">


    <!-- Open Graph -->
    <meta property="og:title" content="<?php _e($seo_title); ?>" />
    <meta property="og:url" content="<?php _e($seo_url); ?>" />
    <?php if (isset($job) && $job->logo != ''): ?>
    <meta property="og:image" content="<?php _e(ASSET_URL . "images/thumb_{$job->logo}"); ?>" />
    <?php endif; ?>
    <meta property="og:description" content="<?php _e($seo_desc); ?>" />
    <meta property="og:site_name" content="<?php _e($seo_title); ?>" />

    <link rel="canonical" href="<?php _e($seo_url); ?>" />
    <link rel="shortlink" href="<?php _e($seo_url); ?>" />

    <?php if (isset($markdown)): ?>
        <link href="<?php _e(ASSET_URL); ?>bootstrap-markdown/css/bootstrap-markdown.min.css" rel="stylesheet">
    <?php endif; ?>

    <link href="https://fonts.googleapis.com/css?family=Tajawal&display=swap" rel="stylesheet">  
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    </head>
  <body>
    <!-- Fixed navbar -->


    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="<?php _e(BASE_URL); ?>"><?php _e(APP_NAME); ?></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav">
          <li class="nav-item active">
            <a class="nav-link" href="<?php _e(BASE_URL); ?>"><?php echo $lang->t('link|home'); ?><span class="sr-only">(current)</span></a>
          </li>
          <?php if(reqularUserIsValid()): ?>
                <?php if(isset($_SESSION['permission']) && $_SESSION['permission']['jobPoster'] == True): ?>
          <li class="nav-item">
            <a class="nav-link" href="<?php _e(USER_URL .'jobs/new'); ?>"><?php echo $lang->t('jobs|post_job'); ?></a>
          </li>
          <?php elseif(isset($_SESSION['permission']) && $_SESSION['permission']['jobApplicant'] == True): ?>
              <?php endif ?>
          <li class="nav-item">
            <a class="nav-link" href="<?php _e(USER_URL .'applications'); ?>"><?php echo $lang->t('apply|applications'); ?></a>
          </li>
          <?php if (userIsValid()): ?>
                <li class="nav-item">
                  <a class="nav-link" href="<?php _e(BASE_URL .'admin/manage'); ?>"><?php echo $lang->t('link|admin'); ?></a>
                </li>
              <?php endif; ?>
              <li class="nav-item">
                <a class="nav-link" href="<?php _e(USER_URL .'profile'); ?>"><?php echo $lang->t('user|welcome') .' '. $_SESSION['username']; ?></a></li>
              <li class="nav-item">
                <a class="nav-link" href="<?php _e(USER_URL .'logout'); ?>"><?php echo $lang->t('link|logout'); ?></a></li>
            <?php else: ?>
                  <li class="nav-item">
                    <a class="nav-link" href="<?php _e(USER_URL .'login'); ?>"><?php echo $lang->t('link|user_login'); ?></a>
                  </li>
            <?php endif; ?>
        </ul>
      </div>
    </nav>

    <div class="container theme-showcase">
     