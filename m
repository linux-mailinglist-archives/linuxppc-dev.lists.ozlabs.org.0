Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0351789A9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 05:35:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XLfR14Z5zDqTl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 15:35:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=X+wBnqQ5; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XLXt1JdjzDqSd
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 15:30:54 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id y30so347066pga.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2020 20:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OWUR5oTygA9h8IedsUL9OoKv5C2XK4YyN0lJTOYOESQ=;
 b=X+wBnqQ507bZ3g7ePamjOT29SPt6GRh1rwxnBTGc3ggsB3e1YynS7A8tjOeP/KqlJn
 U7uThOWUncfU9mBijeMB3JxYYGVaSIroGIEv9SZpiHMQMWUrXImjyAgSdnCOHwvMRVtj
 nDYhfRA8EA+WdY0KrNn8XsodmHoXD2MtsUJNxKXHBNncgboLVAx5zii0zNnV704Sw2hE
 6RWru/fUcV8rJ9B0m74GgO7VN0DZ1xKab2ysdLUWT0n8+R5yK/vaNEzAvCWkUCESEkgK
 QR3ukvyLTLgbMscSLikLhruans6pbg61KT3SIq2YuETbntMl6cOJreyKo9oO6pDBvOzL
 NUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OWUR5oTygA9h8IedsUL9OoKv5C2XK4YyN0lJTOYOESQ=;
 b=jABIelBi1Z0kv3f9ZeGWWkH+6Q2mb/JZBOLMaCuYnFa7ObcmltbGw249C7spVyMsNY
 Wbh0a2ABlNfESvl1x/3agqVaujfh3YkhdexcrEJaSwoI/1E7f3kVEWGI0CNfvwypx19t
 VL7AI77vDDuGPMhakMCUcp861ai93WSAwjcwwLMeMkF00WpwVUuZFiwFBa6er5CKGXUL
 Yo4lrSuqBwaSfALO3Pkz4ij1HifT+sGAF+0ALamKStyqH+102K38xnVdQIpaWQ6W+E0w
 7fMhftzzU9H3zbbmfeXU/iM+2bPM+6N9HRgGFgSRy68d2LhOcuNCSflOluAFnnJv2FpI
 AQVw==
X-Gm-Message-State: ANhLgQ3CaiJxT4rentnVVX86uLOaaWz8FP0+MwIi3r0YCp9e9hjYbBdV
 7tzv3W4s8mlW04ontAWHbPsApA==
X-Google-Smtp-Source: ADFU+vvnsEn2WNvd87oF3eBM1krzSggwmxshIXznZaRCXv1VNvhx94YnFoKF+FpchUmSh8lyZZel0g==
X-Received: by 2002:a63:a052:: with SMTP id u18mr895128pgn.210.1583296251294; 
 Tue, 03 Mar 2020 20:30:51 -0800 (PST)
Received: from santosiv.in.ibm.com ([2401:4900:16ee:7b5f:eac:4364:ff14:3aaa])
 by smtp.gmail.com with ESMTPSA id
 y193sm10775723pfg.162.2020.03.03.20.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 20:30:50 -0800 (PST)
From: Santosh Sivaraj <santosh@fossix.org>
To: <stable@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 2/6] asm-generic/tlb: Track which levels of the page tables
 have been cleared
Date: Wed,  4 Mar 2020 10:00:24 +0530
Message-Id: <20200304043028.280136-3-santosh@fossix.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200304043028.280136-1-santosh@fossix.org>
References: <20200304043028.280136-1-santosh@fossix.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Will Deacon <will.deacon@arm.com>,
 Greg KH <greg@kroah.com>
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
2.24.1

