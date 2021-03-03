$(function(){
  function buildField(index) {
    const html = `<div class="rule-form-list" data-index=${index}>
                    <label for="rule_content">ルール ${index}</label>
                    <textarea name="post[rules_attributes][${index}][content]" id="post_rules_attributes_${index}_content"></textarea>
                    <span class="delete-form-btn">
                    削除する
                    </span>
                   </div>`;
    return html;
  }
  let fileIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] // 追加するフォームのインデックス番号を用意
  var lastIndex = $(".rule-form-list:last").data("index"); // 編集フォーム用（すでにデータがある分のインデックス番号が何か取得しておく）
  console.log(lastIndex);
  fileIndex.splice(0, lastIndex);// 編集フォーム用（データがある分のインデックスをfileIndexから除いておく）
  let fileCount = $(".hidden-destroy").length; // 編集フォーム用（データがある分のフォームの数を取得する）
  let displayCount = $(".rule-form-list").length; // 見えているフォームの数を取得する
  $(".hidden-destroy").hide(); // 編集フォーム用（削除用のチェックボックスを非表示にしておく）
  if (fileIndex.length == 0) $(".add-form-btn").css("display","none"); // 編集フォーム用（フォームが10つある場合は追加ボタンを非表示にしておく）
  $(".add-form-btn").on("click", function(){
    $(".rule-form").append(buildField(fileIndex[0]));
    fileIndex.shift(); // fileIndexの一番小さい数字を取り除く
    if (fileIndex.length == 0) $(".add-form-btn").css("display","none"); // フォームが５つになったら追加ボタンを非表示にする
    displayCount += 1; // 見えているフォームの数をカウントアップしておく
  });
  
  $(".rule-form").on("click", ".delete-form-btn", function() {
    alert("aタグ .click() のイベントだよぉ〜！");
  });
});
