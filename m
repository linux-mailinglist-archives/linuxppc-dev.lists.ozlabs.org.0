Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C78D074FE2F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 06:28:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=YjT2iggk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R14VT3DvQz3bwd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 14:28:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=YjT2iggk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R14TY6hY1z304g
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 14:27:28 +1000 (AEST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5701eaf0d04so72757487b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 21:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689136043; x=1691728043;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wiHFwa+qInqC9Ufc7qLGqz2T4+XJI6K3K6pkdSvL2BE=;
        b=YjT2iggkRTiXtZMR1jMLANF/DCx6aBNBHMVDVVl8Gr0GinPbSloyq6adfQMkbwXuDy
         4LOhxp9lsDQkNYPLAl5k89Ck7UzmU2gS51lf58HBHMNkZxeBrwzXKOfpjPMpHU7Xhn8z
         K9b44iVOIzPUbQ6ymuTwqdYb3uxH5ZNNlppLByjfI27io4ZaUeNDCqifG61+Enltfq1W
         Q4VeG3xJt0Bk+AP9vkRr0OjwSSW1svxOnjAGiUGPKap1kin/J6ow8NcPSugD6S/XzNDL
         Pw7KzGLDDMHF/NqW9CZBI1VUfB0aeFWeRbgCBvTEtczkxjQmMIk8cik2x0kBWOU3eCTM
         DkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689136043; x=1691728043;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wiHFwa+qInqC9Ufc7qLGqz2T4+XJI6K3K6pkdSvL2BE=;
        b=UcbxnICusMxYC0Fs9GwFbFnP3aQ4N9RNElGR2Nt7WULBFTvakwmKF9OLoPW9ZItobk
         Gqttq8zj9Rod6Mblqw0B+FaRLmnkG3eodbDReNnruy6/skDTEc2hKaRTY5Pz8yBpSRw+
         QWhEJMRglIF/vmMZ8LSiX5JlJDz+ta4kzr6/kuAeXfxliu9Pym2tBwZP57KJn02WPGpr
         zVXG73bMHGVg206eBC/aQkLZ0H6IoH/xFW45jS8wysRd6GWQoM2TYJ/B8yXdCtUl6mQe
         mAW1kGPoquUxUltx6pPrXKzXLm3IPekK0xP5bX2mg5CpRxDtv+3j2w4hB65FEDWOIUFs
         lSGA==
X-Gm-Message-State: ABy/qLZzucMk37ypdYnj7Ctciqur7Zi4HUfvYf99VwiZLQmc/+qu2o0d
	TD3mick2UH1WrrQaWUNOi01ZoA==
X-Google-Smtp-Source: APBJJlF5lEOtFts7UwfGvvEUizjbQpUSNw8Id5rb3Vpn8mt/ge/Q6rrPqXyVhuX/GSF3C2Mj1ANz1w==
X-Received: by 2002:a81:91d2:0:b0:559:deed:f363 with SMTP id i201-20020a8191d2000000b00559deedf363mr16696703ywg.2.1689136042885;
        Tue, 11 Jul 2023 21:27:22 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id i67-20020a0df846000000b005772f3fc0acsm972965ywf.44.2023.07.11.21.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 21:27:22 -0700 (PDT)
Date: Tue, 11 Jul 2023 21:27:09 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 00/13] mm: free retracted page table by RCU
Message-ID: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
  Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Here is v3 of the series of patches to mm (and a few architectures), based
on v6.5-rc1 which includes the preceding two series (thank you!): in which
khugepaged takes advantage of pte_offset_map[_lock]() allowing for pmd
transitions.  Differences from v1 and v2 are noted patch by patch below.

This replaces the v2 "mm: free retracted page table by RCU"
https://lore.kernel.org/linux-mm/54cb04f-3762-987f-8294-91dafd8ebfb0@google.com/
series of 12 posted on 2023-06-20.

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

Based on v6.5-rc1; and almost good on current mm-unstable or current
linux-next - just one patch conflicts, the 12/13: I'll reply to that
one with its mm-unstable or linux-next equivalent (vma_assert_locked()
has been added next to where vma_try_start_write() is being removed).

01/13 mm/pgtable: add rcu_read_lock() and rcu_read_unlock()s
      v3: same as v1
02/13 mm/pgtable: add PAE safety to __pte_offset_map()
      v3: same as v2
      v2: rename to pmdp_get_lockless_start/end() per Matthew;
          so use inlines without _irq_save(flags) macro oddity;
          add pmdp_get_lockless_sync() for use later in 09/13.
03/13 arm: adjust_pte() use pte_offset_map_nolock()
      v3: same as v1
04/13 powerpc: assert_pte_locked() use pte_offset_map_nolock()
      v3: same as v1
05/13 powerpc: add pte_free_defer() for pgtables sharing page
      v3: much simpler version, following suggestion by Jason
      v2: fix rcu_head usage to cope with concurrent deferrals;
          add para to commit message explaining rcu_head issue.
06/13 sparc: add pte_free_defer() for pte_t *pgtable_t
      v3: same as v2
      v2: use page_address() instead of less common page_to_virt();
          add para to commit message explaining simple conversion;
          changed title since sparc64 pgtables do not share page.
07/13 s390: add pte_free_defer() for pgtables sharing page
      v3: much simpler version, following suggestion by Gerald
      v2: complete rewrite, integrated with s390's existing pgtable
          management; temporarily using a global mm_pgtable_list_lock,
          to be restored to per-mm spinlock in a later followup patch.
08/13 mm/pgtable: add pte_free_defer() for pgtable as page
      v3: same as v2
      v2: add comment on rcu_head to "Page table pages", per JannH
09/13 mm/khugepaged: retract_page_tables() without mmap or vma lock
      v3: same as v2
      v2: repeat checks under ptl because UFFD, per PeterX and JannH;
          bring back mmu_notifier calls for PMD, per JannH and Jason;
          pmdp_get_lockless_sync() to issue missing interrupt if PAE.
10/13 mm/khugepaged: collapse_pte_mapped_thp() with mmap_read_lock()
      v3: updated to using ptent instead of *pte
      v2: first check VMA, in case page tables torn down, per JannH;
          pmdp_get_lockless_sync() to issue missing interrupt if PAE;
          moved mmu_notifier after step 1, reworked final goto labels.
11/13 mm/khugepaged: delete khugepaged_collapse_pte_mapped_thps()
      v3: rediffed
      v2: same as v1
12/13 mm: delete mmap_write_trylock() and vma_try_start_write()
      v3: rediffed (different diff needed for mm-unstable or linux-next)
      v2: same as v1
13/13 mm/pgtable: notes on pte_offset_map[_lock]()
      v3: new: JannH asked for more helpful comment, this is my attempt;
          could be moved to be the first in the series.

 arch/arm/mm/fault-armv.c            |   3 +-
 arch/powerpc/include/asm/pgalloc.h  |   4 +
 arch/powerpc/mm/pgtable-frag.c      |  29 +-
 arch/powerpc/mm/pgtable.c           |  16 +-
 arch/s390/include/asm/pgalloc.h     |   4 +
 arch/s390/mm/pgalloc.c              |  80 ++++-
 arch/sparc/include/asm/pgalloc_64.h |   4 +
 arch/sparc/mm/init_64.c             |  16 +
 include/linux/mm.h                  |  17 --
 include/linux/mm_types.h            |   4 +
 include/linux/mmap_lock.h           |  10 -
 include/linux/pgtable.h             |  10 +-
 mm/khugepaged.c                     | 481 +++++++++++-------------------
 mm/pgtable-generic.c                |  97 +++++-
 14 files changed, 404 insertions(+), 371 deletions(-)

Hugh
