package collection_test

import (
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"

	. "github.com/hieuvp/gotemplate-fmt/collection"
)

var _ = Describe("Set", func() {

	var set *Set

	BeforeEach(func() {
		set = NewSet()
	})

	Describe("Emptiness", func() {
		Context("When the set does not contain items", func() {
			It("Should be empty", func() {
				Expect(set.IsEmpty()).To(BeTrue())
			})
		})

		Context("When the set contains items", func() {
			It("Should not be empty", func() {
				set.Add("red")

				Expect(set.IsEmpty()).To(BeFalse())
			})
		})
	})

	Describe("Size", func() {
		Context("As items are added", func() {
			It("Should return an increasing size", func() {
				By("Empty set size being 0", func() {
					Expect(set.Size()).To(BeZero())
				})

				By("Adding a first item", func() {
					set.Add("red")

					Expect(set.Size()).To(Equal(1))
				})

				By("Adding a second item", func() {
					set.Add("blue")

					Expect(set.Size()).To(Equal(2))
				})
			})
		})
	})

	Describe("Contains", func() {
		Context("When red has not been added", func() {
			It("Should not contain red", func() {
				Expect(set.Contains("red")).To(BeFalse())
			})
		})

		Context("When red has been adding", func() {
			It("Should contain red", func() {
				set.Add("red")

				Expect(set.Contains("red")).To(BeTrue())
			})
		})
	})
})
