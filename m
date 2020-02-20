Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D511F165985
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 09:45:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NSq41JvtzDqRJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 19:45:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=aZBjkKJ2; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NSlf3k4mzDqSg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 19:42:54 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id d9so1270609plo.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 00:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QcZMDkYbi4PCaUtgytpxeZUUFI6CVIxTM3TjTbEOqmA=;
 b=aZBjkKJ2rVHe7rG5DUHlj7/eibX2Klyvbn3HTxEtx4u85XoVuNvgTtpvfL0MA0vy2V
 RHPbeNC4CUxmxtTdq/RfVgWYKRntHcgzRe6RfS8BhYHLImZRv5Ms2O7/xTBW0CwgkLM8
 pTvyD5fq2geW3l0vxIFwviI4m5VFRv6rSKFMo0zs0zMc/iCZwBUdipfqyUQwKs6XntEg
 4BxNsm5UVI7GTUFjA1aG/PbNLrF6URGCs8HsAJU+Zp8AINLlFqvgBy5yp9VWQ4sUBg+H
 j76p0Jc9sdrK8Te3O1P6Tgr2PSRZUf+40IT9Am99gsPIrHvvxiiBEPID3UYO+Hz4iY92
 09xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QcZMDkYbi4PCaUtgytpxeZUUFI6CVIxTM3TjTbEOqmA=;
 b=cxCyfjsPZvVP5f5Uf83B92RV9zXMae0dy19ZOoVPQjK9ciM6fxRaq4MXiqF3raUQuG
 U1p2U8AK8Zul3Q1krY6rvfMHWbZgSfH1zg6yN8S+mDfqoPQluS11lLoHR3BSuhqyQc34
 dZQGeUxIUm/XT+oEI+icsNfSwqSMrt2R1Y5Vt+eF2A4cigwE3X7tPljzrhHAumw67OFy
 a27dTRDVhV2IQZY/439o+Nvt5mv+2dXIOab7FUUaWjmTMiAoR9be1jiALzM7fx04md04
 Btad5zs2ihH6xjFtMcC23jCc9Kfwfh0t1TBh+g1p1QgEUiz2xlAROfDS/jXJA8Zj1PMV
 wtJg==
X-Gm-Message-State: APjAAAUtKuwzGjaEDmnZ0o5nom6asdRe6nAg2wavPNJtz+WwxlSGNtoe
 EBdtO8luGRFRPqGOWRzNNhzA8rxDVsc=
X-Google-Smtp-Source: APXvYqzpPpHl4pph9y6TCwrhJEG2S0gwgXFbtpQWfS2cafaroEQ9IUoKfj1WXHIXUjMC/jH/bAhUnw==
X-Received: by 2002:a17:90a:ec02:: with SMTP id
 l2mr2411354pjy.12.1582188172089; 
 Thu, 20 Feb 2020 00:42:52 -0800 (PST)
Received: from santosiv.in.ibm.com ([129.41.84.72])
 by smtp.gmail.com with ESMTPSA id r145sm2512381pfr.5.2020.02.20.00.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 00:42:51 -0800 (PST)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/6] asm-generic/tlb: Track freeing of page-table directories
 in struct mmu_gather
Date: Thu, 20 Feb 2020 14:12:24 +0530
Message-Id: <20200220084229.1278137-2-santosh@fossix.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200220084229.1278137-1-santosh@fossix.org>
References: <20200220084229.1278137-1-santosh@fossix.org>
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
Cc: peterz@infradead.org, aneesh.kumar@linux.ibm.com,
 akshay.adiga@linux.ibm.com, Will Deacon <will.deacon@arm.com>,
 gregkh@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Zijlstra <peterz@infradead.org>

Some architectures require different TLB invalidation instructions
depending on whether it is only the last-level of page table being
changed, or whether there are also changes to the intermediate
(directory) entries higher up the tree.

Add a new bit to the flags bitfield in struct mmu_gather so that the
architecture code can operate accordingly if it's the intermediate
levels being invalidated.

22a61c3c4f1379 in upstream

Signed-off-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Will Deacon <will.deacon@arm.com>
Cc: <stable@vger.kernel.org> # 4.19
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
[santosh: prerequisite for tlbflush backports]
---
 include/asm-generic/tlb.h | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index b3353e21f3b3..97306b32d8d2 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -97,12 +97,22 @@ struct mmu_gather {
 #endif
 	unsigned long		start;
 	unsigned long		end;
-	/* we are in the middle of an operation to clear
-	 * a full mm and can make some optimizations */
-	unsigned int		fullmm : 1,
-	/* we have performed an operation which
-	 * requires a complete flush of the tlb */
-				need_flush_all : 1;
+	/*
+	 * we are in the middle of an operation to clear
+	 * a full mm and can make some optimizations
+	 */
+	unsigned int		fullmm : 1;
+
+	/*
+	 * we have performed an operation which
+	 * requires a complete flush of the tlb
+	 */
+	unsigned int		need_flush_all : 1;
+
+	/*
+	 * we have removed page directories
+	 */
+	unsigned int		freed_tables : 1;
 
 	struct mmu_gather_batch *active;
 	struct mmu_gather_batch	local;
@@ -137,6 +147,7 @@ static inline void __tlb_reset_range(struct mmu_gather *tlb)
 		tlb->start = TASK_SIZE;
 		tlb->end = 0;
 	}
+	tlb->freed_tables = 0;
 }
 
 static inline void tlb_flush_mmu_tlbonly(struct mmu_gather *tlb)
@@ -278,6 +289,7 @@ static inline void tlb_remove_check_page_size_change(struct mmu_gather *tlb,
 #define pte_free_tlb(tlb, ptep, address)			\
 	do {							\
 		__tlb_adjust_range(tlb, address, PAGE_SIZE);	\
+		tlb->freed_tables = 1;			\
 		__pte_free_tlb(tlb, ptep, address);		\
 	} while (0)
 #endif
@@ -285,7 +297,8 @@ static inline void tlb_remove_check_page_size_change(struct mmu_gather *tlb,
 #ifndef pmd_free_tlb
 #define pmd_free_tlb(tlb, pmdp, address)			\
 	do {							\
-		__tlb_adjust_range(tlb, address, PAGE_SIZE);		\
+		__tlb_adjust_range(tlb, address, PAGE_SIZE);	\
+		tlb->freed_tables = 1;			\
 		__pmd_free_tlb(tlb, pmdp, address);		\
 	} while (0)
 #endif
@@ -295,6 +308,7 @@ static inline void tlb_remove_check_page_size_change(struct mmu_gather *tlb,
 #define pud_free_tlb(tlb, pudp, address)			\
 	do {							\
 		__tlb_adjust_range(tlb, address, PAGE_SIZE);	\
+		tlb->freed_tables = 1;			\
 		__pud_free_tlb(tlb, pudp, address);		\
 	} while (0)
 #endif
@@ -304,7 +318,8 @@ static inline void tlb_remove_check_page_size_change(struct mmu_gather *tlb,
 #ifndef p4d_free_tlb
 #define p4d_free_tlb(tlb, pudp, address)			\
 	do {							\
-		__tlb_adjust_range(tlb, address, PAGE_SIZE);		\
+		__tlb_adjust_range(tlb, address, PAGE_SIZE);	\
+		tlb->freed_tables = 1;			\
 		__p4d_free_tlb(tlb, pudp, address);		\
 	} while (0)
 #endif
-- 
2.24.1

