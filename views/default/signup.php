<?php include 'header.php'; ?>
<?php include 'flash.php'; ?>
<div class="alert alert-warning" id='api_result' hidden></div>
<div class="row list card text-right"> 
<div class="col-md-12">
<form class="form-horizontal" role="form" method="post" action="<?php _e(USER_URL .'signupnew'); ?>">
  
  <div class="form-group">
    <label class="col-md-3 control-label"></label>
    <div class="col-md-8">
      <h3><?php echo $lang->t('user|login_to_user', APP_NAME); ?></h3>
    </div>
  </div>

  <div class="form-group">
    <label for="identity_number" class="col-md-3 col-sm-12 control-label"><?php echo $lang->t('user|identity_number'); ?></label>
    <div class="col-sm-8 form-inline">
        <input type="text" class="form-control col-sm-10" id="identity_number" name="identity_number" placeholder="<?php echo $lang->t('user|identity_number'); ?>" required />
        <button id="search" class="btn btn-default col-sm-2"><span class="small"><?php echo $lang->t('link|search'); ?></span></button>
      </div>
    </div>

  <!-- user_group -->
  <div class="form-group">
    <label for="user_group" class="col-md-3 col-sm-12 control-label"><?php echo $lang->t('user|user_group'); ?></label>
    <div class="col-md-8 col-sm-12">
        <select name="user_group" id="user_group" class="form-control input-lg">
            <?php foreach($groups as $group): ?>
            <option value="<?php _e($group->id); ?>"><?php _e($group->name); ?></option>
            <?php endforeach; ?>
        </select>
    </div>
  </div>
  <!-- user_group -->

  <div class="form-group">
    <label for="username" class="col-md-3 col-sm-12 control-label"><?php echo $lang->t('user|username'); ?></label>
    <div class="col-md-8 col-sm-12">
      <input type="username" class="form-control" id="username" name="username" placeholder="<?php echo $lang->t('user|username'); ?>" required />
    </div>
  </div>

  <div class="form-group">
  <label for="fullname" class="col-md-3 col-sm-12 control-label"><?php echo $lang->t('user|fullname'); ?></label>
    <div class="col-md-8 col-sm-12 form-inline">

            <input type="firstname" class="form-control" id="firstname" name="firstname" placeholder="<?php echo $lang->t('user|firstname'); ?>" required />

            <input type="secondname" class="form-control" id="secondname" name="secondname" placeholder="<?php echo $lang->t('user|secondname'); ?>" required />

            <input type="lastname" class="form-control" id="lastname" name="lastname" placeholder="<?php echo $lang->t('user|lastname'); ?>" required />    
    </div>

  </div>

  <div class="form-group">
    <label for="email" class="col-md-3 col-sm-12 control-label"><?php echo $lang->t('user|email'); ?></label>
    <div class="col-md-8 col-sm-12">
      <input type="email" class="form-control" id="email" name="email" placeholder="<?php echo $lang->t('user|email'); ?>" required />
    </div>
  </div>

  <div class="form-group">
    <label for="mobile" class="col-md-3 col-sm-12 control-label"><?php echo $lang->t('user|mobile'); ?></label>
    <div class="col-md-8 col-sm-12">
      <input type="mobile" class="form-control" id="mobile" name="mobile" placeholder="<?php echo $lang->t('user|mobile'); ?>" required />
    </div>
  </div>

  <div class="form-group">
    <label for="password" class="col-md-3 col-sm-12 control-label"><?php echo $lang->t('user|password'); ?></label>
    <div class="col-md-8 col-sm-12">
      <input type="password" class="form-control" id="password" name="password" placeholder="<?php echo $lang->t('user|password'); ?>" required />
    </div>
  </div>

  <div class="form-group">
    <label for="re_password" class="col-md-3 col-sm-12 control-label"><?php echo $lang->t('user|re_password'); ?></label>
    <div class="col-md-8 col-sm-12">
      <input type="password" class="form-control" id="re_password" name="re_password" placeholder="<?php echo $lang->t('user|re_password'); ?>" required />
    </div>
  </div>
  <div id="qualifications">
  
  </div>

  <div class="form-group">
    <div class="col-md-8 col-sm-12">
      <input type="hidden" name="<?php _e($csrf_key); ?>" value="<?php _e($csrf_token); ?>">
      <button type="submit" class="btn btn-default all-btns"><?php echo $lang->t('link|signup'); ?></button>
    </div>
  </div>
</form>
</div>
</div>
<!-- Jobskee tracker -->
<img src="http://c.statcounter.com/9473250/0/77fcf0a4/1/">
<div class="loading" hidden></div>


<?php include 'footer.php'; ?>

<script type="text/javascript">
$("#search").click(function(res){
  ToggleLoader();
  
  var identityNumber = $("#identity_number").val();
  var base_url = "<?php echo USER_URL; ?>";
  base_url +='api?identityNumber='+identityNumber
  var request = $.ajax({
    url: base_url,
    method: "GET",
  });
  
  request.done(function( res ) {
    if(res['userInfo'] == null || res['userInfo']['Email'] == null){
      ToggleAlert('warning','No user with this identity number !');      
    }else{
      FillUserInfo(res['userInfo']);
      ToggleAlert('success','User Info was retrived Successfully !');     
    }

    ToggleLoader();
  });

  request.fail(function( jqXHR, textStatus ) {
    alert( "Request failed: " + textStatus );
    
  });

});

function FillUserInfo(userInfo){
var html="";
  $('#email').val(userInfo['Email']);
  $('#mobile').val(userInfo['Mobile']);
  $('#firstname').val(userInfo['ArabicFirstName']);
  // 
  $('#secondname').val(userInfo['ArabicSecondName']);
  $('#lastname').val(userInfo['ArabicLastName']);

  if(userInfo['Qualifications'] != null){
    var userQualifications =  userInfo['Qualifications'];
    $('#qualifications').empty();
    for (var i=0; i<userQualifications.length; i++){
      html ="<input type='hidden' name='qualifications["+i+"]' value='"+userQualifications[i]['MajorCode']+"' />";
      $('#qualifications').append(html);
    }
  }

  return;
}

function ToggleLoader(){
  $(".loading").fadeToggle();
}

function ToggleAlert(Type,Message){
  $('#api_result').removeClass().addClass('alert alert-'+Type);
  $('#api_result').text(Message).show();
setTimeout(() => {
  $('#api_result').hide();
}, 3000);
}

</script>

