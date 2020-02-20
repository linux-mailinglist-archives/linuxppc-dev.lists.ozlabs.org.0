Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0765165700
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 06:36:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NNcs0fDCzDqV1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 16:36:45 +1100 (AEDT)
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
 header.s=20150623 header.b=POZtORHd; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NNb83CfgzDqRR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 16:35:13 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id g6so1086089plp.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 21:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NKOsDlonI6ZZnqYhj8NP6zsInFEyFSvYMOHlkhHk/d4=;
 b=POZtORHdgH72O8bDBEfA5gjhoqk2cdAjFNd2Zi3GjYKTTbjLRikgh4fk0PMZrJ6i5M
 z28UPuMvpAmF4Hr3CA7uqZsLEG38XcJ8pc5TyCufQ2P7OJUg5nk7ZGpfoHVGHVT4CDhU
 AFMSG5nHpmp1cR0bMtiuC/l3v7Ie96ScSk3ry7coQjDNDRzRl+wcuiesnNlOnFEze+ZY
 b9XPs7QqHNRy61xALzh3VdA6zAOrTev0+/x1MHHyHaOuU0s54570Lm3zFFk2JspXsyX6
 yaheXMTYlQHMiQFUnBHQfdIKftLgdTYm0AWeTIa587H0XDsgQHoUZLg52utgAnCAsb3F
 25hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NKOsDlonI6ZZnqYhj8NP6zsInFEyFSvYMOHlkhHk/d4=;
 b=q6OApkWf7UK24oEzGmZYnKJcRXEtkeg77wqTycvIOPby11UkSlX7HHCIjs0bFReQxg
 Rq0xpJt+TojqSufLuE7USgYtH3E0owpO6NmWLu1dfmsgsRg9cgcAKpn2UZPL8FgfZeLt
 RDjCgWUX3AvkhXa944ZFmQdBxxOpeV9P5gs6gZ7y4GLndTTkiPHDpQhd5U5okWmCEnHa
 mIENp7GDPFBzFXkQhZgkX1aPxA245Nv3LraJlQeJZJg79RyCYgrsUHhUrPVCqUb6w8WU
 ZbPiDOLzX5Xwe8YNk1DSBRX1BZQ9DVHvfThVFcPL9c0zj6mQs3aYZ3hafwMoiHWBnjVy
 191A==
X-Gm-Message-State: APjAAAWIwnmJ+kGZvk5vj7HWIuom+nsVeoutm36KakYU+QptMpAiQ1MN
 9U/ckzPIb5eQHRy0oOSza6SEMZ0kiDc=
X-Google-Smtp-Source: APXvYqyyPoeNybZrSmK+0WHyI+lggbO8N/MMUcjHQHOypDxitVIxCh0Lsjl5NTHnErYegDfvoTyeuw==
X-Received: by 2002:a17:902:6a8c:: with SMTP id
 n12mr29129863plk.191.1582176909748; 
 Wed, 19 Feb 2020 21:35:09 -0800 (PST)
Received: from santosiv.in.ibm.com ([129.41.84.71])
 by smtp.gmail.com with ESMTPSA id r11sm1664262pgi.9.2020.02.19.21.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 21:35:09 -0800 (PST)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/6] asm-generic/tlb: Track freeing of page-table directories
 in struct mmu_gather
Date: Thu, 20 Feb 2020 11:04:52 +0530
Message-Id: <20200220053457.930231-2-santosh@fossix.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200220053457.930231-1-santosh@fossix.org>
References: <20200220053457.930231-1-santosh@fossix.org>
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
 akshay.adiga@linux.ibm.com, Will Deacon <will.deacon@arm.com>
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

