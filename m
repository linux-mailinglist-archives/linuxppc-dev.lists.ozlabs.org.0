Return-Path: <linuxppc-dev+bounces-7476-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52414A7D395
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 07:32:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWHsH422Kz2yrJ;
	Mon,  7 Apr 2025 15:32:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744003939;
	cv=none; b=YIA9WVJCTs09ztyLtKlYK1SmA/qRcucE6U+80K4vEXwlx/+NnXlh09bARq8+7Jkgjm019n+jJmeoyD0NbA/QXkQzQFHkYXAXeanZEbTCBCwUU/A92i4Egm+kYjzWrXcWz/xZDBbd2W4lRvvFAZHnPwxeBgPE1ycp739qvmYVE2TgTd5E4XikQNx1YSV21ZN5e8L31x5oERgtFAAmh7Oo5nCsXfv6t5bYRCQEBMccl8pws5dRPTu0YIY8a205ZhiBAWUl7mTCDsvySNbSqJrIoTmQcssXKtBkzsiFzTCK/wfNpBS0UAyLsh2ywdCJYOvnuLE8hldj+ekiuis/nOVDjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744003939; c=relaxed/relaxed;
	bh=HRwmECLRlTZmZ0+NCYgvVUErOZFaimdP930wmDJU8Ig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l/GexgW7qtg9Br+E/SMIxJscNOoqfNtbSaEnxdWTUDPiPCdjPupe6qLbQI4sBJCRii9NFvDh5GX1oBrOmyfT7X2r3fs6KFCaIMks6XQu1dfQ+/Mtl9kOmnOw96RkH9JieaRuEUwkw+qFLxkfPsZdH2xUQVZm8r8wqK3h0jTjjpWFb98iHRNlN1sgX1hUzYKkxApdRb4fjKx+ibUyVNepJSTp5guBkcpjS37+o4lMd1D2JMf8BSEDGhnLen2esA5Z0BkPodBcmheWU4tJYB+nZVowkbORzxtgX4Km1mMG4IHQ1rqilBphf+jNRjXoIxFQDnw//3oyc3xLEExjE0fjDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWHsG5YKTz2yqs
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Apr 2025 15:32:18 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 336541CC4;
	Sun,  6 Apr 2025 22:31:49 -0700 (PDT)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.42.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0B0463F6A8;
	Sun,  6 Apr 2025 22:31:40 -0700 (PDT)
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
	Ard Biesheuvel <ardb@kernel.org>,
	linux-efi@vger.kernel.org
Subject: [PATCH V2 3/3] arm64/mm: Define ptdesc_t
Date: Mon,  7 Apr 2025 11:01:13 +0530
Message-Id: <20250407053113.746295-4-anshuman.khandual@arm.com>
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

Define ptdesc_t type which describes the basic page table descriptor layout
on arm64 platform. Subsequently all level specific pxxval_t descriptors are
derived from ptdesc_t thus establishing a common original format, which can
also be appropriate for page table entries, masks and protection values etc
which are used at all page table levels.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-efi@vger.kernel.org
Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable-types.h | 20 ++++++++++++++------
 arch/arm64/include/asm/ptdump.h        |  8 ++++----
 arch/arm64/kernel/efi.c                |  4 ++--
 arch/arm64/kernel/pi/map_kernel.c      |  2 +-
 arch/arm64/kernel/pi/map_range.c       |  4 ++--
 arch/arm64/kernel/pi/pi.h              |  2 +-
 arch/arm64/mm/mmap.c                   |  2 +-
 arch/arm64/mm/ptdump.c                 |  2 +-
 8 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable-types.h b/arch/arm64/include/asm/pgtable-types.h
index 6d6d4065b0cb..265e8301d7ba 100644
--- a/arch/arm64/include/asm/pgtable-types.h
+++ b/arch/arm64/include/asm/pgtable-types.h
@@ -11,11 +11,19 @@
 
 #include <asm/types.h>
 
-typedef u64 pteval_t;
-typedef u64 pmdval_t;
-typedef u64 pudval_t;
-typedef u64 p4dval_t;
-typedef u64 pgdval_t;
+/*
+ * Page Table Descriptor
+ *
+ * Generic page table descriptor format from which
+ * all level specific descriptors can be derived.
+ */
+typedef u64 ptdesc_t;
+
+typedef ptdesc_t pteval_t;
+typedef ptdesc_t pmdval_t;
+typedef ptdesc_t pudval_t;
+typedef ptdesc_t p4dval_t;
+typedef ptdesc_t pgdval_t;
 
 /*
  * These are used to make use of C type-checking..
@@ -46,7 +54,7 @@ typedef struct { pgdval_t pgd; } pgd_t;
 #define pgd_val(x)	((x).pgd)
 #define __pgd(x)	((pgd_t) { (x) } )
 
-typedef struct { pteval_t pgprot; } pgprot_t;
+typedef struct { ptdesc_t pgprot; } pgprot_t;
 #define pgprot_val(x)	((x).pgprot)
 #define __pgprot(x)	((pgprot_t) { (x) } )
 
diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
index 01033c1d38dc..fded5358641f 100644
--- a/arch/arm64/include/asm/ptdump.h
+++ b/arch/arm64/include/asm/ptdump.h
@@ -24,8 +24,8 @@ struct ptdump_info {
 };
 
 struct ptdump_prot_bits {
-	u64		mask;
-	u64		val;
+	ptdesc_t	mask;
+	ptdesc_t	val;
 	const char	*set;
 	const char	*clear;
 };
@@ -34,7 +34,7 @@ struct ptdump_pg_level {
 	const struct ptdump_prot_bits *bits;
 	char name[4];
 	int num;
-	u64 mask;
+	ptdesc_t mask;
 };
 
 /*
@@ -51,7 +51,7 @@ struct ptdump_pg_state {
 	const struct mm_struct *mm;
 	unsigned long start_address;
 	int level;
-	u64 current_prot;
+	ptdesc_t current_prot;
 	bool check_wx;
 	unsigned long wx_pages;
 	unsigned long uxn_pages;
diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 1d25d8899dbf..42e281c07c2f 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -29,7 +29,7 @@ static bool region_is_misaligned(const efi_memory_desc_t *md)
  * executable, everything else can be mapped with the XN bits
  * set. Also take the new (optional) RO/XP bits into account.
  */
-static __init pteval_t create_mapping_protection(efi_memory_desc_t *md)
+static __init ptdesc_t create_mapping_protection(efi_memory_desc_t *md)
 {
 	u64 attr = md->attribute;
 	u32 type = md->type;
@@ -83,7 +83,7 @@ static __init pteval_t create_mapping_protection(efi_memory_desc_t *md)
 
 int __init efi_create_mapping(struct mm_struct *mm, efi_memory_desc_t *md)
 {
-	pteval_t prot_val = create_mapping_protection(md);
+	ptdesc_t prot_val = create_mapping_protection(md);
 	bool page_mappings_only = (md->type == EFI_RUNTIME_SERVICES_CODE ||
 				   md->type == EFI_RUNTIME_SERVICES_DATA);
 
diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_kernel.c
index e57b043f324b..a00f57c73d81 100644
--- a/arch/arm64/kernel/pi/map_kernel.c
+++ b/arch/arm64/kernel/pi/map_kernel.c
@@ -159,7 +159,7 @@ static void noinline __section(".idmap.text") set_ttbr0_for_lpa2(u64 ttbr)
 static void __init remap_idmap_for_lpa2(void)
 {
 	/* clear the bits that change meaning once LPA2 is turned on */
-	pteval_t mask = PTE_SHARED;
+	ptdesc_t mask = PTE_SHARED;
 
 	/*
 	 * We have to clear bits [9:8] in all block or page descriptors in the
diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
index 81345f68f9fc..7982788e7b9a 100644
--- a/arch/arm64/kernel/pi/map_range.c
+++ b/arch/arm64/kernel/pi/map_range.c
@@ -30,7 +30,7 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
 		      int level, pte_t *tbl, bool may_use_cont, u64 va_offset)
 {
 	u64 cmask = (level == 3) ? CONT_PTE_SIZE - 1 : U64_MAX;
-	pteval_t protval = pgprot_val(prot) & ~PTE_TYPE_MASK;
+	ptdesc_t protval = pgprot_val(prot) & ~PTE_TYPE_MASK;
 	int lshift = (3 - level) * PTDESC_TABLE_SHIFT;
 	u64 lmask = (PAGE_SIZE << lshift) - 1;
 
@@ -87,7 +87,7 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
 	}
 }
 
-asmlinkage u64 __init create_init_idmap(pgd_t *pg_dir, pteval_t clrmask)
+asmlinkage u64 __init create_init_idmap(pgd_t *pg_dir, ptdesc_t clrmask)
 {
 	u64 ptep = (u64)pg_dir + PAGE_SIZE;
 	pgprot_t text_prot = PAGE_KERNEL_ROX;
diff --git a/arch/arm64/kernel/pi/pi.h b/arch/arm64/kernel/pi/pi.h
index c91e5e965cd3..91dcb5b6bbd1 100644
--- a/arch/arm64/kernel/pi/pi.h
+++ b/arch/arm64/kernel/pi/pi.h
@@ -33,4 +33,4 @@ void map_range(u64 *pgd, u64 start, u64 end, u64 pa, pgprot_t prot,
 
 asmlinkage void early_map_kernel(u64 boot_status, void *fdt);
 
-asmlinkage u64 create_init_idmap(pgd_t *pgd, pteval_t clrmask);
+asmlinkage u64 create_init_idmap(pgd_t *pgd, ptdesc_t clrmask);
diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
index 07aeab8a7606..c86c348857c4 100644
--- a/arch/arm64/mm/mmap.c
+++ b/arch/arm64/mm/mmap.c
@@ -83,7 +83,7 @@ arch_initcall(adjust_protection_map);
 
 pgprot_t vm_get_page_prot(unsigned long vm_flags)
 {
-	pteval_t prot;
+	ptdesc_t prot;
 
 	/* Short circuit GCS to avoid bloating the table. */
 	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index ac0c20ba0cd9..421a5de806c6 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -194,7 +194,7 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
 	struct ptdump_pg_state *st = container_of(pt_st, struct ptdump_pg_state, ptdump);
 	struct ptdump_pg_level *pg_level = st->pg_level;
 	static const char units[] = "KMGTPE";
-	u64 prot = 0;
+	ptdesc_t prot = 0;
 
 	/* check if the current level has been folded dynamically */
 	if (st->mm && ((level == 1 && mm_p4d_folded(st->mm)) ||
-- 
2.25.1


