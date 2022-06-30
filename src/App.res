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
    <Box marginTop={#px(64)}>  // marginTop needed to keep content below NavBar
      <Gallery />
    </Box>
  </Provider>
}
