Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CFB45DAA4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 14:01:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0J1261RDz3fJx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 00:01:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZzIySi0a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZzIySi0a; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Hn371kFz3cSH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 23:51:19 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id p17so5165742pgj.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 04:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jsvj+Vbti5IH80H2NKwlhtig+v3OF6NiNLoruEqpKzY=;
 b=ZzIySi0ak8IailjyQ1daCB9eY9UBChcNWBgbPIWtbGPdJgc1CG8BYr8Qx8IO4+wVYZ
 HLR6pEqBw2AsbsTUYl8I8nphWCphY6BEa7F1BaKqbuf/LXc9VPS3AFcTjFdlCZXMPfde
 zUQmYxIg/iJwycuLY/zAt5rcGeUmJKRn64MaDn0T8ne6+krMWAvjklcN03EHC+vTt0mV
 RdDr2WfOtxlhTKLH2rhN+6FVP6rVgwDv23LynypMxgd1+xNogOXXD5XZp304vP/Y37us
 vjsDCTalL8iXKV7RorYe8TxyKG4vsbP68KNucAfzXY/spbLFcZONmBuB466nKUus7RLa
 5v9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jsvj+Vbti5IH80H2NKwlhtig+v3OF6NiNLoruEqpKzY=;
 b=oYG6CAHaD7yDsKgo2PpoEdXqHmwA35nAmRQdEMNFtyhU21FXQ/osaDRfP1JefaMwV9
 PExN73Tbbg7lRQZQwlEHsYef/AhWSD7f+WyTxxq5R8/A0Vy6gNVWhXdkykhcJtP2huvD
 d8olsBWP7g8pZIHMZ3xsGNuTWc7C07LEeHKSsh2DX5pPAHgz5qX7yOMm2Jg/JXzD084U
 /I0ZHdJEJbRgMYP3ja/ioe+fqohjYIE6jfRi3tDFu0sa29hF1ipQM2kyZBUpy2/CAL+t
 VIxWxUrudHl11gfOoxn5RkKaQL6zX1UZFf5ihzf6Nci3AE/yHO9iCiju1IAwCGsHG4lT
 u9IA==
X-Gm-Message-State: AOAM5325DVuI4m5RcJy3aoUXke3P0C/meYah3z0ksN0+rQRNk5+Sa9sy
 AgNYE7eL4Ic++6txf5mICin7nS+vHXI=
X-Google-Smtp-Source: ABdhPJzUdxyGp/Xx4IEz96orTVdj4mZOLFOkSY4rhT9rFlJszqZ4KyawBcFOnlHyxoHgekW3z6eyAA==
X-Received: by 2002:a62:1c0f:0:b0:4a3:4f16:89de with SMTP id
 c15-20020a621c0f000000b004a34f1689demr14089523pfc.22.1637844677107; 
 Thu, 25 Nov 2021 04:51:17 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id gc22sm7242851pjb.57.2021.11.25.04.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:51:16 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 16/17] powerpc/64s: Move hash MMU support code under
 CONFIG_PPC_64S_HASH_MMU
Date: Thu, 25 Nov 2021 22:50:24 +1000
Message-Id: <20211125125025.1472060-17-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211125125025.1472060-1-npiggin@gmail.com>
References: <20211125125025.1472060-1-npiggin@gmail.com>
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

Compiling out hash support code when CONFIG_PPC_64S_HASH_MMU=n saves
128kB kernel image size (90kB text) on powernv_defconfig minus KVM,
350kB on pseries_defconfig minus KVM, 40kB on a tiny config.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                          |  2 +-
 arch/powerpc/include/asm/book3s/64/mmu.h      | 21 ++++++++++--
 .../include/asm/book3s/64/tlbflush-hash.h     |  6 ++++
 arch/powerpc/include/asm/book3s/pgtable.h     |  4 +++
 arch/powerpc/include/asm/mmu_context.h        |  2 ++
 arch/powerpc/include/asm/paca.h               |  8 +++++
 arch/powerpc/kernel/asm-offsets.c             |  2 ++
 arch/powerpc/kernel/entry_64.S                |  4 +--
 arch/powerpc/kernel/exceptions-64s.S          | 16 ++++++++++
 arch/powerpc/kernel/mce.c                     |  2 +-
 arch/powerpc/kernel/mce_power.c               | 10 ++++--
 arch/powerpc/kernel/paca.c                    | 18 ++++-------
 arch/powerpc/kernel/process.c                 | 13 ++++----
 arch/powerpc/kernel/prom.c                    |  2 ++
 arch/powerpc/kernel/setup_64.c                |  5 +++
 arch/powerpc/kexec/core_64.c                  |  4 +--
 arch/powerpc/kexec/ranges.c                   |  4 +++
 arch/powerpc/mm/book3s64/Makefile             | 15 +++++----
 arch/powerpc/mm/book3s64/hugetlbpage.c        |  2 ++
 arch/powerpc/mm/book3s64/mmu_context.c        | 32 +++++++++++++++----
 arch/powerpc/mm/book3s64/pgtable.c            |  2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  4 +++
 arch/powerpc/mm/copro_fault.c                 |  2 ++
 arch/powerpc/mm/ptdump/Makefile               |  2 +-
 arch/powerpc/platforms/powernv/idle.c         |  2 ++
 arch/powerpc/platforms/powernv/setup.c        |  2 ++
 arch/powerpc/platforms/pseries/lpar.c         | 11 +++++--
 arch/powerpc/platforms/pseries/lparcfg.c      |  2 +-
 arch/powerpc/platforms/pseries/mobility.c     |  6 ++++
 arch/powerpc/platforms/pseries/ras.c          |  2 ++
 arch/powerpc/platforms/pseries/reconfig.c     |  2 ++
 arch/powerpc/platforms/pseries/setup.c        |  6 ++--
 arch/powerpc/xmon/xmon.c                      |  8 +++--
 drivers/misc/lkdtm/Makefile                   |  2 +-
 drivers/misc/lkdtm/core.c                     |  2 +-
 35 files changed, 174 insertions(+), 53 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1fa336ec8faf..fb48823ccd62 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -129,7 +129,7 @@ config PPC
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
-	select ARCH_HAS_MEMREMAP_COMPAT_ALIGN	if PPC_BOOK3S_64
+	select ARCH_HAS_MEMREMAP_COMPAT_ALIGN	if PPC_64S_HASH_MMU
 	select ARCH_HAS_MMIOWB			if PPC64
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PHYS_TO_DMA
diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index c02f42d1031e..046888f7ab6e 100644
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
@@ -193,8 +198,15 @@ static inline struct subpage_prot_table *mm_ctx_subpage_prot(mm_context_t *ctx)
 extern int mmu_linear_psize;
 extern int mmu_virtual_psize;
 extern int mmu_vmalloc_psize;
-extern int mmu_vmemmap_psize;
 extern int mmu_io_psize;
+#else /* CONFIG_PPC_64S_HASH_MMU */
+#ifdef CONFIG_PPC_64K_PAGES
+#define mmu_virtual_psize MMU_PAGE_64K
+#else
+#define mmu_virtual_psize MMU_PAGE_4K
+#endif
+#endif
+extern int mmu_vmemmap_psize;
 
 /* MMU initialization */
 void mmu_early_init_devtree(void);
@@ -233,8 +245,9 @@ static inline void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 	 * know which translations we will pick. Hence go with hash
 	 * restrictions.
 	 */
-	return hash__setup_initial_memory_limit(first_memblock_base,
-					   first_memblock_size);
+	if (!radix_enabled())
+		hash__setup_initial_memory_limit(first_memblock_base,
+						 first_memblock_size);
 }
 
 #ifdef CONFIG_PPC_PSERIES
@@ -255,6 +268,7 @@ static inline void radix_init_pseries(void) { }
 void cleanup_cpu_mmu_context(void);
 #endif
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 static inline int get_user_context(mm_context_t *ctx, unsigned long ea)
 {
 	int index = ea >> MAX_EA_BITS_PER_CONTEXT;
@@ -274,6 +288,7 @@ static inline unsigned long get_user_vsid(mm_context_t *ctx,
 
 	return get_vsid(context, ea, ssize);
 }
+#endif
 
 #endif /* __ASSEMBLY__ */
 #endif /* _ASM_POWERPC_BOOK3S_64_MMU_H_ */
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index 3b95769739c7..8b762f282190 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -112,8 +112,14 @@ static inline void hash__flush_tlb_kernel_range(unsigned long start,
 
 struct mmu_gather;
 extern void hash__tlb_flush(struct mmu_gather *tlb);
+void flush_tlb_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long addr);
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
index ad130e15a126..818d7c851d36 100644
--- a/arch/powerpc/include/asm/book3s/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/pgtable.h
@@ -25,6 +25,7 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 				     unsigned long size, pgprot_t vma_prot);
 #define __HAVE_PHYS_MEM_ACCESS_PROT
 
+#if defined(CONFIG_PPC_HASH_MMU_NATIVE) || defined(CONFIG_PPC_64S_HASH_MMU)
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
index cc05522f50bf..b823f484c640 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -218,10 +218,12 @@ int main(void)
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
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 70cff7b49e17..9581906b5ee9 100644
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
index 046c99e31d01..65b695e9401e 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1369,11 +1369,15 @@ EXC_COMMON_BEGIN(data_access_common)
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
@@ -1416,6 +1420,7 @@ EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
 EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
 EXC_COMMON_BEGIN(data_access_slb_common)
 	GEN_COMMON data_access_slb
+#ifdef CONFIG_PPC_64S_HASH_MMU
 BEGIN_MMU_FTR_SECTION
 	/* HPT case, do SLB fault */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -1428,6 +1433,9 @@ MMU_FTR_SECTION_ELSE
 	/* Radix case, access is outside page table range */
 	li	r3,-EFAULT
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
+#else
+	li	r3,-EFAULT
+#endif
 	std	r3,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_segment_interrupt
@@ -1462,11 +1470,15 @@ EXC_VIRT_END(instruction_access, 0x4400, 0x80)
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
 
 
@@ -1496,6 +1508,7 @@ EXC_VIRT_BEGIN(instruction_access_slb, 0x4480, 0x80)
 EXC_VIRT_END(instruction_access_slb, 0x4480, 0x80)
 EXC_COMMON_BEGIN(instruction_access_slb_common)
 	GEN_COMMON instruction_access_slb
+#ifdef CONFIG_PPC_64S_HASH_MMU
 BEGIN_MMU_FTR_SECTION
 	/* HPT case, do SLB fault */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -1508,6 +1521,9 @@ MMU_FTR_SECTION_ELSE
 	/* Radix case, access is outside page table range */
 	li	r3,-EFAULT
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
+#else
+	li	r3,-EFAULT
+#endif
 	std	r3,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_segment_interrupt
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index fd829f7f25a4..2503dd4713b9 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -586,7 +586,7 @@ void machine_check_print_event_info(struct machine_check_event *evt,
 		mc_error_class[evt->error_class] : "Unknown";
 	printk("%sMCE: CPU%d: %s\n", level, evt->cpu, subtype);
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	/* Display faulty slb contents for SLB errors. */
 	if (evt->error_type == MCE_ERROR_TYPE_SLB && !in_guest)
 		slb_dump_contents(local_paca->mce_faulty_slbs);
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index cf5263b648fc..a48ff18d6d65 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -77,7 +77,7 @@ static bool mce_in_guest(void)
 }
 
 /* flush SLBs and reload */
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 void flush_and_reload_slb(void)
 {
 	if (early_radix_enabled())
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
index 4208b4044d12..39da688a9455 100644
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
 		memblock_phys_free(__pa(paca_ptrs[boot_cpuid]->slb_shadow_ptr),
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
index 5d2333d2a283..a64cfbb85ca2 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1240,7 +1240,7 @@ struct task_struct *__switch_to(struct task_struct *prev,
 {
 	struct thread_struct *new_thread, *old_thread;
 	struct task_struct *last;
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	struct ppc64_tlb_batch *batch;
 #endif
 
@@ -1249,7 +1249,7 @@ struct task_struct *__switch_to(struct task_struct *prev,
 
 	WARN_ON(!irqs_disabled());
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	batch = this_cpu_ptr(&ppc64_tlb_batch);
 	if (batch->active) {
 		current_thread_info()->local_flags |= _TLF_LAZY_MMU;
@@ -1328,6 +1328,7 @@ struct task_struct *__switch_to(struct task_struct *prev,
 	 */
 
 #ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	/*
 	 * This applies to a process that was context switched while inside
 	 * arch_enter_lazy_mmu_mode(), to re-activate the batch that was
@@ -1339,6 +1340,7 @@ struct task_struct *__switch_to(struct task_struct *prev,
 		batch = this_cpu_ptr(&ppc64_tlb_batch);
 		batch->active = 1;
 	}
+#endif
 
 	/*
 	 * Math facilities are masked out of the child MSR in copy_thread.
@@ -1689,7 +1691,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 
 static void setup_ksp_vsid(struct task_struct *p, unsigned long sp)
 {
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	unsigned long sp_vsid;
 	unsigned long llp = mmu_psize_defs[mmu_linear_psize].sllp;
 
@@ -2333,10 +2335,9 @@ unsigned long arch_randomize_brk(struct mm_struct *mm)
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
index 2e67588f6f6e..2197404cdcc4 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -234,6 +234,7 @@ static void __init check_cpu_pa_features(unsigned long node)
 #ifdef CONFIG_PPC_BOOK3S_64
 static void __init init_mmu_slb_size(unsigned long node)
 {
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	const __be32 *slb_size_ptr;
 
 	slb_size_ptr = of_get_flat_dt_prop(node, "slb-size", NULL) ? :
@@ -241,6 +242,7 @@ static void __init init_mmu_slb_size(unsigned long node)
 
 	if (slb_size_ptr)
 		mmu_slb_size = be32_to_cpup(slb_size_ptr);
+#endif
 }
 #else
 #define init_mmu_slb_size(node) do { } while(0)
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 9a493796ce66..22647bb82198 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -887,6 +887,8 @@ void __init setup_per_cpu_areas(void)
 	} else if (radix_enabled()) {
 		atom_size = PAGE_SIZE;
 	} else {
+#ifdef CONFIG_PPC_64S_HASH_MMU
+
 		/*
 		 * Linear mapping is one of 4K, 1M and 16M.  For 4K, no need
 		 * to group units.  For larger mappings, use 1M atom which
@@ -896,6 +898,9 @@ void __init setup_per_cpu_areas(void)
 			atom_size = PAGE_SIZE;
 		else
 			atom_size = SZ_1M;
+#else
+		BUILD_BUG(); // radix_enabled() should be constant true
+#endif
 	}
 
 	if (pcpu_chosen_fc != PCPU_FC_PAGE) {
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 66678518b938..635b5fc30b53 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -378,7 +378,7 @@ void default_machine_kexec(struct kimage *image)
 	/* NOTREACHED */
 }
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 /* Values we need to export to the second kernel via the device tree. */
 static unsigned long htab_base;
 static unsigned long htab_size;
@@ -420,4 +420,4 @@ static int __init export_htab_values(void)
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
 
diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
index 501efadb287f..2d50cac499c5 100644
--- a/arch/powerpc/mm/book3s64/Makefile
+++ b/arch/powerpc/mm/book3s64/Makefile
@@ -2,20 +2,23 @@
 
 ccflags-y	:= $(NO_MINIMAL_TOC)
 
+obj-y				+= mmu_context.o pgtable.o trace.o
+ifdef CONFIG_PPC_64S_HASH_MMU
 CFLAGS_REMOVE_slb.o = $(CC_FLAGS_FTRACE)
-
-obj-y				+= hash_pgtable.o hash_utils.o slb.o \
-				   mmu_context.o pgtable.o hash_tlb.o trace.o
+obj-y				+= hash_pgtable.o hash_utils.o hash_tlb.o slb.o
 obj-$(CONFIG_PPC_HASH_MMU_NATIVE)	+= hash_native.o
-obj-$(CONFIG_PPC_RADIX_MMU)	+= radix_pgtable.o radix_tlb.o
 obj-$(CONFIG_PPC_4K_PAGES)	+= hash_4k.o
 obj-$(CONFIG_PPC_64K_PAGES)	+= hash_64k.o
+obj-$(CONFIG_TRANSPARENT_HUGEPAGE) += hash_hugepage.o
+obj-$(CONFIG_PPC_SUBPAGE_PROT)	+= subpage_prot.o
+endif
+
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
+
+obj-$(CONFIG_PPC_RADIX_MMU)	+= radix_pgtable.o radix_tlb.o
 ifdef CONFIG_HUGETLB_PAGE
 obj-$(CONFIG_PPC_RADIX_MMU)	+= radix_hugetlbpage.o
 endif
-obj-$(CONFIG_TRANSPARENT_HUGEPAGE) += hash_hugepage.o
-obj-$(CONFIG_PPC_SUBPAGE_PROT)	+= subpage_prot.o
 obj-$(CONFIG_SPAPR_TCE_IOMMU)	+= iommu_api.o
 obj-$(CONFIG_PPC_PKEY)	+= pkeys.o
 
diff --git a/arch/powerpc/mm/book3s64/hugetlbpage.c b/arch/powerpc/mm/book3s64/hugetlbpage.c
index a688e1324ae5..95b2a283fd6e 100644
--- a/arch/powerpc/mm/book3s64/hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/hugetlbpage.c
@@ -16,6 +16,7 @@
 unsigned int hpage_shift;
 EXPORT_SYMBOL(hpage_shift);
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 int __hash_page_huge(unsigned long ea, unsigned long access, unsigned long vsid,
 		     pte_t *ptep, unsigned long trap, unsigned long flags,
 		     int ssize, unsigned int shift, unsigned int mmu_psize)
@@ -122,6 +123,7 @@ int __hash_page_huge(unsigned long ea, unsigned long access, unsigned long vsid,
 	*ptep = __pte(new_pte & ~H_PAGE_BUSY);
 	return 0;
 }
+#endif
 
 pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma,
 				  unsigned long addr, pte_t *ptep)
diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
index c10fc8a72fb3..24aa953c9311 100644
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
@@ -150,6 +153,13 @@ void hash__setup_new_exec(void)
 
 	slb_setup_new_exec();
 }
+#else
+static inline int hash__init_new_context(struct mm_struct *mm)
+{
+	BUILD_BUG();
+	return 0;
+}
+#endif
 
 static int radix__init_new_context(struct mm_struct *mm)
 {
@@ -175,7 +185,9 @@ static int radix__init_new_context(struct mm_struct *mm)
 	 */
 	asm volatile("ptesync;isync" : : : "memory");
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	mm->context.hash_context = NULL;
+#endif
 
 	return index;
 }
@@ -213,14 +225,22 @@ EXPORT_SYMBOL_GPL(__destroy_context);
 
 static void destroy_contexts(mm_context_t *ctx)
 {
-	int index, context_id;
+	if (radix_enabled()) {
+		ida_free(&mmu_context_ida, ctx->id);
+	} else {
+#ifdef CONFIG_PPC_64S_HASH_MMU
+		int index, context_id;
 
-	for (index = 0; index < ARRAY_SIZE(ctx->extended_id); index++) {
-		context_id = ctx->extended_id[index];
-		if (context_id)
-			ida_free(&mmu_context_ida, context_id);
+		for (index = 0; index < ARRAY_SIZE(ctx->extended_id); index++) {
+			context_id = ctx->extended_id[index];
+			if (context_id)
+				ida_free(&mmu_context_ida, context_id);
+		}
+		kfree(ctx->hash_context);
+#else
+		BUILD_BUG(); // radix_enabled() should be constant true
+#endif
 	}
-	kfree(ctx->hash_context);
 }
 
 static void pmd_frag_destroy(void *pmd_frag)
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 4d97d1525d49..d765d972566b 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -534,7 +534,7 @@ static int __init pgtable_debugfs_setup(void)
 }
 arch_initcall(pgtable_debugfs_setup);
 
-#ifdef CONFIG_ZONE_DEVICE
+#if defined(CONFIG_ZONE_DEVICE) && defined(ARCH_HAS_MEMREMAP_COMPAT_ALIGN)
 /*
  * Override the generic version in mm/memremap.c.
  *
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 77820036c722..99dbee114539 100644
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
@@ -576,6 +578,7 @@ void __init radix__early_init_mmu(void)
 {
 	unsigned long lpcr;
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 #ifdef CONFIG_PPC_64K_PAGES
 	/* PAGE_SIZE mappings */
 	mmu_virtual_psize = MMU_PAGE_64K;
@@ -592,6 +595,7 @@ void __init radix__early_init_mmu(void)
 		mmu_vmemmap_psize = MMU_PAGE_2M;
 	} else
 		mmu_vmemmap_psize = mmu_virtual_psize;
+#endif
 #endif
 	/*
 	 * initialize page table size
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
diff --git a/arch/powerpc/mm/ptdump/Makefile b/arch/powerpc/mm/ptdump/Makefile
index 4050cbb55acf..b533caaf0910 100644
--- a/arch/powerpc/mm/ptdump/Makefile
+++ b/arch/powerpc/mm/ptdump/Makefile
@@ -10,5 +10,5 @@ obj-$(CONFIG_PPC_BOOK3S_64)	+= book3s64.o
 
 ifdef CONFIG_PTDUMP_DEBUGFS
 obj-$(CONFIG_PPC_BOOK3S_32)	+= bats.o segment_regs.o
-obj-$(CONFIG_PPC_BOOK3S_64)	+= hashpagetable.o
+obj-$(CONFIG_PPC_64S_HASH_MMU)	+= hashpagetable.o
 endif
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 3bc84e2fe064..f0edfe6c1598 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -491,12 +491,14 @@ static unsigned long power7_idle_insn(unsigned long type)
 
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
index 5ef6b8afb3d0..f37d6524a24d 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -211,6 +211,7 @@ static void __init pnv_init(void)
 #endif
 		add_preferred_console("hvc", 0, NULL);
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	if (!radix_enabled()) {
 		size_t size = sizeof(struct slb_entry) * mmu_slb_size;
 		int i;
@@ -223,6 +224,7 @@ static void __init pnv_init(void)
 						cpu_to_node(i));
 		}
 	}
+#endif
 }
 
 static void __init pnv_init_IRQ(void)
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 06d6a824c0dc..fac5d86777db 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -58,6 +58,7 @@ EXPORT_SYMBOL(plpar_hcall);
 EXPORT_SYMBOL(plpar_hcall9);
 EXPORT_SYMBOL(plpar_hcall_norets);
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 /*
  * H_BLOCK_REMOVE supported block size for this page size in segment who's base
  * page size is that page size.
@@ -66,6 +67,7 @@ EXPORT_SYMBOL(plpar_hcall_norets);
  * page size.
  */
 static int hblkrm_size[MMU_PAGE_COUNT][MMU_PAGE_COUNT] __ro_after_init;
+#endif
 
 /*
  * Due to the involved complexity, and that the current hypervisor is only
@@ -689,7 +691,7 @@ void vpa_init(int cpu)
 		return;
 	}
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	/*
 	 * PAPR says this feature is SLB-Buffer but firmware never
 	 * reports that.  All SPLPAR support SLB shadow buffer.
@@ -702,7 +704,7 @@ void vpa_init(int cpu)
 			       "cpu %d (hw %d) of area %lx failed with %ld\n",
 			       cpu, hwcpu, addr, ret);
 	}
-#endif /* CONFIG_PPC_BOOK3S_64 */
+#endif /* CONFIG_PPC_64S_HASH_MMU */
 
 	/*
 	 * Register dispatch trace log, if one has been allocated.
@@ -740,6 +742,8 @@ static int pseries_lpar_register_process_table(unsigned long base,
 	return rc;
 }
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
+
 static long pSeries_lpar_hpte_insert(unsigned long hpte_group,
 				     unsigned long vpn, unsigned long pa,
 				     unsigned long rflags, unsigned long vflags,
@@ -1730,6 +1734,7 @@ void __init hpte_init_pseries(void)
 	if (cpu_has_feature(CPU_FTR_ARCH_300))
 		pseries_lpar_register_process_table(0, 0, 0);
 }
+#endif /* CONFIG_PPC_64S_HASH_MMU */
 
 #ifdef CONFIG_PPC_RADIX_MMU
 void radix_init_pseries(void)
@@ -1932,6 +1937,7 @@ int h_get_mpp_x(struct hvcall_mpp_x_data *mpp_x_data)
 	return rc;
 }
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 static unsigned long vsid_unscramble(unsigned long vsid, int ssize)
 {
 	unsigned long protovsid;
@@ -1992,6 +1998,7 @@ static int __init reserve_vrma_context_id(void)
 	return 0;
 }
 machine_device_initcall(pseries, reserve_vrma_context_id);
+#endif
 
 #ifdef CONFIG_DEBUG_FS
 /* debugfs file interface for vpa data */
diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index 3354c00914fa..c7940fcfc911 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -531,7 +531,7 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
 	seq_printf(m, "shared_processor_mode=%d\n",
 		   lppaca_shared_proc(get_lppaca()));
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	if (!radix_enabled())
 		seq_printf(m, "slb_size=%d\n", mmu_slb_size);
 #endif
diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 210a37a065fb..21b706bcea76 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -451,11 +451,15 @@ static void prod_others(void)
 
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
@@ -480,7 +484,9 @@ static int do_suspend(void)
 	ret = rtas_ibm_suspend_me(&status);
 	if (ret != 0) {
 		pr_err("ibm,suspend-me error: %d\n", status);
+#ifdef CONFIG_PPC_64S_HASH_MMU
 		slb_set_size(saved_slb_size);
+#endif
 	}
 
 	return ret;
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 56092dccfdb8..74c9b1b5bc66 100644
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
@@ -538,6 +539,7 @@ static int mce_handle_err_realmode(int disposition, u8 error_type)
 				slb_save_contents(local_paca->mce_faulty_slbs);
 			flush_and_reload_slb();
 			disposition = RTAS_DISP_FULLY_RECOVERED;
+#endif
 			break;
 		default:
 			break;
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
index 8a62af5b9c24..7f69237d4fa4 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -112,7 +112,7 @@ static void __init fwnmi_init(void)
 	u8 *mce_data_buf;
 	unsigned int i;
 	int nr_cpus = num_possible_cpus();
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	struct slb_entry *slb_ptr;
 	size_t size;
 #endif
@@ -152,7 +152,7 @@ static void __init fwnmi_init(void)
 						(RTAS_ERROR_LOG_MAX * i);
 	}
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	if (!radix_enabled()) {
 		/* Allocate per cpu area to save old slb contents during MCE */
 		size = sizeof(struct slb_entry) * mmu_slb_size * nr_cpus;
@@ -801,7 +801,9 @@ static void __init pSeries_setup_arch(void)
 	fwnmi_init();
 
 	pseries_setup_security_mitigations();
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	pseries_lpar_read_hblkrm_characteristics();
+#endif
 
 	/* By default, only probe PCI (can be overridden by rtas_pci) */
 	pci_add_flags(PCI_PROBE_ONLY);
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 83100c6524cc..0c65dc01c325 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1159,7 +1159,7 @@ cmds(struct pt_regs *excp)
 		case 'P':
 			show_tasks();
 			break;
-#ifdef CONFIG_PPC_BOOK3S
+#if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_PPC_64S_HASH_MMU)
 		case 'u':
 			dump_segments();
 			break;
@@ -2614,7 +2614,7 @@ static void dump_tracing(void)
 static void dump_one_paca(int cpu)
 {
 	struct paca_struct *p;
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	int i = 0;
 #endif
 
@@ -2656,6 +2656,7 @@ static void dump_one_paca(int cpu)
 	DUMP(p, cpu_start, "%#-*x");
 	DUMP(p, kexec_state, "%#-*x");
 #ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	if (!early_radix_enabled()) {
 		for (i = 0; i < SLB_NUM_BOLTED; i++) {
 			u64 esid, vsid;
@@ -2683,6 +2684,7 @@ static void dump_one_paca(int cpu)
 				       22, "slb_cache", i, p->slb_cache[i]);
 		}
 	}
+#endif
 
 	DUMP(p, rfi_flush_fallback_area, "%-*px");
 #endif
@@ -3746,7 +3748,7 @@ static void xmon_print_symbol(unsigned long address, const char *mid,
 	printf("%s", after);
 }
 
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 void dump_segments(void)
 {
 	int i;
diff --git a/drivers/misc/lkdtm/Makefile b/drivers/misc/lkdtm/Makefile
index aa12097668d3..3ba36ff4e94a 100644
--- a/drivers/misc/lkdtm/Makefile
+++ b/drivers/misc/lkdtm/Makefile
@@ -11,7 +11,7 @@ lkdtm-$(CONFIG_LKDTM)		+= usercopy.o
 lkdtm-$(CONFIG_LKDTM)		+= stackleak.o
 lkdtm-$(CONFIG_LKDTM)		+= cfi.o
 lkdtm-$(CONFIG_LKDTM)		+= fortify.o
-lkdtm-$(CONFIG_PPC_BOOK3S_64)	+= powerpc.o
+lkdtm-$(CONFIG_PPC_64S_HASH_MMU) += powerpc.o
 
 KASAN_SANITIZE_rodata.o		:= n
 KASAN_SANITIZE_stackleak.o	:= n
diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
index 609d9ee2acc0..82fb276f7e09 100644
--- a/drivers/misc/lkdtm/core.c
+++ b/drivers/misc/lkdtm/core.c
@@ -182,7 +182,7 @@ static const struct crashtype crashtypes[] = {
 	CRASHTYPE(FORTIFIED_SUBOBJECT),
 	CRASHTYPE(FORTIFIED_STRSCPY),
 	CRASHTYPE(DOUBLE_FAULT),
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	CRASHTYPE(PPC_SLB_MULTIHIT),
 #endif
 };
-- 
2.23.0

