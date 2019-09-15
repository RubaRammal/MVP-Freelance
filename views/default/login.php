<?php include 'header.php'; ?>
<?php include 'flash.php'; ?>
<div class="container-small justify-content-center">
<form class="form-horizontal" role="form" method="post" action="<?php _e(BASE_URL .'user/authenticate'); ?>">
  <div class="row list card text-right">
  <div class="col-md-12">
  <div class="form-group">
    <label class="col-sm-12 control-label"></label>
    <div class="col-sm-12">
      <h3><?php echo $lang->t('user|login_to_user', APP_NAME); ?></h3>
    </div>
  </div>  
  <div class="form-group">
    <label for="email" class="col-sm-12 control-label"><?php echo $lang->t('user|email'); ?></label>
    <div class="col-sm-12">
      <input type="email" class="form-control" id="email" name="email"  required />
    </div>
  </div>
  <div class="form-group">
    <label for="password" class="col-sm-12 control-label"><?php echo $lang->t('user|password'); ?></label>
    <div class="col-sm-12">
      <input type="password" class="form-control" id="password" name="password"  required />
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-3 col-sm-12">
      <input type="hidden" name="<?php _e($csrf_key); ?>" value="<?php _e($csrf_token); ?>">
      <button type="submit" class="btn btn-default btn-lg all-btns"><?php echo $lang->t('link|login'); ?></button>
    </div>
  </div>
  <div class="col-sm-12"></div>
  <div class="col-sm-12 text-center">
    <a class="" href="<?php _e(USER_URL .'signup'); ?>"><?php echo $lang->t('user|signup'); ?></a>
  </div>
  </div>  
  </div>
</form>
</div>
<!-- Jobskee tracker -->
<img src="http://c.statcounter.com/9473250/0/77fcf0a4/1/">
<?php include 'footer.php'; ?>