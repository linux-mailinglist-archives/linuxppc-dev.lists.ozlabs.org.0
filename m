Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A199D7287A4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 21:08:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcYf160gjz3f0h
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 05:08:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=gLnB65KD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=gLnB65KD;
	dkim-atps=neutral
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcYd55whjz3dxw
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 05:07:52 +1000 (AEST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-565eb83efe4so8963727b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 12:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686251269; x=1688843269;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mFXKG+o8ou8b37NYYPzSeVEYTzI6RrQFUcBP7+Z0kCs=;
        b=gLnB65KDapj/L8oyti3OCPecdhfNzwnK27SyCP2Ij67wjZIq+Urt/Xj2ohzoxWGcqt
         9md6NykL5+BICuB+yTQeY5noQu9v1v2MRkxsYM467PbVoGKY6MsnqM4jAqCuFHP/FIOV
         Nmc3w5j8hy4a/q9QA4nUfQcqIorbpGtzTxxEZU3pKmFAyFx7OeJiQ8OIYPYs4ppaQJ99
         d7EiKfcmdkw5gC0oGauuDJG9I1T0YqKfADh5DbR+Bsy6i3IAOqDTgdIwUCl9173XfMxd
         gqB+NbUlpX0CJ1Eyi3fexT8Oih2q1dLLzjaj4zv6Fl4AW8zYJNZ/E0CIlX5rvC2IOp4N
         oYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686251269; x=1688843269;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mFXKG+o8ou8b37NYYPzSeVEYTzI6RrQFUcBP7+Z0kCs=;
        b=QXnfU8Labr+BjyWmoDDIsE169OGmNlb6I8VFIVqbIg3QkiJmM9oFWI8hEagxyNZMmU
         cTAeQBSk1iHcyNb9nihnNhhCc+2Axe7uKmyHVq47yPOOQ6WHAhh9wYtbOX7hHk9lwZQy
         UZlM5Kjcp6U4KrkYiV6GFDVCUdpju2vTLcX76m07mBKuZY6eX4K1BEkSpJBwMMkTvc4q
         P6S2pQO/x+oQpeZV0N0QhhCd1gTUzz3kLqNbpo9R1WmASspJV4+y52MtP3Qe24mDEp5w
         9uO+LdNH4GASdC5A9OxytXiwHTZzbDAcpvaJ1vaBnYpoLwdjksdCiKVd8xIRMtq3W07J
         g9wA==
X-Gm-Message-State: AC+VfDyV7pRqrGek0OBPwNNVMefRH+5ZaQHSUcf3BMSagqRFnT8VtGYF
	Ixk03GCveXhZV8jyfTi3E8W/cw==
X-Google-Smtp-Source: ACHHUZ4Dnk2jZ5ALQkJtH8c5bPqBsquF3+AZZ+zLteBdxMPlpIWo547PqJq12gBBTgb+B20F8e/7/A==
X-Received: by 2002:a81:7b0b:0:b0:561:afca:5b4d with SMTP id w11-20020a817b0b000000b00561afca5b4dmr662072ywc.3.1686251268705;
        Thu, 08 Jun 2023 12:07:48 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id j77-20020a819250000000b00565862c5e90sm103014ywg.83.2023.06.08.12.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:07:48 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:07:36 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 00/23] arch: allow pte_offset_map[_lock]() to fail
Message-ID: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, C
 hris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Here is v2 series of patches to various architectures, based on v6.4-rc5:
preparing for v2 of changes following in mm, affecting pte_offset_map()
and pte_offset_map_lock().  There are very few differences from v1:
noted patch by patch below.

v1 was "arch: allow pte_offset_map[_lock]() to fail"
https://lore.kernel.org/linux-mm/77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com/
series of 23 posted on 2023-05-09,
followed by "mm: allow pte_offset_map[_lock]() to fail"
https://lore.kernel.org/linux-mm/68a97fbe-5c1e-7ac6-72c-7b9c6290b370@google.com/
series of 31 posted on 2023-05-21,
followed by  "mm: free retracted page table by RCU"
https://lore.kernel.org/linux-mm/35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com/
series of 12 posted on 2023-05-28.

The first two series are "independent": neither depends
for build or correctness on the other, and the arch patches can either be
merged separately via arch trees, or be picked up by akpm; but both series
must be in before the third series is added to make the effective changes
(and that adds just a little more in arm, powerpc, s390 and sparc).

What is it all about?  Some mmap_lock avoidance i.e. latency reduction.
Initially just for the case of collapsing shmem or file pages to THPs;
but likely to be relied upon later in other contexts e.g. freeing of
empty page tables (but that's not work I'm doing).  mmap_write_lock
avoidance when collapsing to anon THPs?  Perhaps, but again that's not
work I've done: a quick attempt was not as easy as the shmem/file case.

I would much prefer not to have to make these small but wide-ranging
changes for such a niche case; but failed to find another way, and
have heard that shmem MADV_COLLAPSE's usefulness is being limited by
that mmap_write_lock it currently requires.

These changes (though of course not these exact patches, and not all
of these architectures!) have been in Google's data centre kernel for
three years now: we do rely upon them.

What are the per-arch changes about?  Generally, two things.

One: the current mmap locking may not be enough to guard against that
tricky transition between pmd entry pointing to page table, and empty
pmd entry, and pmd entry pointing to huge page: pte_offset_map() will
have to validate the pmd entry for itself, returning NULL if no page
table is there.  What to do about that varies: often the nearby error
handling indicates just to skip it; but in some cases a "goto again"
looks appropriate (and if that risks an infinite loop, then there
must have been an oops, or pfn 0 mistaken for page table, before).

Deeper study of each site might show that 90% of them here in arch
code could only fail if there's corruption e.g. a transition to THP
would be surprising on an arch without HAVE_ARCH_TRANSPARENT_HUGEPAGE.
But given the likely extension to freeing empty page tables, I have
not limited this set of changes to THP; and it has been easier, and
sets a better example, if each site is given appropriate handling.

Two: pte_offset_map() will need to do an rcu_read_lock(), with the
corresponding rcu_read_unlock() in pte_unmap().  But most architectures
never supported CONFIG_HIGHPTE, so some don't always call pte_unmap()
after pte_offset_map(), or have used userspace pte_offset_map() where
pte_offset_kernel() is more correct.  No problem in the current tree,
but a problem once an rcu_read_unlock() will be needed to keep balance.

A common special case of that comes in arch/*/mm/hugetlbpage.c, if
the architecture supports hugetlb pages down at the lowest PTE level.
huge_pte_alloc() uses pte_alloc_map(), but generic hugetlb code does
no corresponding pte_unmap(); similarly for huge_pte_offset().
Thanks to Mike Kravetz and Andrew Morton, v6.4-rc1 already provides
pte_alloc_huge() and pte_offset_huge() to help fix up those cases.

This posting is based on v6.4-rc5, but good for any v6.4-rc,
current mm-everything and linux-next.

01/23 arm: allow pte_offset_map[_lock]() to fail
      v2: same as v1
02/23 arm64: allow pte_offset_map() to fail
      v2: add ack from Catalin
03/23 arm64/hugetlb: pte_alloc_huge() pte_offset_huge()
      v2: add ack from Catalin
04/23 ia64/hugetlb: pte_alloc_huge() pte_offset_huge()
      v2: same as v1
05/23 m68k: allow pte_offset_map[_lock]() to fail
      v2: same as v1
06/23 microblaze: allow pte_offset_map() to fail
      v2: same as v1
07/23 mips: update_mmu_cache() can replace __update_tlb()
      v2: same as v1
08/23 parisc: add pte_unmap() to balance get_ptep()
      v2: typo fix from Helge; stronger commit message
09/23 parisc: unmap_uncached_pte() use pte_offset_kernel()
      v2: same as v1
10/23 parisc/hugetlb: pte_alloc_huge() pte_offset_huge()
      v2: same as v1
11/23 powerpc: kvmppc_unmap_free_pmd() pte_offset_kernel()
      v2: same as v1
12/23 powerpc: allow pte_offset_map[_lock]() to fail
      v2: same as v1
13/23 powerpc/hugetlb: pte_alloc_huge()
      v2: same as v1
14/23 riscv/hugetlb: pte_alloc_huge() pte_offset_huge()
      v2: add review from Alex, ack from Palmer
15/23 s390: allow pte_offset_map_lock() to fail
      v2: add comment for Claudio
16/23 s390: gmap use pte_unmap_unlock() not spin_unlock()
      v2: add ack from Alexander
17/23 sh/hugetlb: pte_alloc_huge() pte_offset_huge()
      v2: same as v1
18/23 sparc/hugetlb: pte_alloc_huge() pte_offset_huge()
      v2: same as v1
19/23 sparc: allow pte_offset_map() to fail
      v2: same as v1
20/23 sparc: iounit and iommu use pte_offset_kernel()
      v2: same as v1
21/23 x86: Allow get_locked_pte() to fail
      v2: add WARN_ON_ONCE from PeterZ
22/23 x86: sme_populate_pgd() use pte_offset_kernel()
      v2: same as v1
23/23 xtensa: add pte_unmap() to balance pte_offset_map()
      v2: stronger commit message

 arch/arm/lib/uaccess_with_memcpy.c      |  3 ++
 arch/arm/mm/fault-armv.c                |  5 +++-
 arch/arm/mm/fault.c                     |  3 ++
 arch/arm64/mm/fault.c                   |  3 ++
 arch/arm64/mm/hugetlbpage.c             | 11 ++-----
 arch/ia64/mm/hugetlbpage.c              |  4 +--
 arch/m68k/include/asm/mmu_context.h     |  6 ++--
 arch/m68k/kernel/sys_m68k.c             |  2 ++
 arch/m68k/mm/mcfmmu.c                   | 52 +++++++++++++--------------------
 arch/microblaze/kernel/signal.c         |  5 ++--
 arch/mips/include/asm/pgtable.h         | 15 ++--------
 arch/mips/mm/tlb-r3k.c                  |  5 ++--
 arch/mips/mm/tlb-r4k.c                  |  9 ++----
 arch/parisc/kernel/cache.c              | 26 +++++++++++++----
 arch/parisc/kernel/pci-dma.c            |  2 +-
 arch/parisc/mm/hugetlbpage.c            |  4 +--
 arch/powerpc/kvm/book3s_64_mmu_radix.c  |  2 +-
 arch/powerpc/mm/book3s64/hash_tlb.c     |  4 +++
 arch/powerpc/mm/book3s64/subpage_prot.c |  2 ++
 arch/powerpc/mm/hugetlbpage.c           |  2 +-
 arch/powerpc/xmon/xmon.c                |  5 +++-
 arch/riscv/mm/hugetlbpage.c             |  4 +--
 arch/s390/kernel/uv.c                   |  2 ++
 arch/s390/mm/gmap.c                     | 31 ++++++++++++--------
 arch/s390/mm/pgtable.c                  | 12 ++++++--
 arch/sh/mm/hugetlbpage.c                |  4 +--
 arch/sparc/kernel/signal32.c            |  2 ++
 arch/sparc/mm/fault_64.c                |  3 ++
 arch/sparc/mm/hugetlbpage.c             |  4 +--
 arch/sparc/mm/io-unit.c                 |  2 +-
 arch/sparc/mm/iommu.c                   |  2 +-
 arch/sparc/mm/tlb.c                     |  2 ++
 arch/x86/kernel/ldt.c                   |  6 ++--
 arch/x86/mm/mem_encrypt_identity.c      |  2 +-
 arch/xtensa/mm/tlb.c                    |  5 +++-
 35 files changed, 146 insertions(+), 105 deletions(-)

Hugh
