Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 319C57AB17F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 13:59:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsW5g0h90z3dfZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 21:59:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsW584ZHkz3cNV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 21:58:49 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13FA5DA7;
	Fri, 22 Sep 2023 04:58:53 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C73D3F67D;
	Fri, 22 Sep 2023 04:58:11 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Peter Xu <peterx@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 0/2] Fix set_huge_pte_at() panic on arm64
Date: Fri, 22 Sep 2023 12:58:02 +0100
Message-Id: <20230922115804.2043771-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-s390@vger.kernel.org, Ryan Roberts <ryan.roberts@arm.com>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

This series fixes a bug in arm64's implementation of set_huge_pte_at(), which
can result in an unprivileged user causing a kernel panic. The problem was
triggered when running the new uffd poison mm selftest for HUGETLB memory. This
test (and the uffd poison feature) was merged for v6.5-rc7.

Ideally, I'd like to get this fix in for v6.6 and I've cc'ed stable (correctly
this time) to get it backported to v6.5, where the issue first showed up.


Description of Bug
------------------

arm64's huge pte implementation supports multiple huge page sizes, some of which
are implemented in the page table with multiple contiguous entries. So
set_huge_pte_at() needs to work out how big the logical pte is, so that it can
also work out how many physical ptes (or pmds) need to be written. It previously
did this by grabbing the folio out of the pte and querying its size.

However, there are cases when the pte being set is actually a swap entry. But
this also used to work fine, because for huge ptes, we only ever saw migration
entries and hwpoison entries. And both of these types of swap entries have a PFN
embedded, so the code would grab that and everything still worked out.

But over time, more calls to set_huge_pte_at() have been added that set swap
entry types that do not embed a PFN. And this causes the code to go bang. The
triggering case is for the uffd poison test, commit 99aa77215ad0 ("selftests/mm:
add uffd unit test for UFFDIO_POISON"), which causes a PTE_MARKER_POISONED swap
entry to be set, coutesey of commit 8a13897fb0da ("mm: userfaultfd: support
UFFDIO_POISON for hugetlbfs") - added in v6.5-rc7. Although review shows that
there are other call sites that set PTE_MARKER_UFFD_WP (which also has no PFN),
these don't trigger on arm64 because arm64 doesn't support UFFD WP.

If CONFIG_DEBUG_VM is enabled, we do at least get a BUG(), but otherwise, it
will dereference a bad pointer in page_folio():

    static inline struct folio *hugetlb_swap_entry_to_folio(swp_entry_t entry)
    {
        VM_BUG_ON(!is_migration_entry(entry) && !is_hwpoison_entry(entry));

        return page_folio(pfn_to_page(swp_offset_pfn(entry)));
    }


Fix
---

The simplest fix would have been to revert the dodgy cleanup commit 18f3962953e4
("mm: hugetlb: kill set_huge_swap_pte_at()"), but since things have moved on,
this would have required an audit of all the new set_huge_pte_at() call sites to
see if they should be converted to set_huge_swap_pte_at(). As per the original
intent of the change, it would also leave us open to future bugs when people
invariably get it wrong and call the wrong helper.

So instead, I've added a huge page size parameter to set_huge_pte_at(). This
means that the arm64 code has the size in all cases. It's a bigger change, due
to needing to touch the arches that implement the function, but it is entirely
mechanical, so in my view, low risk.

I've compile-tested all touched arches; arm64, parisc, powerpc, riscv, s390,
sparc (and additionally x86_64). I've additionally booted and run mm selftests
against arm64, where I observe the uffd poison test is fixed, and there are no
other regressions.


Patches
-------

patch 1: Convert core mm and arches to pass extra param (no behavioral change)
patch 8: Fix the arm64 bug

Patches based on v6.6-rc2.


Changes since v1 [1]
--------------------

- Pass extra size param instead of converting mm to vma.
    - Passing vma was problematic for kernel mapping case without vma
- Squash all interface changes to single patch
- Simplify powerpc so that is doesn't require __set_huge_page_at()
- Added Reviewed-bys


[1] https://lore.kernel.org/linux-arm-kernel/20230921162007.1630149-1-ryan.roberts@arm.com/


Thanks,
Ryan

Ryan Roberts (2):
  mm: hugetlb: Add huge page size param to set_huge_pte_at()
  arm64: hugetlb: Fix set_huge_pte_at() to work with all swap entries

 arch/arm64/include/asm/hugetlb.h              |  2 +-
 arch/arm64/mm/hugetlbpage.c                   | 23 +++-------
 arch/parisc/include/asm/hugetlb.h             |  2 +-
 arch/parisc/mm/hugetlbpage.c                  |  2 +-
 .../include/asm/nohash/32/hugetlb-8xx.h       |  3 +-
 arch/powerpc/mm/book3s64/hugetlbpage.c        |  5 ++-
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |  3 +-
 arch/powerpc/mm/nohash/8xx.c                  |  3 +-
 arch/powerpc/mm/pgtable.c                     |  3 +-
 arch/riscv/include/asm/hugetlb.h              |  3 +-
 arch/riscv/mm/hugetlbpage.c                   |  3 +-
 arch/s390/include/asm/hugetlb.h               |  6 ++-
 arch/s390/mm/hugetlbpage.c                    |  8 +++-
 arch/sparc/include/asm/hugetlb.h              |  6 ++-
 arch/sparc/mm/hugetlbpage.c                   |  8 +++-
 include/asm-generic/hugetlb.h                 |  2 +-
 include/linux/hugetlb.h                       |  6 ++-
 mm/damon/vaddr.c                              |  3 +-
 mm/hugetlb.c                                  | 43 +++++++++++--------
 mm/migrate.c                                  |  7 ++-
 mm/rmap.c                                     | 23 +++++++---
 mm/vmalloc.c                                  |  2 +-
 22 files changed, 103 insertions(+), 63 deletions(-)

--
2.25.1

