%%raw(`import './App.css';`)
@module("./logo.svg") external logo: string = "default"


module NavBar = {
  @react.component @module("./navBar")
  external make: () => React.element = "default"
}


@react.component
let make = () => {
  open Chakra

  <Provider>
    <NavBar />
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          {React.string("Edit ")}
          <code> {React.string("src/App.res")} </code>
          {React.string(" and save to reload.")}
        </p>
        <p>{React.string("Hello, World!")}</p> 
      </header>
    </div>
  </Provider>
}
