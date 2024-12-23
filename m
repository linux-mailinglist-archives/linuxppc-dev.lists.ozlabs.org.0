Return-Path: <linuxppc-dev+bounces-4443-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D789FAC68
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 10:45:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGtSJ00gHz30CD;
	Mon, 23 Dec 2024 20:45:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734947151;
	cv=none; b=LV6M1VGu8NNfj7UNryLV56Yhge1XjEOVNjkNYFSubvrULKyrObCGO1jd6z7MnTS+/NYurwWGRAQwP/1g/xPsyTs3J+aePeld0yXAewvw/fokkMhgCP0BX09knuoCs1UWEWtZRwsmeZnchzx+8CY03aXLA3n0+QwXlwP/HaR27FFW48gnTuD6CH373n22qgOvxyIIilRYdcOtstnZWeZbyGD9cQcaca4Cv6M8aNvZzlOWpCcrsybQc1yXlSibqfkyfusxiTWmM1UTqLwP/+74rtKFM9oNzQoPNwHt7WLg4EDf4UcA7DLPfKbKgE3uW/1J9D4bKw4A6tH5+ecLIZeR1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734947151; c=relaxed/relaxed;
	bh=m/+0uIvp7xUeTeFwO63TH1y++vtASeDM7X35qnuktEM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g3O/EyN7X4TnLZGjUrGz27kzkI5/L5MXaJ40BcoXnhAmUTaw3Kx0xOyV7ZljV83ADA5G1Pz2OaHxFT2lizuWiONm+1cqD6JRGjn6x3ZywH6yZVT6NSWiXfh5PvC2gzN4qn6g1MOYtZbdjCtarnhXpRPrT7Z8c7YhzS5vRFVMCjeBGSbYDFbz5Tq1WWupEEApnGT9L9gA0u8bEusuP0kohEq1uoBt7hlZ5vccVOT+o15Fpctb+aOQWhrAne0gVd/YIXY+k1KnlqZO5t6L2RWZ7q0lC43mdgqPvnhTyMLBWgN3HdQ4bh4pTu0mZdGflj3phgbljfTYxexwv6gVksR6Ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MiE3zcH3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MiE3zcH3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGtSH0S92z30Bx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 20:45:50 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-728e729562fso3164556b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 01:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947149; x=1735551949; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/+0uIvp7xUeTeFwO63TH1y++vtASeDM7X35qnuktEM=;
        b=MiE3zcH3cverD71Z5nMlls8VnSgJLwfdwgaQr24c6Phb0kKdMK19Qs+fgYTdzKaD2j
         FSfjbsqP+s/CCozpYvUbyDYw3Rdfeq8yToml1Ky1NeXyc0UERsyCangpTn0t5bDCGViA
         IlEepFiRe5/qpFUqTTWlklK5IgNBApaV8g5+GrvZdgEFOAznpfON+Il4SEIyLLDj6Cyc
         DUnIC+mvBIJ09sTEShV49Plr07QI/9644GxRvrHGk8rIvlPesRVOSVEWL0fuD6OrZHeY
         RWCsqPlXKadJ2WLMfeDtxaO7RuAdZt58rCiRbotdszGsJSw36m0lC2DRpL0k7xFfFaFM
         aLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947149; x=1735551949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/+0uIvp7xUeTeFwO63TH1y++vtASeDM7X35qnuktEM=;
        b=Y/ygFSzhsVRULbadl8bunm+Hw1xmcX2IP3EqMMcICCBlnDApUcZqDdpgwmRPsNGtbh
         MKwuq7Oeo8J5ZTL7+3YargPJQIAemUkSPAGx4VjbEu8Omz8+e/sGeWPUjR9oP9/ON/aI
         GZBNFpovq+Ut1ckMJZqqr/TWkx0C/fCRtpa4aNDZxlMXpzB3TCoFgn1sLEy+UcTc/yGd
         nXGVs8CQWqLMo1q8AuL/vKSdKwDBw970g2rkjHguTEYvnlYuielMLTcD5G8tSX7xAYpo
         f1OGs7y63860dfyb4YEOn3yvGPUxFL+2eMwiaA+xcM3WAfUqueafrIkQI+7DRoZt9bgs
         bcHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfICldRmbmV6xnqmLwJGu2+ZOgKPE2IbOgCVnLhEYaqAhLhcMTojsSErv5fDIa8ZZKAE1zgSoW7miwDeQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzJXTn6aXVX4dd5UkAqPaN1u2xh1W9CI1IIcRELtAXNyzNI7b5l
	/8xXkkVJXG1N2bCBULUZ9ldhd8dtuKyW37hiuGJFrtXONArtWfxmPaJV1tHSdbY=
X-Gm-Gg: ASbGncs5y+TKOCA+Q/icoRytgFxEka4A0/VMJq3nntBlrC+2nifys8OUFVqzKdvuHlz
	nfakwmA7mkp0Uv60zTPGLJVQurhN2Yf9XvPEiABBjK2fHeMsXHr13PnVksMRPLumbDp7Ztx4iP4
	pztWkD2IjuvxYQOXhzraDtj/my4W0nintZKGnKz607hVoI2gzk8jdHK6e08TrMAdpxUPDaJ9w7T
	lEJdqhoSHQ+UCUqkK4ReDvMoy/I+N8vQe9XTAxpqa/wvise1xJCAjqXYdlckE6UMSw1ZTWt0hZB
	AGkOW/K7HU7f/Dw96gqfiA==
X-Google-Smtp-Source: AGHT+IHlutX536vagq2BMCvNjirBm1uJlF1dzaH3GgOc0ZHj3lAXm7kK/AuGYqDlsmkXqpl9hOqJ3g==
X-Received: by 2002:a05:6a00:92a4:b0:728:e1f9:b680 with SMTP id d2e1a72fcca58-72abdd7ac89mr17103004b3a.6.1734947149240;
        Mon, 23 Dec 2024 01:45:49 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:45:48 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 13/17] mm: pgtable: introduce generic __tlb_remove_table()
Date: Mon, 23 Dec 2024 17:40:59 +0800
Message-Id: <f7febc7719fd84673a8eae8af71b7b4278d3e110.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Several architectures (arm, arm64, riscv and x86) define exactly the
same __tlb_remove_table(), just introduce generic __tlb_remove_table() to
eliminate these duplications.

The s390 __tlb_remove_table() is nearly the same, so also make s390
__tlb_remove_table() version generic.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/arm/include/asm/tlb.h      |  9 ---------
 arch/arm64/include/asm/tlb.h    |  7 -------
 arch/powerpc/include/asm/tlb.h  |  1 +
 arch/riscv/include/asm/tlb.h    | 12 ------------
 arch/s390/include/asm/tlb.h     |  9 ++++-----
 arch/s390/mm/pgalloc.c          |  7 -------
 arch/sparc/include/asm/tlb_32.h |  1 +
 arch/sparc/include/asm/tlb_64.h |  1 +
 arch/x86/include/asm/tlb.h      | 17 -----------------
 include/asm-generic/tlb.h       | 15 +++++++++++++--
 10 files changed, 20 insertions(+), 59 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index 264ab635e807a..ea4fbe7b17f6f 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -27,15 +27,6 @@
 #else /* !CONFIG_MMU */
 
 #include <asm/tlbflush.h>
-
-static inline void __tlb_remove_table(void *_table)
-{
-	struct ptdesc *ptdesc = (struct ptdesc *)_table;
-
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
-}
-
 #include <asm-generic/tlb.h>
 
 static inline void
diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index 93591a80b5bfb..8d762607285cc 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -10,13 +10,6 @@
 
 #include <linux/pagemap.h>
 
-static inline void __tlb_remove_table(void *_table)
-{
-	struct ptdesc *ptdesc = (struct ptdesc *)_table;
-
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
-}
 
 #define tlb_flush tlb_flush
 static void tlb_flush(struct mmu_gather *tlb);
diff --git a/arch/powerpc/include/asm/tlb.h b/arch/powerpc/include/asm/tlb.h
index 1ca7d4c4b90db..2058e8d3e0138 100644
--- a/arch/powerpc/include/asm/tlb.h
+++ b/arch/powerpc/include/asm/tlb.h
@@ -37,6 +37,7 @@ extern void tlb_flush(struct mmu_gather *tlb);
  */
 #define tlb_needs_table_invalidate()	radix_enabled()
 
+#define __HAVE_ARCH_TLB_REMOVE_TABLE
 /* Get the generic bits... */
 #include <asm-generic/tlb.h>
 
diff --git a/arch/riscv/include/asm/tlb.h b/arch/riscv/include/asm/tlb.h
index ded8724b3c4f7..50b63b5c15bd8 100644
--- a/arch/riscv/include/asm/tlb.h
+++ b/arch/riscv/include/asm/tlb.h
@@ -10,18 +10,6 @@ struct mmu_gather;
 
 static void tlb_flush(struct mmu_gather *tlb);
 
-#ifdef CONFIG_MMU
-
-static inline void __tlb_remove_table(void *table)
-{
-	struct ptdesc *ptdesc = (struct ptdesc *)table;
-
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
-}
-
-#endif /* CONFIG_MMU */
-
 #define tlb_flush tlb_flush
 #include <asm-generic/tlb.h>
 
diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
index 79df7c0932c56..da4a7d175f69c 100644
--- a/arch/s390/include/asm/tlb.h
+++ b/arch/s390/include/asm/tlb.h
@@ -22,7 +22,6 @@
  * Pages used for the page tables is a different story. FIXME: more
  */
 
-void __tlb_remove_table(void *_table);
 static inline void tlb_flush(struct mmu_gather *tlb);
 static inline bool __tlb_remove_page_size(struct mmu_gather *tlb,
 		struct page *page, bool delay_rmap, int page_size);
@@ -87,7 +86,7 @@ static inline void pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 	tlb->cleared_pmds = 1;
 	if (mm_alloc_pgste(tlb->mm))
 		gmap_unlink(tlb->mm, (unsigned long *)pte, address);
-	tlb_remove_ptdesc(tlb, pte);
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pte));
 }
 
 /*
@@ -106,7 +105,7 @@ static inline void pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
 	tlb->cleared_puds = 1;
-	tlb_remove_ptdesc(tlb, pmd);
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pmd));
 }
 
 /*
@@ -124,7 +123,7 @@ static inline void pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
 	tlb->cleared_p4ds = 1;
-	tlb_remove_ptdesc(tlb, pud);
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pud));
 }
 
 /*
@@ -142,7 +141,7 @@ static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 	__tlb_adjust_range(tlb, address, PAGE_SIZE);
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
-	tlb_remove_ptdesc(tlb, p4d);
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
 }
 
 #endif /* _S390_TLB_H */
diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
index c73b89811a264..3e002dea6278f 100644
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -193,13 +193,6 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
 	pagetable_dtor_free(ptdesc);
 }
 
-void __tlb_remove_table(void *table)
-{
-	struct ptdesc *ptdesc = virt_to_ptdesc(table);
-
-	pagetable_dtor_free(ptdesc);
-}
-
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void pte_free_now(struct rcu_head *head)
 {
diff --git a/arch/sparc/include/asm/tlb_32.h b/arch/sparc/include/asm/tlb_32.h
index 5cd28a8793e39..910254867dfbd 100644
--- a/arch/sparc/include/asm/tlb_32.h
+++ b/arch/sparc/include/asm/tlb_32.h
@@ -2,6 +2,7 @@
 #ifndef _SPARC_TLB_H
 #define _SPARC_TLB_H
 
+#define __HAVE_ARCH_TLB_REMOVE_TABLE
 #include <asm-generic/tlb.h>
 
 #endif /* _SPARC_TLB_H */
diff --git a/arch/sparc/include/asm/tlb_64.h b/arch/sparc/include/asm/tlb_64.h
index 3037187482db7..1a6e694418e39 100644
--- a/arch/sparc/include/asm/tlb_64.h
+++ b/arch/sparc/include/asm/tlb_64.h
@@ -33,6 +33,7 @@ void flush_tlb_pending(void);
 #define tlb_needs_table_invalidate()	(false)
 #endif
 
+#define __HAVE_ARCH_TLB_REMOVE_TABLE
 #include <asm-generic/tlb.h>
 
 #endif /* _SPARC64_TLB_H */
diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index f64730be5ad67..3858dbf75880e 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -20,23 +20,6 @@ static inline void tlb_flush(struct mmu_gather *tlb)
 	flush_tlb_mm_range(tlb->mm, start, end, stride_shift, tlb->freed_tables);
 }
 
-/*
- * While x86 architecture in general requires an IPI to perform TLB
- * shootdown, enablement code for several hypervisors overrides
- * .flush_tlb_others hook in pv_mmu_ops and implements it by issuing
- * a hypercall. To keep software pagetable walkers safe in this case we
- * switch to RCU based table free (MMU_GATHER_RCU_TABLE_FREE). See the comment
- * below 'ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE' in include/asm-generic/tlb.h
- * for more details.
- */
-static inline void __tlb_remove_table(void *table)
-{
-	struct ptdesc *ptdesc = (struct ptdesc *)table;
-
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
-}
-
 #ifdef CONFIG_PT_RECLAIM
 static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
 {
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 709830274b756..69de47c7ef3c5 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -153,8 +153,9 @@
  *
  *  Useful if your architecture has non-page page directories.
  *
- *  When used, an architecture is expected to provide __tlb_remove_table()
- *  which does the actual freeing of these pages.
+ *  When used, an architecture is expected to provide __tlb_remove_table() or
+ *  use the generic __tlb_remove_table(), which does the actual freeing of these
+ *  pages.
  *
  *  MMU_GATHER_RCU_TABLE_FREE
  *
@@ -207,6 +208,16 @@ struct mmu_table_batch {
 #define MAX_TABLE_BATCH		\
 	((PAGE_SIZE - sizeof(struct mmu_table_batch)) / sizeof(void *))
 
+#ifndef __HAVE_ARCH_TLB_REMOVE_TABLE
+static inline void __tlb_remove_table(void *table)
+{
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
+}
+#endif
+
 extern void tlb_remove_table(struct mmu_gather *tlb, void *table);
 
 #else /* !CONFIG_MMU_GATHER_HAVE_TABLE_FREE */
-- 
2.20.1


