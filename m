Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B09CC714418
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 08:17:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QV50P3qlDz3fBQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 16:17:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=TyhMHkB8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=TyhMHkB8;
	dkim-atps=neutral
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QV4zX41mdz3bTf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 16:16:24 +1000 (AEST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-561c1436c75so43874317b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 May 2023 23:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685340981; x=1687932981;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xPq2eB/hW7ShnFytnKcTY7aukisfg/jLLLPKQ4lP3rM=;
        b=TyhMHkB8EAAdy+hUHa48C2vLWt0oIXv3HPWA7oGBtoKurezV9dmnaHp/Ug08+YXBMJ
         q7/doDqEaB13J8DWMDOsmxCRPRcN6V2SXOTsYe+dqJjrxA7f0LVq1fNiXr9IMn2dnMMI
         ESckYbJKgJgrbJ8T+uYkbBEglbSci8JLRkQ5xTjOVaaAsg2STz0pP4v2Ide+0MWDvyHe
         y1hUI8uDpAzlLTOdYFAa9G5upyPvxazDxgjqrZ/FkHni8ZrS3oyiM+Gr8t/oORl7+XNi
         bEMYjRBzoNKzLiTXOPBKXj7pF37UgxQaCI1yMdVBb74YQf5DcZFdirdn0N62WO3feJu6
         qWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685340981; x=1687932981;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xPq2eB/hW7ShnFytnKcTY7aukisfg/jLLLPKQ4lP3rM=;
        b=Xj4ATyA0i2sGzgpeh0F6AyLl124SNu9FFOgYA/AqeuG1SBuGfBI8ngSBtcgpoTNMiH
         lM8himTWKbQ/gZchcu4Tbv8NHr3pi1ERv/nxg9i5ICWTkoRDp1+nf81bRifgSlewTYeF
         Hb/MsDC0/NvGhS0jlbFKuG882ftkAEQBLYB3YhHiupI+I7XlIt1r5fDqt1jpqBSAnY6n
         cVE0gwy0WB6fBOJWW+GVo3y9GPzNnswgEjGKVaedFFdddGljBrIwSbVQkuQ+qXnWe9qE
         yLW9QwctEFTjUheIFmtWp5xlBo+65GZrYOZFs/eEPRtfmw3bQe6i1JUt9JaWsanp019q
         IGLw==
X-Gm-Message-State: AC+VfDx9tavm67U6F8YpIFX9/UfbqDoBbHQWAxfjJ5TXCxC8S6YqyVAy
	IRvQRqmpCuYXV8vmmwa0WHcR6A==
X-Google-Smtp-Source: ACHHUZ5ZacpUNHnx35XFkkfr+0IABaEA7Bz0HX1XL9bgqfNu7gBbTpGfMWgF9E5JOg8lgzwGl1APAA==
X-Received: by 2002:a0d:f003:0:b0:565:a0c8:7e66 with SMTP id z3-20020a0df003000000b00565a0c87e66mr11630388ywe.0.1685340981021;
        Sun, 28 May 2023 23:16:21 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id n5-20020a819c45000000b00545a081847fsm3407533ywa.15.2023.05.28.23.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 23:16:20 -0700 (PDT)
Date: Sun, 28 May 2023 23:16:16 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 02/12] mm/pgtable: add PAE safety to __pte_offset_map()
In-Reply-To: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
Message-ID: <923480d5-35ab-7cac-79d0-343d16e29318@google.com>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
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

There is a faint risk that __pte_offset_map(), on a 32-bit architecture
with a 64-bit pmd_t e.g. x86-32 with CONFIG_X86_PAE=y, would succeed on
a pmdval assembled from a pmd_low and a pmd_high which never belonged
together: their combination not pointing to a page table at all, perhaps
not even a valid pfn.  pmdp_get_lockless() is not enough to prevent that.

Guard against that (on such configs) by local_irq_save() blocking TLB
flush between present updates, as linux/pgtable.h suggests.  It's only
needed around the pmdp_get_lockless() in __pte_offset_map(): a race when
__pte_offset_map_lock() repeats the pmdp_get_lockless() after getting the
lock, would just send it back to __pte_offset_map() again.

CONFIG_GUP_GET_PXX_LOW_HIGH is enabled when required by mips, sh and x86.
It is not enabled by arm-32 CONFIG_ARM_LPAE: my understanding is that
Will Deacon's 2020 enhancements to READ_ONCE() are sufficient for arm.
It is not enabled by arc, but its pmd_t is 32-bit even when pte_t 64-bit.

Limit the IRQ disablement to CONFIG_HIGHPTE?  Perhaps, but would need a
little more work, to retry if pmd_low good for page table, but pmd_high
non-zero from THP (and that might be making x86-specific assumptions).

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 mm/pgtable-generic.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 674671835631..d28b63386cef 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -232,12 +232,32 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long address,
 #endif
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+#if defined(CONFIG_GUP_GET_PXX_LOW_HIGH) && \
+	(defined(CONFIG_SMP) || defined(CONFIG_PREEMPT_RCU))
+/*
+ * See the comment above ptep_get_lockless() in include/linux/pgtable.h:
+ * the barriers in pmdp_get_lockless() cannot guarantee that the value in
+ * pmd_high actually belongs with the value in pmd_low; but holding interrupts
+ * off blocks the TLB flush between present updates, which guarantees that a
+ * successful __pte_offset_map() points to a page from matched halves.
+ */
+#define config_might_irq_save(flags)	local_irq_save(flags)
+#define config_might_irq_restore(flags)	local_irq_restore(flags)
+#else
+#define config_might_irq_save(flags)
+#define config_might_irq_restore(flags)
+#endif
+
 pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
 {
+	unsigned long __maybe_unused flags;
 	pmd_t pmdval;
 
 	rcu_read_lock();
+	config_might_irq_save(flags);
 	pmdval = pmdp_get_lockless(pmd);
+	config_might_irq_restore(flags);
+
 	if (pmdvalp)
 		*pmdvalp = pmdval;
 	if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
-- 
2.35.3

