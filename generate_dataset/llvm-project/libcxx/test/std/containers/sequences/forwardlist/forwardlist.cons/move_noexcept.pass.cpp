//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

// <forward_list>

// forward_list(forward_list&&)
//        noexcept(is_nothrow_move_constructible<allocator_type>::value);

// This tests a conforming extension

// UNSUPPORTED: c++03

#include <forward_list>
#include <cassert>

#include "test_macros.h"
#include "MoveOnly.h"
#include "test_allocator.h"

template <class T>
struct some_alloc
{
    typedef T value_type;
    some_alloc(const some_alloc&);
};

int main(int, char**)
{
#if defined(_LIBCPP_VERSION)
    {
        typedef std::forward_list<MoveOnly> C;
        static_assert(std::is_nothrow_move_constructible<C>::value, "");
    }
    {
        typedef std::forward_list<MoveOnly, test_allocator<MoveOnly>> C;
        static_assert(std::is_nothrow_move_constructible<C>::value, "");
    }
    {
        typedef std::forward_list<MoveOnly, other_allocator<MoveOnly>> C;
        static_assert(std::is_nothrow_move_constructible<C>::value, "");
    }
    {
        typedef std::forward_list<MoveOnly, some_alloc<MoveOnly>> C;
        static_assert(!std::is_nothrow_move_constructible<C>::value, "");
    }
#endif // _LIBCPP_VERSION

  return 0;
}
