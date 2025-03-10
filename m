Return-Path: <linuxppc-dev+bounces-6846-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EA5A5908C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Mar 2025 11:00:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBC7203ZLz3bgV;
	Mon, 10 Mar 2025 20:59:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741600797;
	cv=none; b=ErU9xikEz9At1rYSxFP+nJxnBfF4P3UeJiDhqY67qo21IKYiy4E/bOHpeoCzroYAiJIYITg0/sFdqD55A9y2vbNWi/j2aeVJ0g8XhI1TCpx32eXAP301MSvNLhnLQnWrsSoVxLGU5v2Llbwuj+u+nUdODpnRC7iRDTAkD699gYfYPQwcx0A6tTpm6wM7zkwhyH8qv73OqTn6lvshUoR0ZAXzinlzP/8uezzGhdGRu9fz/hEgP4Bcba52ZrKiNrZYrMHIuaCaFNM/9Lnuy1l5se2NZe3GXyUGZ7Bgd3uRFEe781ZPgN/1ciO1epJ83kDw1WJjD2abO/Pg2X5xcLZ/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741600797; c=relaxed/relaxed;
	bh=9TOmyGb4N5DsWcqOF4+bRHUwmy4W9KYIvcth30kE9Pg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GNj0kx9LRc7EBvakari8xyyVN6JN3zQ7fSbi6JiOKREzLWrOOpkhI+BMsS4reyR9fsbS7FiL//G7NBBTKXEdOnleA7RxhuEC8/h4Gf9cTp7YzXSGQO+yaGWH1Dn/X0FW3BgwF1wG3Qh3QFOTHnSnG8ys+tLuSzSTTgymM9rMo+dHaylODA2Ixhdve3Gqm/H3O9HWW6HdE40EK2Ki/FX2jtQQ6nnTYg6sX2OeFbHWgH1aR6aOTgeDPmVVbFuFDjUovLy4IH/hzgG1DMcM+mtLfpYkXeRG9x8Dpfu5L8t4r9GkkA+xRnwHadBdGqP7lCQkQfGHcS9VFVg+vLJCjIob7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBC711HqNz2ykX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Mar 2025 20:59:57 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF12826BA;
	Mon, 10 Mar 2025 02:59:37 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.42.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CB0C43F673;
	Mon, 10 Mar 2025 02:59:19 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: [RFC 2/2] arm64/ptdump: Replace u64 with pteval_t
Date: Mon, 10 Mar 2025 15:29:02 +0530
Message-Id: <20250310095902.390664-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310095902.390664-1-anshuman.khandual@arm.com>
References: <20250310095902.390664-1-anshuman.khandual@arm.com>
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
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Page table entry's value, mask and protection are represented with pteval_t
data type format not u64 that has been assumed while dumping the page table
entries. Replace all such u64 instances with pteval_t instead as required.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/ptdump.h | 12 ++++++------
 arch/arm64/mm/ptdump.c          |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
index 8baba0d1aa8f..8ade657547f9 100644
--- a/arch/arm64/include/asm/ptdump.h
+++ b/arch/arm64/include/asm/ptdump.h
@@ -24,8 +24,8 @@ struct ptdump_info {
 };
 
 struct ptdump_prot_bits {
-	u64		mask;
-	u64		val;
+	pteval_t	mask;
+	pteval_t	val;
 	const char	*set;
 	const char	*clear;
 };
@@ -34,7 +34,7 @@ struct ptdump_pg_level {
 	const struct ptdump_prot_bits *bits;
 	char name[4];
 	int num;
-	u64 mask;
+	pteval_t mask;
 };
 
 /*
@@ -51,7 +51,7 @@ struct ptdump_pg_state {
 	const struct mm_struct *mm;
 	unsigned long start_address;
 	int level;
-	u64 current_prot;
+	pteval_t current_prot;
 	bool check_wx;
 	unsigned long wx_pages;
 	unsigned long uxn_pages;
@@ -59,7 +59,7 @@ struct ptdump_pg_state {
 
 void ptdump_walk(struct seq_file *s, struct ptdump_info *info);
 void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
-	       u64 val);
+	       pteval_t val);
 void note_page_pte(struct ptdump_state *st, unsigned long addr, pte_t pte);
 void note_page_pmd(struct ptdump_state *st, unsigned long addr, pmd_t pmd);
 void note_page_pud(struct ptdump_state *st, unsigned long addr, pud_t pud);
@@ -74,7 +74,7 @@ static inline void ptdump_debugfs_register(struct ptdump_info *info,
 #endif /* CONFIG_PTDUMP_DEBUGFS */
 #else
 static inline void note_page(struct ptdump_state *pt_st, unsigned long addr,
-			     int level, u64 val) { }
+			     int level, pteval_t val) { }
 static inline void note_page_pte(struct ptdump_state *st, unsigned long addr, pte_t pte) { }
 static inline void note_page_pmd(struct ptdump_state *st, unsigned long addr, pmd_t pmd) { }
 static inline void note_page_pud(struct ptdump_state *st, unsigned long addr, pud_t pud) { }
diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index 0c66c8474a48..7950c0e9e89c 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -189,12 +189,12 @@ static void note_prot_wx(struct ptdump_pg_state *st, unsigned long addr)
 }
 
 void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
-	       u64 val)
+	       pteval_t val)
 {
 	struct ptdump_pg_state *st = container_of(pt_st, struct ptdump_pg_state, ptdump);
 	struct ptdump_pg_level *pg_level = st->pg_level;
 	static const char units[] = "KMGTPE";
-	u64 prot = 0;
+	pteval_t prot = 0;
 
 	/* check if the current level has been folded dynamically */
 	if (st->mm && ((level == 1 && mm_p4d_folded(st->mm)) ||
-- 
2.25.1


