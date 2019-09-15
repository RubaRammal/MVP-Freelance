<?php include 'header.php'; ?>
<?php include 'search-form.php'; ?>

<div class="alert alert-info" role="alert"><?php _e($count); ?> <?php echo $lang->t('search|jobs_found'); ?> "<?php _e($terms); ?>"</div>
<div class="row list">
    
<?php foreach($categories as $category): ?>
<h4 class="job-category"><?php _e($category->name); ?> <?php echo $lang->t('jobs|jobs'); ?></h4>
<div class="list-group list-layout">
<?php if (isset($jobs[$category->id])):
foreach($jobs[$category->id] as $job): ?>
    <a class="list-group-item item-layout" href="<?php _e(BASE_URL ."jobs/{$job->id}/". slugify($job->title ." {$lang->t('jobs|at')} ". $job->company_name)); ?>">
    <h5>
        <span class="job-title"><?php _e($job->title); ?></span>&nbsp;
        <span class="job-company"><?php _e($job->company_name); ?></span>
        <span class="badge badge-secondary float-left"><?php niceDate($job->created); ?></span>
    </h5>
    </a>
<?php endforeach; 
endif; ?>
    <a class="list-group-item" href="<?php _e(BASE_URL ."categories/{$category->id}/{$category->url}"); ?>">
        <h6 class="view-jobs"><?php echo $lang->t('jobs|view_all', $category->name); ?></h6>
    </a>
</div>

<?php endforeach; ?>
</div>
<?php include 'footer.php'; ?>

<!--  -->