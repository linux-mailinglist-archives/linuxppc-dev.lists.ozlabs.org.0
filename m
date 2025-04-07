Return-Path: <linuxppc-dev+bounces-7475-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1944AA7D392
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 07:32:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWHs81lPJz2yr3;
	Mon,  7 Apr 2025 15:32:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744003932;
	cv=none; b=gcmQx2r8DX7lnQeP1RDkSL+r7W5IJyz0L4AaYhhwBXvWEih6SC9uKuzbmzEF+KMjbxb+U6gScZ1HQRtTzX6kQ+T0zWxVoQeSpAifufhIdPrcrx6Bn4pJOcmdxD3tMI0borqn+VpwaZzHy/CLKAbYmgXk0orbQQ8I3faJzlm2Jk2dw+JgJapKP0UlW6awe37e4XsJICzA0RnpxkndaAOxghegIoMRLoOJgMCukuSsJBD1Krd1rS3gjgfmB71GEPK7J6Kg7cqqUo2xzGQmgbCzPdtW6y88gT/UlGNinXXHx+tmewIQW8OyzI4L8szE+K5RzhK2pkpDf57BN6SyziW5AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744003932; c=relaxed/relaxed;
	bh=pmj4Hc3yqg0X1p4niapwdjvDbElR2NYLcMUUNz8Td74=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I97BYRUhuKDfupLU1lqdcNqJI70GxyAtRKGXYDLuBoVmt66Zhcg0RJtLimW5AZIN0Q+tyb6DvnjyEpDC4llu6eMnh2LSNmUAUhk1AX4vA3mjXeoZ5HXkt0xmfrH48pIxshydWJ03YdlAMO4jcMMdw152GJMGN/EG3yI0rO981yejBKHRfpMm2DbPVG8jKqTqJMAedrKxWU/tJUtzOXxHm7hhuNtI/G4MU2a9VjaHLufHRu2iUvLax9o+PVcDcMYmhOOBcMG9oNJKeBoDQJ98SMc7sPc7LfkulDxhy3iMWZyJJBBhye29w7fx6Xf4c2vuYXWr8Q//WxnP2XA/s2XBmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWHs73CTjz2xGw
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Apr 2025 15:32:11 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C73871BB0;
	Sun,  6 Apr 2025 22:31:41 -0700 (PDT)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.42.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA4633F6A8;
	Sun,  6 Apr 2025 22:31:33 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: mark.rutland@arm.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH V2 2/3] mm/ptdump: Split effective_prot() into level specific callbacks
Date: Mon,  7 Apr 2025 11:01:12 +0530
Message-Id: <20250407053113.746295-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407053113.746295-1-anshuman.khandual@arm.com>
References: <20250407053113.746295-1-anshuman.khandual@arm.com>
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
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Last argument in effective_prot() is u64 assuming pxd_val() returned value
(all page table levels) is 64 bit. pxd_val() is very platform specific and
its type should not be assumed in generic MM.

Split effective_prot() into individual page table level specific callbacks
which accepts corresponding pxd_t argument instead and then the subscribing
platform (only x86) just derive pxd_val() from the entries as required and
proceed as earlier.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-mm@kvack.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/x86/mm/dump_pagetables.c | 32 +++++++++++++++++++++++++++++++-
 include/linux/ptdump.h        |  6 +++++-
 mm/ptdump.c                   | 20 ++++++++++----------
 3 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/arch/x86/mm/dump_pagetables.c b/arch/x86/mm/dump_pagetables.c
index 2e1c2d006ace..a4700ef6eb64 100644
--- a/arch/x86/mm/dump_pagetables.c
+++ b/arch/x86/mm/dump_pagetables.c
@@ -266,6 +266,32 @@ static void effective_prot(struct ptdump_state *pt_st, int level, u64 val)
 	st->prot_levels[level] = effective;
 }
 
+static void effective_prot_pte(struct ptdump_state *st, pte_t pte)
+{
+	effective_prot(st, 4, pte_val(pte));
+}
+
+static void effective_prot_pmd(struct ptdump_state *st, pmd_t pmd)
+{
+	effective_prot(st, 3, pmd_val(pmd));
+}
+
+static void effective_prot_pud(struct ptdump_state *st, pud_t pud)
+{
+	effective_prot(st, 2, pud_val(pud));
+}
+
+static void effective_prot_p4d(struct ptdump_state *st, p4d_t p4d)
+{
+	effective_prot(st, 1, p4d_val(p4d));
+}
+
+static void effective_prot_pgd(struct ptdump_state *st, pgd_t pgd)
+{
+	effective_prot(st, 0, pgd_val(pgd));
+}
+
+
 /*
  * This function gets called on a break in a continuous series
  * of PTE entries; the next one is different so we need to
@@ -416,7 +442,11 @@ bool ptdump_walk_pgd_level_core(struct seq_file *m,
 			.note_page_p4d = note_page_p4d,
 			.note_page_pgd = note_page_pgd,
 			.note_page_flush = note_page_flush,
-			.effective_prot = effective_prot,
+			.effective_prot_pte = effective_prot_pte,
+			.effective_prot_pmd = effective_prot_pmd,
+			.effective_prot_pud = effective_prot_pud,
+			.effective_prot_p4d = effective_prot_p4d,
+			.effective_prot_pgd = effective_prot_pgd,
 			.range		= ptdump_ranges
 		},
 		.level = -1,
diff --git a/include/linux/ptdump.h b/include/linux/ptdump.h
index 1c1eb1fae199..240bd3bff18d 100644
--- a/include/linux/ptdump.h
+++ b/include/linux/ptdump.h
@@ -17,7 +17,11 @@ struct ptdump_state {
 	void (*note_page_p4d)(struct ptdump_state *st, unsigned long addr, p4d_t p4d);
 	void (*note_page_pgd)(struct ptdump_state *st, unsigned long addr, pgd_t pgd);
 	void (*note_page_flush)(struct ptdump_state *st);
-	void (*effective_prot)(struct ptdump_state *st, int level, u64 val);
+	void (*effective_prot_pte)(struct ptdump_state *st, pte_t pte);
+	void (*effective_prot_pmd)(struct ptdump_state *st, pmd_t pmd);
+	void (*effective_prot_pud)(struct ptdump_state *st, pud_t pud);
+	void (*effective_prot_p4d)(struct ptdump_state *st, p4d_t p4d);
+	void (*effective_prot_pgd)(struct ptdump_state *st, pgd_t pgd);
 	const struct ptdump_range *range;
 };
 
diff --git a/mm/ptdump.c b/mm/ptdump.c
index 706cfc19439b..9374f29cdc6f 100644
--- a/mm/ptdump.c
+++ b/mm/ptdump.c
@@ -38,8 +38,8 @@ static int ptdump_pgd_entry(pgd_t *pgd, unsigned long addr,
 		return note_kasan_page_table(walk, addr);
 #endif
 
-	if (st->effective_prot)
-		st->effective_prot(st, 0, pgd_val(val));
+	if (st->effective_prot_pgd)
+		st->effective_prot_pgd(st, val);
 
 	if (pgd_leaf(val)) {
 		st->note_page_pgd(st, addr, val);
@@ -61,8 +61,8 @@ static int ptdump_p4d_entry(p4d_t *p4d, unsigned long addr,
 		return note_kasan_page_table(walk, addr);
 #endif
 
-	if (st->effective_prot)
-		st->effective_prot(st, 1, p4d_val(val));
+	if (st->effective_prot_p4d)
+		st->effective_prot_p4d(st, val);
 
 	if (p4d_leaf(val)) {
 		st->note_page_p4d(st, addr, val);
@@ -84,8 +84,8 @@ static int ptdump_pud_entry(pud_t *pud, unsigned long addr,
 		return note_kasan_page_table(walk, addr);
 #endif
 
-	if (st->effective_prot)
-		st->effective_prot(st, 2, pud_val(val));
+	if (st->effective_prot_pud)
+		st->effective_prot_pud(st, val);
 
 	if (pud_leaf(val)) {
 		st->note_page_pud(st, addr, val);
@@ -106,8 +106,8 @@ static int ptdump_pmd_entry(pmd_t *pmd, unsigned long addr,
 		return note_kasan_page_table(walk, addr);
 #endif
 
-	if (st->effective_prot)
-		st->effective_prot(st, 3, pmd_val(val));
+	if (st->effective_prot_pmd)
+		st->effective_prot_pmd(st, val);
 	if (pmd_leaf(val)) {
 		st->note_page_pmd(st, addr, val);
 		walk->action = ACTION_CONTINUE;
@@ -122,8 +122,8 @@ static int ptdump_pte_entry(pte_t *pte, unsigned long addr,
 	struct ptdump_state *st = walk->private;
 	pte_t val = ptep_get_lockless(pte);
 
-	if (st->effective_prot)
-		st->effective_prot(st, 4, pte_val(val));
+	if (st->effective_prot_pte)
+		st->effective_prot_pte(st, val);
 
 	st->note_page_pte(st, addr, val);
 
-- 
2.25.1


