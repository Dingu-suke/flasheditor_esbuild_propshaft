// app/javascript/react/App.jsx
import React from 'react';
import Editor from '@monaco-editor/react';

const App = () => {
  return (
    <>
      <button className="btn" onClick={()=>document.getElementById('my_modal_1').showModal()}>open modal</button>
        <dialog id="my_modal_1" className="modal">
          <div className="modal-box">
            <h3 className="font-bold text-lg">Hello!</h3>
              <div>
                <Editor
                height="30vh"
                theme="vs-dark"
                defaultLanguage="javascript"
                defaultValue="// コードを入力する"
                />
              </div>
            <p className="py-4">Press ESC key or click the button below to close</p>
            <div className="modal-action">
              <form method="dialog">
                {/* if there is a button in form, it will close the modal */}
                <button className="btn">Close</button>
              </form>
            </div>
          </div>
        </dialog>
    </>
    
  );
}

export default App;
const rootElement = document.getElementById("monaco");