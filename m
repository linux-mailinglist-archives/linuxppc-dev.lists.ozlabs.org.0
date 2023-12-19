Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F263E8182B7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 08:56:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XR8GUsal;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e1An0OP8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvTYC57XRz3cY5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 18:56:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XR8GUsal;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e1An0OP8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvTXJ5XpQz2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 18:55:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702972556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+h83lLyn/5apLRr4X1Iml0TGvxqR5/pwpG6+wMVRoO8=;
	b=XR8GUsaluDchgruKmarqBEqjW3Wqmhwn4GplqLYMVIMv0CFAKTWmyjaZJ4QLKt6Y03shFw
	5SPz1ofzy3xk0tM53bvNAgaXdpVWJxzfVMba7MLpXt7SgdL9i/0dCMaKKz9fVEpw8TaBHi
	XD0l0+6cK3iff/FxWtQuYwIL0K3Oa2w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702972557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+h83lLyn/5apLRr4X1Iml0TGvxqR5/pwpG6+wMVRoO8=;
	b=e1An0OP8oXVE2+mR88+F/TQd5LKEloMrhe2JHRTGjtVhtCXxk+8R3a29mJPq22li2gqEc9
	frluwe5u800VRk+QHoiQH7bRu9wInvj24zl6D3vfUIM95kgm+ZvcaC9bbSUds2Nxn1fppu
	05A4lITAuDZKVu0/DTc49iv/4JjL6Qk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-78fty2BGN2uAAfrfPZNG0g-1; Tue,
 19 Dec 2023 02:55:53 -0500
X-MC-Unique: 78fty2BGN2uAAfrfPZNG0g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 065E63C025C1;
	Tue, 19 Dec 2023 07:55:52 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83B262026D66;
	Tue, 19 Dec 2023 07:55:40 +0000 (UTC)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 00/13] mm/gup: Unify hugetlb, part 2
Date: Tue, 19 Dec 2023 15:55:25 +0800
Message-ID: <20231219075538.414708-1-peterx@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, peterx@redhat.com, Andrew Jones <andrew.jones@linux.dev>, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

This is v1 of the series.  The series removes the hugetlb slow gup path
after a previous refactor work [1], so that slow gup now uses the exact
same path to handle all kinds of memory including hugetlb.

It's based on latest mm-unstalbe (c13bdc82ada9).

RFC->v1 (use old verion's patch index):
- Fix build for !THP and/or !HUGETLB
- Fix a bug in the hugepd path that can cause a loop
- patch 3:
  - Rename to "Make HPAGE_PXD_* macros visible even if !THP" [Christoph, MikeR]
- patch 5:
  - Posted separately as a devmap bugfix
- patch 6:
  - Add a comment above gup_huge_pd() explaining the file folio writeback
    issue, with references when anyone would extend hugepd to other types
    of file memories [Christoph]
- patch 7:
  - Keep parameter name as "page" in record_subpages(), modify the
    commit message by removing any assumption on head page. [Matthew]
- patch 12:
  - Rename to: "mm/gup: handle hugetlb in the generic follow_page_mask
    code" [Christoph]
- Added patch:
  - "mm/Kconfig: CONFIG_PGTABLE_HAS_HUGE_LEAVES", this helps to fix build
    for !THP and/or !HUGETLB
- Added patch
  - "mm/gup: Cache *pudp in follow_pud_mask()", as suggested by Christoph

For the long term, this is one small step towards merging hugetlb specific
codes into generic mm paths.  From that POV, this series removes one
reference to huge_pte_offset() out of many others.

To make it work, the generic code will need to at least understand hugepd,
which is already done like so in fast-gup.  Fortunately it seems that's the
only major thing I need to teach slow GUP to share the common path for now
besides normal huge PxD entries.  Non-gup can be more challenging, but
that's a question for later.

There's one major difference for slow-gup on cont_pte / cont_pmd handling,
currently supported on three architectures (aarch64, riscv, ppc).  Before
the series, slow gup will be able to recognize cont entries with the help
of huge_pte_offset().  Now it's gone but still working, by looking up
pgtable entries one by one.  It's not ideal, but hopefully this change
should not affect yet on major workloads.  There's some more information in
the commit message of the last patch.  If this would be a concern, we can
consider teaching slow gup to recognize cont pte/pmd entries, and that
should recover the lost performance.  But I doubt its necessity for now, so
I kept it as simple as it can be.

Test Done
=========

This v1 went through the normal GUP smoke tests over different memory
types on archs (using VM instances): x86_64, aarch64, ppc64le.  For
aarch64, tested over 64KB cont_pte huge pages.  For ppc64le, tested over
16MB hugepd entries (Power8 hash MMU on 4K base page size).

Patch layout
=============

Patch 1-7:    Preparation works, or cleanups in relevant code paths
Patch 8-12:   Teach slow gup with all kinds of huge entries (pXd, hugepd)
Patch 13:     Drop hugetlb_follow_page_mask()

More information can be found in the commit messages of each patch.  Any
comment will be welcomed.  Thanks.

[1] https://lore.kernel.org/all/20230628215310.73782-1-peterx@redhat.com

Peter Xu (13):
  mm/Kconfig: CONFIG_PGTABLE_HAS_HUGE_LEAVES
  mm/hugetlb: Declare hugetlbfs_pagecache_present() non-static
  mm: Provide generic pmd_thp_or_huge()
  mm: Make HPAGE_PXD_* macros even if !THP
  mm: Introduce vma_pgtable_walk_{begin|end}()
  mm/gup: Drop folio_fast_pin_allowed() in hugepd processing
  mm/gup: Refactor record_subpages() to find 1st small page
  mm/gup: Handle hugetlb for no_page_table()
  mm/gup: Cache *pudp in follow_pud_mask()
  mm/gup: Handle huge pud for follow_pud_mask()
  mm/gup: Handle huge pmd for follow_pmd_mask()
  mm/gup: Handle hugepd for follow_page()
  mm/gup: Handle hugetlb in the generic follow_page_mask code

 include/linux/huge_mm.h |  25 +--
 include/linux/hugetlb.h |  16 +-
 include/linux/mm.h      |   3 +
 include/linux/pgtable.h |   4 +
 mm/Kconfig              |   3 +
 mm/gup.c                | 362 ++++++++++++++++++++++++++++++++--------
 mm/huge_memory.c        | 133 +--------------
 mm/hugetlb.c            |  75 +--------
 mm/internal.h           |   7 +-
 mm/memory.c             |  12 ++
 10 files changed, 342 insertions(+), 298 deletions(-)

-- 
2.41.0

