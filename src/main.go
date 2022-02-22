package main

import (
	"io/ioutil"
	"log"

	"github.com/davidbyttow/govips/v2/vips"
)

func main() {
	vips.Startup(nil)
	defer vips.Shutdown()

	log.Println("Opening picklerick.jpg")
	image1, err := vips.NewImageFromFile("picklerick.jpg")
	if err != nil {
		panic(err)
	}

	log.Println("Resizing image")
	if err := image1.Resize(0.5, vips.KernelAuto); err != nil {
		panic(err)
	}

	log.Println("Exporting image")
	ep := vips.NewDefaultJPEGExportParams()
	image1bytes, _, err := image1.Export(ep)
	if err != nil {
		panic(err)
	}

	log.Println("Saving image to output.jpg")
	err = ioutil.WriteFile("output.jpg", image1bytes, 0644)
	if err != nil {
		panic(err)
	}
}
