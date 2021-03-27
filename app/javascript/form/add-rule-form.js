$(function(){
  var maxCount = 20;
  var minCount = 1;
  var index = $('.rule-form .rule-list').length;
  // 追加
  $('.add-form-btn').on('click', function(){
    //var inputCount = $('.rule-form .rule-list').length;
    var inputCount = $('.rule-form .rule-list').length;
    if (inputCount < maxCount){
      var element = $('.rule-form .rule-list:last-child').clone(true);// 末尾をイベントごと複製
      
      // 複製したinputのクリア
      var inputList = element[0].querySelectorAll('input[type="text"], textarea');
      var inputFile = element[0].querySelectorAll('input[type="file"]');
      console.log(index);

      for (var i = 0; i < inputList.length; i++) {
        inputList[i].value = "";
        inputFile[i].value = "";
        inputList[i].name = "rule[rule_content" + index + "][content]";
        inputFile[i].name = "rule[rule_content" + index + "][image]";
      }
      $('.rule-form .rule-list').parent().append(element);// 末尾追加
      index += 1;
    }
    else {
      alert("登録できるのは、"+ minCount + "~" + maxCount + "ルールです。");
    }
  });
  // 削除
  $('.delete-form-btn').on('click', function(){// イベントごと複製しているのでonのselectorは未設定
    var inputCount = $('.rule-form .rule-list').length;
    if (inputCount > minCount){
      $(this).closest('.rule-list').remove();
    }
    else {
      alert("登録できるのは、"+ minCount + "~" + maxCount + "ルールです。");
    }
  });
})
