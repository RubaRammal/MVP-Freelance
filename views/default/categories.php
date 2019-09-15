<?php include 'header.php'; ?>
<?php include 'search-form.php'; ?>

<?php include 'flash.php'; ?>
<div class="row list">
<h4 class="job-category"><?php echo $lang->t('jobs|jobs'); ?> <?php _e($categ->name); ?></h4>
<div class="list-group  list-layout">
<?php foreach($jobs as $job): ?>    
  <a class="list-group-item item-layout" href="<?php _e(BASE_URL ."jobs/{$job->id}/". slugify($job->title ." {$lang->t('jobs|at')} ". $job->company_name)); ?>">
    <h5>
        <span class="job-title"><?php _e($job->title); ?></span>&nbsp;
        <span class="job-company"><?php _e($job->company_name); ?></span>
        <span class="badge badge-secondary float-left"><?php niceDate($job->created); ?></span>
    </h5>
    </a>
<?php endforeach; ?>  
</div>
</div>

<form class="form-inline" style="display: none;" role="form" method="post" action="<?php _e(BASE_URL . "subscribe/new"); ?>">
  <div class="form-group">
    <input type="email" class="form-control input-lg" id="email" name="email" placeholder="<?php echo $lang->t('jobs|enter_email'); ?>" required />
    <input type="hidden" name="category_id" value="<?php echo $categ->id; ?>" />
    <input type="hidden" name="city_id" value="0" />
    <input type="hidden" name="trap" value="" />
    <input type="hidden" name="<?php _e($csrf_key); ?>" value="<?php _e($csrf_token); ?>">
  </div>
  <button type="submit" class="btn btn-default btn-lg"><?php echo $lang->t('jobs|subscribe_to', $categ->name); ?></button>
</form>

<div class="row">
<ul class="pagination">
  <?php for($i=1;$i<=$number_of_pages;$i++): ?>  
  <li class="page-item" <?php if($current_page == $i) { _e(" class='disabled'"); } ?>>
      <?php if ($page_name == 'home'): ?>
        <a class="page-link" href="<?php _e(BASE_URL ."categories/{$categ->id}/{$categ->url}"); ?>"><?php _e($i); ?></a>
      <?php else: ?>
        <a class="page-link" href="<?php _e(BASE_URL ."categories/{$categ->id}/{$categ->url}/{$i}"); ?>"><?php _e($i); ?></a>
      <?php endif; ?>
  </li>
  <?php endfor; ?>
</ul>
</div>

<?php include 'footer.php'; ?>