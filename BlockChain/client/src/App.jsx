// import { useEffect, useState } from "react";
import { EthProvider } from "./contexts/EthContext";
import Patients from "./Patients";
import './input.css'
import Navbar from "./Navbar";
import { Routes, Route,BrowserRouter} from "react-router-dom";
import Analyzer from "./Analyzer";
import Doctors from "./Doctors";

function App() {

  
  return (
    <EthProvider>
      <div id="App" className='m-9 font-poppins'>
        <BrowserRouter >
      <Navbar/>
        <Routes>
          <Route path='/' element={<Patients/>}/>
          {/* <Route path='*' element={</>}/> */}
          <Route exact path='/analyzer' element={<Analyzer/>}/>
          <Route exact path='/doctors' element={<Doctors/>}/>
        </Routes>
        </BrowserRouter>
        {/* <Patients/> */}
      </div>
    </EthProvider>
  );
}

export default App;
