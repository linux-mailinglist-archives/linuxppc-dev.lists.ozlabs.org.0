Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E92CD210348
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 07:25:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xV7D5pzvzDqcj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 15:25:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=DvRcDYTC; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xV3W3F96zDqSm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 15:22:31 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id g67so10221027pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 22:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6y8xaEb9LV894Ycksw6hTuNBMRoBhwg8g7vq7evkHOI=;
 b=DvRcDYTC+utSLrz1zG50Sw2J6E/hqfYA5l953a1xdVoLqzdF97mvnJ08LgfjWteg0b
 gxRxrZHfTc8VwDLezY+xwpmD38HWjnIgXcx9wthBG6libmHo3Nh71Sxfj6iELO8/5jBa
 QDlN4aXgB7NZlBucOa4/HYDqSvAY/C5duh4zsgUrBAEjwuLg9EENyJ12ccXh15WIm7W9
 LN54iAo9fsisK7qmrYWk/DjwoYt6fHmKHjkAFyk8zWiVdcR5V4Ip7uf/R8Q2Lu1jHIL3
 Wses30i6O8lOM0F2eCTIkm0kVaX6PZuoOEnr/mXPVHwfDrhTSnViQ9qXcp5DRyK22pB0
 BlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6y8xaEb9LV894Ycksw6hTuNBMRoBhwg8g7vq7evkHOI=;
 b=mLX+zHhVh8y1U74dyVN0VL+jEEyoth4aildw5bfJRrO0fucgmMhb9oFyMuNYq4jYPg
 1PWbwpAxECLMmC+conyT0ggQbXTlu9QCHY3DF7OEIPAokJXf/dqjWXh/qM6zmkOuhJT6
 GG0vJr9w/ha0ioblE9nJtIZKcGpFZGgfywM7vSPbo3ZE3L+e/HhKFduD317yy678L6mg
 GhGHFHWXIPrz1vExhDKcfta39rlQQQ5ui4IqfC81HEtIgdwEzEWZnk65sk5hxDB7pjNF
 6usnHgZDYEVOJTrpvfORqCdk27lU2YaxcXsAYp+uDlb4aAfG9lbkNM9B2W+/nUuOyBki
 aRdQ==
X-Gm-Message-State: AOAM533LL/ysybDI1yJJZ4jkqc6bFDdjhPNtbGnaUdTil8/FaI2BWxYm
 RPXOQB1ho+sysdSi4hGcwwvX2w==
X-Google-Smtp-Source: ABdhPJxOH8F/609SPn8UR8vF/lH4dcC50iab7INb56JNeZk7w+e1yAkB2EZw1QLxDKictLTeEsyZVA==
X-Received: by 2002:a63:b255:: with SMTP id t21mr9352045pgo.78.1593580948782; 
 Tue, 30 Jun 2020 22:22:28 -0700 (PDT)
Received: from santosiv.in.ibm.com.com ([203.223.190.240])
 by smtp.gmail.com with ESMTPSA id y80sm4375201pfb.165.2020.06.30.22.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 22:22:28 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: <stable@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] mm/mmu_gather: invalidate TLB correctly on batch
 allocation failure and flush
Date: Wed,  1 Jul 2020 10:51:47 +0530
Message-Id: <20200701052147.1698510-2-santosh@fossix.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200701052147.1698510-1-santosh@fossix.org>
References: <20200701052147.1698510-1-santosh@fossix.org>
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
are now removing HAVE_RCU_TABLE_INVALIDATE.  The default value for
tlb_needs_table_invalidate is to always force an invalidate and sparc can
avoid the table invalidate.  Hence we define tlb_needs_table_invalidate to
false for sparc architecture.

Link: http://lkml.kernel.org/r/20200116064531.483522-3-aneesh.kumar@linux.ibm.com
Fixes: a46cc7a90fd8 ("powerpc/mm/radix: Improve TLB/PWC flushes")
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: <stable@vger.kernel.org>  # 4.19
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
---
 arch/Kconfig                    |  3 ---
 arch/powerpc/include/asm/tlb.h  | 11 +++++++++++
 arch/sparc/include/asm/tlb_64.h |  9 +++++++++
 include/asm-generic/tlb.h       | 15 +++++++++++++++
 mm/memory.c                     | 16 ++++++++--------
 5 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index a336548487e69..3abbdb0cea447 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -363,9 +363,6 @@ config HAVE_ARCH_JUMP_LABEL
 config HAVE_RCU_TABLE_FREE
 	bool
 
-config HAVE_RCU_TABLE_INVALIDATE
-	bool
-
 config ARCH_HAVE_NMI_SAFE_CMPXCHG
 	bool
 
diff --git a/arch/powerpc/include/asm/tlb.h b/arch/powerpc/include/asm/tlb.h
index f0e571b2dc7c8..63418275f402e 100644
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
diff --git a/arch/sparc/include/asm/tlb_64.h b/arch/sparc/include/asm/tlb_64.h
index a2f3fa61ee36a..8cb8f3833239a 100644
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
index b3353e21f3b3e..92dcfd01e0ee4 100644
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
index bbf0cc4066c84..7656714c9b7c4 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -325,14 +325,14 @@ bool __tlb_remove_page_size(struct mmu_gather *tlb, struct page *page, int page_
  */
 static inline void tlb_table_invalidate(struct mmu_gather *tlb)
 {
-#ifdef CONFIG_HAVE_RCU_TABLE_INVALIDATE
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
2.26.2

