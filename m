Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A182A1DAD9B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 10:36:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RmLs0qYJzDqc1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 18:36:37 +1000 (AEST)
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
 header.s=20150623 header.b=Cy0hTnTA; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RmGx4Ht9zDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 18:33:13 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id p21so1081224pgm.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 01:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DvGJDJ10NCwwfIoYiATTvuoTDqLIXlzfFKq1jKX4bOM=;
 b=Cy0hTnTAPs1JQEg5UTxTAbeYYI7lx7paxKnv1ZXiggmOqQ6yTQYOQBZWyxnUhDuhRS
 REHWbOlrE0wkyGkx2fk3lPLVGZzCLrrefyOoPWduJ9ZnsasvuF5teNjOxyj6RrghWAaq
 7Rq2/mr7Fjh5fwJ2JbC2hqTp/3tpJLLgaRZcY+BXBqOY0HCUBi5I/nZeNbW56OQPkYNQ
 kKXE31RBVJqmJNzMBmSebse7yCJMoHzBtNthhlMTgTVSqi3wfjeHRJA4WNogi4jRo7YH
 t5xctEMCLfx41V3pdAx1TljO64UuDJWy5f0AO/gUwpYBLfO6+EhQiHe7niR/xKJbdV4n
 Vrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DvGJDJ10NCwwfIoYiATTvuoTDqLIXlzfFKq1jKX4bOM=;
 b=e1xC41m1kVoyupCYuKSQNTFUgGxBZq9MsNugwmjFnYUaFVS1Sun/Ag7CBDXO8OOZC6
 2xZ/o2rIt1rv6oTsnJvUNqIaFrzpn+41mGwTPq+qjS59WAhQFz5K7EK6960Rq+WzdnXk
 06Pt/qcF2EeYgmxGCs/ocTBUyz4nt9SAKpXESkjkChoFJOa2/Pppa/fEE164wqx+w5k7
 OwtvqnjGXpKCO153CBViJrs/YzuCLJ7+lUTrWZ5Xif8Of1NRmJOykLCpAO+nA8Aeh7w4
 jMcn11/XDRO93SyAWVdD5tUJeZpM8Aaz6cDWKv0v9/kAUiNfkdjkUUOnVCEF9sqTNBR2
 iFpg==
X-Gm-Message-State: AOAM533+1OD8f01/KVqo+2u02NtVVjyyzudRzuoaIP7PjooZ5e8f51Rm
 j2vVwq+dYTaOX6Iy1RygSq2LDA==
X-Google-Smtp-Source: ABdhPJzuMxVxkEIHchBwUmpORtcFOYOxowBV2WxC+d+eFA7YvFuscZXksRaJ690s125sVI8Tl+S5WA==
X-Received: by 2002:aa7:8084:: with SMTP id v4mr3201873pff.39.1589963590255;
 Wed, 20 May 2020 01:33:10 -0700 (PDT)
Received: from santosiv.in.ibm.com.com ([223.181.246.139])
 by smtp.gmail.com with ESMTPSA id 2sm1553980pfz.39.2020.05.20.01.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 01:33:08 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: <stable@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v4 1/6] asm-generic/tlb: Track freeing of page-table
 directories in struct mmu_gather
Date: Wed, 20 May 2020 14:00:20 +0530
Message-Id: <20200520083025.229011-2-santosh@fossix.org>
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
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will.deacon@arm.com>,
 Greg KH <greg@kroah.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Zijlstra <peterz@infradead.org>

commit 22a61c3c4f1379ef8b0ce0d5cb78baf3178950e2 upstream

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
2.25.4

