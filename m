Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AB61752E4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 05:52:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48W7751pvfzDqbG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 15:52:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=W8WrEsSj; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48W75M1kJXzDqg9
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 15:51:18 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id g6so3698894plp.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Mar 2020 20:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xDn7n6KxrE6J11K4Ximh1OvTjpedVh4/c8Zz9sCN0Ok=;
 b=W8WrEsSjeyv0i7FYiHJR3Lhr43+iTg1wM3zXy7BxMfDZAVHAI5b++IOmK+jyjq3Wbw
 AZb+9O/rUmtIf6p1mLQ1GZhca5Gg1PotLtTbED+dwjNroLWNH0NqaWdFoQuESBwDm55y
 gVb6DBZUVPELLuDdaAwuT6itm1ChLMkGCVFEMpXmTdGAIPo11miqAGPLvnqM7rICygod
 mL5sqXzwfVCeI2fcCjU5jnCqY+hMCw1Wc2Xg9Q8KVKVzYBn/+HJxPg7eW5NZVI2782Ut
 o72WWC7xC1wC9x6P0aYAHp6SjzvAf90BB9TIndNIyJkhc4iX+3jceivINLORk3uNG9ZI
 0SSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xDn7n6KxrE6J11K4Ximh1OvTjpedVh4/c8Zz9sCN0Ok=;
 b=lE9iJ8O35PvyMxidLL0rJA5fp0FktdNc2jwekrWfCcvx/7QJSyzMJf107czpVRaulw
 YhT01wjrzI7gB7Y0RUJ3sgeGcuh3jpm1mTVyNIIfzEYCuAM4nCkE/zIB7r3SkdkOSmKA
 c3E10Xvuo34XWnrzqSKJtUt3KshOWShrBT3IJRrD1cl1+JrxChD2XZjVpRsGLpRPEjOT
 OjfSDTfKev7NBNUdEMI6b/KRNQ/Ur1WKOFUrLuctfwuRxjvMgMAzRh/XwJW6D4Ktz0/q
 AwM945069+1zjGFReMvpqNjdkSCdCD4uTaxOpHUBAyyXC4Nz4Ln+sPM5Xq8C58s4OyIu
 vBkg==
X-Gm-Message-State: APjAAAVvTGuvtxIouqxcfmuGANN+pvjL7gIPIFjm6teoSF8S8IsJBm8d
 GFz9zjI7Nf7jzg1MLmP66ZpCw46+
X-Google-Smtp-Source: APXvYqxvQC14RQ9QdnX6RRL2qSh8q1iIAF2WEguaHRzcOSRBWnmzyAnzFMPaOS41m2kTOFicDavDUw==
X-Received: by 2002:a17:902:7898:: with SMTP id
 q24mr15283878pll.164.1583124672753; 
 Sun, 01 Mar 2020 20:51:12 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-117-248.tpgi.com.au.
 [193.116.117.248])
 by smtp.gmail.com with ESMTPSA id a9sm18575258pfo.35.2020.03.01.20.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2020 20:51:12 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] powerpc/64s: CONFIG_PPC_HASH_MMU
Date: Mon,  2 Mar 2020 14:49:02 +1000
Message-Id: <20200302044902.3418935-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This allows the 64s hash MMU code to be compiled out if radix is
selected. This saves about 128kB kernel image size (90kB text) on
powernv_defconfig minus KVM, 40kB on a tiny config.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/include/asm/book3s/64/mmu.h      | 20 ++++++++++++++++-
 arch/powerpc/include/asm/book3s/64/pgtable.h  |  6 +++++
 .../include/asm/book3s/64/tlbflush-hash.h     | 10 +++++++--
 arch/powerpc/include/asm/book3s/64/tlbflush.h |  4 ----
 arch/powerpc/include/asm/book3s/pgtable.h     |  4 ++++
 arch/powerpc/include/asm/mmu.h                | 14 ++++++++++--
 arch/powerpc/include/asm/mmu_context.h        |  2 ++
 arch/powerpc/include/asm/paca.h               |  9 ++++++++
 arch/powerpc/include/asm/sparsemem.h          |  2 +-
 arch/powerpc/kernel/asm-offsets.c             |  4 ++++
 arch/powerpc/kernel/dt_cpu_ftrs.c             | 10 ++++++++-
 arch/powerpc/kernel/entry_64.S                |  4 ++--
 arch/powerpc/kernel/exceptions-64s.S          | 22 ++++++++++++++++---
 arch/powerpc/kernel/mce.c                     |  2 +-
 arch/powerpc/kernel/mce_power.c               | 10 ++++++---
 arch/powerpc/kernel/paca.c                    | 18 ++++++---------
 arch/powerpc/kernel/process.c                 | 13 ++++++-----
 arch/powerpc/kernel/prom.c                    |  2 ++
 arch/powerpc/kernel/setup_64.c                |  4 ++++
 arch/powerpc/kexec/core_64.c                  |  4 ++--
 arch/powerpc/kvm/Kconfig                      |  1 +
 arch/powerpc/mm/book3s64/Makefile             | 17 ++++++++------
 arch/powerpc/mm/book3s64/hash_pgtable.c       |  1 -
 arch/powerpc/mm/book3s64/hash_utils.c         |  9 --------
 .../{hash_hugetlbpage.c => hugetlbpage.c}     |  2 ++
 arch/powerpc/mm/book3s64/mmu_context.c        | 18 +++++++++++++--
 arch/powerpc/mm/book3s64/pgtable.c            | 22 +++++++++++++++++--
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  5 +++++
 arch/powerpc/mm/book3s64/slb.c                | 14 ------------
 arch/powerpc/mm/copro_fault.c                 |  2 ++
 arch/powerpc/mm/fault.c                       | 20 +++++++++++++++++
 arch/powerpc/platforms/Kconfig.cputype        | 20 ++++++++++++++++-
 arch/powerpc/platforms/powernv/idle.c         |  2 ++
 arch/powerpc/platforms/powernv/setup.c        |  2 ++
 arch/powerpc/xmon/xmon.c                      |  8 +++++--
 36 files changed, 231 insertions(+), 77 deletions(-)
 rename arch/powerpc/mm/book3s64/{hash_hugetlbpage.c => hugetlbpage.c} (99%)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 497b7d0b2d7e..50c361b8b7fd 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -963,6 +963,7 @@ config PPC_MEM_KEYS
 	prompt "PowerPC Memory Protection Keys"
 	def_bool y
 	depends on PPC_BOOK3S_64
+	depends on PPC_HASH_MMU
 	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_HAS_PKEYS
 	help
diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index bb3deb76c951..fca69dd23e25 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -107,7 +107,9 @@ typedef struct {
 		 * from EA and new context ids to build the new VAs.
 		 */
 		mm_context_id_t id;
+#ifdef CONFIG_PPC_HASH_MMU
 		mm_context_id_t extended_id[TASK_SIZE_USER64/TASK_CONTEXT_SIZE];
+#endif
 	};
 
 	/* Number of bits in the mm_cpumask */
@@ -116,7 +118,9 @@ typedef struct {
 	/* Number of users of the external (Nest) MMU */
 	atomic_t copros;
 
+#ifdef CONFIG_PPC_HASH_MMU
 	struct hash_mm_context *hash_context;
+#endif
 
 	unsigned long vdso_base;
 	/*
@@ -139,6 +143,7 @@ typedef struct {
 #endif
 } mm_context_t;
 
+#ifdef CONFIG_PPC_HASH_MMU
 static inline u16 mm_ctx_user_psize(mm_context_t *ctx)
 {
 	return ctx->hash_context->user_psize;
@@ -193,11 +198,22 @@ static inline struct subpage_prot_table *mm_ctx_subpage_prot(mm_context_t *ctx)
 }
 #endif
 
+#endif
+
 /*
  * The current system page and segment sizes
  */
-extern int mmu_linear_psize;
+#if defined(CONFIG_PPC_RADIX_MMU) && !defined(CONFIG_PPC_HASH_MMU)
+#ifdef CONFIG_PPC_64K_PAGES
+#define mmu_virtual_psize MMU_PAGE_64K
+#else
+#define mmu_virtual_psize MMU_PAGE_4K
+#endif
+#else
 extern int mmu_virtual_psize;
+#endif
+
+extern int mmu_linear_psize;
 extern int mmu_vmalloc_psize;
 extern int mmu_vmemmap_psize;
 extern int mmu_io_psize;
@@ -243,6 +259,7 @@ extern void radix_init_pseries(void);
 static inline void radix_init_pseries(void) { };
 #endif
 
+#ifdef CONFIG_PPC_HASH_MMU
 static inline int get_user_context(mm_context_t *ctx, unsigned long ea)
 {
 	int index = ea >> MAX_EA_BITS_PER_CONTEXT;
@@ -262,6 +279,7 @@ static inline unsigned long get_user_vsid(mm_context_t *ctx,
 
 	return get_vsid(context, ea, ssize);
 }
+#endif
 
 #endif /* __ASSEMBLY__ */
 #endif /* _ASM_POWERPC_BOOK3S_64_MMU_H_ */
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 201a69e6a355..0d0b5dcadd16 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1139,8 +1139,14 @@ extern pmd_t mk_pmd(struct page *page, pgprot_t pgprot);
 extern pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot);
 extern void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 		       pmd_t *pmdp, pmd_t pmd);
+#ifdef CONFIG_PPC_HASH_MMU
 extern void update_mmu_cache_pmd(struct vm_area_struct *vma, unsigned long addr,
 				 pmd_t *pmd);
+#else
+static inline void update_mmu_cache_pmd(struct vm_area_struct *vma, unsigned long addr, pmd_t *pmd)
+{
+}
+#endif
 extern int hash__has_transparent_hugepage(void);
 static inline int has_transparent_hugepage(void)
 {
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index 64d02a704bcb..bb8a22ee9668 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -112,9 +112,15 @@ static inline void hash__flush_tlb_kernel_range(unsigned long start,
 
 struct mmu_gather;
 extern void hash__tlb_flush(struct mmu_gather *tlb);
+extern void flush_tlb_pmd_range(struct mm_struct *mm, pmd_t *pmd,
+				unsigned long addr);
+
+#ifdef CONFIG_PPC_HASH_MMU
 /* Private function for use by PCI IO mapping code */
 extern void __flush_hash_table_range(struct mm_struct *mm, unsigned long start,
 				     unsigned long end);
-extern void flush_tlb_pmd_range(struct mm_struct *mm, pmd_t *pmd,
-				unsigned long addr);
+#else
+static inline void __flush_hash_table_range(struct mm_struct *mm, unsigned long start,
+				     unsigned long end) { }
+#endif
 #endif /*  _ASM_POWERPC_BOOK3S_64_TLBFLUSH_HASH_H */
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index dcb5c3839d2f..d2e80f178b6d 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -14,7 +14,6 @@ enum {
 	TLB_INVAL_SCOPE_LPID = 1,	/* invalidate TLBs for current LPID */
 };
 
-#ifdef CONFIG_PPC_NATIVE
 static inline void tlbiel_all(void)
 {
 	/*
@@ -30,9 +29,6 @@ static inline void tlbiel_all(void)
 	else
 		hash__tlbiel_all(TLB_INVAL_SCOPE_GLOBAL);
 }
-#else
-static inline void tlbiel_all(void) { BUG(); };
-#endif
 
 static inline void tlbiel_all_lpid(bool radix)
 {
diff --git a/arch/powerpc/include/asm/book3s/pgtable.h b/arch/powerpc/include/asm/book3s/pgtable.h
index 0e1263455d73..cb85da522d0c 100644
--- a/arch/powerpc/include/asm/book3s/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/pgtable.h
@@ -26,6 +26,7 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 				     unsigned long size, pgprot_t vma_prot);
 #define __HAVE_PHYS_MEM_ACCESS_PROT
 
+#ifdef CONFIG_PPC_HASH_MMU
 /*
  * This gets called at the end of handling a page fault, when
  * the kernel has put a new PTE into the page table for the process.
@@ -36,6 +37,9 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
  * waiting for the inevitable extra hash-table miss exception.
  */
 void update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep);
+#else
+static inline void update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep) {}
+#endif
 
 #endif /* __ASSEMBLY__ */
 #endif
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 0699cfeeb8c9..9ff4b99cd0d3 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -269,7 +269,7 @@ static inline void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
 }
 #endif /* !CONFIG_DEBUG_VM */
 
-#ifdef CONFIG_PPC_RADIX_MMU
+#if defined(CONFIG_PPC_RADIX_MMU) && defined(CONFIG_PPC_HASH_MMU)
 static inline bool radix_enabled(void)
 {
 	return mmu_has_feature(MMU_FTR_TYPE_RADIX);
@@ -279,7 +279,7 @@ static inline bool early_radix_enabled(void)
 {
 	return early_mmu_has_feature(MMU_FTR_TYPE_RADIX);
 }
-#else
+#elif defined(CONFIG_PPC_HASH_MMU)
 static inline bool radix_enabled(void)
 {
 	return false;
@@ -289,6 +289,16 @@ static inline bool early_radix_enabled(void)
 {
 	return false;
 }
+#else
+static inline bool radix_enabled(void)
+{
+	return true;
+}
+
+static inline bool early_radix_enabled(void)
+{
+	return true;
+}
 #endif
 
 #ifdef CONFIG_PPC_MEM_KEYS
diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index 360367c579de..6a0fafbef119 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -74,6 +74,7 @@ extern void hash__reserve_context_id(int id);
 extern void __destroy_context(int context_id);
 static inline void mmu_context_init(void) { }
 
+#ifdef CONFIG_PPC_HASH_MMU
 static inline int alloc_extended_context(struct mm_struct *mm,
 					 unsigned long ea)
 {
@@ -99,6 +100,7 @@ static inline bool need_extra_context(struct mm_struct *mm, unsigned long ea)
 		return true;
 	return false;
 }
+#endif
 
 #else
 extern void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next,
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index e3cc9eb9204d..6b365cffaee9 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -95,7 +95,9 @@ struct paca_struct {
 					/* this becomes non-zero. */
 	u8 kexec_state;		/* set when kexec down has irqs off */
 #ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_HASH_MMU
 	struct slb_shadow *slb_shadow_ptr;
+#endif
 	struct dtl_entry *dispatch_log;
 	struct dtl_entry *dispatch_log_end;
 #endif
@@ -109,6 +111,8 @@ struct paca_struct {
 	u64 exgen[EX_SIZE] __attribute__((aligned(0x80)));
 	u64 exslb[EX_SIZE];	/* used for SLB/segment table misses
  				 * on the linear mapping */
+
+#ifdef CONFIG_PPC_HASH_MMU
 	/* SLB related definitions */
 	u16 vmalloc_sllp;
 	u8 slb_cache_ptr;
@@ -119,6 +123,7 @@ struct paca_struct {
 	u32 slb_used_bitmap;		/* Bitmaps for first 32 SLB entries. */
 	u32 slb_kern_bitmap;
 	u32 slb_cache[SLB_CACHE_ENTRIES];
+#endif
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
 #ifdef CONFIG_PPC_BOOK3E
@@ -149,6 +154,7 @@ struct paca_struct {
 
 #ifdef CONFIG_PPC_BOOK3S
 	mm_context_id_t mm_ctx_id;
+#ifdef CONFIG_PPC_HASH_MMU
 #ifdef CONFIG_PPC_MM_SLICES
 	unsigned char mm_ctx_low_slices_psize[BITS_PER_LONG / BITS_PER_BYTE];
 	unsigned char mm_ctx_high_slices_psize[SLICE_ARRAY_SIZE];
@@ -157,6 +163,7 @@ struct paca_struct {
 	u16 mm_ctx_user_psize;
 	u16 mm_ctx_sllp;
 #endif
+#endif
 #endif
 
 	/*
@@ -260,9 +267,11 @@ struct paca_struct {
 #endif /* CONFIG_PPC_PSERIES */
 
 #ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_HASH_MMU
 	/* Capture SLB related old contents in MCE handler. */
 	struct slb_entry *mce_faulty_slbs;
 	u16 slb_save_cache_ptr;
+#endif
 #endif /* CONFIG_PPC_BOOK3S_64 */
 #ifdef CONFIG_STACKPROTECTOR
 	unsigned long canary;
diff --git a/arch/powerpc/include/asm/sparsemem.h b/arch/powerpc/include/asm/sparsemem.h
index 3192d454a733..958fed1f052e 100644
--- a/arch/powerpc/include/asm/sparsemem.h
+++ b/arch/powerpc/include/asm/sparsemem.h
@@ -16,7 +16,7 @@
 extern int create_section_mapping(unsigned long start, unsigned long end, int nid);
 extern int remove_section_mapping(unsigned long start, unsigned long end);
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_HASH_MMU
 extern int resize_hpt_for_hotplug(unsigned long new_mem_size);
 #else
 static inline int resize_hpt_for_hotplug(unsigned long new_mem_size) { return 0; }
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index fcf24a365fc0..c4a8a070eab0 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -238,6 +238,7 @@ int main(void)
 #endif /* CONFIG_PPC_BOOK3E */
 
 #ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_HASH_MMU
 	OFFSET(PACASLBCACHE, paca_struct, slb_cache);
 	OFFSET(PACASLBCACHEPTR, paca_struct, slb_cache_ptr);
 	OFFSET(PACASTABRR, paca_struct, stab_rr);
@@ -246,6 +247,7 @@ int main(void)
 	OFFSET(MMUPSIZESLLP, mmu_psize_def, sllp);
 #else
 	OFFSET(PACACONTEXTSLLP, paca_struct, mm_ctx_sllp);
+#endif
 #endif /* CONFIG_PPC_MM_SLICES */
 	OFFSET(PACA_EXGEN, paca_struct, exgen);
 	OFFSET(PACA_EXMC, paca_struct, exmc);
@@ -254,10 +256,12 @@ int main(void)
 #ifdef CONFIG_PPC_PSERIES
 	OFFSET(PACALPPACAPTR, paca_struct, lppaca_ptr);
 #endif
+#ifdef CONFIG_PPC_HASH_MMU
 	OFFSET(PACA_SLBSHADOWPTR, paca_struct, slb_shadow_ptr);
 	OFFSET(SLBSHADOW_STACKVSID, slb_shadow, save_area[SLB_NUM_BOLTED - 1].vsid);
 	OFFSET(SLBSHADOW_STACKESID, slb_shadow, save_area[SLB_NUM_BOLTED - 1].esid);
 	OFFSET(SLBSHADOW_SAVEAREA, slb_shadow, save_area);
+#endif
 	OFFSET(LPPACA_PMCINUSE, lppaca, pmcregs_in_use);
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	OFFSET(PACA_PMCINUSE, paca_struct, pmcregs_in_use);
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 182b4047c1ef..36385eb87d36 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -298,6 +298,7 @@ static int __init feat_enable_idle_stop(struct dt_cpu_feature *f)
 
 static int __init feat_enable_mmu_hash(struct dt_cpu_feature *f)
 {
+#ifdef CONFIG_PPC_HASH_MMU
 	u64 lpcr;
 
 	lpcr = mfspr(SPRN_LPCR);
@@ -313,10 +314,13 @@ static int __init feat_enable_mmu_hash(struct dt_cpu_feature *f)
 	cur_cpu_spec->cpu_user_features |= PPC_FEATURE_HAS_MMU;
 
 	return 1;
+#endif
+	return 0;
 }
 
 static int __init feat_enable_mmu_hash_v3(struct dt_cpu_feature *f)
 {
+#ifdef CONFIG_PPC_HASH_MMU
 	u64 lpcr;
 
 	system_registers.lpcr_clear |= (LPCR_ISL | LPCR_UPRT | LPCR_HR);
@@ -328,14 +332,18 @@ static int __init feat_enable_mmu_hash_v3(struct dt_cpu_feature *f)
 	cur_cpu_spec->cpu_user_features |= PPC_FEATURE_HAS_MMU;
 
 	return 1;
+#endif
+	return 0;
 }
 
 
 static int __init feat_enable_mmu_radix(struct dt_cpu_feature *f)
 {
+#ifdef CONFIG_PPC_HASH_MMU
+	cur_cpu_spec->mmu_features |= MMU_FTRS_HASH_BASE;
+#endif
 #ifdef CONFIG_PPC_RADIX_MMU
 	cur_cpu_spec->mmu_features |= MMU_FTR_TYPE_RADIX;
-	cur_cpu_spec->mmu_features |= MMU_FTRS_HASH_BASE;
 	cur_cpu_spec->cpu_user_features |= PPC_FEATURE_HAS_MMU;
 
 	return 1;
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 6ba675b0cf7d..5f40fe4ec6ba 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -646,7 +646,7 @@ _GLOBAL(_switch)
 #endif
 
 	ld	r8,KSP(r4)	/* new stack pointer */
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_HASH_MMU
 BEGIN_MMU_FTR_SECTION
 	b	2f
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
@@ -698,7 +698,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	slbmte	r7,r0
 	isync
 2:
-#endif /* CONFIG_PPC_BOOK3S_64 */
+#endif /* CONFIG_PPC_HASH_MMU */
 
 	clrrdi	r7, r8, THREAD_SHIFT	/* base of new stack */
 	/* Note: this uses SWITCH_FRAME_SIZE rather than INT_FRAME_SIZE
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index ffc15f4f079d..b94874c2f7ab 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1161,6 +1161,7 @@ EXC_COMMON_BEGIN(data_access_common)
 	INT_COMMON 0x300, PACA_EXGEN, 1, 1, 1, 1, 1
 	ld	r4,_DAR(r1)
 	ld	r5,_DSISR(r1)
+#ifdef CONFIG_PPC_HASH_MMU
 BEGIN_MMU_FTR_SECTION
 	ld	r6,_MSR(r1)
 	li	r3,0x300
@@ -1168,6 +1169,9 @@ BEGIN_MMU_FTR_SECTION
 MMU_FTR_SECTION_ELSE
 	b	handle_page_fault
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
+#else
+	b	handle_page_fault
+#endif
 
 
 EXC_REAL_BEGIN(data_access_slb, 0x380, 0x80)
@@ -1181,6 +1185,7 @@ EXC_COMMON_BEGIN(data_access_slb_common)
 	INT_COMMON 0x380, PACA_EXSLB, 1, 1, 0, 1, 0
 	ld	r4,_DAR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
+#ifdef CONFIG_PPC_HASH_MMU
 BEGIN_MMU_FTR_SECTION
 	/* HPT case, do SLB fault */
 	bl	do_slb_fault
@@ -1192,6 +1197,9 @@ MMU_FTR_SECTION_ELSE
 	/* Radix case, access is outside page table range */
 	li	r3,-EFAULT
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
+#else
+	li	r3,-EFAULT
+#endif
 	std	r3,RESULT(r1)
 	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
@@ -1213,6 +1221,7 @@ EXC_COMMON_BEGIN(instruction_access_common)
 	INT_COMMON 0x400, PACA_EXGEN, 1, 1, 1, 2, 2
 	ld	r4,_DAR(r1)
 	ld	r5,_DSISR(r1)
+#ifdef CONFIG_PPC_HASH_MMU
 BEGIN_MMU_FTR_SECTION
 	ld      r6,_MSR(r1)
 	li	r3,0x400
@@ -1220,6 +1229,9 @@ BEGIN_MMU_FTR_SECTION
 MMU_FTR_SECTION_ELSE
 	b	handle_page_fault
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
+#else
+	b	handle_page_fault
+#endif
 
 
 EXC_REAL_BEGIN(instruction_access_slb, 0x480, 0x80)
@@ -1233,6 +1245,7 @@ EXC_COMMON_BEGIN(instruction_access_slb_common)
 	INT_COMMON 0x480, PACA_EXSLB, 1, 1, 0, 2, 0
 	ld	r4,_DAR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
+#ifdef CONFIG_PPC_HASH_MMU
 BEGIN_MMU_FTR_SECTION
 	/* HPT case, do SLB fault */
 	bl	do_slb_fault
@@ -1244,6 +1257,9 @@ MMU_FTR_SECTION_ELSE
 	/* Radix case, access is outside page table range */
 	li	r3,-EFAULT
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
+#else
+	li	r3,-EFAULT
+#endif
 	std	r3,RESULT(r1)
 	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
@@ -2252,8 +2268,8 @@ disable_machine_check:
  * Hash table stuff
  */
 	.balign	IFETCH_ALIGN_BYTES
+#ifdef CONFIG_PPC_HASH_MMU
 do_hash_page:
-#ifdef CONFIG_PPC_BOOK3S_64
 	lis	r0,(DSISR_BAD_FAULT_64S | DSISR_DABRMATCH | DSISR_KEYFAULT)@h
 	ori	r0,r0,DSISR_BAD_FAULT_64S@l
 	and.	r0,r5,r0		/* weird error? */
@@ -2283,7 +2299,7 @@ do_hash_page:
 	/* Reload DAR/DSISR into r4/r5 for the DABR check below */
 	ld	r4,_DAR(r1)
 	ld      r5,_DSISR(r1)
-#endif /* CONFIG_PPC_BOOK3S_64 */
+#endif /* CONFIG_PPC_HASH_MMU */
 
 /* Here we have a page fault that hash_page can't handle. */
 handle_page_fault:
@@ -2315,7 +2331,7 @@ handle_dabr_fault:
 	b       ret_from_except
 
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_HASH_MMU
 /* We have a page fault that hash_page could handle but HV refused
  * the PTE insertion
  */
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 34c1001e9e8b..c8ff446acec0 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -544,7 +544,7 @@ void machine_check_print_event_info(struct machine_check_event *evt,
 		mc_error_class[evt->error_class] : "Unknown";
 	printk("%sMCE: CPU%d: %s\n", level, evt->cpu, subtype);
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_HASH_MMU
 	/* Display faulty slb contents for SLB errors. */
 	if (evt->error_type == MCE_ERROR_TYPE_SLB)
 		slb_dump_contents(local_paca->mce_faulty_slbs);
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index 1cbf7f1a4e3d..fd03ac9d7f7b 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -58,7 +58,7 @@ unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr)
 }
 
 /* flush SLBs and reload */
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_HASH_MMU
 void flush_and_reload_slb(void)
 {
 	/* Invalidate all SLBs */
@@ -88,7 +88,7 @@ void flush_and_reload_slb(void)
 
 static void flush_erat(void)
 {
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_HASH_MMU
 	if (!early_cpu_has_feature(CPU_FTR_ARCH_300)) {
 		flush_and_reload_slb();
 		return;
@@ -103,7 +103,7 @@ static void flush_erat(void)
 
 static int mce_flush(int what)
 {
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_HASH_MMU
 	if (what == MCE_FLUSH_SLB) {
 		flush_and_reload_slb();
 		return 1;
@@ -409,8 +409,10 @@ static int mce_handle_ierror(struct pt_regs *regs,
 		/* attempt to correct the error */
 		switch (table[i].error_type) {
 		case MCE_ERROR_TYPE_SLB:
+#ifdef CONFIG_PPC_HASH_MMU
 			if (local_paca->in_mce == 1)
 				slb_save_contents(local_paca->mce_faulty_slbs);
+#endif
 			handled = mce_flush(MCE_FLUSH_SLB);
 			break;
 		case MCE_ERROR_TYPE_ERAT:
@@ -496,8 +498,10 @@ static int mce_handle_derror(struct pt_regs *regs,
 		/* attempt to correct the error */
 		switch (table[i].error_type) {
 		case MCE_ERROR_TYPE_SLB:
+#ifdef CONFIG_PPC_HASH_MMU
 			if (local_paca->in_mce == 1)
 				slb_save_contents(local_paca->mce_faulty_slbs);
+#endif
 			if (mce_flush(MCE_FLUSH_SLB))
 				handled = 1;
 			break;
diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index 949eceb254d8..415bdd687900 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -131,8 +131,7 @@ static struct lppaca * __init new_lppaca(int cpu, unsigned long limit)
 }
 #endif /* CONFIG_PPC_PSERIES */
 
-#ifdef CONFIG_PPC_BOOK3S_64
-
+#ifdef CONFIG_PPC_HASH_MMU
 /*
  * 3 persistent SLBs are allocated here.  The buffer will be zero
  * initially, hence will all be invaild until we actually write them.
@@ -161,8 +160,7 @@ static struct slb_shadow * __init new_slb_shadow(int cpu, unsigned long limit)
 
 	return s;
 }
-
-#endif /* CONFIG_PPC_BOOK3S_64 */
+#endif /* CONFIG_PPC_HASH_MMU */
 
 /* The Paca is an array with one entry per processor.  Each contains an
  * lppaca, which contains the information shared between the
@@ -194,7 +192,7 @@ void __init initialise_paca(struct paca_struct *new_paca, int cpu)
 	new_paca->kexec_state = KEXEC_STATE_NONE;
 	new_paca->__current = &init_task;
 	new_paca->data_offset = 0xfeeeeeeeeeeeeeeeULL;
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_HASH_MMU
 	new_paca->slb_shadow_ptr = NULL;
 #endif
 
@@ -267,7 +265,7 @@ void __init allocate_paca(int cpu)
 #ifdef CONFIG_PPC_PSERIES
 	paca->lppaca_ptr = new_lppaca(cpu, limit);
 #endif
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_HASH_MMU
 	paca->slb_shadow_ptr = new_slb_shadow(cpu, limit);
 #endif
 	paca_struct_size += sizeof(struct paca_struct);
@@ -285,7 +283,7 @@ void __init free_unused_pacas(void)
 	paca_nr_cpu_ids = nr_cpu_ids;
 	paca_ptrs_size = new_ptrs_size;
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_HASH_MMU
 	if (early_radix_enabled()) {
 		/* Ugly fixup, see new_slb_shadow() */
 		memblock_free(__pa(paca_ptrs[boot_cpuid]->slb_shadow_ptr),
@@ -298,9 +296,9 @@ void __init free_unused_pacas(void)
 			paca_ptrs_size + paca_struct_size, nr_cpu_ids);
 }
 
+#ifdef CONFIG_PPC_HASH_MMU
 void copy_mm_to_paca(struct mm_struct *mm)
 {
-#ifdef CONFIG_PPC_BOOK3S
 	mm_context_t *context = &mm->context;
 
 	get_paca()->mm_ctx_id = context->id;
@@ -315,7 +313,5 @@ void copy_mm_to_paca(struct mm_struct *mm)
 	get_paca()->mm_ctx_user_psize = context->user_psize;
 	get_paca()->mm_ctx_sllp = context->sllp;
 #endif
-#else /* !CONFIG_PPC_BOOK3S */
-	return;
-#endif
 }
+#endif /* CONFIG_PPC_HASH_MMU */
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index fad50db9dcf2..c2e8eb100a89 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1140,7 +1140,7 @@ struct task_struct *__switch_to(struct task_struct *prev,
 {
 	struct thread_struct *new_thread, *old_thread;
 	struct task_struct *last;
-#ifdef CONFIG_PPC_BOOK3S_64
+#if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_PPC_HASH_MMU)
 	struct ppc64_tlb_batch *batch;
 #endif
 
@@ -1149,7 +1149,7 @@ struct task_struct *__switch_to(struct task_struct *prev,
 
 	WARN_ON(!irqs_disabled());
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_PPC_HASH_MMU)
 	batch = this_cpu_ptr(&ppc64_tlb_batch);
 	if (batch->active) {
 		current_thread_info()->local_flags |= _TLF_LAZY_MMU;
@@ -1204,11 +1204,13 @@ struct task_struct *__switch_to(struct task_struct *prev,
 	last = _switch(old_thread, new_thread);
 
 #ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_HASH_MMU
 	if (current_thread_info()->local_flags & _TLF_LAZY_MMU) {
 		current_thread_info()->local_flags &= ~_TLF_LAZY_MMU;
 		batch = this_cpu_ptr(&ppc64_tlb_batch);
 		batch->active = 1;
 	}
+#endif
 
 	if (current->thread.regs) {
 		restore_math(current->thread.regs);
@@ -1568,7 +1570,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 
 static void setup_ksp_vsid(struct task_struct *p, unsigned long sp)
 {
-#ifdef CONFIG_PPC_BOOK3S_64
+#if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_PPC_HASH_MMU)
 	unsigned long sp_vsid;
 	unsigned long llp = mmu_psize_defs[mmu_linear_psize].sllp;
 
@@ -2179,10 +2181,9 @@ unsigned long arch_randomize_brk(struct mm_struct *mm)
 	 * the heap, we can put it above 1TB so it is backed by a 1TB
 	 * segment. Otherwise the heap will be in the bottom 1TB
 	 * which always uses 256MB segments and this may result in a
-	 * performance penalty. We don't need to worry about radix. For
-	 * radix, mmu_highuser_ssize remains unchanged from 256MB.
+	 * performance penalty.
 	 */
-	if (!is_32bit_task() && (mmu_highuser_ssize == MMU_SEGSIZE_1T))
+	if (!radix_enabled() && !is_32bit_task() && (mmu_highuser_ssize == MMU_SEGSIZE_1T))
 		base = max_t(unsigned long, mm->brk, 1UL << SID_SHIFT_1T);
 #endif
 
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 6620f37abe73..f372340cbcd6 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -232,6 +232,7 @@ static void __init check_cpu_pa_features(unsigned long node)
 #ifdef CONFIG_PPC_BOOK3S_64
 static void __init init_mmu_slb_size(unsigned long node)
 {
+#ifdef CONFIG_PPC_HASH_MMU
 	const __be32 *slb_size_ptr;
 
 	slb_size_ptr = of_get_flat_dt_prop(node, "slb-size", NULL) ? :
@@ -239,6 +240,7 @@ static void __init init_mmu_slb_size(unsigned long node)
 
 	if (slb_size_ptr)
 		mmu_slb_size = be32_to_cpup(slb_size_ptr);
+#endif
 }
 #else
 #define init_mmu_slb_size(node) do { } while(0)
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index e05e6dd67ae6..70f2db84f5f4 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -758,6 +758,7 @@ void __init setup_per_cpu_areas(void)
 	unsigned int cpu;
 	int rc;
 
+#ifdef CONFIG_PPC_HASH_MMU
 	/*
 	 * Linear mapping is one of 4K, 1M and 16M.  For 4K, no need
 	 * to group units.  For larger mappings, use 1M atom which
@@ -767,6 +768,9 @@ void __init setup_per_cpu_areas(void)
 		atom_size = PAGE_SIZE;
 	else
 		atom_size = 1 << 20;
+#else
+	atom_size = PAGE_SIZE;
+#endif
 
 	rc = pcpu_embed_first_chunk(0, dyn_size, atom_size, pcpu_cpu_distance,
 				    pcpu_fc_alloc, pcpu_fc_free);
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 04a7cba58eff..97b580b0a766 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -372,7 +372,7 @@ void default_machine_kexec(struct kimage *image)
 	/* NOTREACHED */
 }
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_HASH_MMU
 /* Values we need to export to the second kernel via the device tree. */
 static unsigned long htab_base;
 static unsigned long htab_size;
@@ -414,4 +414,4 @@ static int __init export_htab_values(void)
 	return 0;
 }
 late_initcall(export_htab_values);
-#endif /* CONFIG_PPC_BOOK3S_64 */
+#endif /* CONFIG_PPC_HASH_MMU */
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index 711fca9bc6f0..1693f1eebea8 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -70,6 +70,7 @@ config KVM_BOOK3S_64
 	select KVM
 	select KVM_BOOK3S_PR_POSSIBLE if !KVM_BOOK3S_HV_POSSIBLE
 	select SPAPR_TCE_IOMMU if IOMMU_SUPPORT && (PPC_PSERIES || PPC_POWERNV)
+	select PPC_HASH_MMU
 	---help---
 	  Support running unmodified book3s_64 and book3s_32 guest kernels
 	  in virtual machines on book3s_64 host processors.
diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
index fd393b8be14f..5376e11ec85f 100644
--- a/arch/powerpc/mm/book3s64/Makefile
+++ b/arch/powerpc/mm/book3s64/Makefile
@@ -2,20 +2,23 @@
 
 ccflags-y	:= $(NO_MINIMAL_TOC)
 
+obj-y				+= mmu_context.o pgtable.o
+ifdef CONFIG_PPC_HASH_MMU
 CFLAGS_REMOVE_slb.o = $(CC_FLAGS_FTRACE)
-
-obj-y				+= hash_pgtable.o hash_utils.o slb.o \
-				   mmu_context.o pgtable.o hash_tlb.o
+obj-y				+= hash_pgtable.o hash_utils.o hash_tlb.o slb.o
 obj-$(CONFIG_PPC_NATIVE)	+= hash_native.o
-obj-$(CONFIG_PPC_RADIX_MMU)	+= radix_pgtable.o radix_tlb.o
 obj-$(CONFIG_PPC_4K_PAGES)	+= hash_4k.o
 obj-$(CONFIG_PPC_64K_PAGES)	+= hash_64k.o
-obj-$(CONFIG_HUGETLB_PAGE)	+= hash_hugetlbpage.o
+obj-$(CONFIG_TRANSPARENT_HUGEPAGE) += hash_hugepage.o
+obj-$(CONFIG_PPC_SUBPAGE_PROT)	+= subpage_prot.o
+endif
+
+obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
+
+obj-$(CONFIG_PPC_RADIX_MMU)	+= radix_pgtable.o radix_tlb.o
 ifdef CONFIG_HUGETLB_PAGE
 obj-$(CONFIG_PPC_RADIX_MMU)	+= radix_hugetlbpage.o
 endif
-obj-$(CONFIG_TRANSPARENT_HUGEPAGE) += hash_hugepage.o
-obj-$(CONFIG_PPC_SUBPAGE_PROT)	+= subpage_prot.o
 obj-$(CONFIG_SPAPR_TCE_IOMMU)	+= iommu_api.o
 obj-$(CONFIG_PPC_MEM_KEYS)	+= pkeys.o
 
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index 64733b9cb20a..637f90452657 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -17,7 +17,6 @@
 
 #include <mm/mmu_decl.h>
 
-#define CREATE_TRACE_POINTS
 #include <trace/events/thp.h>
 
 #if H_PGTABLE_RANGE > (USER_VSID_RANGE * (TASK_SIZE_USER64 / TASK_CONTEXT_SIZE))
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 523d4d39d11e..44ade204d050 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -95,8 +95,6 @@
  */
 
 static unsigned long _SDR1;
-struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT];
-EXPORT_SYMBOL_GPL(mmu_psize_defs);
 
 u8 hpte_page_sizes[1 << LP_BITS];
 EXPORT_SYMBOL_GPL(hpte_page_sizes);
@@ -105,14 +103,7 @@ struct hash_pte *htab_address;
 unsigned long htab_size_bytes;
 unsigned long htab_hash_mask;
 EXPORT_SYMBOL_GPL(htab_hash_mask);
-int mmu_linear_psize = MMU_PAGE_4K;
-EXPORT_SYMBOL_GPL(mmu_linear_psize);
 int mmu_virtual_psize = MMU_PAGE_4K;
-int mmu_vmalloc_psize = MMU_PAGE_4K;
-#ifdef CONFIG_SPARSEMEM_VMEMMAP
-int mmu_vmemmap_psize = MMU_PAGE_4K;
-#endif
-int mmu_io_psize = MMU_PAGE_4K;
 int mmu_kernel_ssize = MMU_SEGSIZE_256M;
 EXPORT_SYMBOL_GPL(mmu_kernel_ssize);
 int mmu_highuser_ssize = MMU_SEGSIZE_256M;
diff --git a/arch/powerpc/mm/book3s64/hash_hugetlbpage.c b/arch/powerpc/mm/book3s64/hugetlbpage.c
similarity index 99%
rename from arch/powerpc/mm/book3s64/hash_hugetlbpage.c
rename to arch/powerpc/mm/book3s64/hugetlbpage.c
index eefa89c6117b..e4df7016e0fb 100644
--- a/arch/powerpc/mm/book3s64/hash_hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/hugetlbpage.c
@@ -18,6 +18,7 @@
 unsigned int hpage_shift;
 EXPORT_SYMBOL(hpage_shift);
 
+#ifdef CONFIG_PPC_HASH_MMU
 extern long hpte_insert_repeating(unsigned long hash, unsigned long vpn,
 				  unsigned long pa, unsigned long rlags,
 				  unsigned long vflags, int psize, int ssize);
@@ -128,6 +129,7 @@ int __hash_page_huge(unsigned long ea, unsigned long access, unsigned long vsid,
 	*ptep = __pte(new_pte & ~H_PAGE_BUSY);
 	return 0;
 }
+#endif
 
 pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma,
 				  unsigned long addr, pte_t *ptep)
diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
index 0ba30b8b935b..660941edd550 100644
--- a/arch/powerpc/mm/book3s64/mmu_context.c
+++ b/arch/powerpc/mm/book3s64/mmu_context.c
@@ -28,6 +28,7 @@ static int alloc_context_id(int min_id, int max_id)
 	return ida_alloc_range(&mmu_context_ida, min_id, max_id, GFP_KERNEL);
 }
 
+#ifdef CONFIG_PPC_HASH_MMU
 void hash__reserve_context_id(int id)
 {
 	int result = ida_alloc_range(&mmu_context_ida, id, id, GFP_KERNEL);
@@ -47,9 +48,9 @@ int hash__alloc_context_id(void)
 	return alloc_context_id(MIN_USER_CONTEXT, max);
 }
 EXPORT_SYMBOL_GPL(hash__alloc_context_id);
+#endif
 
-void slb_setup_new_exec(void);
-
+#ifdef CONFIG_PPC_HASH_MMU
 static int realloc_context_ids(mm_context_t *ctx)
 {
 	int i, id;
@@ -143,12 +144,15 @@ static int hash__init_new_context(struct mm_struct *mm)
 	return index;
 }
 
+void slb_setup_new_exec(void);
+
 void hash__setup_new_exec(void)
 {
 	slice_setup_new_exec();
 
 	slb_setup_new_exec();
 }
+#endif
 
 static int radix__init_new_context(struct mm_struct *mm)
 {
@@ -174,7 +178,9 @@ static int radix__init_new_context(struct mm_struct *mm)
 	 */
 	asm volatile("ptesync;isync" : : : "memory");
 
+#ifdef CONFIG_PPC_HASH_MMU
 	mm->context.hash_context = NULL;
+#endif
 
 	return index;
 }
@@ -185,8 +191,10 @@ int init_new_context(struct task_struct *tsk, struct mm_struct *mm)
 
 	if (radix_enabled())
 		index = radix__init_new_context(mm);
+#ifdef CONFIG_PPC_HASH_MMU
 	else
 		index = hash__init_new_context(mm);
+#endif
 
 	if (index < 0)
 		return index;
@@ -210,6 +218,7 @@ void __destroy_context(int context_id)
 }
 EXPORT_SYMBOL_GPL(__destroy_context);
 
+#ifdef CONFIG_PPC_HASH_MMU
 static void destroy_contexts(mm_context_t *ctx)
 {
 	int index, context_id;
@@ -221,6 +230,7 @@ static void destroy_contexts(mm_context_t *ctx)
 	}
 	kfree(ctx->hash_context);
 }
+#endif
 
 static void pmd_frag_destroy(void *pmd_frag)
 {
@@ -273,7 +283,11 @@ void destroy_context(struct mm_struct *mm)
 		process_tb[mm->context.id].prtb0 = 0;
 	else
 		subpage_prot_free(mm);
+#ifdef CONFIG_PPC_HASH_MMU
 	destroy_contexts(&mm->context);
+#else
+	ida_free(&mmu_context_ida, mm->context.id);
+#endif
 	mm->context.id = MMU_NO_CONTEXT;
 }
 
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 2bf7e1b4fd82..2f308d21700e 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -11,14 +11,25 @@
 #include <asm/debugfs.h>
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
-#include <asm/trace.h>
 #include <asm/powernv.h>
 #include <asm/firmware.h>
 #include <asm/ultravisor.h>
 
 #include <mm/mmu_decl.h>
+#define CREATE_TRACE_POINTS
 #include <trace/events/thp.h>
 
+struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT];
+EXPORT_SYMBOL_GPL(mmu_psize_defs);
+
+int mmu_linear_psize = MMU_PAGE_4K;
+EXPORT_SYMBOL_GPL(mmu_linear_psize);
+int mmu_vmalloc_psize = MMU_PAGE_4K;
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+int mmu_vmemmap_psize = MMU_PAGE_4K;
+#endif
+int mmu_io_psize = MMU_PAGE_4K;
+
 unsigned long __pmd_frag_nr;
 EXPORT_SYMBOL(__pmd_frag_nr);
 unsigned long __pmd_frag_size_shift;
@@ -147,6 +158,7 @@ pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 	return pmd_set_protbits(__pmd(pmdv), newprot);
 }
 
+#ifdef CONFIG_PPC_HASH_MMU
 /*
  * This is called at the end of handling a user page fault, when the
  * fault has been handled by updating a HUGE PMD entry in the linux page tables.
@@ -159,6 +171,7 @@ void update_mmu_cache_pmd(struct vm_area_struct *vma, unsigned long addr,
 	if (radix_enabled())
 		prefetch((void *)addr);
 }
+#endif
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 /* For use by kexec */
@@ -220,7 +233,12 @@ static void flush_partition(unsigned int lpid, bool radix)
 			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
 		/* do we need fixup here ?*/
 		asm volatile("eieio; tlbsync; ptesync" : : : "memory");
-		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 0);
+		/*
+		 * XXX: Can't use this tracepoint
+		 * because this file defines the  THP tracepoints
+		 * trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 0);
+		 * KVM tlbie tracing has much larger deficiencies though.
+		 */
 	}
 }
 
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 2a9a0cd79490..cd22557bb512 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -315,8 +315,11 @@ static void __init radix_init_pgtable(void)
 	unsigned long rts_field;
 	struct memblock_region *reg;
 
+#ifdef CONFIG_PPC_HASH_MMU
 	/* We don't support slb for radix */
 	mmu_slb_size = 0;
+#endif
+
 	/*
 	 * Create the linear mapping, using standard page size for now
 	 */
@@ -548,6 +551,7 @@ void __init radix__early_init_mmu(void)
 {
 	unsigned long lpcr;
 
+#ifdef CONFIG_PPC_HASH_MMU
 #ifdef CONFIG_PPC_64K_PAGES
 	/* PAGE_SIZE mappings */
 	mmu_virtual_psize = MMU_PAGE_64K;
@@ -564,6 +568,7 @@ void __init radix__early_init_mmu(void)
 		mmu_vmemmap_psize = MMU_PAGE_2M;
 	} else
 		mmu_vmemmap_psize = mmu_virtual_psize;
+#endif
 #endif
 	/*
 	 * initialize page table size
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 716204aee3da..f216bbe58d15 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -812,17 +812,3 @@ long do_slb_fault(struct pt_regs *regs, unsigned long ea)
 		return err;
 	}
 }
-
-void do_bad_slb_fault(struct pt_regs *regs, unsigned long ea, long err)
-{
-	if (err == -EFAULT) {
-		if (user_mode(regs))
-			_exception(SIGSEGV, regs, SEGV_BNDERR, ea);
-		else
-			bad_page_fault(regs, ea, SIGSEGV);
-	} else if (err == -EINVAL) {
-		unrecoverable_exception(regs);
-	} else {
-		BUG();
-	}
-}
diff --git a/arch/powerpc/mm/copro_fault.c b/arch/powerpc/mm/copro_fault.c
index beb060b96632..9fdef2216800 100644
--- a/arch/powerpc/mm/copro_fault.c
+++ b/arch/powerpc/mm/copro_fault.c
@@ -87,6 +87,7 @@ int copro_handle_mm_fault(struct mm_struct *mm, unsigned long ea,
 }
 EXPORT_SYMBOL_GPL(copro_handle_mm_fault);
 
+#ifdef CONFIG_PPC_HASH_MMU
 int copro_calculate_slb(struct mm_struct *mm, u64 ea, struct copro_slb *slb)
 {
 	u64 vsid, vsidkey;
@@ -151,3 +152,4 @@ void copro_flush_all_slbs(struct mm_struct *mm)
 	cxl_slbia(mm);
 }
 EXPORT_SYMBOL_GPL(copro_flush_all_slbs);
+#endif
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 8db0507619e2..02095e1d8e62 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -33,6 +33,7 @@
 #include <linux/hugetlb.h>
 #include <linux/uaccess.h>
 
+#include <asm/asm-prototypes.h>
 #include <asm/firmware.h>
 #include <asm/page.h>
 #include <asm/pgtable.h>
@@ -685,3 +686,22 @@ void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
 
 	die("Kernel access of bad area", regs, sig);
 }
+
+#ifdef CONFIG_PPC_BOOK3S_64
+/*
+ * Radix takes bad slb (segment) faults as well.
+ */
+void do_bad_slb_fault(struct pt_regs *regs, unsigned long ea, long err)
+{
+	if (err == -EFAULT) {
+		if (user_mode(regs))
+			_exception(SIGSEGV, regs, SEGV_BNDERR, ea);
+		else
+			bad_page_fault(regs, ea, SIGSEGV);
+	} else if (err == -EINVAL) {
+		unrecoverable_exception(regs);
+	} else {
+		BUG();
+	}
+}
+#endif
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 6caedc88474f..a700deae0dcc 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -98,7 +98,6 @@ config PPC_BOOK3S_64
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select IRQ_WORK
-	select PPC_MM_SLICES
 
 config PPC_BOOK3E_64
 	bool "Embedded processors"
@@ -120,11 +119,13 @@ choice
 config GENERIC_CPU
 	bool "Generic (POWER4 and above)"
 	depends on PPC64 && !CPU_LITTLE_ENDIAN
+	select PPC_HASH_MMU
 
 config GENERIC_CPU
 	bool "Generic (POWER8 and above)"
 	depends on PPC64 && CPU_LITTLE_ENDIAN
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_HASH_MMU
 
 config GENERIC_CPU
 	bool "Generic 32 bits powerpc"
@@ -133,24 +134,29 @@ config GENERIC_CPU
 config CELL_CPU
 	bool "Cell Broadband Engine"
 	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
+	select PPC_HASH_MMU
 
 config POWER5_CPU
 	bool "POWER5"
 	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
+	select PPC_HASH_MMU
 
 config POWER6_CPU
 	bool "POWER6"
 	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
+	select PPC_HASH_MMU
 
 config POWER7_CPU
 	bool "POWER7"
 	depends on PPC_BOOK3S_64
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_HASH_MMU
 
 config POWER8_CPU
 	bool "POWER8"
 	depends on PPC_BOOK3S_64
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_HASH_MMU
 
 config POWER9_CPU
 	bool "POWER9"
@@ -358,9 +364,21 @@ config PPC_RADIX_MMU
 	  is only implemented by IBM Power9 CPUs, if you don't have one of them
 	  you can probably disable this.
 
+config PPC_HASH_MMU
+	bool "Hash MMU Support"
+	depends on PPC_BOOK3S_64
+	default y
+	select PPC_MM_SLICES
+	help
+	  Enable support for the Power ISA Hash style MMU. This is implemented
+          by all IBM Power and other Book3S CPUs.
+
+	  If you're unsure, say Y.
+
 config PPC_RADIX_MMU_DEFAULT
 	bool "Default to using the Radix MMU when possible"
 	depends on PPC_RADIX_MMU
+	depends on PPC_HASH_MMU
 	default y
 	help
 	  When the hardware supports the Radix MMU, default to using it unless
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 78599bca66c2..3f2633b46ca3 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -491,12 +491,14 @@ static unsigned long power7_idle_insn(unsigned long type)
 
 	mtspr(SPRN_SPRG3,	local_paca->sprg_vdso);
 
+#ifdef CONFIG_PPC_HASH_MMU
 	/*
 	 * The SLB has to be restored here, but it sometimes still
 	 * contains entries, so the __ variant must be used to prevent
 	 * multi hits.
 	 */
 	__slb_restore_bolted_realmode();
+#endif
 
 	return srr1;
 }
diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index 11fdae81b5dd..fb7061ca63d0 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -168,6 +168,7 @@ static void __init pnv_init(void)
 #endif
 		add_preferred_console("hvc", 0, NULL);
 
+#ifdef CONFIG_PPC_HASH_MMU
 	if (!radix_enabled()) {
 		int i;
 
@@ -175,6 +176,7 @@ static void __init pnv_init(void)
 		for_each_possible_cpu(i)
 			paca_ptrs[i]->mce_faulty_slbs = memblock_alloc_node(mmu_slb_size, __alignof__(*paca_ptrs[i]->mce_faulty_slbs), cpu_to_node(i));
 	}
+#endif
 }
 
 static void __init pnv_init_IRQ(void)
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 0ec9640335bb..0146bfb9ee2a 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1119,9 +1119,11 @@ cmds(struct pt_regs *excp)
 			show_tasks();
 			break;
 #ifdef CONFIG_PPC_BOOK3S
+#ifdef CONFIG_PPC_HASH_MMU
 		case 'u':
 			dump_segments();
 			break;
+#endif
 #elif defined(CONFIG_44x)
 		case 'u':
 			dump_tlb_44x();
@@ -2419,7 +2421,7 @@ static void dump_tracing(void)
 static void dump_one_paca(int cpu)
 {
 	struct paca_struct *p;
-#ifdef CONFIG_PPC_BOOK3S_64
+#if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_PPC_HASH_MMU)
 	int i = 0;
 #endif
 
@@ -2461,6 +2463,7 @@ static void dump_one_paca(int cpu)
 	DUMP(p, cpu_start, "%#-*x");
 	DUMP(p, kexec_state, "%#-*x");
 #ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_HASH_MMU
 	if (!early_radix_enabled()) {
 		for (i = 0; i < SLB_NUM_BOLTED; i++) {
 			u64 esid, vsid;
@@ -2488,6 +2491,7 @@ static void dump_one_paca(int cpu)
 				       22, "slb_cache", i, p->slb_cache[i]);
 		}
 	}
+#endif
 
 	DUMP(p, rfi_flush_fallback_area, "%-*px");
 #endif
@@ -3570,7 +3574,7 @@ static void xmon_print_symbol(unsigned long address, const char *mid,
 	printf("%s", after);
 }
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_PPC_HASH_MMU)
 void dump_segments(void)
 {
 	int i;
-- 
2.23.0

