Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A81204EB207
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 18:45:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSb5s3jk7z3c1c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 03:45:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q23SN6Pk;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q23SN6Pk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Q23SN6Pk; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q23SN6Pk; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSb593Qqpz2xfP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 03:44:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648572278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RVY7rMpGFn52vdQ2M3hw/PWs92e8BoddZH/fcoM4f7g=;
 b=Q23SN6PkbKjoSyTuEPgsickhz/amcjcByJL6Ui9DFgOX6OWtnwlW3jsHWP4OSC4dts2aiS
 ekeQje9b65LhUgfV0dUg40RN7RZ7SeQnShS2rBr9DtPvcy8ZJ7AnQ7prrdY0GijkGEC6jp
 AtNsS/M7w37H9a4tZfxzSPYw/akauQo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648572278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RVY7rMpGFn52vdQ2M3hw/PWs92e8BoddZH/fcoM4f7g=;
 b=Q23SN6PkbKjoSyTuEPgsickhz/amcjcByJL6Ui9DFgOX6OWtnwlW3jsHWP4OSC4dts2aiS
 ekeQje9b65LhUgfV0dUg40RN7RZ7SeQnShS2rBr9DtPvcy8ZJ7AnQ7prrdY0GijkGEC6jp
 AtNsS/M7w37H9a4tZfxzSPYw/akauQo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-JHxNB2iVMtKGFGYz0rnuuA-1; Tue, 29 Mar 2022 12:44:35 -0400
X-MC-Unique: JHxNB2iVMtKGFGYz0rnuuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9289C803524;
 Tue, 29 Mar 2022 16:44:33 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B31D6112132D;
 Tue, 29 Mar 2022 16:43:31 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] mm: COW fixes part 3: reliable GUP R/W FOLL_GET of
 anonymous pages
Date: Tue, 29 Mar 2022 18:43:21 +0200
Message-Id: <20220329164329.208407-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Cc: x86@kernel.org, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Donald Dutile <ddutile@redhat.com>, Liang Zhang <zhangliang5@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Paul Mackerras <paulus@samba.org>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Jason Gunthorpe <jgg@nvidia.com>, David Rientjes <rientjes@google.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Pedro Gomes <pedrodemargomes@gmail.com>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Heiko Carstens <hca@linux.ibm.com>,
 Shakeel Butt <shakeelb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Oded Gabbay <oded.gabbay@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Oleg Nesterov <oleg@redhat.com>,
 Nadav Amit <namit@vmware.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

More information on the general COW issues can be found at [2]. This series
is based on latest linus/master and [1]:
	[PATCH v3 00/16] mm: COW fixes part 2: reliable GUP pins of
	anonymous pages

v2 is located at:
	https://github.com/davidhildenbrand/linux/tree/cow_fixes_part_3_v2


This series fixes memory corruptions when a GUP R/W reference
(FOLL_WRITE | FOLL_GET) was taken on an anonymous page and COW logic fails
to detect exclusivity of the page to then replacing the anonymous page by
a copy in the page table: The GUP reference lost synchronicity with the
pages mapped into the page tables. This series focuses on x86, arm64,
s390x and ppc64/book3s -- other architectures are fairly easy to support
by implementing __HAVE_ARCH_PTE_SWP_EXCLUSIVE.

This primarily fixes the O_DIRECT memory corruptions that can happen on
concurrent swapout, whereby we lose DMA reads to a page (modifying the user
page by writing to it).

O_DIRECT currently uses FOLL_GET for short-term (!FOLL_LONGTERM)
DMA from/to a user page. In the long run, we want to convert it to properly
use FOLL_PIN, and John is working on it, but that might take a while and
might not be easy to backport. In the meantime, let's restore what used to
work before we started modifying our COW logic: make R/W FOLL_GET
references reliable as long as there is no fork() after GUP involved.

This is just the natural follow-up of part 2, that will also further
reduce "wrong COW" on the swapin path, for example, when we cannot remove
a page from the swapcache due to concurrent writeback, or if we have two
threads faulting on the same swapped-out page. Fixing O_DIRECT is just a
nice side-product

This issue, including other related COW issues, has been summarized in [3]
under 2):
"
  2. Intra Process Memory Corruptions due to Wrong COW (FOLL_GET)

  It was discovered that we can create a memory corruption by reading a
  file via O_DIRECT to a part (e.g., first 512 bytes) of a page,
  concurrently writing to an unrelated part (e.g., last byte) of the same
  page, and concurrently write-protecting the page via clear_refs
  SOFTDIRTY tracking [6].

  For the reproducer, the issue is that O_DIRECT grabs a reference of the
  target page (via FOLL_GET) and clear_refs write-protects the relevant
  page table entry. On successive write access to the page from the
  process itself, we wrongly COW the page when resolving the write fault,
  resulting in a loss of synchronicity and consequently a memory corruption.

  While some people might think that using clear_refs in this combination
  is a corner cases, it turns out to be a more generic problem unfortunately.

  For example, it was just recently discovered that we can similarly
  create a memory corruption without clear_refs, simply by concurrently
  swapping out the buffer pages [7]. Note that we nowadays even use the
  swap infrastructure in Linux without an actual swap disk/partition: the
  prime example is zram which is enabled as default under Fedora [10].

  The root issue is that a write-fault on a page that has additional
  references results in a COW and thereby a loss of synchronicity
  and consequently a memory corruption if two parties believe they are
  referencing the same page.
"

We don't particularly care about R/O FOLL_GET references: they were never
reliable and O_DIRECT doesn't expect to observe modifications from a page
after DMA was started.

Note that:
* this only fixes the issue on x86, arm64, s390x and ppc64/book3s
  ("enterprise architectures"). Other architectures have to implement
  __HAVE_ARCH_PTE_SWP_EXCLUSIVE to achieve the same.
* this does *not * consider any kind of fork() after taking the reference:
  fork() after GUP never worked reliably with FOLL_GET.
* Not losing PG_anon_exclusive during swapout was the last remaining
  piece. KSM already makes sure that there are no other references on
  a page before considering it for sharing. Page migration maintains
  PG_anon_exclusive and simply fails when there are additional references
  (freezing the refcount fails). Only swapout code dropped the
  PG_anon_exclusive flag because it requires more work to remember +
  restore it.

With this series in place, most COW issues of [3] are fixed on said
architectures. Other architectures can implement
__HAVE_ARCH_PTE_SWP_EXCLUSIVE fairly easily.

[1] https://lkml.kernel.org/r/20220329160440.193848-1-david@redhat.com
[2] https://lkml.kernel.org/r/20211217113049.23850-1-david@redhat.com
[3] https://lore.kernel.org/r/3ae33b08-d9ef-f846-56fb-645e3b9b4c66@redhat.com

v2 -> v3:
* Rebased and retested
* "arm64/pgtable: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE"
  -> Add RB and a comment to the patch description
* "s390/pgtable: cleanup description of swp pte layout"
  -> Added
* "s390/pgtable: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE"
  -> Use new set_pte_bit()/clear_pte_bit()
  -> Fixups comments/patch description

David Hildenbrand (8):
  mm/swap: remember PG_anon_exclusive via a swp pte bit
  mm/debug_vm_pgtable: add tests for __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  x86/pgtable: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  arm64/pgtable: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  s390/pgtable: cleanup description of swp pte layout
  s390/pgtable: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  powerpc/pgtable: remove _PAGE_BIT_SWAP_TYPE for book3s
  powerpc/pgtable: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE for book3s

 arch/arm64/include/asm/pgtable-prot.h        |  1 +
 arch/arm64/include/asm/pgtable.h             | 23 ++++++--
 arch/powerpc/include/asm/book3s/64/pgtable.h | 31 ++++++++---
 arch/s390/include/asm/pgtable.h              | 36 +++++++++----
 arch/x86/include/asm/pgtable.h               | 16 ++++++
 arch/x86/include/asm/pgtable_64.h            |  4 +-
 arch/x86/include/asm/pgtable_types.h         |  5 ++
 include/linux/pgtable.h                      | 29 +++++++++++
 include/linux/swapops.h                      |  2 +
 mm/debug_vm_pgtable.c                        | 15 ++++++
 mm/memory.c                                  | 55 ++++++++++++++++++--
 mm/rmap.c                                    | 19 ++++---
 mm/swapfile.c                                | 13 ++++-
 13 files changed, 216 insertions(+), 33 deletions(-)

-- 
2.35.1

