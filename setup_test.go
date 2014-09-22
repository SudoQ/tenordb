package tenordb

import (
	"testing"
)

func TestSetup(t *testing.T) {
	err := Setup()
	if err != nil {
		t.Fatal(err)
	}
}
