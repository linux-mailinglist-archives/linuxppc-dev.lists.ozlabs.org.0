Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E443C3F9CA1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 18:37:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx53Y624yz3cCd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 02:37:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RQHBCrYC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RQHBCrYC; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx50536khz307D
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 02:34:29 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id fs6so4899503pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 09:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lBrJ3eDJZ8uMLJgUagw2CEXXlwJGOv2uZajTesvIhU0=;
 b=RQHBCrYCtQsu0M3C0F6RiZqqSpH7VJa33IIujbF5g57pf5TxIAiV0JW0fYdOYEKQSk
 N5vhs3PEcbikQXJO1k5VTgO1idXA9NoxG1v2OTStIaoZ4OBUVprtACFBjCNlxPoMoWCD
 E1m0R5z0u2kzvc7Zrc6NWoePhfcqjYSH53n/LQP1Hf5yK4RKL10La3I/s0t5k3EugGhw
 3g1sJfeMvc7lG8sLUyqgcdcSRM2UyMHgu/O5kEzIdrBMfPJlbr9T/odDjwEdKM3Pb0Uc
 BhZP6cN6hSDSqK08SirrknDCSd5Q4Q7j1ma02rXV1FQPPEsjHYfiNY7baFDlMgpa82D2
 NI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lBrJ3eDJZ8uMLJgUagw2CEXXlwJGOv2uZajTesvIhU0=;
 b=W04OZhbiye/Mz0W9Msus8butTVgrY1iJX2VMprv/G0WEEkgHOcJDqaVWe/f6l4ZqA1
 jXDkPtLsBL1t8j1xV3uXzZtrurjBElOVQYS+BlLZZfDAIHlmR7RLSKYyh/K7ssAbKs7v
 iMBMpLCZpyEBGOO78oAyR7CeDwPMNL2Or1320qIazgWhr6s0JoIepHdauYiZ9bqjguJA
 WfdkN/uRIk4yBlGCc+ysvR/OmcnJUqegYpqMDTPP28GapZ2fFJ2UEF11crFuFhXEWQfQ
 9hPjmTOB5vnZ4Oqa/01c2EhlO9GHAT0yJB1KCf+0AxYLcwvlAtbcWiJKU00zy0pLeOOQ
 6NVw==
X-Gm-Message-State: AOAM5312lqj6DDaNmQhi/w0h+zLI6RK7kGZtlkJJSTVuzdXRHW2R89Of
 Dt5Iu5s7ZeFcjdsAHVDZUJY2Bpah1Lw=
X-Google-Smtp-Source: ABdhPJzkU/kM/v3KE9D9Nl++a3e7n/YeCVw4QlcxPG/rNQIbZxniFMxk2dXPg5/6PPsGhb3ytgWv7g==
X-Received: by 2002:a17:90b:291:: with SMTP id
 az17mr11823382pjb.2.1630082066085; 
 Fri, 27 Aug 2021 09:34:26 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (220-244-72-10.tpgi.com.au. [220.244.72.10])
 by smtp.gmail.com with ESMTPSA id u24sm7083852pfm.85.2021.08.27.09.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 09:34:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 4/6] powerpc/64s: Make hash MMU code build configurable
Date: Sat, 28 Aug 2021 02:34:08 +1000
Message-Id: <20210827163410.1177154-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210827163410.1177154-1-npiggin@gmail.com>
References: <20210827163410.1177154-1-npiggin@gmail.com>
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

Introduce a new option CONFIG_PPC_64S_HASH_MMU which allows the 64s hash
MMU code to be compiled out if radix is selected and the minimum
supported CPU type is POWER9 or higher, and KVM is not selected.

This saves 128kB kernel image size (90kB text) on powernv_defconfig
minus KVM, 350kB on pseries_defconfig minus KVM, 40kB on a tiny config.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/include/asm/book3s/64/mmu.h      | 22 +++++-
 .../include/asm/book3s/64/tlbflush-hash.h     |  7 ++
 arch/powerpc/include/asm/book3s/pgtable.h     |  4 ++
 arch/powerpc/include/asm/mmu.h                | 38 +++++++++--
 arch/powerpc/include/asm/mmu_context.h        |  2 +
 arch/powerpc/include/asm/paca.h               |  8 +++
 arch/powerpc/kernel/asm-offsets.c             |  2 +
 arch/powerpc/kernel/dt_cpu_ftrs.c             | 10 ++-
 arch/powerpc/kernel/entry_64.S                |  4 +-
 arch/powerpc/kernel/exceptions-64s.S          | 16 +++++
 arch/powerpc/kernel/mce.c                     |  2 +-
 arch/powerpc/kernel/mce_power.c               | 10 ++-
 arch/powerpc/kernel/paca.c                    | 18 ++---
 arch/powerpc/kernel/process.c                 | 13 ++--
 arch/powerpc/kernel/prom.c                    |  2 +
 arch/powerpc/kernel/setup_64.c                |  4 ++
 arch/powerpc/kexec/core_64.c                  |  4 +-
 arch/powerpc/kexec/ranges.c                   |  4 ++
 arch/powerpc/kvm/Kconfig                      |  1 +
 arch/powerpc/mm/book3s64/Makefile             | 17 +++--
 arch/powerpc/mm/book3s64/hash_pgtable.c       |  1 -
 arch/powerpc/mm/book3s64/hash_utils.c         | 10 ---
 .../{hash_hugetlbpage.c => hugetlbpage.c}     |  6 ++
 arch/powerpc/mm/book3s64/mmu_context.c        | 16 +++++
 arch/powerpc/mm/book3s64/pgtable.c            | 22 +++++-
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  4 ++
 arch/powerpc/mm/book3s64/slb.c                | 16 -----
 arch/powerpc/mm/copro_fault.c                 |  2 +
 arch/powerpc/mm/fault.c                       | 17 +++++
 arch/powerpc/mm/pgtable.c                     | 10 ++-
 arch/powerpc/platforms/Kconfig.cputype        | 20 +++++-
 arch/powerpc/platforms/cell/Kconfig           |  1 +
 arch/powerpc/platforms/maple/Kconfig          |  1 +
 arch/powerpc/platforms/microwatt/Kconfig      |  2 +-
 arch/powerpc/platforms/pasemi/Kconfig         |  1 +
 arch/powerpc/platforms/powermac/Kconfig       |  1 +
 arch/powerpc/platforms/powernv/Kconfig        |  2 +-
 arch/powerpc/platforms/powernv/idle.c         |  2 +
 arch/powerpc/platforms/powernv/setup.c        |  2 +
 arch/powerpc/platforms/pseries/lpar.c         | 68 ++++++++++---------
 arch/powerpc/platforms/pseries/lparcfg.c      |  2 +-
 arch/powerpc/platforms/pseries/mobility.c     |  6 ++
 arch/powerpc/platforms/pseries/ras.c          |  4 ++
 arch/powerpc/platforms/pseries/reconfig.c     |  2 +
 arch/powerpc/platforms/pseries/setup.c        |  6 +-
 arch/powerpc/xmon/xmon.c                      |  8 ++-
 47 files changed, 310 insertions(+), 111 deletions(-)
 rename arch/powerpc/mm/book3s64/{hash_hugetlbpage.c => hugetlbpage.c} (95%)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d01e3401581d..db4e0efd229b 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -940,6 +940,7 @@ config PPC_MEM_KEYS
 	prompt "PowerPC Memory Protection Keys"
 	def_bool y
 	depends on PPC_BOOK3S_64
+	depends on PPC_64S_HASH_MMU
 	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_HAS_PKEYS
 	help
diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index c02f42d1031e..857dc88b0043 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -98,7 +98,9 @@ typedef struct {
 		 * from EA and new context ids to build the new VAs.
 		 */
 		mm_context_id_t id;
+#ifdef CONFIG_PPC_64S_HASH_MMU
 		mm_context_id_t extended_id[TASK_SIZE_USER64/TASK_CONTEXT_SIZE];
+#endif
 	};
 
 	/* Number of bits in the mm_cpumask */
@@ -110,7 +112,9 @@ typedef struct {
 	/* Number of user space windows opened in process mm_context */
 	atomic_t vas_windows;
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	struct hash_mm_context *hash_context;
+#endif
 
 	void __user *vdso;
 	/*
@@ -133,6 +137,7 @@ typedef struct {
 #endif
 } mm_context_t;
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 static inline u16 mm_ctx_user_psize(mm_context_t *ctx)
 {
 	return ctx->hash_context->user_psize;
@@ -187,11 +192,22 @@ static inline struct subpage_prot_table *mm_ctx_subpage_prot(mm_context_t *ctx)
 }
 #endif
 
+#endif
+
 /*
  * The current system page and segment sizes
  */
-extern int mmu_linear_psize;
+#if defined(CONFIG_PPC_RADIX_MMU) && !defined(CONFIG_PPC_64S_HASH_MMU)
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
@@ -228,6 +244,7 @@ extern void hash__setup_initial_memory_limit(phys_addr_t first_memblock_base,
 static inline void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 					      phys_addr_t first_memblock_size)
 {
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	/*
 	 * Hash has more strict restrictions. At this point we don't
 	 * know which translations we will pick. Hence go with hash
@@ -235,6 +252,7 @@ static inline void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 	 */
 	return hash__setup_initial_memory_limit(first_memblock_base,
 					   first_memblock_size);
+#endif
 }
 
 #ifdef CONFIG_PPC_PSERIES
@@ -255,6 +273,7 @@ static inline void radix_init_pseries(void) { }
 void cleanup_cpu_mmu_context(void);
 #endif
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 static inline int get_user_context(mm_context_t *ctx, unsigned long ea)
 {
 	int index = ea >> MAX_EA_BITS_PER_CONTEXT;
@@ -274,6 +293,7 @@ static inline unsigned long get_user_vsid(mm_context_t *ctx,
 
 	return get_vsid(context, ea, ssize);
 }
+#endif
 
 #endif /* __ASSEMBLY__ */
 #endif /* _ASM_POWERPC_BOOK3S_64_MMU_H_ */
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index 3b95769739c7..06f4bd09eecf 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -112,8 +112,15 @@ static inline void hash__flush_tlb_kernel_range(unsigned long start,
 
 struct mmu_gather;
 extern void hash__tlb_flush(struct mmu_gather *tlb);
+extern void flush_tlb_pmd_range(struct mm_struct *mm, pmd_t *pmd,
+				unsigned long addr);
+
+#ifdef CONFIG_PPC_64S_HASH_MMU
 /* Private function for use by PCI IO mapping code */
 extern void __flush_hash_table_range(unsigned long start, unsigned long end);
 extern void flush_tlb_pmd_range(struct mm_struct *mm, pmd_t *pmd,
 				unsigned long addr);
+#else
+static inline void __flush_hash_table_range(unsigned long start, unsigned long end) { }
+#endif
 #endif /*  _ASM_POWERPC_BOOK3S_64_TLBFLUSH_HASH_H */
diff --git a/arch/powerpc/include/asm/book3s/pgtable.h b/arch/powerpc/include/asm/book3s/pgtable.h
index ad130e15a126..815f52c23579 100644
--- a/arch/powerpc/include/asm/book3s/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/pgtable.h
@@ -25,6 +25,7 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 				     unsigned long size, pgprot_t vma_prot);
 #define __HAVE_PHYS_MEM_ACCESS_PROT
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 /*
  * This gets called at the end of handling a page fault, when
  * the kernel has put a new PTE into the page table for the process.
@@ -35,6 +36,9 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
  * waiting for the inevitable extra hash-table miss exception.
  */
 void update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep);
+#else
+static inline void update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep) {}
+#endif
 
 #endif /* __ASSEMBLY__ */
 #endif
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 27016b98ecb2..f46217af74bf 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -157,7 +157,7 @@ DECLARE_PER_CPU(int, next_tlbcam_idx);
 
 enum {
 	MMU_FTRS_POSSIBLE =
-#if defined(CONFIG_PPC_BOOK3S_64) || defined(CONFIG_PPC_BOOK3S_604)
+#if defined(CONFIG_PPC_BOOK3S_604)
 		MMU_FTR_HPTE_TABLE |
 #endif
 #ifdef CONFIG_PPC_8xx
@@ -184,23 +184,29 @@ enum {
 		MMU_FTR_USE_TLBRSRV | MMU_FTR_USE_PAIRED_MAS |
 #endif
 #ifdef CONFIG_PPC_BOOK3S_64
+		MMU_FTR_KERNEL_RO |
+#ifdef CONFIG_PPC_64S_HASH_MMU
 		MMU_FTR_NO_SLBIE_B | MMU_FTR_16M_PAGE | MMU_FTR_TLBIEL |
 		MMU_FTR_LOCKLESS_TLBIE | MMU_FTR_CI_LARGE_PAGE |
 		MMU_FTR_1T_SEGMENT | MMU_FTR_TLBIE_CROP_VA |
-		MMU_FTR_KERNEL_RO | MMU_FTR_68_BIT_VA |
+		MMU_FTR_68_BIT_VA |
+#endif
 #endif
 #ifdef CONFIG_PPC_RADIX_MMU
 		MMU_FTR_TYPE_RADIX |
 		MMU_FTR_GTSE |
 #endif /* CONFIG_PPC_RADIX_MMU */
+#ifdef CONFIG_PPC_64S_HASH_MMU
+		MMU_FTR_HPTE_TABLE |
+#endif /* CONFIG_PPC_64S_HASH_MMU */
 #ifdef CONFIG_PPC_KUAP
-	MMU_FTR_BOOK3S_KUAP |
+		MMU_FTR_BOOK3S_KUAP |
 #endif /* CONFIG_PPC_KUAP */
 #ifdef CONFIG_PPC_MEM_KEYS
-	MMU_FTR_PKEY |
+		MMU_FTR_PKEY |
 #endif
 #ifdef CONFIG_PPC_KUEP
-	MMU_FTR_BOOK3S_KUEP |
+		MMU_FTR_BOOK3S_KUEP |
 #endif /* CONFIG_PPC_KUAP */
 
 		0,
@@ -324,6 +330,7 @@ static inline void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
 }
 #endif /* !CONFIG_DEBUG_VM */
 
+#if defined(CONFIG_PPC_RADIX_MMU) && defined(CONFIG_PPC_64S_HASH_MMU)
 static inline bool radix_enabled(void)
 {
 	return mmu_has_feature(MMU_FTR_TYPE_RADIX);
@@ -333,6 +340,27 @@ static inline bool early_radix_enabled(void)
 {
 	return early_mmu_has_feature(MMU_FTR_TYPE_RADIX);
 }
+#elif defined(CONFIG_PPC_64S_HASH_MMU)
+static inline bool radix_enabled(void)
+{
+	return false;
+}
+
+static inline bool early_radix_enabled(void)
+{
+	return false;
+}
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
+#endif
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
 static inline bool strict_kernel_rwx_enabled(void)
diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index 9ba6b585337f..e46394d27785 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -75,6 +75,7 @@ extern void hash__reserve_context_id(int id);
 extern void __destroy_context(int context_id);
 static inline void mmu_context_init(void) { }
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 static inline int alloc_extended_context(struct mm_struct *mm,
 					 unsigned long ea)
 {
@@ -100,6 +101,7 @@ static inline bool need_extra_context(struct mm_struct *mm, unsigned long ea)
 		return true;
 	return false;
 }
+#endif
 
 #else
 extern void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next,
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index dc05a862e72a..295573a82c66 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -97,7 +97,9 @@ struct paca_struct {
 					/* this becomes non-zero. */
 	u8 kexec_state;		/* set when kexec down has irqs off */
 #ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	struct slb_shadow *slb_shadow_ptr;
+#endif
 	struct dtl_entry *dispatch_log;
 	struct dtl_entry *dispatch_log_end;
 #endif
@@ -110,6 +112,7 @@ struct paca_struct {
 	/* used for most interrupts/exceptions */
 	u64 exgen[EX_SIZE] __attribute__((aligned(0x80)));
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	/* SLB related definitions */
 	u16 vmalloc_sllp;
 	u8 slb_cache_ptr;
@@ -120,6 +123,7 @@ struct paca_struct {
 	u32 slb_used_bitmap;		/* Bitmaps for first 32 SLB entries. */
 	u32 slb_kern_bitmap;
 	u32 slb_cache[SLB_CACHE_ENTRIES];
+#endif
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
 #ifdef CONFIG_PPC_BOOK3E
@@ -149,6 +153,7 @@ struct paca_struct {
 #endif /* CONFIG_PPC_BOOK3E */
 
 #ifdef CONFIG_PPC_BOOK3S
+#ifdef CONFIG_PPC_64S_HASH_MMU
 #ifdef CONFIG_PPC_MM_SLICES
 	unsigned char mm_ctx_low_slices_psize[BITS_PER_LONG / BITS_PER_BYTE];
 	unsigned char mm_ctx_high_slices_psize[SLICE_ARRAY_SIZE];
@@ -156,6 +161,7 @@ struct paca_struct {
 	u16 mm_ctx_user_psize;
 	u16 mm_ctx_sllp;
 #endif
+#endif
 #endif
 
 	/*
@@ -268,9 +274,11 @@ struct paca_struct {
 #endif /* CONFIG_PPC_PSERIES */
 
 #ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	/* Capture SLB related old contents in MCE handler. */
 	struct slb_entry *mce_faulty_slbs;
 	u16 slb_save_cache_ptr;
+#endif
 #endif /* CONFIG_PPC_BOOK3S_64 */
 #ifdef CONFIG_STACKPROTECTOR
 	unsigned long canary;
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index a47eefa09bcb..70b02241fc9d 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -220,10 +220,12 @@ int main(void)
 	OFFSET(PACA_EXGEN, paca_struct, exgen);
 	OFFSET(PACA_EXMC, paca_struct, exmc);
 	OFFSET(PACA_EXNMI, paca_struct, exnmi);
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	OFFSET(PACA_SLBSHADOWPTR, paca_struct, slb_shadow_ptr);
 	OFFSET(SLBSHADOW_STACKVSID, slb_shadow, save_area[SLB_NUM_BOLTED - 1].vsid);
 	OFFSET(SLBSHADOW_STACKESID, slb_shadow, save_area[SLB_NUM_BOLTED - 1].esid);
 	OFFSET(SLBSHADOW_SAVEAREA, slb_shadow, save_area);
+#endif
 	OFFSET(LPPACA_PMCINUSE, lppaca, pmcregs_in_use);
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	OFFSET(PACA_PMCINUSE, paca_struct, pmcregs_in_use);
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 358aee7c2d79..0fddb74b1041 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -269,6 +269,7 @@ static int __init feat_enable_idle_stop(struct dt_cpu_feature *f)
 
 static int __init feat_enable_mmu_hash(struct dt_cpu_feature *f)
 {
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	u64 lpcr;
 
 	lpcr = mfspr(SPRN_LPCR);
@@ -284,10 +285,13 @@ static int __init feat_enable_mmu_hash(struct dt_cpu_feature *f)
 	cur_cpu_spec->cpu_user_features |= PPC_FEATURE_HAS_MMU;
 
 	return 1;
+#endif
+	return 0;
 }
 
 static int __init feat_enable_mmu_hash_v3(struct dt_cpu_feature *f)
 {
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	u64 lpcr;
 
 	lpcr = mfspr(SPRN_LPCR);
@@ -298,14 +302,18 @@ static int __init feat_enable_mmu_hash_v3(struct dt_cpu_feature *f)
 	cur_cpu_spec->cpu_user_features |= PPC_FEATURE_HAS_MMU;
 
 	return 1;
+#endif
+	return 0;
 }
 
 
 static int __init feat_enable_mmu_radix(struct dt_cpu_feature *f)
 {
+#ifdef CONFIG_PPC_64S_HASH_MMU
+	cur_cpu_spec->mmu_features |= MMU_FTRS_HASH_BASE;
+#endif
 #ifdef CONFIG_PPC_RADIX_MMU
 	cur_cpu_spec->mmu_features |= MMU_FTR_TYPE_RADIX;
-	cur_cpu_spec->mmu_features |= MMU_FTRS_HASH_BASE;
 	cur_cpu_spec->mmu_features |= MMU_FTR_GTSE;
 	cur_cpu_spec->cpu_user_features |= PPC_FEATURE_HAS_MMU;
 
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 15720f8661a1..a6d063a914c5 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -180,7 +180,7 @@ _GLOBAL(_switch)
 #endif
 
 	ld	r8,KSP(r4)	/* new stack pointer */
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 BEGIN_MMU_FTR_SECTION
 	b	2f
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
@@ -232,7 +232,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	slbmte	r7,r0
 	isync
 2:
-#endif /* CONFIG_PPC_BOOK3S_64 */
+#endif /* CONFIG_PPC_64S_HASH_MMU */
 
 	clrrdi	r7, r8, THREAD_SHIFT	/* base of new stack */
 	/* Note: this uses SWITCH_FRAME_SIZE rather than INT_FRAME_SIZE
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 4aec59a77d4c..dc6c0254d73a 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1364,11 +1364,15 @@ EXC_COMMON_BEGIN(data_access_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	andis.	r0,r4,DSISR_DABRMATCH@h
 	bne-	1f
+#ifdef CONFIG_PPC_64S_HASH_MMU
 BEGIN_MMU_FTR_SECTION
 	bl	do_hash_fault
 MMU_FTR_SECTION_ELSE
 	bl	do_page_fault
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
+#else
+	bl	do_page_fault
+#endif
 	b	interrupt_return_srr
 
 1:	bl	do_break
@@ -1411,6 +1415,7 @@ EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
 EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
 EXC_COMMON_BEGIN(data_access_slb_common)
 	GEN_COMMON data_access_slb
+#ifdef CONFIG_PPC_64S_HASH_MMU
 BEGIN_MMU_FTR_SECTION
 	/* HPT case, do SLB fault */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -1423,6 +1428,9 @@ MMU_FTR_SECTION_ELSE
 	/* Radix case, access is outside page table range */
 	li	r3,-EFAULT
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
+#else
+	li	r3,-EFAULT
+#endif
 	std	r3,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
@@ -1457,11 +1465,15 @@ EXC_VIRT_END(instruction_access, 0x4400, 0x80)
 EXC_COMMON_BEGIN(instruction_access_common)
 	GEN_COMMON instruction_access
 	addi	r3,r1,STACK_FRAME_OVERHEAD
+#ifdef CONFIG_PPC_64S_HASH_MMU
 BEGIN_MMU_FTR_SECTION
 	bl	do_hash_fault
 MMU_FTR_SECTION_ELSE
 	bl	do_page_fault
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
+#else
+	bl	do_page_fault
+#endif
 	b	interrupt_return_srr
 
 
@@ -1491,6 +1503,7 @@ EXC_VIRT_BEGIN(instruction_access_slb, 0x4480, 0x80)
 EXC_VIRT_END(instruction_access_slb, 0x4480, 0x80)
 EXC_COMMON_BEGIN(instruction_access_slb_common)
 	GEN_COMMON instruction_access_slb
+#ifdef CONFIG_PPC_64S_HASH_MMU
 BEGIN_MMU_FTR_SECTION
 	/* HPT case, do SLB fault */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -1503,6 +1516,9 @@ MMU_FTR_SECTION_ELSE
 	/* Radix case, access is outside page table range */
 	li	r3,-EFAULT
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
+#else
+	li	r3,-EFAULT
+#endif
 	std	r3,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 47a683cd00d2..8265d7908dd8 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -573,7 +573,7 @@ void machine_check_print_event_info(struct machine_check_event *evt,
 		mc_error_class[evt->error_class] : "Unknown";
 	printk("%sMCE: CPU%d: %s\n", level, evt->cpu, subtype);
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	/* Display faulty slb contents for SLB errors. */
 	if (evt->error_type == MCE_ERROR_TYPE_SLB && !in_guest)
 		slb_dump_contents(local_paca->mce_faulty_slbs);
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index c2f55fe7092d..dc51e154a54e 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -77,7 +77,7 @@ static bool mce_in_guest(void)
 }
 
 /* flush SLBs and reload */
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 void flush_and_reload_slb(void)
 {
 	/* Invalidate all SLBs */
@@ -99,7 +99,7 @@ void flush_and_reload_slb(void)
 
 void flush_erat(void)
 {
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	if (!early_cpu_has_feature(CPU_FTR_ARCH_300)) {
 		flush_and_reload_slb();
 		return;
@@ -114,7 +114,7 @@ void flush_erat(void)
 
 static int mce_flush(int what)
 {
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	if (what == MCE_FLUSH_SLB) {
 		flush_and_reload_slb();
 		return 1;
@@ -499,8 +499,10 @@ static int mce_handle_ierror(struct pt_regs *regs, unsigned long srr1,
 			/* attempt to correct the error */
 			switch (table[i].error_type) {
 			case MCE_ERROR_TYPE_SLB:
+#ifdef CONFIG_PPC_64S_HASH_MMU
 				if (local_paca->in_mce == 1)
 					slb_save_contents(local_paca->mce_faulty_slbs);
+#endif
 				handled = mce_flush(MCE_FLUSH_SLB);
 				break;
 			case MCE_ERROR_TYPE_ERAT:
@@ -588,8 +590,10 @@ static int mce_handle_derror(struct pt_regs *regs,
 			/* attempt to correct the error */
 			switch (table[i].error_type) {
 			case MCE_ERROR_TYPE_SLB:
+#ifdef CONFIG_PPC_64S_HASH_MMU
 				if (local_paca->in_mce == 1)
 					slb_save_contents(local_paca->mce_faulty_slbs);
+#endif
 				if (mce_flush(MCE_FLUSH_SLB))
 					handled = 1;
 				break;
diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index 9bd30cac852b..813930374d24 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -139,8 +139,7 @@ static struct lppaca * __init new_lppaca(int cpu, unsigned long limit)
 }
 #endif /* CONFIG_PPC_PSERIES */
 
-#ifdef CONFIG_PPC_BOOK3S_64
-
+#ifdef CONFIG_PPC_64S_HASH_MMU
 /*
  * 3 persistent SLBs are allocated here.  The buffer will be zero
  * initially, hence will all be invaild until we actually write them.
@@ -169,8 +168,7 @@ static struct slb_shadow * __init new_slb_shadow(int cpu, unsigned long limit)
 
 	return s;
 }
-
-#endif /* CONFIG_PPC_BOOK3S_64 */
+#endif /* CONFIG_PPC_64S_HASH_MMU */
 
 #ifdef CONFIG_PPC_PSERIES
 /**
@@ -226,7 +224,7 @@ void __init initialise_paca(struct paca_struct *new_paca, int cpu)
 	new_paca->kexec_state = KEXEC_STATE_NONE;
 	new_paca->__current = &init_task;
 	new_paca->data_offset = 0xfeeeeeeeeeeeeeeeULL;
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	new_paca->slb_shadow_ptr = NULL;
 #endif
 
@@ -307,7 +305,7 @@ void __init allocate_paca(int cpu)
 #ifdef CONFIG_PPC_PSERIES
 	paca->lppaca_ptr = new_lppaca(cpu, limit);
 #endif
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	paca->slb_shadow_ptr = new_slb_shadow(cpu, limit);
 #endif
 #ifdef CONFIG_PPC_PSERIES
@@ -328,7 +326,7 @@ void __init free_unused_pacas(void)
 	paca_nr_cpu_ids = nr_cpu_ids;
 	paca_ptrs_size = new_ptrs_size;
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	if (early_radix_enabled()) {
 		/* Ugly fixup, see new_slb_shadow() */
 		memblock_free(__pa(paca_ptrs[boot_cpuid]->slb_shadow_ptr),
@@ -341,9 +339,9 @@ void __init free_unused_pacas(void)
 			paca_ptrs_size + paca_struct_size, nr_cpu_ids);
 }
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 void copy_mm_to_paca(struct mm_struct *mm)
 {
-#ifdef CONFIG_PPC_BOOK3S
 	mm_context_t *context = &mm->context;
 
 #ifdef CONFIG_PPC_MM_SLICES
@@ -356,7 +354,5 @@ void copy_mm_to_paca(struct mm_struct *mm)
 	get_paca()->mm_ctx_user_psize = context->user_psize;
 	get_paca()->mm_ctx_sllp = context->sllp;
 #endif
-#else /* !CONFIG_PPC_BOOK3S */
-	return;
-#endif
 }
+#endif /* CONFIG_PPC_64S_HASH_MMU */
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 185beb290580..718cc3153da0 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1206,7 +1206,7 @@ struct task_struct *__switch_to(struct task_struct *prev,
 {
 	struct thread_struct *new_thread, *old_thread;
 	struct task_struct *last;
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	struct ppc64_tlb_batch *batch;
 #endif
 
@@ -1215,7 +1215,7 @@ struct task_struct *__switch_to(struct task_struct *prev,
 
 	WARN_ON(!irqs_disabled());
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	batch = this_cpu_ptr(&ppc64_tlb_batch);
 	if (batch->active) {
 		current_thread_info()->local_flags |= _TLF_LAZY_MMU;
@@ -1294,6 +1294,7 @@ struct task_struct *__switch_to(struct task_struct *prev,
 	 */
 
 #ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	/*
 	 * This applies to a process that was context switched while inside
 	 * arch_enter_lazy_mmu_mode(), to re-activate the batch that was
@@ -1305,6 +1306,7 @@ struct task_struct *__switch_to(struct task_struct *prev,
 		batch = this_cpu_ptr(&ppc64_tlb_batch);
 		batch->active = 1;
 	}
+#endif
 
 	/*
 	 * Math facilities are masked out of the child MSR in copy_thread.
@@ -1655,7 +1657,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 
 static void setup_ksp_vsid(struct task_struct *p, unsigned long sp)
 {
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	unsigned long sp_vsid;
 	unsigned long llp = mmu_psize_defs[mmu_linear_psize].sllp;
 
@@ -2302,10 +2304,9 @@ unsigned long arch_randomize_brk(struct mm_struct *mm)
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
index f620e04dc9bf..ebc8871d644e 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -235,6 +235,7 @@ static void __init check_cpu_pa_features(unsigned long node)
 #ifdef CONFIG_PPC_BOOK3S_64
 static void __init init_mmu_slb_size(unsigned long node)
 {
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	const __be32 *slb_size_ptr;
 
 	slb_size_ptr = of_get_flat_dt_prop(node, "slb-size", NULL) ? :
@@ -242,6 +243,7 @@ static void __init init_mmu_slb_size(unsigned long node)
 
 	if (slb_size_ptr)
 		mmu_slb_size = be32_to_cpup(slb_size_ptr);
+#endif
 }
 #else
 #define init_mmu_slb_size(node) do { } while(0)
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 1ff258f6c76c..730bd943f7a7 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -880,6 +880,7 @@ void __init setup_per_cpu_areas(void)
 	unsigned int cpu;
 	int rc = -EINVAL;
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	/*
 	 * Linear mapping is one of 4K, 1M and 16M.  For 4K, no need
 	 * to group units.  For larger mappings, use 1M atom which
@@ -889,6 +890,9 @@ void __init setup_per_cpu_areas(void)
 		atom_size = PAGE_SIZE;
 	else
 		atom_size = 1 << 20;
+#else
+	atom_size = PAGE_SIZE;
+#endif
 
 	if (pcpu_chosen_fc != PCPU_FC_PAGE) {
 		rc = pcpu_embed_first_chunk(0, dyn_size, atom_size, pcpu_cpu_distance,
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 8a449b2d8715..a66a5c6638dd 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -374,7 +374,7 @@ void default_machine_kexec(struct kimage *image)
 	/* NOTREACHED */
 }
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 /* Values we need to export to the second kernel via the device tree. */
 static unsigned long htab_base;
 static unsigned long htab_size;
@@ -416,4 +416,4 @@ static int __init export_htab_values(void)
 	return 0;
 }
 late_initcall(export_htab_values);
-#endif /* CONFIG_PPC_BOOK3S_64 */
+#endif /* CONFIG_PPC_64S_HASH_MMU */
diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
index 6b81c852feab..92d831621fa0 100644
--- a/arch/powerpc/kexec/ranges.c
+++ b/arch/powerpc/kexec/ranges.c
@@ -306,10 +306,14 @@ int add_initrd_mem_range(struct crash_mem **mem_ranges)
  */
 int add_htab_mem_range(struct crash_mem **mem_ranges)
 {
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	if (!htab_address)
 		return 0;
 
 	return add_mem_range(mem_ranges, __pa(htab_address), htab_size_bytes);
+#else
+	return 0;
+#endif
 }
 #endif
 
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index e45644657d49..4ca2f0491e15 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -70,6 +70,7 @@ config KVM_BOOK3S_64
 	select KVM_BOOK3S_64_HANDLER
 	select KVM
 	select KVM_BOOK3S_PR_POSSIBLE if !KVM_BOOK3S_HV_POSSIBLE
+	select PPC_64S_HASH_MMU
 	select SPAPR_TCE_IOMMU if IOMMU_SUPPORT && (PPC_PSERIES || PPC_POWERNV)
 	help
 	  Support running unmodified book3s_64 and book3s_32 guest kernels
diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
index 319f4b7f3357..9a474188f48f 100644
--- a/arch/powerpc/mm/book3s64/Makefile
+++ b/arch/powerpc/mm/book3s64/Makefile
@@ -2,20 +2,23 @@
 
 ccflags-y	:= $(NO_MINIMAL_TOC)
 
+obj-y				+= mmu_context.o pgtable.o
+ifdef CONFIG_PPC_64S_HASH_MMU
 CFLAGS_REMOVE_slb.o = $(CC_FLAGS_FTRACE)
-
-obj-y				+= hash_pgtable.o hash_utils.o slb.o \
-				   mmu_context.o pgtable.o hash_tlb.o
+obj-y				+= hash_pgtable.o hash_utils.o hash_tlb.o slb.o
 obj-$(CONFIG_PPC_HASH_MMU_NATIVE)	+= hash_native.o
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
 obj-$(CONFIG_PPC_PKEY)	+= pkeys.o
 
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index ad5eff097d31..7ce8914992e3 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -16,7 +16,6 @@
 
 #include <mm/mmu_decl.h>
 
-#define CREATE_TRACE_POINTS
 #include <trace/events/thp.h>
 
 #if H_PGTABLE_RANGE > (USER_VSID_RANGE * (TASK_SIZE_USER64 / TASK_CONTEXT_SIZE))
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 43c05cdbba73..b3c82975358d 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -99,8 +99,6 @@
  */
 
 static unsigned long _SDR1;
-struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT];
-EXPORT_SYMBOL_GPL(mmu_psize_defs);
 
 u8 hpte_page_sizes[1 << LP_BITS];
 EXPORT_SYMBOL_GPL(hpte_page_sizes);
@@ -109,15 +107,7 @@ struct hash_pte *htab_address;
 unsigned long htab_size_bytes;
 unsigned long htab_hash_mask;
 EXPORT_SYMBOL_GPL(htab_hash_mask);
-int mmu_linear_psize = MMU_PAGE_4K;
-EXPORT_SYMBOL_GPL(mmu_linear_psize);
 int mmu_virtual_psize = MMU_PAGE_4K;
-int mmu_vmalloc_psize = MMU_PAGE_4K;
-EXPORT_SYMBOL_GPL(mmu_vmalloc_psize);
-#ifdef CONFIG_SPARSEMEM_VMEMMAP
-int mmu_vmemmap_psize = MMU_PAGE_4K;
-#endif
-int mmu_io_psize = MMU_PAGE_4K;
 int mmu_kernel_ssize = MMU_SEGSIZE_256M;
 EXPORT_SYMBOL_GPL(mmu_kernel_ssize);
 int mmu_highuser_ssize = MMU_SEGSIZE_256M;
diff --git a/arch/powerpc/mm/book3s64/hash_hugetlbpage.c b/arch/powerpc/mm/book3s64/hugetlbpage.c
similarity index 95%
rename from arch/powerpc/mm/book3s64/hash_hugetlbpage.c
rename to arch/powerpc/mm/book3s64/hugetlbpage.c
index a688e1324ae5..d185c14802aa 100644
--- a/arch/powerpc/mm/book3s64/hash_hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/hugetlbpage.c
@@ -16,6 +16,11 @@
 unsigned int hpage_shift;
 EXPORT_SYMBOL(hpage_shift);
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
+extern long hpte_insert_repeating(unsigned long hash, unsigned long vpn,
+				  unsigned long pa, unsigned long rlags,
+				  unsigned long vflags, int psize, int ssize);
+
 int __hash_page_huge(unsigned long ea, unsigned long access, unsigned long vsid,
 		     pte_t *ptep, unsigned long trap, unsigned long flags,
 		     int ssize, unsigned int shift, unsigned int mmu_psize)
@@ -122,6 +127,7 @@ int __hash_page_huge(unsigned long ea, unsigned long access, unsigned long vsid,
 	*ptep = __pte(new_pte & ~H_PAGE_BUSY);
 	return 0;
 }
+#endif
 
 pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma,
 				  unsigned long addr, pte_t *ptep)
diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
index c10fc8a72fb3..642cabc25e99 100644
--- a/arch/powerpc/mm/book3s64/mmu_context.c
+++ b/arch/powerpc/mm/book3s64/mmu_context.c
@@ -31,6 +31,7 @@ static int alloc_context_id(int min_id, int max_id)
 	return ida_alloc_range(&mmu_context_ida, min_id, max_id, GFP_KERNEL);
 }
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 void hash__reserve_context_id(int id)
 {
 	int result = ida_alloc_range(&mmu_context_ida, id, id, GFP_KERNEL);
@@ -50,7 +51,9 @@ int hash__alloc_context_id(void)
 	return alloc_context_id(MIN_USER_CONTEXT, max);
 }
 EXPORT_SYMBOL_GPL(hash__alloc_context_id);
+#endif
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 static int realloc_context_ids(mm_context_t *ctx)
 {
 	int i, id;
@@ -144,12 +147,15 @@ static int hash__init_new_context(struct mm_struct *mm)
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
@@ -175,7 +181,9 @@ static int radix__init_new_context(struct mm_struct *mm)
 	 */
 	asm volatile("ptesync;isync" : : : "memory");
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	mm->context.hash_context = NULL;
+#endif
 
 	return index;
 }
@@ -186,8 +194,10 @@ int init_new_context(struct task_struct *tsk, struct mm_struct *mm)
 
 	if (radix_enabled())
 		index = radix__init_new_context(mm);
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	else
 		index = hash__init_new_context(mm);
+#endif
 
 	if (index < 0)
 		return index;
@@ -211,6 +221,7 @@ void __destroy_context(int context_id)
 }
 EXPORT_SYMBOL_GPL(__destroy_context);
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 static void destroy_contexts(mm_context_t *ctx)
 {
 	int index, context_id;
@@ -222,6 +233,7 @@ static void destroy_contexts(mm_context_t *ctx)
 	}
 	kfree(ctx->hash_context);
 }
+#endif
 
 static void pmd_frag_destroy(void *pmd_frag)
 {
@@ -274,7 +286,11 @@ void destroy_context(struct mm_struct *mm)
 		process_tb[mm->context.id].prtb0 = 0;
 	else
 		subpage_prot_free(mm);
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	destroy_contexts(&mm->context);
+#else
+	ida_free(&mmu_context_ida, mm->context.id);
+#endif
 	mm->context.id = MMU_NO_CONTEXT;
 }
 
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 9ffa65074cb0..354023f337f7 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -11,17 +11,29 @@
 #include <asm/debugfs.h>
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
-#include <asm/trace.h>
 #include <asm/powernv.h>
 #include <asm/firmware.h>
 #include <asm/ultravisor.h>
 #include <asm/kexec.h>
 
 #include <mm/mmu_decl.h>
+#define CREATE_TRACE_POINTS
 #include <trace/events/thp.h>
 
 #include "internal.h"
 
+struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT];
+EXPORT_SYMBOL_GPL(mmu_psize_defs);
+
+int mmu_linear_psize = MMU_PAGE_4K;
+EXPORT_SYMBOL_GPL(mmu_linear_psize);
+int mmu_vmalloc_psize = MMU_PAGE_4K;
+EXPORT_SYMBOL_GPL(mmu_vmalloc_psize);
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+int mmu_vmemmap_psize = MMU_PAGE_4K;
+#endif
+int mmu_io_psize = MMU_PAGE_4K;
+
 unsigned long __pmd_frag_nr;
 EXPORT_SYMBOL(__pmd_frag_nr);
 unsigned long __pmd_frag_size_shift;
@@ -234,7 +246,13 @@ static void flush_partition(unsigned int lpid, bool radix)
 			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
 		/* do we need fixup here ?*/
 		asm volatile("eieio; tlbsync; ptesync" : : : "memory");
-		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 0);
+		/*
+		 * trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 0);
+		 *
+		 * Can't use this tracepoint because this file defines the THP
+		 * tracepoints. KVM tlbie tracing already has other
+		 * deficiencies, so it's not urgent.
+		 */
 	}
 }
 
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 2176a5f70746..a5d687ffcb97 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -334,8 +334,10 @@ static void __init radix_init_pgtable(void)
 	phys_addr_t start, end;
 	u64 i;
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	/* We don't support slb for radix */
 	mmu_slb_size = 0;
+#endif
 
 	/*
 	 * Create the linear mapping
@@ -588,6 +590,7 @@ void __init radix__early_init_mmu(void)
 {
 	unsigned long lpcr;
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 #ifdef CONFIG_PPC_64K_PAGES
 	/* PAGE_SIZE mappings */
 	mmu_virtual_psize = MMU_PAGE_64K;
@@ -604,6 +607,7 @@ void __init radix__early_init_mmu(void)
 		mmu_vmemmap_psize = MMU_PAGE_2M;
 	} else
 		mmu_vmemmap_psize = mmu_virtual_psize;
+#endif
 #endif
 	/*
 	 * initialize page table size
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index c91bd85eb90e..83c30b222d4a 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -868,19 +868,3 @@ DEFINE_INTERRUPT_HANDLER_RAW(do_slb_fault)
 		return err;
 	}
 }
-
-DEFINE_INTERRUPT_HANDLER(do_bad_slb_fault)
-{
-	int err = regs->result;
-
-	if (err == -EFAULT) {
-		if (user_mode(regs))
-			_exception(SIGSEGV, regs, SEGV_BNDERR, regs->dar);
-		else
-			bad_page_fault(regs, SIGSEGV);
-	} else if (err == -EINVAL) {
-		unrecoverable_exception(regs);
-	} else {
-		BUG();
-	}
-}
diff --git a/arch/powerpc/mm/copro_fault.c b/arch/powerpc/mm/copro_fault.c
index 8acd00178956..c1cb21a00884 100644
--- a/arch/powerpc/mm/copro_fault.c
+++ b/arch/powerpc/mm/copro_fault.c
@@ -82,6 +82,7 @@ int copro_handle_mm_fault(struct mm_struct *mm, unsigned long ea,
 }
 EXPORT_SYMBOL_GPL(copro_handle_mm_fault);
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 int copro_calculate_slb(struct mm_struct *mm, u64 ea, struct copro_slb *slb)
 {
 	u64 vsid, vsidkey;
@@ -146,3 +147,4 @@ void copro_flush_all_slbs(struct mm_struct *mm)
 	cxl_slbia(mm);
 }
 EXPORT_SYMBOL_GPL(copro_flush_all_slbs);
+#endif
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 34f641d4a2fe..fe10695587c0 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -35,6 +35,7 @@
 #include <linux/kfence.h>
 #include <linux/pkeys.h>
 
+#include <asm/asm-prototypes.h>
 #include <asm/firmware.h>
 #include <asm/interrupt.h>
 #include <asm/page.h>
@@ -622,4 +623,20 @@ DEFINE_INTERRUPT_HANDLER(do_bad_page_fault_segv)
 {
 	bad_page_fault(regs, SIGSEGV);
 }
+
+DEFINE_INTERRUPT_HANDLER(do_bad_slb_fault)
+{
+	int err = regs->result;
+
+	if (err == -EFAULT) {
+		if (user_mode(regs))
+			_exception(SIGSEGV, regs, SEGV_BNDERR, regs->dar);
+		else
+			bad_page_fault(regs, SIGSEGV);
+	} else if (err == -EINVAL) {
+		unrecoverable_exception(regs);
+	} else {
+		BUG();
+	}
+}
 #endif
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index cd16b407f47e..ab105d33e0b0 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -81,9 +81,6 @@ static struct page *maybe_pte_to_page(pte_t pte)
 
 static pte_t set_pte_filter_hash(pte_t pte)
 {
-	if (radix_enabled())
-		return pte;
-
 	pte = __pte(pte_val(pte) & ~_PAGE_HPTEFLAGS);
 	if (pte_looks_normal(pte) && !(cpu_has_feature(CPU_FTR_COHERENT_ICACHE) ||
 				       cpu_has_feature(CPU_FTR_NOEXECUTE))) {
@@ -112,6 +109,9 @@ static inline pte_t set_pte_filter(pte_t pte)
 {
 	struct page *pg;
 
+	if (radix_enabled())
+		return pte;
+
 	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
 		return set_pte_filter_hash(pte);
 
@@ -144,6 +144,10 @@ static pte_t set_access_flags_filter(pte_t pte, struct vm_area_struct *vma,
 {
 	struct page *pg;
 
+#ifdef CONFIG_PPC_BOOK3S_64
+	return pte;
+#endif
+
 	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
 		return pte;
 
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 0e1bb1cedd13..9b90fc501ed4 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -103,7 +103,6 @@ config PPC_BOOK3S_64
 	select ARCH_SUPPORTS_HUGETLBFS
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select IRQ_WORK
-	select PPC_MM_SLICES
 	select PPC_HAVE_KUEP
 	select PPC_HAVE_KUAP
 
@@ -128,11 +127,13 @@ choice
 config GENERIC_CPU
 	bool "Generic (POWER4 and above)"
 	depends on PPC64 && !CPU_LITTLE_ENDIAN
+	select PPC_64S_HASH_MMU
 
 config GENERIC_CPU
 	bool "Generic (POWER8 and above)"
 	depends on PPC64 && CPU_LITTLE_ENDIAN
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_64S_HASH_MMU
 
 config GENERIC_CPU
 	bool "Generic 32 bits powerpc"
@@ -141,24 +142,29 @@ config GENERIC_CPU
 config CELL_CPU
 	bool "Cell Broadband Engine"
 	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
+	select PPC_64S_HASH_MMU
 
 config POWER5_CPU
 	bool "POWER5"
 	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
+	select PPC_64S_HASH_MMU
 
 config POWER6_CPU
 	bool "POWER6"
 	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
+	select PPC_64S_HASH_MMU
 
 config POWER7_CPU
 	bool "POWER7"
 	depends on PPC_BOOK3S_64
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_64S_HASH_MMU
 
 config POWER8_CPU
 	bool "POWER8"
 	depends on PPC_BOOK3S_64
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_64S_HASH_MMU
 
 config POWER9_CPU
 	bool "POWER9"
@@ -362,6 +368,17 @@ config SPE
 
 	  If in doubt, say Y here.
 
+config PPC_64S_HASH_MMU
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
 config PPC_RADIX_MMU
 	bool "Radix MMU Support"
 	depends on PPC_BOOK3S_64
@@ -375,6 +392,7 @@ config PPC_RADIX_MMU
 config PPC_RADIX_MMU_DEFAULT
 	bool "Default to using the Radix MMU when possible"
 	depends on PPC_RADIX_MMU
+	depends on PPC_64S_HASH_MMU
 	default y
 	help
 	  When the hardware supports the Radix MMU, default to using it unless
diff --git a/arch/powerpc/platforms/cell/Kconfig b/arch/powerpc/platforms/cell/Kconfig
index db4465c51b56..faa894714a2a 100644
--- a/arch/powerpc/platforms/cell/Kconfig
+++ b/arch/powerpc/platforms/cell/Kconfig
@@ -8,6 +8,7 @@ config PPC_CELL_COMMON
 	select PPC_DCR_MMIO
 	select PPC_INDIRECT_PIO
 	select PPC_INDIRECT_MMIO
+	select PPC_64S_HASH_MMU
 	select PPC_HASH_MMU_NATIVE
 	select PPC_RTAS
 	select IRQ_EDGE_EOI_HANDLER
diff --git a/arch/powerpc/platforms/maple/Kconfig b/arch/powerpc/platforms/maple/Kconfig
index 7fd84311ade5..4c058cc57c90 100644
--- a/arch/powerpc/platforms/maple/Kconfig
+++ b/arch/powerpc/platforms/maple/Kconfig
@@ -9,6 +9,7 @@ config PPC_MAPLE
 	select GENERIC_TBSYNC
 	select PPC_UDBG_16550
 	select PPC_970_NAP
+	select PPC_64S_HASH_MMU
 	select PPC_HASH_MMU_NATIVE
 	select PPC_RTAS
 	select MMIO_NVRAM
diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
index 62b51e37fc05..823192e9d38a 100644
--- a/arch/powerpc/platforms/microwatt/Kconfig
+++ b/arch/powerpc/platforms/microwatt/Kconfig
@@ -5,7 +5,7 @@ config PPC_MICROWATT
 	select PPC_XICS
 	select PPC_ICS_NATIVE
 	select PPC_ICP_NATIVE
-	select PPC_HASH_MMU_NATIVE
+	select PPC_HASH_MMU_NATIVE if PPC_64S_HASH_MMU
 	select PPC_UDBG_16550
 	select ARCH_RANDOM
 	help
diff --git a/arch/powerpc/platforms/pasemi/Kconfig b/arch/powerpc/platforms/pasemi/Kconfig
index bc7137353a7f..85ae18ddd911 100644
--- a/arch/powerpc/platforms/pasemi/Kconfig
+++ b/arch/powerpc/platforms/pasemi/Kconfig
@@ -5,6 +5,7 @@ config PPC_PASEMI
 	select MPIC
 	select FORCE_PCI
 	select PPC_UDBG_16550
+	select PPC_64S_HASH_MMU
 	select PPC_HASH_MMU_NATIVE
 	select MPIC_BROKEN_REGREAD
 	help
diff --git a/arch/powerpc/platforms/powermac/Kconfig b/arch/powerpc/platforms/powermac/Kconfig
index 2b56df145b82..130707ec9f99 100644
--- a/arch/powerpc/platforms/powermac/Kconfig
+++ b/arch/powerpc/platforms/powermac/Kconfig
@@ -6,6 +6,7 @@ config PPC_PMAC
 	select FORCE_PCI
 	select PPC_INDIRECT_PCI if PPC32
 	select PPC_MPC106 if PPC32
+	select PPC_64S_HASH_MMU if PPC64
 	select PPC_HASH_MMU_NATIVE
 	select ZONE_DMA if PPC32
 	default y
diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
index cd754e116184..161dfe024085 100644
--- a/arch/powerpc/platforms/powernv/Kconfig
+++ b/arch/powerpc/platforms/powernv/Kconfig
@@ -2,7 +2,7 @@
 config PPC_POWERNV
 	depends on PPC64 && PPC_BOOK3S
 	bool "IBM PowerNV (Non-Virtualized) platform support"
-	select PPC_HASH_MMU_NATIVE
+	select PPC_HASH_MMU_NATIVE if PPC_64S_HASH_MMU
 	select PPC_XICS
 	select PPC_ICP_NATIVE
 	select PPC_XIVE_NATIVE
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 528a7e0cf83a..ea4c63ebd1f8 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -492,12 +492,14 @@ static unsigned long power7_idle_insn(unsigned long type)
 
 	mtspr(SPRN_SPRG3,	local_paca->sprg_vdso);
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
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
index a8db3f153063..c6dbfa2e075a 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -207,6 +207,7 @@ static void __init pnv_init(void)
 #endif
 		add_preferred_console("hvc", 0, NULL);
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	if (!radix_enabled()) {
 		size_t size = sizeof(struct slb_entry) * mmu_slb_size;
 		int i;
@@ -219,6 +220,7 @@ static void __init pnv_init(void)
 						cpu_to_node(i));
 		}
 	}
+#endif
 }
 
 static void __init pnv_init_IRQ(void)
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index dab356e3ff87..880b77ba939b 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -57,6 +57,7 @@ EXPORT_SYMBOL(plpar_hcall);
 EXPORT_SYMBOL(plpar_hcall9);
 EXPORT_SYMBOL(plpar_hcall_norets);
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 /*
  * H_BLOCK_REMOVE supported block size for this page size in segment who's base
  * page size is that page size.
@@ -65,6 +66,7 @@ EXPORT_SYMBOL(plpar_hcall_norets);
  * page size.
  */
 static int hblkrm_size[MMU_PAGE_COUNT][MMU_PAGE_COUNT] __ro_after_init;
+#endif
 
 /*
  * Due to the involved complexity, and that the current hypervisor is only
@@ -688,7 +690,7 @@ void vpa_init(int cpu)
 		return;
 	}
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	/*
 	 * PAPR says this feature is SLB-Buffer but firmware never
 	 * reports that.  All SPLPAR support SLB shadow buffer.
@@ -701,7 +703,7 @@ void vpa_init(int cpu)
 			       "cpu %d (hw %d) of area %lx failed with %ld\n",
 			       cpu, hwcpu, addr, ret);
 	}
-#endif /* CONFIG_PPC_BOOK3S_64 */
+#endif /* CONFIG_PPC_64S_HASH_MMU */
 
 	/*
 	 * Register dispatch trace log, if one has been allocated.
@@ -709,7 +711,35 @@ void vpa_init(int cpu)
 	register_dtl_buffer(cpu);
 }
 
-#ifdef CONFIG_PPC_BOOK3S_64
+static int pseries_lpar_register_process_table(unsigned long base,
+			unsigned long page_size, unsigned long table_size)
+{
+	long rc;
+	unsigned long flags = 0;
+
+	if (table_size)
+		flags |= PROC_TABLE_NEW;
+	if (radix_enabled()) {
+		flags |= PROC_TABLE_RADIX;
+		if (mmu_has_feature(MMU_FTR_GTSE))
+			flags |= PROC_TABLE_GTSE;
+	} else
+		flags |= PROC_TABLE_HPT_SLB;
+	for (;;) {
+		rc = plpar_hcall_norets(H_REGISTER_PROC_TBL, flags, base,
+					page_size, table_size);
+		if (!H_IS_LONG_BUSY(rc))
+			break;
+		mdelay(get_longbusy_msecs(rc));
+	}
+	if (rc != H_SUCCESS) {
+		pr_err("Failed to register process table (rc=%ld)\n", rc);
+		BUG();
+	}
+	return rc;
+}
+
+#ifdef CONFIG_PPC_64S_HASH_MMU
 
 static long pSeries_lpar_hpte_insert(unsigned long hpte_group,
 				     unsigned long vpn, unsigned long pa,
@@ -1676,34 +1706,6 @@ static int pseries_lpar_resize_hpt(unsigned long shift)
 	return 0;
 }
 
-static int pseries_lpar_register_process_table(unsigned long base,
-			unsigned long page_size, unsigned long table_size)
-{
-	long rc;
-	unsigned long flags = 0;
-
-	if (table_size)
-		flags |= PROC_TABLE_NEW;
-	if (radix_enabled()) {
-		flags |= PROC_TABLE_RADIX;
-		if (mmu_has_feature(MMU_FTR_GTSE))
-			flags |= PROC_TABLE_GTSE;
-	} else
-		flags |= PROC_TABLE_HPT_SLB;
-	for (;;) {
-		rc = plpar_hcall_norets(H_REGISTER_PROC_TBL, flags, base,
-					page_size, table_size);
-		if (!H_IS_LONG_BUSY(rc))
-			break;
-		mdelay(get_longbusy_msecs(rc));
-	}
-	if (rc != H_SUCCESS) {
-		pr_err("Failed to register process table (rc=%ld)\n", rc);
-		BUG();
-	}
-	return rc;
-}
-
 void __init hpte_init_pseries(void)
 {
 	mmu_hash_ops.hpte_invalidate	 = pSeries_lpar_hpte_invalidate;
@@ -1726,6 +1728,7 @@ void __init hpte_init_pseries(void)
 	if (cpu_has_feature(CPU_FTR_ARCH_300))
 		pseries_lpar_register_process_table(0, 0, 0);
 }
+#endif /* CONFIG_PPC_64S_HASH_MMU */
 
 #ifdef CONFIG_PPC_RADIX_MMU
 void radix_init_pseries(void)
@@ -1790,7 +1793,6 @@ void arch_free_page(struct page *page, int order)
 EXPORT_SYMBOL(arch_free_page);
 
 #endif /* CONFIG_PPC_SMLPAR */
-#endif /* CONFIG_PPC_BOOK3S_64 */
 
 #ifdef CONFIG_TRACEPOINTS
 #ifdef CONFIG_JUMP_LABEL
@@ -1928,6 +1930,7 @@ int h_get_mpp_x(struct hvcall_mpp_x_data *mpp_x_data)
 	return rc;
 }
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 static unsigned long vsid_unscramble(unsigned long vsid, int ssize)
 {
 	unsigned long protovsid;
@@ -1988,6 +1991,7 @@ static int __init reserve_vrma_context_id(void)
 	return 0;
 }
 machine_device_initcall(pseries, reserve_vrma_context_id);
+#endif
 
 #ifdef CONFIG_DEBUG_FS
 /* debugfs file interface for vpa data */
diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index f71eac74ea92..a0acb9e2b3c7 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -531,7 +531,7 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
 	seq_printf(m, "shared_processor_mode=%d\n",
 		   lppaca_shared_proc(get_lppaca()));
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	seq_printf(m, "slb_size=%d\n", mmu_slb_size);
 #endif
 	parse_em_data(m);
diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index e83e0891272d..aec1971e16a1 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -417,11 +417,15 @@ static void prod_others(void)
 
 static u16 clamp_slb_size(void)
 {
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	u16 prev = mmu_slb_size;
 
 	slb_set_size(SLB_MIN_SIZE);
 
 	return prev;
+#else
+	return 0;
+#endif
 }
 
 static int do_suspend(void)
@@ -446,7 +450,9 @@ static int do_suspend(void)
 	ret = rtas_ibm_suspend_me(&status);
 	if (ret != 0) {
 		pr_err("ibm,suspend-me error: %d\n", status);
+#ifdef CONFIG_PPC_64S_HASH_MMU
 		slb_set_size(saved_slb_size);
+#endif
 	}
 
 	return ret;
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 167f2e1b8d39..9286302e841c 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -526,6 +526,7 @@ static int mce_handle_err_realmode(int disposition, u8 error_type)
 			disposition = RTAS_DISP_FULLY_RECOVERED;
 			break;
 		case	MC_ERROR_TYPE_SLB:
+#ifdef CONFIG_PPC_64S_HASH_MMU
 			/*
 			 * Store the old slb content in paca before flushing.
 			 * Print this when we go to virtual mode.
@@ -537,6 +538,9 @@ static int mce_handle_err_realmode(int disposition, u8 error_type)
 			if (local_paca->in_mce == 1)
 				slb_save_contents(local_paca->mce_faulty_slbs);
 			flush_and_reload_slb();
+#else
+			flush_erat();
+#endif
 			disposition = RTAS_DISP_FULLY_RECOVERED;
 			break;
 		default:
diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/platforms/pseries/reconfig.c
index 7f7369fec46b..80dae18d6621 100644
--- a/arch/powerpc/platforms/pseries/reconfig.c
+++ b/arch/powerpc/platforms/pseries/reconfig.c
@@ -337,8 +337,10 @@ static int do_update_property(char *buf, size_t bufsize)
 	if (!newprop)
 		return -ENOMEM;
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	if (!strcmp(name, "slb-size") || !strcmp(name, "ibm,slb-size"))
 		slb_set_size(*(int *)value);
+#endif
 
 	return of_update_property(np, newprop);
 }
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 631a0d57b6cd..cf626224f6f7 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -113,7 +113,7 @@ static void __init fwnmi_init(void)
 	u8 *mce_data_buf;
 	unsigned int i;
 	int nr_cpus = num_possible_cpus();
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	struct slb_entry *slb_ptr;
 	size_t size;
 #endif
@@ -153,7 +153,7 @@ static void __init fwnmi_init(void)
 						(RTAS_ERROR_LOG_MAX * i);
 	}
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	if (!radix_enabled()) {
 		/* Allocate per cpu area to save old slb contents during MCE */
 		size = sizeof(struct slb_entry) * mmu_slb_size * nr_cpus;
@@ -799,7 +799,9 @@ static void __init pSeries_setup_arch(void)
 	fwnmi_init();
 
 	pseries_setup_security_mitigations();
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	pseries_lpar_read_hblkrm_characteristics();
+#endif
 
 	/* By default, only probe PCI (can be overridden by rtas_pci) */
 	pci_add_flags(PCI_PROBE_ONLY);
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index da4d7f225a40..95d0ecd30a2a 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1170,9 +1170,11 @@ cmds(struct pt_regs *excp)
 			show_tasks();
 			break;
 #ifdef CONFIG_PPC_BOOK3S
+#ifdef CONFIG_PPC_64S_HASH_MMU
 		case 'u':
 			dump_segments();
 			break;
+#endif
 #elif defined(CONFIG_44x)
 		case 'u':
 			dump_tlb_44x();
@@ -2618,7 +2620,7 @@ static void dump_tracing(void)
 static void dump_one_paca(int cpu)
 {
 	struct paca_struct *p;
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	int i = 0;
 #endif
 
@@ -2660,6 +2662,7 @@ static void dump_one_paca(int cpu)
 	DUMP(p, cpu_start, "%#-*x");
 	DUMP(p, kexec_state, "%#-*x");
 #ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	if (!early_radix_enabled()) {
 		for (i = 0; i < SLB_NUM_BOLTED; i++) {
 			u64 esid, vsid;
@@ -2687,6 +2690,7 @@ static void dump_one_paca(int cpu)
 				       22, "slb_cache", i, p->slb_cache[i]);
 		}
 	}
+#endif
 
 	DUMP(p, rfi_flush_fallback_area, "%-*px");
 #endif
@@ -3751,7 +3755,7 @@ static void xmon_print_symbol(unsigned long address, const char *mid,
 	printf("%s", after);
 }
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 void dump_segments(void)
 {
 	int i;
-- 
2.23.0

