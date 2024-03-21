Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7568862F5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 23:08:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hQFPxs5I;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NsyMRPY3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V103Y1kmzz3dWj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 09:08:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hQFPxs5I;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NsyMRPY3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V102k2FX8z3cNN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 09:08:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qBwIOGN4e8d3gKHF9DSbgwYKpkkiYBwtwtMI0MG6X/U=;
	b=hQFPxs5Iqa8oOYU8tRI2nlJB0QOmVFUok4HpsJXkFgyakHkcrZTS/NKYw+xy2UuwBsHRX8
	BRGTwRqrNPHGYwzEqGl/EHCdIbmWh0tkIKbxRIM3JTQR6dhRCjC6t6cjlIZm8Os3r5Ci/p
	ivIlWX1DQekKCR1MHNFekxacTkFnb4w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qBwIOGN4e8d3gKHF9DSbgwYKpkkiYBwtwtMI0MG6X/U=;
	b=NsyMRPY35MmFMs6OaKZzO/0NrYb4sN8QgAFToQV8Djz3/ikvMIC522ls8aCqHwaQgmtQgj
	z/ua5XIymiOlQsIe/B+BkxKKMvnI7mOo24+WirxqlDtf32WfQd4ZlbqOXuW0wtBJO7t/Mc
	BooJZY8pV1JE2yQVIAs9XorjvINcIKw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-SiRIoLwMMnORtT8fENWd5g-1; Thu, 21 Mar 2024 18:08:06 -0400
X-MC-Unique: SiRIoLwMMnORtT8fENWd5g-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-69152af7760so3924436d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 15:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058886; x=1711663686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBwIOGN4e8d3gKHF9DSbgwYKpkkiYBwtwtMI0MG6X/U=;
        b=BkY+DTUKfsLodhZAHSkyTn9HYaMsCsar6j8Ix9TyT1ImwphjWAaULOGn31L7LeCabK
         9crOvLzI2E8F+gndcQnl0Rr00YzI5jd4scadPpJ/tWhGWZaYbDf1NpB0RKszE04yttG/
         ZkzTDTML3Atk8lsMakZfwj2cjGpLOOfYg+TBKHJ+zum0l1K+eRjPmX3oZbtSfReL3c6V
         6OgBTaIPTlK8LvVobmP/66F8kBP5rsuVeCdXQxDgBtc4UTvn0xTzeS7MXh0A9EFV7D5R
         rF6Rr2XssF/iI+RITymXXmMQTTzsqy79i0s1dR/pPwmJQ119zcjH0/apQAd7JNCUT8iu
         9avA==
X-Gm-Message-State: AOJu0YwN7HIAYxSKKDiBYcz0HS+wDFLgu1w2Ihxt1yEbEjibRWdo2ZF9
	6tA7xerAf65OdaXbDNoASzxL4M6d5yb0m21k8aPopFrrtG6O56DVqoXKq7zgxvvIorUlTSZstsW
	TB2/las24V4qdZZy9wwS154IEtT0lmdAPEQdQ//z8Fpadi6ALo6P6+a8ZHFdAAXg=
X-Received: by 2002:a05:6214:4198:b0:695:c55d:fdf8 with SMTP id ld24-20020a056214419800b00695c55dfdf8mr219314qvb.1.1711058885675;
        Thu, 21 Mar 2024 15:08:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjJcDDJC7HZiortxxZHWVHGJUJGwG79NEWr9Sr06E8nvFXSb1um5gXNtJQjx6vxfyzbm5MLg==
X-Received: by 2002:a05:6214:4198:b0:695:c55d:fdf8 with SMTP id ld24-20020a056214419800b00695c55dfdf8mr219273qvb.1.1711058885190;
        Thu, 21 Mar 2024 15:08:05 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:04 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/12] mm/gup: Unify hugetlb, part 2
Date: Thu, 21 Mar 2024 18:07:50 -0400
Message-ID: <20240321220802.679544-1-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, peterx@redhat.com, Andrew Jones <andrew.jones@linux.dev>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

v3:
- Rebased to latest mm-unstalbe (a824831a082f, of March 21th)
- Dropped patch to introduce pmd_thp_or_huge(), replace such uses (and also
  pXd_huge() users) with pXd_leaf() [Jason]
- Add a comment for CONFIG_PGTABLE_HAS_HUGE_LEAVES [Jason]
- Use IS_ENABLED() in follow_huge_pud() [Jason]
- Remove redundant none pud check in follow_pud_mask() [Jason]

rfc: https://lore.kernel.org/r/20231116012908.392077-1-peterx@redhat.com
v1:  https://lore.kernel.org/r/20231219075538.414708-1-peterx@redhat.com
v2:  https://lore.kernel.org/r/20240103091423.400294-1-peterx@redhat.com

The series removes the hugetlb slow gup path after a previous refactor work
[1], so that slow gup now uses the exact same path to process all kinds of
memory including hugetlb.

For the long term, we may want to remove most, if not all, call sites of
huge_pte_offset().  It'll be ideal if that API can be completely dropped
from arch hugetlb API.  This series is one small step towards merging
hugetlb specific codes into generic mm paths.  From that POV, this series
removes one reference to huge_pte_offset() out of many others.

One goal of such a route is that we can reconsider merging hugetlb features
like High Granularity Mapping (HGM).  It was not accepted in the past
because it may add lots of hugetlb specific codes and make the mm code even
harder to maintain.  With a merged codeset, features like HGM can hopefully
share some code with THP, legacy (PMD+) or modern (continuous PTEs).

To make it work, the generic slow gup code will need to at least understand
hugepd, which is already done like so in fast-gup.  Due to the specialty of
hugepd to be software-only solution (no hardware recognizes the hugepd
format, so it's purely artificial structures), there's chance we can merge
some or all hugepd formats with cont_pte in the future.  That question is
yet unsettled from Power side to have an acknowledgement.  As of now for
this series, I kept the hugepd handling because we may still need to do so
before getting a clearer picture of the future of hugepd.  The other reason
is simply that we did it already for fast-gup and most codes are still
around to be reused.  It'll make more sense to keep slow/fast gup behave
the same before a decision is made to remove hugepd.

There's one major difference for slow-gup on cont_pte / cont_pmd handling,
currently supported on three architectures (aarch64, riscv, ppc).  Before
the series, slow gup will be able to recognize e.g. cont_pte entries with
the help of huge_pte_offset() when hstate is around.  Now it's gone but
still working, by looking up pgtable entries one by one.

It's not ideal, but hopefully this change should not affect yet on major
workloads.  There's some more information in the commit message of the last
patch.  If this would be a concern, we can consider teaching slow gup to
recognize cont pte/pmd entries, and that should recover the lost
performance.  But I doubt its necessity for now, so I kept it as simple as
it can be.

Test Done
=========

For x86_64, tested full gup_test matrix over 2MB huge pages. For aarch64,
tested the same over 64KB cont_pte huge pages.

One note is that this v3 didn't go through any ppc test anymore, as finding
such system can always take time.  It's based on the fact that it was
tested in previous versions, and this version should have zero change
regarding to hugepd sections.

If anyone (Christophe?) wants to give it a shot on PowerPC, please do and I
would appreciate it: "./run_vmtests.sh -a -t gup_test" should do well
enough (please consider [2] applied if hugepd is <1MB), as long as we're
sure the hugepd pages are touched as expected.

Patch layout
=============

Patch 1-8:    Preparation works, or cleanups in relevant code paths
Patch 9-11:   Teach slow gup with all kinds of huge entries (pXd, hugepd)
Patch 12:     Drop hugetlb_follow_page_mask()

More information can be found in the commit messages of each patch.  Any
comment will be welcomed.  Thanks.

[1] https://lore.kernel.org/all/20230628215310.73782-1-peterx@redhat.com
[2] https://lore.kernel.org/r/20240321215047.678172-1-peterx@redhat.com

Peter Xu (12):
  mm/Kconfig: CONFIG_PGTABLE_HAS_HUGE_LEAVES
  mm/hugetlb: Declare hugetlbfs_pagecache_present() non-static
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
 mm/Kconfig              |   6 +
 mm/gup.c                | 354 +++++++++++++++++++++++++++++++++-------
 mm/huge_memory.c        | 133 +--------------
 mm/hugetlb.c            |  75 +--------
 mm/internal.h           |   7 +-
 mm/memory.c             |  12 ++
 9 files changed, 337 insertions(+), 294 deletions(-)

-- 
2.44.0

