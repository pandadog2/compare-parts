'use strict';

const delete_image = () => {
  const delete_btn = document.getElementsByClassName('delete_btn');
  const delete_image = document.getElementsByClassName('delete_image');

  for (let i = 0; i < delete_btn.length; i++) {
    delete_btn[i].addEventListener('click', () => {
      delete_btn[i].style.display = "none";
      delete_image[i].style.display = "none";
    }, false);
  };
};

window.addEventListener('load', delete_image);
