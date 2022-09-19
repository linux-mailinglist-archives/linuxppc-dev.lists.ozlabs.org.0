Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7C45BD317
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 19:03:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWWGY2trCz3fBp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 03:03:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWWFH6t4Pz3c79
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 03:02:27 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MWWDs3T0Zz9slG;
	Mon, 19 Sep 2022 19:02:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f7fl_yEY73-I; Mon, 19 Sep 2022 19:02:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MWWDr4Yhrz9skd;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8D1D88B76E;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id v3J8Id2LG4Bq; Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.8])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 557EB8B776;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 28JH1xjK1549633
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 19:01:59 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 28JH1xxs1549632;
	Mon, 19 Sep 2022 19:01:59 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 14/19] powerpc: Remove CONFIG_PPC_FSL_BOOK3E
Date: Mon, 19 Sep 2022 19:01:38 +0200
Message-Id: <795cb93b88c9a0279289712e674f39e3b108a1b4.1663606876.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <828f6a64eeb51ce9abfa1d4e84c521a02fecebb8.1663606875.git.christophe.leroy@csgroup.eu>
References: <828f6a64eeb51ce9abfa1d4e84c521a02fecebb8.1663606875.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1663606899; l=23855; s=20211009; h=from:subject:message-id; bh=d+IgjNVwY0M0th89P78GQq++/BkeizSfV/57Sl47kRc=; b=hI71eBjR5fjrqjpUSw0G+LobWbTmGOvDX4n4aDhVXe09hHQWQ4YfuOG5KA3pHpOZA+GPQCiYzfEG Pv/Yfmv4BYenIlhRzsPy/E3GJdYF/gOAMEecO4eyCO4yKMBXHISD
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CONFIG_PPC_FSL_BOOK3E is redundant with CONFIG_PPC_E500.

Remove it.

And rename five files accordingly.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                             |  2 +-
 arch/powerpc/include/asm/barrier.h               |  2 +-
 arch/powerpc/include/asm/hugetlb.h               |  4 ++--
 arch/powerpc/include/asm/kvm_host.h              |  2 +-
 arch/powerpc/include/asm/mmu.h                   |  2 +-
 arch/powerpc/include/asm/nohash/32/pgtable.h     |  2 +-
 arch/powerpc/include/asm/nohash/64/pgtable.h     |  2 +-
 .../nohash/{hugetlb-book3e.h => hugetlb-e500.h}  |  2 +-
 arch/powerpc/include/asm/nohash/pgtable.h        |  2 +-
 .../asm/nohash/{pte-book3e.h => pte-e500.h}      |  0
 arch/powerpc/include/asm/page.h                  |  2 +-
 arch/powerpc/include/asm/ppc_asm.h               |  6 +++---
 arch/powerpc/include/asm/setup.h                 |  2 +-
 arch/powerpc/kernel/Makefile                     |  2 +-
 arch/powerpc/kernel/asm-offsets.c                |  4 ++--
 .../{cpu_setup_fsl_booke.S => cpu_setup_e500.S}  |  0
 arch/powerpc/kernel/head_booke.h                 |  2 +-
 arch/powerpc/kernel/interrupt_64.S               |  2 +-
 arch/powerpc/kernel/security.c                   | 10 +++++-----
 arch/powerpc/kernel/smp.c                        |  2 +-
 arch/powerpc/kernel/sysfs.c                      |  6 +++---
 arch/powerpc/kernel/vmlinux.lds.S                |  2 +-
 arch/powerpc/lib/feature-fixups.c                |  4 ++--
 arch/powerpc/mm/hugetlbpage.c                    |  2 +-
 arch/powerpc/mm/mem.c                            |  2 +-
 arch/powerpc/mm/mmu_decl.h                       |  4 ++--
 arch/powerpc/mm/nohash/Makefile                  |  6 +++---
 arch/powerpc/mm/nohash/{fsl_book3e.c => e500.c}  |  0
 .../{book3e_hugetlbpage.c => e500_hugetlbpage.c} |  0
 arch/powerpc/mm/nohash/tlb.c                     | 16 ++++++++--------
 arch/powerpc/mm/nohash/tlb_low.S                 |  2 +-
 arch/powerpc/platforms/Kconfig.cputype           | 16 ++++------------
 32 files changed, 52 insertions(+), 60 deletions(-)
 rename arch/powerpc/include/asm/nohash/{hugetlb-book3e.h => hugetlb-e500.h} (95%)
 rename arch/powerpc/include/asm/nohash/{pte-book3e.h => pte-e500.h} (100%)
 rename arch/powerpc/kernel/{cpu_setup_fsl_booke.S => cpu_setup_e500.S} (100%)
 rename arch/powerpc/mm/nohash/{fsl_book3e.c => e500.c} (100%)
 rename arch/powerpc/mm/nohash/{book3e_hugetlbpage.c => e500_hugetlbpage.c} (100%)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 94a614bb1581..38f36eb4d96c 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -290,7 +290,7 @@ config PPC_LONG_DOUBLE_128
 config PPC_BARRIER_NOSPEC
 	bool
 	default y
-	depends on PPC_BOOK3S_64 || PPC_FSL_BOOK3E
+	depends on PPC_BOOK3S_64 || PPC_E500
 
 config EARLY_PRINTK
 	bool
diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
index ef2d8b15eaab..e80b2c0e9315 100644
--- a/arch/powerpc/include/asm/barrier.h
+++ b/arch/powerpc/include/asm/barrier.h
@@ -86,7 +86,7 @@ do {									\
 
 #ifdef CONFIG_PPC_BOOK3S_64
 #define NOSPEC_BARRIER_SLOT   nop
-#elif defined(CONFIG_PPC_FSL_BOOK3E)
+#elif defined(CONFIG_PPC_E500)
 #define NOSPEC_BARRIER_SLOT   nop; nop
 #endif
 
diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index 32ce0fb7548f..ea71f7245a63 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -7,8 +7,8 @@
 
 #ifdef CONFIG_PPC_BOOK3S_64
 #include <asm/book3s/64/hugetlb.h>
-#elif defined(CONFIG_PPC_FSL_BOOK3E)
-#include <asm/nohash/hugetlb-book3e.h>
+#elif defined(CONFIG_PPC_E500)
+#include <asm/nohash/hugetlb-e500.h>
 #elif defined(CONFIG_PPC_8xx)
 #include <asm/nohash/32/hugetlb-8xx.h>
 #endif /* CONFIG_PPC_BOOK3S_64 */
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index c2b003550dc9..caea15dcb91d 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -443,7 +443,7 @@ struct kvmppc_passthru_irqmap {
 };
 #endif
 
-# ifdef CONFIG_PPC_FSL_BOOK3E
+# ifdef CONFIG_PPC_E500
 #define KVMPPC_BOOKE_IAC_NUM	2
 #define KVMPPC_BOOKE_DAC_NUM	2
 # else
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 5b46da9ba7f6..39057320e436 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -141,7 +141,7 @@
 
 typedef pte_t *pgtable_t;
 
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 #include <asm/percpu.h>
 DECLARE_PER_CPU(int, next_tlbcam_idx);
 #endif
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 197e7552d9f6..0d40b33184eb 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -131,7 +131,7 @@ void unmap_kernel_page(unsigned long va);
 #elif defined(CONFIG_44x)
 #include <asm/nohash/32/pte-44x.h>
 #elif defined(CONFIG_PPC_85xx) && defined(CONFIG_PTE_64BIT)
-#include <asm/nohash/pte-book3e.h>
+#include <asm/nohash/pte-e500.h>
 #elif defined(CONFIG_PPC_85xx)
 #include <asm/nohash/32/pte-85xx.h>
 #elif defined(CONFIG_PPC_8xx)
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index 599921cc257e..879e9a6e5a87 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -70,7 +70,7 @@
 /*
  * Include the PTE bits definitions
  */
-#include <asm/nohash/pte-book3e.h>
+#include <asm/nohash/pte-e500.h>
 
 #define PTE_RPN_MASK	(~((1UL << PTE_RPN_SHIFT) - 1))
 
diff --git a/arch/powerpc/include/asm/nohash/hugetlb-book3e.h b/arch/powerpc/include/asm/nohash/hugetlb-e500.h
similarity index 95%
rename from arch/powerpc/include/asm/nohash/hugetlb-book3e.h
rename to arch/powerpc/include/asm/nohash/hugetlb-e500.h
index ecd8694cb229..bdcd9040ad04 100644
--- a/arch/powerpc/include/asm/nohash/hugetlb-book3e.h
+++ b/arch/powerpc/include/asm/nohash/hugetlb-e500.h
@@ -30,7 +30,7 @@ void flush_hugetlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
 
 static inline void hugepd_populate(hugepd_t *hpdp, pte_t *new, unsigned int pshift)
 {
-	/* We use the old format for PPC_FSL_BOOK3E */
+	/* We use the old format for PPC_E500 */
 	*hpdp = __hugepd(((unsigned long)new & ~PD_HUGE) | pshift);
 }
 
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index b499da6c1a99..1ebf3413e9d5 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -292,7 +292,7 @@ static inline int pgd_huge(pgd_t pgd)
  * We use it to ensure coherency between the i-cache and d-cache
  * for the page which has just been mapped in.
  */
-#if defined(CONFIG_PPC_FSL_BOOK3E) && defined(CONFIG_HUGETLB_PAGE)
+#if defined(CONFIG_PPC_E500) && defined(CONFIG_HUGETLB_PAGE)
 void update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep);
 #else
 static inline
diff --git a/arch/powerpc/include/asm/nohash/pte-book3e.h b/arch/powerpc/include/asm/nohash/pte-e500.h
similarity index 100%
rename from arch/powerpc/include/asm/nohash/pte-book3e.h
rename to arch/powerpc/include/asm/nohash/pte-e500.h
diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index e5f75c70eda8..f906135b778a 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -31,7 +31,7 @@ extern unsigned int hpage_shift;
 #define HPAGE_SHIFT hpage_shift
 #elif defined(CONFIG_PPC_8xx)
 #define HPAGE_SHIFT		19	/* 512k pages */
-#elif defined(CONFIG_PPC_FSL_BOOK3E)
+#elif defined(CONFIG_PPC_E500)
 #define HPAGE_SHIFT		22	/* 4M pages */
 #endif
 #define HPAGE_SIZE		((1UL) << HPAGE_SHIFT)
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 55149a0384db..7e4fe766e247 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -342,7 +342,7 @@ GLUE(.,name):
 #endif
 
 /* various errata or part fixups */
-#if defined(CONFIG_PPC_CELL) || defined(CONFIG_PPC_FSL_BOOK3E)
+#if defined(CONFIG_PPC_CELL) || defined(CONFIG_PPC_E500)
 #define MFTB(dest)			\
 90:	mfspr dest, SPRN_TBRL;		\
 BEGIN_FTR_SECTION_NESTED(96);		\
@@ -768,7 +768,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
 	stringify_in_c(.llong (_target);)	\
 	stringify_in_c(.previous)
 
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 #define BTB_FLUSH(reg)			\
 	lis reg,BUCSR_INIT@h;		\
 	ori reg,reg,BUCSR_INIT@l;	\
@@ -776,6 +776,6 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
 	isync;
 #else
 #define BTB_FLUSH(reg)
-#endif /* CONFIG_PPC_FSL_BOOK3E */
+#endif /* CONFIG_PPC_E500 */
 
 #endif /* _ASM_POWERPC_PPC_ASM_H */
diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index dd461b2c825c..85143849a586 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -69,7 +69,7 @@ void do_barrier_nospec_fixups_range(bool enable, void *start, void *end);
 static inline void do_barrier_nospec_fixups_range(bool enable, void *start, void *end) { }
 #endif
 
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 void __init setup_spectre_v2(void);
 #else
 static inline void setup_spectre_v2(void) {}
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 33dafd12e81d..658c4dffaa56 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -114,7 +114,7 @@ endif
 obj64-$(CONFIG_HIBERNATION)	+= swsusp_asm64.o
 obj-$(CONFIG_MODULES)		+= module.o module_$(BITS).o
 obj-$(CONFIG_44x)		+= cpu_setup_44x.o
-obj-$(CONFIG_PPC_FSL_BOOK3E)	+= cpu_setup_fsl_booke.o
+obj-$(CONFIG_PPC_E500)		+= cpu_setup_e500.o
 obj-$(CONFIG_PPC_DOORBELL)	+= dbell.o
 obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
 
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 10ce03052a19..4ce2a4aa3985 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -59,7 +59,7 @@
 #endif
 #endif
 
-#if defined(CONFIG_PPC_FSL_BOOK3E)
+#if defined(CONFIG_PPC_E500)
 #include "../mm/mmu_decl.h"
 #endif
 
@@ -651,7 +651,7 @@ int main(void)
 	DEFINE(PGD_T_LOG2, PGD_T_LOG2);
 	DEFINE(PTE_T_LOG2, PTE_T_LOG2);
 #endif
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 	DEFINE(TLBCAM_SIZE, sizeof(struct tlbcam));
 	OFFSET(TLBCAM_MAS0, tlbcam, MAS0);
 	OFFSET(TLBCAM_MAS1, tlbcam, MAS1);
diff --git a/arch/powerpc/kernel/cpu_setup_fsl_booke.S b/arch/powerpc/kernel/cpu_setup_e500.S
similarity index 100%
rename from arch/powerpc/kernel/cpu_setup_fsl_booke.S
rename to arch/powerpc/kernel/cpu_setup_e500.S
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index a2f82ced6e4a..1047dc053b47 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -34,7 +34,7 @@
  */
 #define THREAD_NORMSAVE(offset)	(THREAD_NORMSAVES + (offset * 4))
 
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 #define BOOKE_CLEAR_BTB(reg)									\
 START_BTB_FLUSH_SECTION								\
 	BTB_FLUSH(reg)									\
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index ce25b28cf418..e9679a87f649 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -240,7 +240,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_common)
 	std	r0,GPR0(r1)
 	std	r10,GPR1(r1)
 	std	r2,GPR2(r1)
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 START_BTB_FLUSH_SECTION
 	BTB_FLUSH(r10)
 END_BTB_FLUSH_SECTION
diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index b562a1d2c750..206475e3e0b4 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -35,7 +35,7 @@ static enum branch_cache_flush_type link_stack_flush_type = BRANCH_CACHE_FLUSH_N
 bool barrier_nospec_enabled;
 static bool no_nospec;
 static bool btb_flush_enabled;
-#if defined(CONFIG_PPC_FSL_BOOK3E) || defined(CONFIG_PPC_BOOK3S_64)
+#if defined(CONFIG_PPC_E500) || defined(CONFIG_PPC_BOOK3S_64)
 static bool no_spectrev2;
 #endif
 
@@ -122,7 +122,7 @@ static __init int security_feature_debugfs_init(void)
 device_initcall(security_feature_debugfs_init);
 #endif /* CONFIG_DEBUG_FS */
 
-#if defined(CONFIG_PPC_FSL_BOOK3E) || defined(CONFIG_PPC_BOOK3S_64)
+#if defined(CONFIG_PPC_E500) || defined(CONFIG_PPC_BOOK3S_64)
 static int __init handle_nospectre_v2(char *p)
 {
 	no_spectrev2 = true;
@@ -130,9 +130,9 @@ static int __init handle_nospectre_v2(char *p)
 	return 0;
 }
 early_param("nospectre_v2", handle_nospectre_v2);
-#endif /* CONFIG_PPC_FSL_BOOK3E || CONFIG_PPC_BOOK3S_64 */
+#endif /* CONFIG_PPC_E500 || CONFIG_PPC_BOOK3S_64 */
 
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 void __init setup_spectre_v2(void)
 {
 	if (no_spectrev2 || cpu_mitigations_off())
@@ -140,7 +140,7 @@ void __init setup_spectre_v2(void)
 	else
 		btb_flush_enabled = true;
 }
-#endif /* CONFIG_PPC_FSL_BOOK3E */
+#endif /* CONFIG_PPC_E500 */
 
 #ifdef CONFIG_PPC_BOOK3S_64
 ssize_t cpu_show_meltdown(struct device *dev, struct device_attribute *attr, char *buf)
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 169703fead57..11ded19186b9 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -708,7 +708,7 @@ static struct task_struct *current_set[NR_CPUS];
 static void smp_store_cpu_info(int id)
 {
 	per_cpu(cpu_pvr, id) = mfspr(SPRN_PVR);
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 	per_cpu(next_tlbcam_idx, id)
 		= (mfspr(SPRN_TLB1CFG) & TLBnCFG_N_ENTRY) - 1;
 #endif
diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index 3a10cda9c05e..ef9a61718940 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -228,7 +228,7 @@ static void __init sysfs_create_dscr_default(void)
 }
 #endif /* CONFIG_PPC64 */
 
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 #define MAX_BIT				63
 
 static u64 pw20_wt;
@@ -907,7 +907,7 @@ static int register_cpu_online(unsigned int cpu)
 		device_create_file(s, &dev_attr_tscr);
 #endif /* CONFIG_PPC64 */
 
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 	if (PVR_VER(cur_cpu_spec->pvr_value) == PVR_VER_E6500) {
 		device_create_file(s, &dev_attr_pw20_state);
 		device_create_file(s, &dev_attr_pw20_wait_time);
@@ -1003,7 +1003,7 @@ static int unregister_cpu_online(unsigned int cpu)
 		device_remove_file(s, &dev_attr_tscr);
 #endif /* CONFIG_PPC64 */
 
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 	if (PVR_VER(cur_cpu_spec->pvr_value) == PVR_VER_E6500) {
 		device_remove_file(s, &dev_attr_pw20_state);
 		device_remove_file(s, &dev_attr_pw20_wait_time);
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 8bb5f081ee31..58c7901e57d1 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -201,7 +201,7 @@ SECTIONS
 	}
 #endif /* CONFIG_PPC_BARRIER_NOSPEC */
 
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 	. = ALIGN(8);
 	__spec_btb_flush_fixup : AT(ADDR(__spec_btb_flush_fixup) - LOAD_OFFSET) {
 		__start__btb_flush_fixup = .;
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 993d3f31832a..31f40f544de5 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -550,7 +550,7 @@ void do_barrier_nospec_fixups(bool enable)
 }
 #endif /* CONFIG_PPC_BARRIER_NOSPEC */
 
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_end)
 {
 	unsigned int instr[2], *dest;
@@ -602,7 +602,7 @@ void __init do_btb_flush_fixups(void)
 	for (; start < end; start += 2)
 		patch_btb_flush_section(start);
 }
-#endif /* CONFIG_PPC_FSL_BOOK3E */
+#endif /* CONFIG_PPC_E500 */
 
 void do_lwsync_fixups(unsigned long value, void *fixup_start, void *fixup_end)
 {
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index bc84a594ca62..8c3ea5300ac3 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -623,7 +623,7 @@ static int __init hugetlbpage_init(void)
 		if (pdshift > shift) {
 			if (!IS_ENABLED(CONFIG_PPC_8xx))
 				pgtable_cache_add(pdshift - shift);
-		} else if (IS_ENABLED(CONFIG_PPC_FSL_BOOK3E) ||
+		} else if (IS_ENABLED(CONFIG_PPC_E500) ||
 			   IS_ENABLED(CONFIG_PPC_8xx)) {
 			pgtable_cache_add(PTE_T_ORDER);
 		}
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 01772e79fd93..5bb4458deb6d 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -308,7 +308,7 @@ void __init mem_init(void)
 	}
 #endif /* CONFIG_HIGHMEM */
 
-#if defined(CONFIG_PPC_FSL_BOOK3E) && !defined(CONFIG_SMP)
+#if defined(CONFIG_PPC_E500) && !defined(CONFIG_SMP)
 	/*
 	 * If smp is enabled, next_tlbcam_idx is initialized in the cpu up
 	 * functions.... do it here for the non-smp case.
diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 341c2e0c71d2..bd9784f77f2e 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -111,7 +111,7 @@ void MMU_init_hw_patch(void);
 unsigned long mmu_mapin_ram(unsigned long base, unsigned long top);
 #endif
 
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 extern unsigned long map_mem_in_cams(unsigned long ram, int max_cam_idx,
 				     bool dryrun, bool init);
 #ifdef CONFIG_PPC32
@@ -157,7 +157,7 @@ static inline phys_addr_t v_block_mapped(unsigned long va) { return 0; }
 static inline unsigned long p_block_mapped(phys_addr_t pa) { return 0; }
 #endif
 
-#if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_PPC_8xx) || defined(CONFIG_PPC_FSL_BOOK3E)
+#if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_PPC_8xx) || defined(CONFIG_PPC_E500)
 void mmu_mark_initmem_nx(void);
 void mmu_mark_rodata_ro(void);
 #else
diff --git a/arch/powerpc/mm/nohash/Makefile b/arch/powerpc/mm/nohash/Makefile
index b467a25ee155..f3894e79d5f7 100644
--- a/arch/powerpc/mm/nohash/Makefile
+++ b/arch/powerpc/mm/nohash/Makefile
@@ -7,13 +7,13 @@ obj-$(CONFIG_PPC_BOOK3E_64)  	+= tlb_low_64e.o book3e_pgtable.o
 obj-$(CONFIG_40x)		+= 40x.o
 obj-$(CONFIG_44x)		+= 44x.o
 obj-$(CONFIG_PPC_8xx)		+= 8xx.o
-obj-$(CONFIG_PPC_FSL_BOOK3E)	+= fsl_book3e.o
+obj-$(CONFIG_PPC_E500)		+= e500.o
 obj-$(CONFIG_RANDOMIZE_BASE)	+= kaslr_booke.o
 ifdef CONFIG_HUGETLB_PAGE
-obj-$(CONFIG_PPC_FSL_BOOK3E)	+= book3e_hugetlbpage.o
+obj-$(CONFIG_PPC_E500)	+= e500_hugetlbpage.o
 endif
 
 # Disable kcov instrumentation on sensitive code
 # This is necessary for booting with kcov enabled on book3e machines
 KCOV_INSTRUMENT_tlb.o := n
-KCOV_INSTRUMENT_fsl_book3e.o := n
+KCOV_INSTRUMENT_e500.o := n
diff --git a/arch/powerpc/mm/nohash/fsl_book3e.c b/arch/powerpc/mm/nohash/e500.c
similarity index 100%
rename from arch/powerpc/mm/nohash/fsl_book3e.c
rename to arch/powerpc/mm/nohash/e500.c
diff --git a/arch/powerpc/mm/nohash/book3e_hugetlbpage.c b/arch/powerpc/mm/nohash/e500_hugetlbpage.c
similarity index 100%
rename from arch/powerpc/mm/nohash/book3e_hugetlbpage.c
rename to arch/powerpc/mm/nohash/e500_hugetlbpage.c
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index f21896ebdc5a..fcb1e5ae5c55 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -50,7 +50,7 @@
  * indirect page table entries.
  */
 #if defined(CONFIG_PPC_BOOK3E_MMU) || defined(CONFIG_PPC_8xx)
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT] = {
 	[MMU_PAGE_4K] = {
 		.shift	= 12,
@@ -166,7 +166,7 @@ int extlb_level_exc;
 
 #endif /* CONFIG_PPC64 */
 
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 /* next_tlbcam_idx is used to round-robin tlbcam entry assignment */
 DEFINE_PER_CPU(int, next_tlbcam_idx);
 EXPORT_PER_CPU_SYMBOL(next_tlbcam_idx);
@@ -441,7 +441,7 @@ static void __init setup_page_sizes(void)
 	unsigned int eptcfg;
 	int i, psize;
 
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 	unsigned int mmucfg = mfspr(SPRN_MMUCFG);
 	int fsl_mmu = mmu_has_feature(MMU_FTR_TYPE_FSL_E);
 
@@ -584,7 +584,7 @@ static void __init setup_mmu_htw(void)
 		patch_exception(0x1c0, exc_data_tlb_miss_htw_book3e);
 		patch_exception(0x1e0, exc_instruction_tlb_miss_htw_book3e);
 		break;
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 	case PPC_HTW_E6500:
 		extlb_level_exc = EX_TLB_SIZE;
 		patch_exception(0x1c0, exc_data_tlb_miss_e6500_book3e);
@@ -627,7 +627,7 @@ static void early_init_this_mmu(void)
 	}
 	mtspr(SPRN_MAS4, mas4);
 
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 	if (mmu_has_feature(MMU_FTR_TYPE_FSL_E)) {
 		unsigned int num_cams;
 		bool map = true;
@@ -680,7 +680,7 @@ static void __init early_init_mmu_global(void)
 	/* Look for HW tablewalk support */
 	setup_mmu_htw();
 
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 	if (mmu_has_feature(MMU_FTR_TYPE_FSL_E)) {
 		if (book3e_htw_mode == PPC_HTW_NONE) {
 			extlb_level_exc = EX_TLB_SIZE;
@@ -701,7 +701,7 @@ static void __init early_init_mmu_global(void)
 
 static void __init early_mmu_set_memory_limit(void)
 {
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 	if (mmu_has_feature(MMU_FTR_TYPE_FSL_E)) {
 		/*
 		 * Limit memory so we dont have linear faults.
@@ -750,7 +750,7 @@ void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 	 * We crop it to the size of the first MEMBLOCK to
 	 * avoid going over total available memory just in case...
 	 */
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#ifdef CONFIG_PPC_E500
 	if (early_mmu_has_feature(MMU_FTR_TYPE_FSL_E)) {
 		unsigned long linear_sz;
 		unsigned int num_cams;
diff --git a/arch/powerpc/mm/nohash/tlb_low.S b/arch/powerpc/mm/nohash/tlb_low.S
index 6914bc8e4ead..e1199608ff4d 100644
--- a/arch/powerpc/mm/nohash/tlb_low.S
+++ b/arch/powerpc/mm/nohash/tlb_low.S
@@ -364,7 +364,7 @@ _GLOBAL(_tlbivax_bcast)
 #error Unsupported processor type !
 #endif
 
-#if defined(CONFIG_PPC_FSL_BOOK3E)
+#if defined(CONFIG_PPC_E500)
 /*
  * extern void loadcam_entry(unsigned int index)
  *
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 5b065186ace5..32c60ad8f45d 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -107,7 +107,6 @@ config PPC_BOOK3S_64
 
 config PPC_BOOK3E_64
 	bool "Embedded processors"
-	select PPC_FSL_BOOK3E
 	select PPC_E500
 	select PPC_E500MC
 	select PPC_FPU # Make it a choice ?
@@ -259,8 +258,11 @@ config PPC_BOOK3S
 
 config PPC_E500
 	select FSL_EMB_PERFMON
-	select PPC_FSL_BOOK3E
 	bool
+	select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
+	select PPC_SMP_MUXED_IPI
+	select PPC_DOORBELL
+	select PPC_KUEP
 
 config PPC_E500MC
 	bool "e500mc Support"
@@ -320,16 +322,6 @@ config BOOKE_OR_40x
 	depends on BOOKE || 40x
 	default y
 
-# this is for common code between PPC32 & PPC64 FSL BOOKE
-config PPC_FSL_BOOK3E
-	bool
-	select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
-	imply FSL_EMB_PERFMON
-	select PPC_SMP_MUXED_IPI
-	select PPC_DOORBELL
-	select PPC_KUEP
-	default y if PPC_85xx
-
 config PTE_64BIT
 	bool
 	depends on 44x || PPC_E500 || PPC_86xx
-- 
2.37.1

