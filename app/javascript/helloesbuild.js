document.addEventListener("DOMContentLoaded", () => {
  const message = document.createElement("p"); // p要素を作成
  message.textContent = "Hello ESbuild"; // テキスト内容を設定
  document.body.appendChild(message); // body要素に追加
});