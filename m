Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DFE1DADAF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 10:38:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RmP01WzhzDqc3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 18:38:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=KoBiDgTY; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RmH265THzDqLl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 18:33:18 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id s20so1028609plp.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 01:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jK3eak8AGYwL0wJRZqsVcAfH4fevuortaENnjYjREuc=;
 b=KoBiDgTYuD8IKAqJBdXII+sxD6sA6Xi0IPUUqUub+G+3EfhEhjhsSpHZL/JvhHO0dM
 2HmkJd/HUr826uvD1Vp3f/hieDftN1Bj0Gt9Pj5/OPBqO0kaUEBNKBRikRilWTNxINnH
 CUi6XhdWliKmD07poHONfOzVzfFSNwkijYCUMh/fsdJTPoUc7qVFqqVokN4sD7a+JugC
 UlXaCfR61zsJ/DNdrlRdJXk4sc3pyv6Yz9/x/u67nggENWPChw+Y0vU2tK46gsVu0K6z
 rpuemkIFk3dA37qPpjIHwefNbzQGNSQ5cDK8KHkHMgg0lTXWgUsjb8nrh/27VNnm5X0U
 fuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jK3eak8AGYwL0wJRZqsVcAfH4fevuortaENnjYjREuc=;
 b=tb2bupLw+jTwA6iWqqEYoU/Jd06saWaFExJRASvLinIbaWZete2PDNaIQCWwCVbyij
 2A1RfJDEAHhHemASstjBf7m43dbsLRsCih4yplahFRBAeLUvAarxGBjzNWgl4Rrq0hT9
 aGbnWqYv6kf7tLPjTOjs8pyS5aCIvmORx2tBUNE7xqtz0O7FiY5dRk9z4dTS9qYlsHdO
 3MYTpoBjM1EbpOPBxRpzGMhNrGsfZh1GktktYMaRlyxHqcknL+8yrekIqGoSCKqbfC9b
 el5UoKzsthyoH6Co4oc8FxkpV3aLISDXgM2Re/n/bdTgwLrBaoaoKU8J4R6oln5XmbU2
 Wx1g==
X-Gm-Message-State: AOAM533kAxjZxwDEh5qZHvA/mR7MXkmzWBL4GbGPi6BYY6Cx/jQgPsc5
 sP1qxLpwJEVfYT1J5NrOOb22fA==
X-Google-Smtp-Source: ABdhPJzDTT7m+BSVW0Xo6BaI3Xo8msG0e5KvtMajBqg/QMPqaK6NDnNIXye7Ajo6vR+g/ZnmZp9tZw==
X-Received: by 2002:a17:90a:2586:: with SMTP id
 k6mr4041874pje.121.1589963594861; 
 Wed, 20 May 2020 01:33:14 -0700 (PDT)
Received: from santosiv.in.ibm.com.com ([223.181.246.139])
 by smtp.gmail.com with ESMTPSA id 2sm1553980pfz.39.2020.05.20.01.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 01:33:14 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: <stable@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v4 2/6] asm-generic/tlb: Track which levels of the page tables
 have been cleared
Date: Wed, 20 May 2020 14:00:21 +0530
Message-Id: <20200520083025.229011-3-santosh@fossix.org>
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
 Will Deacon <will.deacon@arm.com>, Greg KH <greg@kroah.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Will Deacon <will.deacon@arm.com>

commit a6d60245d6d9b1caf66b0d94419988c4836980af upstream

It is common for architectures with hugepage support to require only a
single TLB invalidation operation per hugepage during unmap(), rather than
iterating through the mapping at a PAGE_SIZE increment. Currently,
however, the level in the page table where the unmap() operation occurs
is not stored in the mmu_gather structure, therefore forcing
architectures to issue additional TLB invalidation operations or to give
up and over-invalidate by e.g. invalidating the entire TLB.

Ideally, we could add an interval rbtree to the mmu_gather structure,
which would allow us to associate the correct mapping granule with the
various sub-mappings within the range being invalidated. However, this
is costly in terms of book-keeping and memory management, so instead we
approximate by keeping track of the page table levels that are cleared
and provide a means to query the smallest granule required for invalidation.

Signed-off-by: Will Deacon <will.deacon@arm.com>
Cc: <stable@vger.kernel.org> # 4.19
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
[santosh: prerequisite for upcoming tlbflush backports]
---
 include/asm-generic/tlb.h | 58 +++++++++++++++++++++++++++++++++------
 mm/memory.c               |  4 ++-
 2 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 97306b32d8d2..f2b9dc9cbaf8 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -114,6 +114,14 @@ struct mmu_gather {
 	 */
 	unsigned int		freed_tables : 1;
 
+	/*
+	 * at which levels have we cleared entries?
+	 */
+	unsigned int		cleared_ptes : 1;
+	unsigned int		cleared_pmds : 1;
+	unsigned int		cleared_puds : 1;
+	unsigned int		cleared_p4ds : 1;
+
 	struct mmu_gather_batch *active;
 	struct mmu_gather_batch	local;
 	struct page		*__pages[MMU_GATHER_BUNDLE];
@@ -148,6 +156,10 @@ static inline void __tlb_reset_range(struct mmu_gather *tlb)
 		tlb->end = 0;
 	}
 	tlb->freed_tables = 0;
+	tlb->cleared_ptes = 0;
+	tlb->cleared_pmds = 0;
+	tlb->cleared_puds = 0;
+	tlb->cleared_p4ds = 0;
 }
 
 static inline void tlb_flush_mmu_tlbonly(struct mmu_gather *tlb)
@@ -197,6 +209,25 @@ static inline void tlb_remove_check_page_size_change(struct mmu_gather *tlb,
 }
 #endif
 
+static inline unsigned long tlb_get_unmap_shift(struct mmu_gather *tlb)
+{
+	if (tlb->cleared_ptes)
+		return PAGE_SHIFT;
+	if (tlb->cleared_pmds)
+		return PMD_SHIFT;
+	if (tlb->cleared_puds)
+		return PUD_SHIFT;
+	if (tlb->cleared_p4ds)
+		return P4D_SHIFT;
+
+	return PAGE_SHIFT;
+}
+
+static inline unsigned long tlb_get_unmap_size(struct mmu_gather *tlb)
+{
+	return 1UL << tlb_get_unmap_shift(tlb);
+}
+
 /*
  * In the case of tlb vma handling, we can optimise these away in the
  * case where we're doing a full MM flush.  When we're doing a munmap,
@@ -230,13 +261,19 @@ static inline void tlb_remove_check_page_size_change(struct mmu_gather *tlb,
 #define tlb_remove_tlb_entry(tlb, ptep, address)		\
 	do {							\
 		__tlb_adjust_range(tlb, address, PAGE_SIZE);	\
+		tlb->cleared_ptes = 1;				\
 		__tlb_remove_tlb_entry(tlb, ptep, address);	\
 	} while (0)
 
-#define tlb_remove_huge_tlb_entry(h, tlb, ptep, address)	     \
-	do {							     \
-		__tlb_adjust_range(tlb, address, huge_page_size(h)); \
-		__tlb_remove_tlb_entry(tlb, ptep, address);	     \
+#define tlb_remove_huge_tlb_entry(h, tlb, ptep, address)	\
+	do {							\
+		unsigned long _sz = huge_page_size(h);		\
+		__tlb_adjust_range(tlb, address, _sz);		\
+		if (_sz == PMD_SIZE)				\
+			tlb->cleared_pmds = 1;			\
+		else if (_sz == PUD_SIZE)			\
+			tlb->cleared_puds = 1;			\
+		__tlb_remove_tlb_entry(tlb, ptep, address);	\
 	} while (0)
 
 /**
@@ -250,6 +287,7 @@ static inline void tlb_remove_check_page_size_change(struct mmu_gather *tlb,
 #define tlb_remove_pmd_tlb_entry(tlb, pmdp, address)			\
 	do {								\
 		__tlb_adjust_range(tlb, address, HPAGE_PMD_SIZE);	\
+		tlb->cleared_pmds = 1;					\
 		__tlb_remove_pmd_tlb_entry(tlb, pmdp, address);		\
 	} while (0)
 
@@ -264,6 +302,7 @@ static inline void tlb_remove_check_page_size_change(struct mmu_gather *tlb,
 #define tlb_remove_pud_tlb_entry(tlb, pudp, address)			\
 	do {								\
 		__tlb_adjust_range(tlb, address, HPAGE_PUD_SIZE);	\
+		tlb->cleared_puds = 1;					\
 		__tlb_remove_pud_tlb_entry(tlb, pudp, address);		\
 	} while (0)
 
@@ -289,7 +328,8 @@ static inline void tlb_remove_check_page_size_change(struct mmu_gather *tlb,
 #define pte_free_tlb(tlb, ptep, address)			\
 	do {							\
 		__tlb_adjust_range(tlb, address, PAGE_SIZE);	\
-		tlb->freed_tables = 1;			\
+		tlb->freed_tables = 1;				\
+		tlb->cleared_pmds = 1;				\
 		__pte_free_tlb(tlb, ptep, address);		\
 	} while (0)
 #endif
@@ -298,7 +338,8 @@ static inline void tlb_remove_check_page_size_change(struct mmu_gather *tlb,
 #define pmd_free_tlb(tlb, pmdp, address)			\
 	do {							\
 		__tlb_adjust_range(tlb, address, PAGE_SIZE);	\
-		tlb->freed_tables = 1;			\
+		tlb->freed_tables = 1;				\
+		tlb->cleared_puds = 1;				\
 		__pmd_free_tlb(tlb, pmdp, address);		\
 	} while (0)
 #endif
@@ -308,7 +349,8 @@ static inline void tlb_remove_check_page_size_change(struct mmu_gather *tlb,
 #define pud_free_tlb(tlb, pudp, address)			\
 	do {							\
 		__tlb_adjust_range(tlb, address, PAGE_SIZE);	\
-		tlb->freed_tables = 1;			\
+		tlb->freed_tables = 1;				\
+		tlb->cleared_p4ds = 1;				\
 		__pud_free_tlb(tlb, pudp, address);		\
 	} while (0)
 #endif
@@ -319,7 +361,7 @@ static inline void tlb_remove_check_page_size_change(struct mmu_gather *tlb,
 #define p4d_free_tlb(tlb, pudp, address)			\
 	do {							\
 		__tlb_adjust_range(tlb, address, PAGE_SIZE);	\
-		tlb->freed_tables = 1;			\
+		tlb->freed_tables = 1;				\
 		__p4d_free_tlb(tlb, pudp, address);		\
 	} while (0)
 #endif
diff --git a/mm/memory.c b/mm/memory.c
index bbf0cc4066c8..1832c5ed6ac0 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -267,8 +267,10 @@ void arch_tlb_finish_mmu(struct mmu_gather *tlb,
 {
 	struct mmu_gather_batch *batch, *next;
 
-	if (force)
+	if (force) {
+		__tlb_reset_range(tlb);
 		__tlb_adjust_range(tlb, start, end - start);
+	}
 
 	tlb_flush_mmu(tlb);
 
-- 
2.25.4

