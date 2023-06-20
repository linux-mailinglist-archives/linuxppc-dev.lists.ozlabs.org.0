Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FB9736501
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:43:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Rk9aZz3l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QldsV0Djsz3bWc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 17:43:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Rk9aZz3l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qldrb3VLxz2yyc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 17:42:22 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-bc476bf5239so4498011276.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 00:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687246939; x=1689838939;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4mQCeX//121ajNwvCY66Rysl9c9mZt4CnPkKAdBrlyo=;
        b=Rk9aZz3lCgWM/wzoeIdA8TQQHo7EP0qUx4FBk6w6vBIv3V9EGmhpCtWeOKkVLalH/B
         3/IhZXP8pzSAUtUwv1YZ0rZFRUBVXIfjAUyirXzYoBsOop5Z2sZPS+eTpvJIhr7MrLYm
         LUjzgRD1GyQ/XuvAm8PLozNnLUaUsJj8Srr/G3h67lgjS83i0yMgd02EIVoO5rsRx9kI
         daqlfGCCUSLKQt7wMh3o0YW7GwW3VGqW8slprzgeDxp+5B0Z6u1+4uuHf8AelDneMwjV
         DKf7ckeYtLcfEfqu2RjXHw4XHJyjxhdMznrF0GKkr5IkH8s4Le9upNEGz9sVfSI4hq5l
         39mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687246939; x=1689838939;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4mQCeX//121ajNwvCY66Rysl9c9mZt4CnPkKAdBrlyo=;
        b=Or7bhc67CHDylNvIGiRhzy/3Kw8nlTm2YtMPBiqxvVfYsVxHWGRDFa6PQvLlHhydIX
         Gcn/uXhFAmllPKZzW/7Ftcru9PmuvSTzdkoK/UOky1/Xcfj3pEeT38g9y5/QHjGVadpI
         l40jmpb2qbX2a1A2q8ajz6KmKVekpIP61a03PCrMbo/J5LXls5Q6tJmekHj3IJ9ITcKg
         4qcpv+exTY8mgVCkrtJ1/FZZr5Wk+Q4n2mlZv9Saua1A9IIvMXCZ7q8xLfpOhstj0w4r
         whAqisSFCGHSHvlNog48Cxd/LWdGTP6HDxdatoY7ofUGQo84x+2UW6CKZWcR2KDaXJEu
         ZgPw==
X-Gm-Message-State: AC+VfDw/sAYeMe991QhQiLQ0Csca9MHwZf0hvyHsZkabHOv6raoIy5vn
	PB/IOTWAXwEJ5wuQMr1y8XPEKw==
X-Google-Smtp-Source: ACHHUZ5rgE5ZeLfP+qyjhwCRCkWSPHoZuMre6lfq8YixODGIptTSfSS2sgODZVUUkcQ4STmKqbbGHw==
X-Received: by 2002:a25:4dc2:0:b0:bac:4dd6:d0d1 with SMTP id a185-20020a254dc2000000b00bac4dd6d0d1mr7498427ybb.19.1687246938747;
        Tue, 20 Jun 2023 00:42:18 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id j200-20020a2523d1000000b00be6cf9d2544sm254636ybj.40.2023.06.20.00.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 00:42:18 -0700 (PDT)
Date: Tue, 20 Jun 2023 00:42:13 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 02/12] mm/pgtable: add PAE safety to __pte_offset_map()
In-Reply-To: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
Message-ID: <df1884ce-93c-efa-2354-4d749eb25f1@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mel Gorman <mgorman@techsingularity.net>, "David Sc. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
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
index 8b0fc7fdc46f..525f1782b466 100644
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
index 674671835631..5e85a625ab30 100644
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

