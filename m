Return-Path: <linuxppc-dev+bounces-6845-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CDAA5908B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Mar 2025 10:59:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBC6v14D6z30WR;
	Mon, 10 Mar 2025 20:59:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741600791;
	cv=none; b=TlwdTd2sdEwnr4OoajYeBRVRHj5S1Cv7WOxq9aCf1kaKK26S/jr+wLsCfafPwzvvCQWlRorRBYcZDtCnVtT9TiXMqeopuRVSnV0RRc/a5cDECbIPun3BlOIUg+EvVL5Fvq4TJUaIimxtpQSLj0JYh1xsknAcP6A90fGlSPRQyimsw2oXc12+GJVy21ozbMbiCDu+hBxXsIVkbPCDlixgXZWJzlQ2x/LfQjh7V5Mabyel7BWQk88GmHmsBRKZkrVONyJzCiiFGFcU1XyLrf5EZ19Mjy9TqBGOzyJYMLJCe1EyWxkf29LDQGfgoFD/s4qPLupiYbO0lZQ6NZKCOz9HcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741600791; c=relaxed/relaxed;
	bh=ujsLaUKZdbjuY7nW5Sn2p47Mpx4YYahqMgPCIj2vHJI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o0svfce752oUtzBcCc5BoymAKt8dSu1caPvwdGbOkU247l5o3QHNyNqD5GQuoJ+NYdaFkTVqnpvyeHj6OOPM6iWAxBwMWRKRHjCxe8lP3NhecKpia5emusgY+IZt1whfGn2Wj4uaVSZuSSY+z4YT2fQomAZo5AYI9LZSfMiJRrpR4G4wCBNqXxFjbJTtUmckRlZcC7fKVsXdluiCi5u6MQ3cAuyHzvfwb1Wz7VyMbSe4c1at53CyecsDC9HM6ngVhkeYOZwDRIa4T7Ey2uLzGLOblfoXfYo6YMHP9HAbaidoa/l1PGwLNMj6xqjtgpReGBi8eaYoH+LOJGVa1bTDzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBC6t12MYz2ykX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Mar 2025 20:59:50 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC4B41BA8;
	Mon, 10 Mar 2025 02:59:30 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.42.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 671993F673;
	Mon, 10 Mar 2025 02:59:12 -0700 (PDT)
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
	linux-s390@vger.kernel.org
Subject: [RFC 1/2] mm/ptdump: Split note_page() into level specific callbacks
Date: Mon, 10 Mar 2025 15:29:01 +0530
Message-Id: <20250310095902.390664-2-anshuman.khandual@arm.com>
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

Last argument passed down in note_page() is u64 assuming pxd_val() returned
value (all page table levels) is 64 bit - which might not be the case going
ahead when D128 page tables is enabled on arm64 platform. Besides pxd_val()
is very platform specific and its type should not be assumed in generic MM.

Split note_page() into individual page table level specific callbacks which
accepts corresponding pxd_t argument instead and then subscribing platforms
just derive pxd_val() from the entries as required and proceed as earlier.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-mm@kvack.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/ptdump.h | 10 ++++++++
 arch/arm64/mm/ptdump.c          | 37 ++++++++++++++++++++++++++--
 arch/powerpc/mm/ptdump/ptdump.c | 37 ++++++++++++++++++++++++++--
 arch/riscv/mm/ptdump.c          | 37 ++++++++++++++++++++++++++--
 arch/s390/mm/dump_pagetables.c  | 37 ++++++++++++++++++++++++++--
 arch/x86/mm/dump_pagetables.c   | 31 +++++++++++++++++++++++-
 include/linux/ptdump.h          |  7 ++++--
 mm/ptdump.c                     | 43 +++++++++++++++++++++++++--------
 8 files changed, 218 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
index 6cf4aae05219..8baba0d1aa8f 100644
--- a/arch/arm64/include/asm/ptdump.h
+++ b/arch/arm64/include/asm/ptdump.h
@@ -60,6 +60,11 @@ struct ptdump_pg_state {
 void ptdump_walk(struct seq_file *s, struct ptdump_info *info);
 void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
 	       u64 val);
+void note_page_pte(struct ptdump_state *st, unsigned long addr, pte_t pte);
+void note_page_pmd(struct ptdump_state *st, unsigned long addr, pmd_t pmd);
+void note_page_pud(struct ptdump_state *st, unsigned long addr, pud_t pud);
+void note_page_p4d(struct ptdump_state *st, unsigned long addr, p4d_t p4d);
+void note_page_pgd(struct ptdump_state *st, unsigned long addr, pgd_t pgd);
 #ifdef CONFIG_PTDUMP_DEBUGFS
 #define EFI_RUNTIME_MAP_END	DEFAULT_MAP_WINDOW_64
 void __init ptdump_debugfs_register(struct ptdump_info *info, const char *name);
@@ -70,6 +75,11 @@ static inline void ptdump_debugfs_register(struct ptdump_info *info,
 #else
 static inline void note_page(struct ptdump_state *pt_st, unsigned long addr,
 			     int level, u64 val) { }
+static inline void note_page_pte(struct ptdump_state *st, unsigned long addr, pte_t pte) { }
+static inline void note_page_pmd(struct ptdump_state *st, unsigned long addr, pmd_t pmd) { }
+static inline void note_page_pud(struct ptdump_state *st, unsigned long addr, pud_t pud) { }
+static inline void note_page_p4d(struct ptdump_state *st, unsigned long addr, p4d_t p4d) { }
+static inline void note_page_pgd(struct ptdump_state *st, unsigned long addr, pgd_t pgd) { }
 #endif /* CONFIG_PTDUMP_CORE */
 
 #endif /* __ASM_PTDUMP_H */
diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index 688fbe0271ca..0c66c8474a48 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -251,6 +251,31 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
 
 }
 
+void note_page_pte(struct ptdump_state *pt_st, unsigned long addr, pte_t pte)
+{
+	note_page(pt_st, addr, 4, pte_val(pte));
+}
+
+void note_page_pmd(struct ptdump_state *pt_st, unsigned long addr, pmd_t pmd)
+{
+	note_page(pt_st, addr, 3, pmd_val(pmd));
+}
+
+void note_page_pud(struct ptdump_state *pt_st, unsigned long addr, pud_t pud)
+{
+	note_page(pt_st, addr, 2, pud_val(pud));
+}
+
+void note_page_p4d(struct ptdump_state *pt_st, unsigned long addr, p4d_t p4d)
+{
+	note_page(pt_st, addr, 1, p4d_val(p4d));
+}
+
+void note_page_pgd(struct ptdump_state *pt_st, unsigned long addr, pgd_t pgd)
+{
+	note_page(pt_st, addr, 0, pgd_val(pgd));
+}
+
 void ptdump_walk(struct seq_file *s, struct ptdump_info *info)
 {
 	unsigned long end = ~0UL;
@@ -266,7 +291,11 @@ void ptdump_walk(struct seq_file *s, struct ptdump_info *info)
 		.pg_level = &kernel_pg_levels[0],
 		.level = -1,
 		.ptdump = {
-			.note_page = note_page,
+			.note_page_pte = note_page_pte,
+			.note_page_pmd = note_page_pmd,
+			.note_page_pud = note_page_pud,
+			.note_page_p4d = note_page_p4d,
+			.note_page_pgd = note_page_pgd,
 			.range = (struct ptdump_range[]){
 				{info->base_addr, end},
 				{0, 0}
@@ -303,7 +332,11 @@ bool ptdump_check_wx(void)
 		.level = -1,
 		.check_wx = true,
 		.ptdump = {
-			.note_page = note_page,
+			.note_page_pte = note_page_pte,
+			.note_page_pmd = note_page_pmd,
+			.note_page_pud = note_page_pud,
+			.note_page_p4d = note_page_p4d,
+			.note_page_pgd = note_page_pgd,
 			.range = (struct ptdump_range[]) {
 				{_PAGE_OFFSET(vabits_actual), ~0UL},
 				{0, 0}
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 9dc239967b77..12c0fe2e9292 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -298,6 +298,31 @@ static void populate_markers(void)
 #endif
 }
 
+static void note_page_pte(struct ptdump_state *pt_st, unsigned long addr, pte_t pte)
+{
+	note_page(pt_st, addr, 4, pte_val(pte));
+}
+
+static void note_page_pmd(struct ptdump_state *pt_st, unsigned long addr, pmd_t pmd)
+{
+	note_page(pt_st, addr, 3, pmd_val(pmd));
+}
+
+static void note_page_pud(struct ptdump_state *pt_st, unsigned long addr, pud_t pud)
+{
+	note_page(pt_st, addr, 2, pud_val(pud));
+}
+
+static void note_page_p4d(struct ptdump_state *pt_st, unsigned long addr, p4d_t p4d)
+{
+	note_page(pt_st, addr, 1, p4d_val(p4d));
+}
+
+static void note_page_pgd(struct ptdump_state *pt_st, unsigned long addr, pgd_t pgd)
+{
+	note_page(pt_st, addr, 0, pgd_val(pgd));
+}
+
 static int ptdump_show(struct seq_file *m, void *v)
 {
 	struct pg_state st = {
@@ -305,7 +330,11 @@ static int ptdump_show(struct seq_file *m, void *v)
 		.marker = address_markers,
 		.level = -1,
 		.ptdump = {
-			.note_page = note_page,
+			.note_page_pte = note_page_pte,
+			.note_page_pmd = note_page_pmd,
+			.note_page_pud = note_page_pud,
+			.note_page_p4d = note_page_p4d,
+			.note_page_pgd = note_page_pgd,
 			.range = ptdump_range,
 		}
 	};
@@ -338,7 +367,11 @@ bool ptdump_check_wx(void)
 		.level = -1,
 		.check_wx = true,
 		.ptdump = {
-			.note_page = note_page,
+			.note_page_pte = note_page_pte,
+			.note_page_pmd = note_page_pmd,
+			.note_page_pud = note_page_pud,
+			.note_page_p4d = note_page_p4d,
+			.note_page_pgd = note_page_pgd,
 			.range = ptdump_range,
 		}
 	};
diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index 9d5f657a251b..6750a7e65c76 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -318,6 +318,31 @@ static void note_page(struct ptdump_state *pt_st, unsigned long addr,
 	}
 }
 
+static void note_page_pte(struct ptdump_state *pt_st, unsigned long addr, pte_t pte)
+{
+	note_page(pt_st, addr, 4, pte_val(pte));
+}
+
+static void note_page_pmd(struct ptdump_state *pt_st, unsigned long addr, pmd_t pmd)
+{
+	note_page(pt_st, addr, 3, pmd_val(pmd));
+}
+
+static void note_page_pud(struct ptdump_state *pt_st, unsigned long addr, pud_t pud)
+{
+	note_page(pt_st, addr, 2, pud_val(pud));
+}
+
+static void note_page_p4d(struct ptdump_state *pt_st, unsigned long addr, p4d_t p4d)
+{
+	note_page(pt_st, addr, 1, p4d_val(p4d));
+}
+
+static void note_page_pgd(struct ptdump_state *pt_st, unsigned long addr, pgd_t pgd)
+{
+	note_page(pt_st, addr, 0, pgd_val(pgd));
+}
+
 static void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
 {
 	struct pg_state st = {
@@ -325,7 +350,11 @@ static void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
 		.marker = pinfo->markers,
 		.level = -1,
 		.ptdump = {
-			.note_page = note_page,
+			.note_page_pte = note_page_pte,
+			.note_page_pmd = note_page_pmd,
+			.note_page_pud = note_page_pud,
+			.note_page_p4d = note_page_p4d,
+			.note_page_pgd = note_page_pgd,
 			.range = (struct ptdump_range[]) {
 				{pinfo->base_addr, pinfo->end},
 				{0, 0}
@@ -347,7 +376,11 @@ bool ptdump_check_wx(void)
 		.level = -1,
 		.check_wx = true,
 		.ptdump = {
-			.note_page = note_page,
+			.note_page_pte = note_page_pte,
+			.note_page_pmd = note_page_pmd,
+			.note_page_pud = note_page_pud,
+			.note_page_p4d = note_page_p4d,
+			.note_page_pgd = note_page_pgd,
 			.range = (struct ptdump_range[]) {
 				{KERN_VIRT_START, ULONG_MAX},
 				{0, 0}
diff --git a/arch/s390/mm/dump_pagetables.c b/arch/s390/mm/dump_pagetables.c
index fa54f3bc0c8d..f81a2cc47772 100644
--- a/arch/s390/mm/dump_pagetables.c
+++ b/arch/s390/mm/dump_pagetables.c
@@ -145,11 +145,40 @@ static void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
 	}
 }
 
+static void note_page_pte(struct ptdump_state *pt_st, unsigned long addr, pte_t pte)
+{
+	note_page(pt_st, addr, 4, pte_val(pte));
+}
+
+static void note_page_pmd(struct ptdump_state *pt_st, unsigned long addr, pmd_t pmd)
+{
+	note_page(pt_st, addr, 3, pmd_val(pmd));
+}
+
+static void note_page_pud(struct ptdump_state *pt_st, unsigned long addr, pud_t pud)
+{
+	note_page(pt_st, addr, 2, pud_val(pud));
+}
+
+static void note_page_p4d(struct ptdump_state *pt_st, unsigned long addr, p4d_t p4d)
+{
+	note_page(pt_st, addr, 1, p4d_val(p4d));
+}
+
+static void note_page_pgd(struct ptdump_state *pt_st, unsigned long addr, pgd_t pgd)
+{
+	note_page(pt_st, addr, 0, pgd_val(pgd));
+}
+
 bool ptdump_check_wx(void)
 {
 	struct pg_state st = {
 		.ptdump = {
-			.note_page = note_page,
+			.note_page_pte = note_page_pte,
+			.note_page_pmd = note_page_pmd,
+			.note_page_pud = note_page_pud,
+			.note_page_p4d = note_page_p4d,
+			.note_page_pgd = note_page_pgd,
 			.range = (struct ptdump_range[]) {
 				{.start = 0, .end = max_addr},
 				{.start = 0, .end = 0},
@@ -188,7 +217,11 @@ static int ptdump_show(struct seq_file *m, void *v)
 {
 	struct pg_state st = {
 		.ptdump = {
-			.note_page = note_page,
+			.note_page_pte = note_page_pte,
+			.note_page_pmd = note_page_pmd,
+			.note_page_pud = note_page_pud,
+			.note_page_p4d = note_page_p4d,
+			.note_page_pgd = note_page_pgd,
 			.range = (struct ptdump_range[]) {
 				{.start = 0, .end = max_addr},
 				{.start = 0, .end = 0},
diff --git a/arch/x86/mm/dump_pagetables.c b/arch/x86/mm/dump_pagetables.c
index 89079ea73e65..8e06667045e8 100644
--- a/arch/x86/mm/dump_pagetables.c
+++ b/arch/x86/mm/dump_pagetables.c
@@ -362,6 +362,31 @@ static void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
 	}
 }
 
+static void note_page_pte(struct ptdump_state *pt_st, unsigned long addr, pte_t pte)
+{
+	note_page(pt_st, addr, 4, pte_val(pte));
+}
+
+static void note_page_pmd(struct ptdump_state *pt_st, unsigned long addr, pmd_t pmd)
+{
+	note_page(pt_st, addr, 3, pmd_val(pmd));
+}
+
+static void note_page_pud(struct ptdump_state *pt_st, unsigned long addr, pud_t pud)
+{
+	note_page(pt_st, addr, 2, pud_val(pud));
+}
+
+static void note_page_p4d(struct ptdump_state *pt_st, unsigned long addr, p4d_t p4d)
+{
+	note_page(pt_st, addr, 1, p4d_val(p4d));
+}
+
+static void note_page_pgd(struct ptdump_state *pt_st, unsigned long addr, pgd_t pgd)
+{
+	note_page(pt_st, addr, 0, pgd_val(pgd));
+}
+
 bool ptdump_walk_pgd_level_core(struct seq_file *m,
 				struct mm_struct *mm, pgd_t *pgd,
 				bool checkwx, bool dmesg)
@@ -378,7 +403,11 @@ bool ptdump_walk_pgd_level_core(struct seq_file *m,
 
 	struct pg_state st = {
 		.ptdump = {
-			.note_page	= note_page,
+			.note_page_pte = note_page_pte,
+			.note_page_pmd = note_page_pmd,
+			.note_page_pud = note_page_pud,
+			.note_page_p4d = note_page_p4d,
+			.note_page_pgd = note_page_pgd,
 			.effective_prot = effective_prot,
 			.range		= ptdump_ranges
 		},
diff --git a/include/linux/ptdump.h b/include/linux/ptdump.h
index 8dbd51ea8626..3bb5ed62fc6d 100644
--- a/include/linux/ptdump.h
+++ b/include/linux/ptdump.h
@@ -12,8 +12,11 @@ struct ptdump_range {
 
 struct ptdump_state {
 	/* level is 0:PGD to 4:PTE, or -1 if unknown */
-	void (*note_page)(struct ptdump_state *st, unsigned long addr,
-			  int level, u64 val);
+	void (*note_page_pte)(struct ptdump_state *st, unsigned long addr, pte_t pte);
+	void (*note_page_pmd)(struct ptdump_state *st, unsigned long addr, pmd_t pmd);
+	void (*note_page_pud)(struct ptdump_state *st, unsigned long addr, pud_t pud);
+	void (*note_page_p4d)(struct ptdump_state *st, unsigned long addr, p4d_t p4d);
+	void (*note_page_pgd)(struct ptdump_state *st, unsigned long addr, pgd_t pgd);
 	void (*effective_prot)(struct ptdump_state *st, int level, u64 val);
 	const struct ptdump_range *range;
 };
diff --git a/mm/ptdump.c b/mm/ptdump.c
index 106e1d66e9f9..cac4dec90c24 100644
--- a/mm/ptdump.c
+++ b/mm/ptdump.c
@@ -18,7 +18,7 @@ static inline int note_kasan_page_table(struct mm_walk *walk,
 {
 	struct ptdump_state *st = walk->private;
 
-	st->note_page(st, addr, 4, pte_val(kasan_early_shadow_pte[0]));
+	st->note_page_pte(st, addr, kasan_early_shadow_pte[0]);
 
 	walk->action = ACTION_CONTINUE;
 
@@ -42,7 +42,7 @@ static int ptdump_pgd_entry(pgd_t *pgd, unsigned long addr,
 		st->effective_prot(st, 0, pgd_val(val));
 
 	if (pgd_leaf(val)) {
-		st->note_page(st, addr, 0, pgd_val(val));
+		st->note_page_pgd(st, addr, val);
 		walk->action = ACTION_CONTINUE;
 	}
 
@@ -65,7 +65,7 @@ static int ptdump_p4d_entry(p4d_t *p4d, unsigned long addr,
 		st->effective_prot(st, 1, p4d_val(val));
 
 	if (p4d_leaf(val)) {
-		st->note_page(st, addr, 1, p4d_val(val));
+		st->note_page_p4d(st, addr, val);
 		walk->action = ACTION_CONTINUE;
 	}
 
@@ -88,7 +88,7 @@ static int ptdump_pud_entry(pud_t *pud, unsigned long addr,
 		st->effective_prot(st, 2, pud_val(val));
 
 	if (pud_leaf(val)) {
-		st->note_page(st, addr, 2, pud_val(val));
+		st->note_page_pud(st, addr, val);
 		walk->action = ACTION_CONTINUE;
 	}
 
@@ -109,7 +109,7 @@ static int ptdump_pmd_entry(pmd_t *pmd, unsigned long addr,
 	if (st->effective_prot)
 		st->effective_prot(st, 3, pmd_val(val));
 	if (pmd_leaf(val)) {
-		st->note_page(st, addr, 3, pmd_val(val));
+		st->note_page_pmd(st, addr, val);
 		walk->action = ACTION_CONTINUE;
 	}
 
@@ -125,7 +125,7 @@ static int ptdump_pte_entry(pte_t *pte, unsigned long addr,
 	if (st->effective_prot)
 		st->effective_prot(st, 4, pte_val(val));
 
-	st->note_page(st, addr, 4, pte_val(val));
+	st->note_page_pte(st, addr, val);
 
 	return 0;
 }
@@ -134,9 +134,31 @@ static int ptdump_hole(unsigned long addr, unsigned long next,
 		       int depth, struct mm_walk *walk)
 {
 	struct ptdump_state *st = walk->private;
-
-	st->note_page(st, addr, depth, 0);
-
+	pte_t pte_zero = {0};
+	pmd_t pmd_zero = {0};
+	pud_t pud_zero = {0};
+	p4d_t p4d_zero = {0};
+	pgd_t pgd_zero = {0};
+
+	switch (depth) {
+	case 4:
+		st->note_page_pte(st, addr, pte_zero);
+		break;
+	case 3:
+		st->note_page_pmd(st, addr, pmd_zero);
+		break;
+	case 2:
+		st->note_page_pud(st, addr, pud_zero);
+		break;
+	case 1:
+		st->note_page_p4d(st, addr, p4d_zero);
+		break;
+	case 0:
+		st->note_page_pgd(st, addr, pgd_zero);
+		break;
+	default:
+		break;
+	}
 	return 0;
 }
 
@@ -152,6 +174,7 @@ static const struct mm_walk_ops ptdump_ops = {
 void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
 {
 	const struct ptdump_range *range = st->range;
+	pte_t pte_zero = {0};
 
 	mmap_write_lock(mm);
 	while (range->start != range->end) {
@@ -162,7 +185,7 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
 	mmap_write_unlock(mm);
 
 	/* Flush out the last page */
-	st->note_page(st, 0, -1, 0);
+	st->note_page_pte(st, 0, pte_zero);
 }
 
 static int check_wx_show(struct seq_file *m, void *v)
-- 
2.25.1


