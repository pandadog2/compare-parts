const hide_part = () => {
  const hide_btn = document.getElementsByClassName('hide_btn');
  const hide_area = document.getElementsByClassName('hide_area');

  for (let i = 0; i < hide_btn.length; i++) {
    hide_btn[i].addEventListener('click', () => {
      hide_area[i].style.display = "none";
    }, false);
  };
};

window.addEventListener('load', hide_part);
