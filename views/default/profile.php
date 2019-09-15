<?php include 'header.php'; ?>

<?php include 'flash.php'; ?>
<h2 style="text-align:center"><?php echo $lang->t('profile|profile'); ?></h2>

<div class="container-small card card-padding text-right">
    <div class="row">
        <div class="col-sm-8">
        <h1><?php echo $firstname . ' ' .$lastname ?></h1>
            <p class="title">CEO & Founder, Example</p>
            <p>Harvard University</p>
            <div>
                <a href="#"><i class="fa fa-dribbble social-profile"></i></a> 
                <a href="#"><i class="fa fa-twitter social-profile"></i></a>  
                <a href="#"><i class="fa fa-linkedin social-profile"></i></a>  
                <a href="#"><i class="fa fa-facebook social-profile"></i></a> 
            </div>
        </div> 
        <div class="col-sm-4">
            <img class="float-left" src="<?php echo THEME_ASSETS . 'images/profile_logo.png' ?>" alt="John" style="width:60%">
        </div>     
    </div>
    <!-- <div class="row">
    </div> -->
    <div class="row">
        <button onclick="window.location.href='mailto:name@email.com'" class="col-md12 btn btn-default btn-lg all-btns"><?php echo $lang->t('profile|contact'); ?></button>
    </div>
    <!-- <div class="row">
         <div class="col-md-12 contact-card" style="background-color:#343a40; width:auth; height:200px; color: white">
            <ul style="margin:auto; padding:20px; width:50%">

            </ul>
        </div> 
    </div> -->
</div>
<?php include 'footer.php'; ?>