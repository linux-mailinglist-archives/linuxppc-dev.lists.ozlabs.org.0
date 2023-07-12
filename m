Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F7474FE3B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 06:33:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Qvc/PkHD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R14bt2M7Sz3c5M
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 14:32:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Qvc/PkHD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R14b2061wz30K1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 14:32:13 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-c4dfe2a95fbso7100689276.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 21:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689136330; x=1691728330;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GLbz1RkNVDPwgd+c2uKjWshONgMFueYUThzaGJTcWVc=;
        b=Qvc/PkHD69BAU4sP582IfM4RLWXgBIDFZuk6nWDdns1yA6pipuOhfQIqdzEwTgr4pe
         3hHPVwZEX/rTN82QEjOQqTQ59HEMCYwMwWNy+6/fZQSqaZ7WuN8quxZ0OH1xSZb0nnw1
         GQ9yLeSU3CHcxotbWJKDNNaXtCszqsP28pboCNNUqI77cmHp5FQjlA8XyqklDB9TnulT
         WeWBKDY+5/x9n63RzAqMKfAoGe4PZlQiubwU8Q6nAwMM5fg4y0pO4eBHwzFNgIbvMg4s
         7C3QDcHD56vICRPhekeNquZ8dALU2oQhR8OSFrsqDoj5IKRFZFww7bl+bK1ug+1bWYfZ
         rBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689136330; x=1691728330;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GLbz1RkNVDPwgd+c2uKjWshONgMFueYUThzaGJTcWVc=;
        b=afuVwmoTblhCHBcPvfv1RrE+8xtLfCGZ/F+izYGpVZHw4EDN1Iw4xTrZTP0OSvs9TL
         eF1PmwJrZUMI5ROAmMRpPmOFzNV12Md1AggD54NItw0rKWxWlS7tFbjsFCkwDL05tztm
         9SWrfNyFTf51lCXPbfnvClZhpxfvC1BuMSNBxHnzwt9gEi8fRGtgcyWYXbcY/imzGygY
         mQz7dYexXdsUU141fiKrZ6+pMG5XJBPrKRTkVwqVNaYCQcVpdeXNSDxCou+fX7EsjLse
         Hk+bOkgwSVCmB5x17jxNzmVIrD7DmyBI3R6r2mIIVKih+jAb4YT8fCO/nL+rBKsE+CDr
         dEdw==
X-Gm-Message-State: ABy/qLbWAL1sJ71SKvyMM0EHAyYs5SXO9OSp+ORyu9gWpTGTWXzVzjz9
	c7EQn6v3vMYamg3iZKQCt4dCKg==
X-Google-Smtp-Source: APBJJlHuHSECgdU31VYjlaNkYgclr1t2srEz3h6VpNsV9zTecpCyWa2tDNjiRBAwCFbUxJ3Q8EAdUw==
X-Received: by 2002:a25:dd85:0:b0:c18:dc8b:8582 with SMTP id u127-20020a25dd85000000b00c18dc8b8582mr16530943ybg.22.1689136330397;
        Tue, 11 Jul 2023 21:32:10 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id z14-20020a5b0e8e000000b00ca5d05d4d1csm90210ybr.28.2023.07.11.21.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 21:32:10 -0700 (PDT)
Date: Tue, 11 Jul 2023 21:32:05 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 02/13] mm/pgtable: add PAE safety to __pte_offset_map()
In-Reply-To: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com>
Message-ID: <3adcd8f-9191-2df1-d7ea-c4877698aad@google.com>
References: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com>
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

Complement this pmdp_get_lockless_start() and pmdp_get_lockless_end(),
used only locally in __pte_offset_map(), with a pmdp_get_lockless_sync()
synonym for tlb_remove_table_sync_one(): to send the necessary interrupt
at the right moment on those configs which do not already send it.

CONFIG_GUP_GET_PXX_LOW_HIGH is enabled when required by mips, sh and x86.
It is not enabled by arm-32 CONFIG_ARM_LPAE: my understanding is that
Will Deacon's 2020 enhancements to READ_ONCE() are sufficient for arm.
It is not enabled by arc, but its pmd_t is 32-bit even when pte_t 64-bit.

Limit the IRQ disablement to CONFIG_HIGHPTE?  Perhaps, but would need a
little more work, to retry if pmd_low good for page table, but pmd_high
non-zero from THP (and that might be making x86-specific assumptions).

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 include/linux/pgtable.h |  4 ++++
 mm/pgtable-generic.c    | 29 +++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 5134edcec668..7f2db400f653 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -390,6 +390,7 @@ static inline pmd_t pmdp_get_lockless(pmd_t *pmdp)
 	return pmd;
 }
 #define pmdp_get_lockless pmdp_get_lockless
+#define pmdp_get_lockless_sync() tlb_remove_table_sync_one()
 #endif /* CONFIG_PGTABLE_LEVELS > 2 */
 #endif /* CONFIG_GUP_GET_PXX_LOW_HIGH */
 
@@ -408,6 +409,9 @@ static inline pmd_t pmdp_get_lockless(pmd_t *pmdp)
 {
 	return pmdp_get(pmdp);
 }
+static inline void pmdp_get_lockless_sync(void)
+{
+}
 #endif
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 400e5a045848..b9a0c2137cc1 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -232,12 +232,41 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long address,
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
+static unsigned long pmdp_get_lockless_start(void)
+{
+	unsigned long irqflags;
+
+	local_irq_save(irqflags);
+	return irqflags;
+}
+static void pmdp_get_lockless_end(unsigned long irqflags)
+{
+	local_irq_restore(irqflags);
+}
+#else
+static unsigned long pmdp_get_lockless_start(void) { return 0; }
+static void pmdp_get_lockless_end(unsigned long irqflags) { }
+#endif
+
 pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
 {
+	unsigned long irqflags;
 	pmd_t pmdval;
 
 	rcu_read_lock();
+	irqflags = pmdp_get_lockless_start();
 	pmdval = pmdp_get_lockless(pmd);
+	pmdp_get_lockless_end(irqflags);
+
 	if (pmdvalp)
 		*pmdvalp = pmdval;
 	if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
-- 
2.35.3

