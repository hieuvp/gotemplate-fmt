package collection

// Set struct
type Set struct {
	size int
}

// NewSet func
func NewSet() *Set {
	return &Set{0}
}

// IsEmpty func
func (s *Set) IsEmpty() bool {
	return s.size == 0
}

// Add func
func (s *Set) Add(v string) {
	s.size++
}

// Size func
func (s *Set) Size() int {
	return s.size
}

// Contains func
func (s *Set) Contains(v string) bool {
	if s.IsEmpty() {
		return false
	}

	return true
}
