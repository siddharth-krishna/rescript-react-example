%%raw(`import './App.css';`)
@module("./logo.svg") external logo: string = "default"

@react.component
let make = () => {
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
}
