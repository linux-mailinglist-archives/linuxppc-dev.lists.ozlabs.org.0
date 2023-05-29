Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DC47143EC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 08:12:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QV4tl0wSGz3f7r
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 16:12:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=7B1W5MLw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=7B1W5MLw;
	dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QV4sr6NMJz3f3k
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 16:11:27 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-bacf5b89da7so4531576276.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 May 2023 23:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685340684; x=1687932684;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zliJFPKkBRA/n2GaYWcI8flBsJ+sn1iKXV6efEOvVuc=;
        b=7B1W5MLwR/lNmx3BIWIEBSexKnAAtAeI5OObdohvQtJ0ya6QvwHlgYFcOox2PoWx79
         AqTZ5kdBzWLNorOsK4QCVE297PN18hQKAQbCdVGnbvFaS7kyYm3WQLVA/nvW5TUXBwEK
         caAcy7rQi84u8SNtdxTLyllY4LVN73jaN501s4k727QQrqblWsE0z78z1nbHIMjpBe5J
         U7bsOrnIMfDvYrfJ38H4/OhgD5cA+Y2quHyXE8xkEJQ1/qi+xCB9+P6Rf/V3USkqhcRr
         ADhdVtWOZGV+AvVYyI9ulfCMHPe9IScFN/bL7d58cmN+M8/9WGgQpLLoAa3PpgIRJ6V+
         lp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685340684; x=1687932684;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zliJFPKkBRA/n2GaYWcI8flBsJ+sn1iKXV6efEOvVuc=;
        b=VDDO/1smORDCgd7GvHnOQxRQPqysOtokG4xq1w5JGNxphapgqGO823Uv1WP+sQHhgm
         vn00gLLSae8cbUG6gjWQNrrcS36UHYFBesrzl8x8LGXSGC1P8HnoFhggwTZfU+jFHY2e
         7+BFQe5oOW4OdxvL4lUvc/cYdZeK8xZ/x1gGfJCe2krEwi7GnbTkYlx19sB6FeUVu+An
         9rPVMMeA2zGi7UxFFFkXTjF9l1fghKDm6EWGlwIqC2Q2lH9Vpd943ncQr7RRMb/kM74D
         FjN0E/OJf3ALLkQ6ckmXhXJlNX9oBkcs6Y6Kz0YwNggSzS4KlVIuTxLBhPjJZx9hHqWB
         sWcg==
X-Gm-Message-State: AC+VfDyehp7ieLhnxELBHmmcfSnq5F7yR6XJeZaVThXXQIz1+lUCBGd/
	d+/l5KpoQoHXRNf9aHioN5kbXA==
X-Google-Smtp-Source: ACHHUZ6vifKmHFoYdv3qrFkDElnMJbREaNq58bFiSjvre/dDskro6b5jD1pQPpN+OFNUHzxvXn3Qhw==
X-Received: by 2002:a25:d4b:0:b0:ba8:6530:d561 with SMTP id 72-20020a250d4b000000b00ba86530d561mr10306665ybn.30.1685340684077;
        Sun, 28 May 2023 23:11:24 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id r63-20020a252b42000000b00b7b0aba5cccsm2703954ybr.22.2023.05.28.23.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 23:11:23 -0700 (PDT)
Date: Sun, 28 May 2023 23:11:07 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 00/12] mm: free retracted page table by RCU
Message-ID: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Ca
 rstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Zack Rusin <zackr@vmware.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Here is the third series of patches to mm (and a few architectures), based
on v6.4-rc3 with the preceding two series applied: in which khugepaged
takes advantage of pte_offset_map[_lock]() allowing for pmd transitions.

This follows on from the "arch: allow pte_offset_map[_lock]() to fail"
https://lore.kernel.org/linux-mm/77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com/
series of 23 posted on 2023-05-09,
and the "mm: allow pte_offset_map[_lock]() to fail"
https://lore.kernel.org/linux-mm/68a97fbe-5c1e-7ac6-72c-7b9c6290b370@google.com/
series of 31 posted on 2023-05-21.

Those two series were "independent": neither depending for build or
correctness on the other, but both series needed before this third one
can safely make the effective changes.  I'll send v2 of those two series
in a couple of days, incorporating Acks and Revieweds and the minor fixes.

What is it all about?  Some mmap_lock avoidance i.e. latency reduction.
Initially just for the case of collapsing shmem or file pages to THPs:
the usefulness of MADV_COLLAPSE on shmem is being limited by that
mmap_write_lock it currently requires.

Likely to be relied upon later in other contexts e.g. freeing of
empty page tables (but that's not work I'm doing).  mmap_write_lock
avoidance when collapsing to anon THPs?  Perhaps, but again that's not
work I've done: a quick attempt was not as easy as the shmem/file case.

These changes (though of course not these exact patches) have been in
Google's data centre kernel for three years now: we do rely upon them.

Based on the preceding two series over v6.4-rc3, but good over
v6.4-rc[1-4], current mm-everything or current linux-next.

01/12 mm/pgtable: add rcu_read_lock() and rcu_read_unlock()s
02/12 mm/pgtable: add PAE safety to __pte_offset_map()
03/12 arm: adjust_pte() use pte_offset_map_nolock()
04/12 powerpc: assert_pte_locked() use pte_offset_map_nolock()
05/12 powerpc: add pte_free_defer() for pgtables sharing page
06/12 sparc: add pte_free_defer() for pgtables sharing page
07/12 s390: add pte_free_defer(), with use of mmdrop_async()
08/12 mm/pgtable: add pte_free_defer() for pgtable as page
09/12 mm/khugepaged: retract_page_tables() without mmap or vma lock
10/12 mm/khugepaged: collapse_pte_mapped_thp() with mmap_read_lock()
11/12 mm/khugepaged: delete khugepaged_collapse_pte_mapped_thps()
12/12 mm: delete mmap_write_trylock() and vma_try_start_write()

 arch/arm/mm/fault-armv.c            |   3 +-
 arch/powerpc/include/asm/pgalloc.h  |   4 +
 arch/powerpc/mm/pgtable-frag.c      |  18 ++
 arch/powerpc/mm/pgtable.c           |  16 +-
 arch/s390/include/asm/pgalloc.h     |   4 +
 arch/s390/mm/pgalloc.c              |  34 +++
 arch/sparc/include/asm/pgalloc_64.h |   4 +
 arch/sparc/mm/init_64.c             |  16 ++
 include/linux/mm.h                  |  17 --
 include/linux/mm_types.h            |   2 +-
 include/linux/mmap_lock.h           |  10 -
 include/linux/pgtable.h             |   6 +-
 include/linux/sched/mm.h            |   1 +
 kernel/fork.c                       |   2 +-
 mm/khugepaged.c                     | 425 ++++++++----------------------
 mm/pgtable-generic.c                |  44 +++-
 16 files changed, 253 insertions(+), 353 deletions(-)

Hugh
