%%raw(`import './App.css';`)
@module("./logo.svg") external logo: string = "default"


module NavBar = {
  @react.component @module("./navBar")
  external make: () => React.element = "default"
}

type product = {
  product_id: int,
  product_name: string,
  product_kind: string,
  product_pic_src: option<string>,
}

module GalleryItem = {
  open Chakra

  let default_product_pic = "https://raw.githubusercontent.com/apancik/public-domain-icons/master/dist/object%20life%20jacket.svg"
  // let default_product_pic = ""

  @react.component
  let make = (~item: product) =>
    <Box
      height=#px(80)
      width=#md
      overflow=#hidden
      borderWidth=#px(1)
      borderRadius=#lg
      // boxShadow=#box(#px(10), #px(10), #gray) // TODO ?
      padding=#4
    >
      <HStack height=#percent(100.0)>
        <Image
          src={switch item.product_pic_src { | Some(s) => s | None => default_product_pic }}
          width=#auto
          height=#percent(100.0)
        /> // TODO alt text
        <Box p={#6}>
          <Badge>{{React.string(item.product_kind)}}</Badge>
          <Box>{{React.string(item.product_name)}}</Box>
        </Box>
        <Spacer />
      </HStack>
    </Box>
}

module Gallery = {
  open Chakra

  // TODO make this a prop
  let items = [
    {
      product_id: 1,
      product_name: "Life jacket",
      product_kind: "Gear",
      product_pic_src: None,
    },
  ]
  let items = 
    Belt.Array.make(20, items[0])
    -> Belt.Array.map(item => <GalleryItem item> </GalleryItem>)
    -> React.array

  @react.component
  let make = () => {

    <Center>
      <Stack spacing=#2>
        items
      </Stack>
    </Center>
  }
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
