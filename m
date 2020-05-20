Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEB31DADCA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 10:44:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RmWd5V1lzDqVR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 18:44:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::1041; helo=mail-pj1-x1041.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=sTNISCaj; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RmHG0Pl9zDqRj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 18:33:29 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id t40so919132pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 01:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6vUYnVtzIwHWJb6qjVbD2f9l+GduTHLNkDtlUmKXKK8=;
 b=sTNISCaj7RyO3LfhbyD/z0HifoLVQ+e+tV452kn2DsYKSa6Y3ZhGqxzb5RlQhMfZt2
 QoGc2YnDV+OSvUJ47eoHIIBp3QpmVzPRJ4qeuup/wPi57Lo73jnPe59dYZ4M7azzALx6
 KbMXPI/mOx0xhY/QdESEVWILztrxDUwCw1tt2m+ArhPH+n0Aw3gt4AApC3zu4C/WmlLH
 mPaKsI77Zugid0tX0pLtcr3v6M1nCzQTmmjPBn7AMNbF0sFm+jkiw3B24zWEJb8Tw3BI
 yZd4sBGM+ODBoFjvoSzKPS8AnRFJU5sqxwMZKwyOyTiTZAIr2cej1eFVmTUM4M9vM96q
 mrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6vUYnVtzIwHWJb6qjVbD2f9l+GduTHLNkDtlUmKXKK8=;
 b=ZlLxDwXVJ0SYeL0sJYKvpg8WG1hH10geiW4zxGLzgPcrdYATvHUnrhSwGRQccHc6PA
 NHL1YTQxu2yZBPIu+70wD38zpSKhRZAx9Ljdq6+TH7ECYozHBi8TMdXlM2AXB57sR3kk
 w1Xb7kbXki6tEQp62ImX4rQjPeENNtqFGiAJlHmiG/6FHTHk5+B+j1kT+LFYLhhMVirJ
 YPBEaC8gr6uFgofBPrIFqkhbXeEFeOZU8ASpjI+byrdril1rnIThbPsFyGCigmQuOpQu
 S3DBciWEr/YmEWOZ7qgRI8Y/8KJxtlAoEUtXh8LklauacU1uHyLHgDSEyaTt3Iff/wBp
 cJMw==
X-Gm-Message-State: AOAM531xznh96XvUieIzNV+ZKSZy8RXYvWJBJl6tCx8TLweFFWPNDzdM
 E2SyKOYVedldkdo8iuRvLyZlZA==
X-Google-Smtp-Source: ABdhPJywcPpG6uSuWHx87lXNUW8fc0ZLaat13S2lX9XW6p9+3xmG3JjXkP5jmlQxVoYQcCmT24EZgA==
X-Received: by 2002:a17:902:326:: with SMTP id
 35mr3240466pld.188.1589963607187; 
 Wed, 20 May 2020 01:33:27 -0700 (PDT)
Received: from santosiv.in.ibm.com.com ([223.181.246.139])
 by smtp.gmail.com with ESMTPSA id 2sm1553980pfz.39.2020.05.20.01.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 01:33:26 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: <stable@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v4 5/6] mm/mmu_gather: invalidate TLB correctly on batch
 allocation failure and flush
Date: Wed, 20 May 2020 14:00:24 +0530
Message-Id: <20200520083025.229011-6-santosh@fossix.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200520083025.229011-1-santosh@fossix.org>
References: <20200520083025.229011-1-santosh@fossix.org>
MIME-Version: 1.0
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
Cc: Sasha Levin <sashal@kernel.org>, Santosh Sivaraj <santosh@fossix.org>,
 Peter Zijlstra <peterz@infradead.org>, Greg KH <greg@kroah.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Zijlstra <peterz@infradead.org>

commit 0ed1325967ab5f7a4549a2641c6ebe115f76e228 upstream

Architectures for which we have hardware walkers of Linux page table
should flush TLB on mmu gather batch allocation failures and batch flush.
Some architectures like POWER supports multiple translation modes (hash
and radix) and in the case of POWER only radix translation mode needs the
above TLBI.  This is because for hash translation mode kernel wants to
avoid this extra flush since there are no hardware walkers of linux page
table.  With radix translation, the hardware also walks linux page table
and with that, kernel needs to make sure to TLB invalidate page walk cache
before page table pages are freed.

More details in commit d86564a2f085 ("mm/tlb, x86/mm: Support invalidating
TLB caches for RCU_TABLE_FREE")

The changes to sparc are to make sure we keep the old behavior since we
are now removing HAVE_RCU_TABLE_NO_INVALIDATE.  The default value for
tlb_needs_table_invalidate is to always force an invalidate and sparc can
avoid the table invalidate.  Hence we define tlb_needs_table_invalidate to
false for sparc architecture.

Link: http://lkml.kernel.org/r/20200116064531.483522-3-aneesh.kumar@linux.ibm.com
Fixes: a46cc7a90fd8 ("powerpc/mm/radix: Improve TLB/PWC flushes")
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: <stable@vger.kernel.org>  # 4.19
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
[santosh: backported to 4.19 stable]
---
 arch/Kconfig                    |  3 ---
 arch/powerpc/Kconfig            |  1 -
 arch/powerpc/include/asm/tlb.h  | 11 +++++++++++
 arch/sparc/Kconfig              |  1 -
 arch/sparc/include/asm/tlb_64.h |  9 +++++++++
 include/asm-generic/tlb.h       | 15 +++++++++++++++
 mm/memory.c                     | 16 ++++++++--------
 7 files changed, 43 insertions(+), 13 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 061a12b8140e..3abbdb0cea44 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -363,9 +363,6 @@ config HAVE_ARCH_JUMP_LABEL
 config HAVE_RCU_TABLE_FREE
 	bool
 
-config HAVE_RCU_TABLE_NO_INVALIDATE
-	bool
-
 config ARCH_HAVE_NMI_SAFE_CMPXCHG
 	bool
 
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1a00ce4b0040..e5bc0cfea2b1 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -216,7 +216,6 @@ config PPC
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_RCU_TABLE_FREE
-	select HAVE_RCU_TABLE_NO_INVALIDATE	if HAVE_RCU_TABLE_FREE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE		if PPC64 && CPU_LITTLE_ENDIAN
 	select HAVE_SYSCALL_TRACEPOINTS
diff --git a/arch/powerpc/include/asm/tlb.h b/arch/powerpc/include/asm/tlb.h
index f0e571b2dc7c..63418275f402 100644
--- a/arch/powerpc/include/asm/tlb.h
+++ b/arch/powerpc/include/asm/tlb.h
@@ -30,6 +30,17 @@
 #define tlb_remove_check_page_size_change tlb_remove_check_page_size_change
 
 extern void tlb_flush(struct mmu_gather *tlb);
+/*
+ * book3s:
+ * Hash does not use the linux page-tables, so we can avoid
+ * the TLB invalidate for page-table freeing, Radix otoh does use the
+ * page-tables and needs the TLBI.
+ *
+ * nohash:
+ * We still do TLB invalidate in the __pte_free_tlb routine before we
+ * add the page table pages to mmu gather table batch.
+ */
+#define tlb_needs_table_invalidate()	radix_enabled()
 
 /* Get the generic bits... */
 #include <asm-generic/tlb.h>
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index d90d632868aa..e6f2a38d2e61 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -64,7 +64,6 @@ config SPARC64
 	select HAVE_KRETPROBES
 	select HAVE_KPROBES
 	select HAVE_RCU_TABLE_FREE if SMP
-	select HAVE_RCU_TABLE_NO_INVALIDATE if HAVE_RCU_TABLE_FREE
 	select HAVE_MEMBLOCK_NODE_MAP
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select HAVE_DYNAMIC_FTRACE
diff --git a/arch/sparc/include/asm/tlb_64.h b/arch/sparc/include/asm/tlb_64.h
index a2f3fa61ee36..8cb8f3833239 100644
--- a/arch/sparc/include/asm/tlb_64.h
+++ b/arch/sparc/include/asm/tlb_64.h
@@ -28,6 +28,15 @@ void flush_tlb_pending(void);
 #define __tlb_remove_tlb_entry(tlb, ptep, address) do { } while (0)
 #define tlb_flush(tlb)	flush_tlb_pending()
 
+/*
+ * SPARC64's hardware TLB fill does not use the Linux page-tables
+ * and therefore we don't need a TLBI when freeing page-table pages.
+ */
+
+#ifdef CONFIG_HAVE_RCU_TABLE_FREE
+#define tlb_needs_table_invalidate()	(false)
+#endif
+
 #include <asm-generic/tlb.h>
 
 #endif /* _SPARC64_TLB_H */
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index f2b9dc9cbaf8..19934cdd143e 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -61,8 +61,23 @@ struct mmu_table_batch {
 extern void tlb_table_flush(struct mmu_gather *tlb);
 extern void tlb_remove_table(struct mmu_gather *tlb, void *table);
 
+/*
+ * This allows an architecture that does not use the linux page-tables for
+ * hardware to skip the TLBI when freeing page tables.
+ */
+#ifndef tlb_needs_table_invalidate
+#define tlb_needs_table_invalidate() (true)
 #endif
 
+#else
+
+#ifdef tlb_needs_table_invalidate
+#error tlb_needs_table_invalidate() requires HAVE_RCU_TABLE_FREE
+#endif
+
+#endif /* CONFIG_HAVE_RCU_TABLE_FREE */
+
+
 /*
  * If we can't allocate a page to make a big batch of page pointers
  * to work on, then just handle a few from the on-stack structure.
diff --git a/mm/memory.c b/mm/memory.c
index ba5689610c04..7daa7ae1b046 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -327,14 +327,14 @@ bool __tlb_remove_page_size(struct mmu_gather *tlb, struct page *page, int page_
  */
 static inline void tlb_table_invalidate(struct mmu_gather *tlb)
 {
-#ifndef CONFIG_HAVE_RCU_TABLE_NO_INVALIDATE
-	/*
-	 * Invalidate page-table caches used by hardware walkers. Then we still
-	 * need to RCU-sched wait while freeing the pages because software
-	 * walkers can still be in-flight.
-	 */
-	tlb_flush_mmu_tlbonly(tlb);
-#endif
+	if (tlb_needs_table_invalidate()) {
+		/*
+		 * Invalidate page-table caches used by hardware walkers. Then
+		 * we still need to RCU-sched wait while freeing the pages
+		 * because software walkers can still be in-flight.
+		 */
+		tlb_flush_mmu_tlbonly(tlb);
+	}
 }
 
 static void tlb_remove_table_smp_sync(void *arg)
-- 
2.25.4

