'use strict'; //厳密なエラーチェックができる

Object.onload = function () {
  const dts = document.querySelectorAll('dt');

  dts.forEach(dt => {
    dt.addEventListener('click', () => {
      dt.parentNode.classList.toggle('appear');      // クリックした親要素にappearクラスをつける（cssで表示する）

      dts.forEach(el => {                            // クリックしたdtとクリックしていないdt（エレメントのelとする）を判別する
        if (dt !== el) {
          el.parentNode.classList.remove('appear');  // クリックした親要素からappearクラスを削除する（cssで非表示にする）
        }
      });
    });
  });
}
