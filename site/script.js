const tabs = document.querySelectorAll('[data-tab]');
const panels = document.querySelectorAll('[data-panel]');
const toast = document.querySelector('.toast');

tabs.forEach((tab) => {
  tab.addEventListener('click', () => {
    const selected = tab.dataset.tab;
    tabs.forEach((item) => {
      const active = item === tab;
      item.classList.toggle('active', active);
      item.setAttribute('aria-selected', String(active));
    });
    panels.forEach((panel) => {
      const active = panel.dataset.panel === selected;
      panel.classList.toggle('active', active);
      panel.hidden = !active;
    });
  });
});

document.querySelectorAll('[data-copy]').forEach((button) => {
  button.addEventListener('click', async () => {
    const text = document.getElementById(button.dataset.copy).textContent;
    let copied = false;
    try {
      await navigator.clipboard.writeText(text);
      copied = true;
    } catch {
      const fallback = document.createElement('textarea');
      fallback.value = text;
      fallback.setAttribute('readonly', '');
      fallback.style.position = 'fixed';
      fallback.style.opacity = '0';
      document.body.appendChild(fallback);
      fallback.select();
      copied = document.execCommand('copy');
      fallback.remove();
    }

    if (copied) {
      button.firstChild.textContent = 'Скопировано ';
      toast.classList.add('show');
      window.setTimeout(() => {
        button.firstChild.textContent = 'Скопировать ';
        toast.classList.remove('show');
      }, 1600);
    } else {
      const range = document.createRange();
      range.selectNodeContents(document.getElementById(button.dataset.copy));
      const selection = window.getSelection();
      selection.removeAllRanges();
      selection.addRange(range);
    }
  });
});
