Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 771D85BD34B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 19:08:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWWMh0d2Qz3gGg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 03:08:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWWGL5DDhz3f6y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 03:03:22 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MWWF51Ggdz9sl7;
	Mon, 19 Sep 2022 19:02:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cU-hC9Sg6Apn; Mon, 19 Sep 2022 19:02:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MWWDr5kH7z9sl5;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A98D18B788;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id GDo-WsqwCt_p; Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.8])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5F1F18B779;
	Mon, 19 Sep 2022 19:02:04 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 28JH1wXB1549620
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 19:01:58 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 28JH1wnH1549619;
	Mon, 19 Sep 2022 19:01:58 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 11/19] powerpc: Change CONFIG_E500 to CONFIG_PPC_E500
Date: Mon, 19 Sep 2022 19:01:35 +0200
Message-Id: <e63b22083c11c4300f4a82d3123a46e5fdd54fa6.1663606876.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <828f6a64eeb51ce9abfa1d4e84c521a02fecebb8.1663606875.git.christophe.leroy@csgroup.eu>
References: <828f6a64eeb51ce9abfa1d4e84c521a02fecebb8.1663606875.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1663606899; l=14498; s=20211009; h=from:subject:message-id; bh=NaENgatv4riPG5aNVmkPesxd/8VILrunD48u+9oZ9Og=; b=+GMr0CgzOjiIVdV8KkMYSF4d69St9bBNUSLjxXjpiVIo331/wksKdbMeFnYP733tj3sLOLOoR3g0 5m6zb668AHCsrR5X/HuXD6x3uPUYx3p8WYD0wG8wgA28HOiItTmg
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

It will be used outside arch/powerpc, make it clear its a
powerpc configuration item.

And we already have CONFIG_PPC_E500MC, so that will make
it more consistant.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Makefile                     |  2 +-
 arch/powerpc/include/asm/cputable.h       |  4 ++--
 arch/powerpc/include/asm/kgdb.h           |  2 +-
 arch/powerpc/include/asm/mmu.h            |  4 ++--
 arch/powerpc/include/asm/reg_booke.h      |  6 +++---
 arch/powerpc/include/asm/synch.h          |  2 +-
 arch/powerpc/include/asm/vdso/timebase.h  |  2 +-
 arch/powerpc/kernel/Makefile              |  2 +-
 arch/powerpc/kernel/cpu_setup_fsl_booke.S |  4 ++--
 arch/powerpc/kernel/entry_32.S            |  4 ++--
 arch/powerpc/kernel/head_85xx.S           |  4 ++--
 arch/powerpc/kernel/head_booke.h          |  2 +-
 arch/powerpc/kernel/setup_32.c            |  2 +-
 arch/powerpc/kernel/traps.c               |  2 +-
 arch/powerpc/kvm/Kconfig                  |  4 ++--
 arch/powerpc/platforms/Kconfig.cputype    | 26 +++++++++++------------
 arch/powerpc/sysdev/fsl_pci.c             |  2 +-
 arch/powerpc/sysdev/fsl_rio.c             |  2 +-
 18 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index f6d477c4aa64..cb01832385d0 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -210,7 +210,7 @@ KBUILD_CFLAGS		+= $(call cc-option,-mno-string)
 cpu-as-$(CONFIG_40x)		+= -Wa,-m405
 cpu-as-$(CONFIG_44x)		+= -Wa,-m440
 cpu-as-$(CONFIG_ALTIVEC)	+= $(call as-option,-Wa$(comma)-maltivec)
-cpu-as-$(CONFIG_E500)		+= -Wa,-me500
+cpu-as-$(CONFIG_PPC_E500)		+= -Wa,-me500
 
 # When using '-many -mpower4' gas will first try and find a matching power4
 # mnemonic and failing that it will allow any valid mnemonic that GAS knows
diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 27875f0b7bc7..757dbded11dc 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -510,7 +510,7 @@ enum {
 #elif defined(CONFIG_44x)
 	    CPU_FTRS_44X | CPU_FTRS_440x6 |
 #endif
-#ifdef CONFIG_E500
+#ifdef CONFIG_PPC_E500
 	    CPU_FTRS_E500 | CPU_FTRS_E500_2 |
 #endif
 #ifdef CONFIG_PPC_E500MC
@@ -584,7 +584,7 @@ enum {
 #elif defined(CONFIG_44x)
 	    CPU_FTRS_44X & CPU_FTRS_440x6 &
 #endif
-#ifdef CONFIG_E500
+#ifdef CONFIG_PPC_E500
 	    CPU_FTRS_E500 & CPU_FTRS_E500_2 &
 #endif
 #ifdef CONFIG_PPC_E500MC
diff --git a/arch/powerpc/include/asm/kgdb.h b/arch/powerpc/include/asm/kgdb.h
index a9e098a3b881..715c18b75334 100644
--- a/arch/powerpc/include/asm/kgdb.h
+++ b/arch/powerpc/include/asm/kgdb.h
@@ -52,7 +52,7 @@ static inline void arch_kgdb_breakpoint(void)
 /* On non-E500 family PPC32 we determine the size by picking the last
  * register we need, but on E500 we skip sections so we list what we
  * need to store, and add it up. */
-#ifndef CONFIG_E500
+#ifndef CONFIG_PPC_E500
 #define MAXREG			(PT_FPSCR+1)
 #else
 /* 32 GPRs (8 bytes), nip, msr, ccr, link, ctr, xer, acc (8 bytes), spefscr*/
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 860d0290ca4d..5b46da9ba7f6 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -162,7 +162,7 @@ enum {
 #elif defined(CONFIG_44x)
 		MMU_FTR_TYPE_44x |
 #endif
-#ifdef CONFIG_E500
+#ifdef CONFIG_PPC_E500
 		MMU_FTR_TYPE_FSL_E | MMU_FTR_BIG_PHYS | MMU_FTR_USE_TLBILX |
 #endif
 #ifdef CONFIG_PPC_BOOK3S_32
@@ -211,7 +211,7 @@ enum {
 #elif defined(CONFIG_44x)
 #define MMU_FTRS_ALWAYS		MMU_FTR_TYPE_44x
 #endif
-#ifdef CONFIG_E500
+#ifdef CONFIG_PPC_E500
 #define MMU_FTRS_ALWAYS		MMU_FTR_TYPE_FSL_E
 #endif
 
diff --git a/arch/powerpc/include/asm/reg_booke.h b/arch/powerpc/include/asm/reg_booke.h
index 17b8dcd9a40d..af56980b6cdb 100644
--- a/arch/powerpc/include/asm/reg_booke.h
+++ b/arch/powerpc/include/asm/reg_booke.h
@@ -246,7 +246,7 @@
 #define PPC47x_MCSR_FPR	0x00800000 /* FPR parity error */
 #define PPC47x_MCSR_IPR	0x00400000 /* Imprecise Machine Check Exception */
 
-#ifdef CONFIG_E500
+#ifdef CONFIG_PPC_E500
 /* All e500 */
 #define MCSR_MCP 	0x80000000UL /* Machine Check Input Pin */
 #define MCSR_ICPERR 	0x40000000UL /* I-Cache Parity Error */
@@ -282,7 +282,7 @@
 #endif
 
 /* Bit definitions for the HID1 */
-#ifdef CONFIG_E500
+#ifdef CONFIG_PPC_E500
 /* e500v1/v2 */
 #define HID1_PLL_CFG_MASK 0xfc000000	/* PLL_CFG input pins */
 #define HID1_RFXE	0x00020000	/* Read fault exception enable */
@@ -545,7 +545,7 @@
 #define TCR_FIE		0x00800000	/* FIT Interrupt Enable */
 #define TCR_ARE		0x00400000	/* Auto Reload Enable */
 
-#ifdef CONFIG_E500
+#ifdef CONFIG_PPC_E500
 #define TCR_GET_WP(tcr)  ((((tcr) & 0xC0000000) >> 30) | \
 			      (((tcr) & 0x1E0000) >> 15))
 #else
diff --git a/arch/powerpc/include/asm/synch.h b/arch/powerpc/include/asm/synch.h
index 7130176d8cb8..b0b4c64870d7 100644
--- a/arch/powerpc/include/asm/synch.h
+++ b/arch/powerpc/include/asm/synch.h
@@ -44,7 +44,7 @@ static inline void ppc_after_tlbiel_barrier(void)
 
 #if defined(__powerpc64__)
 #    define LWSYNC	lwsync
-#elif defined(CONFIG_E500)
+#elif defined(CONFIG_PPC_E500)
 #    define LWSYNC					\
 	START_LWSYNC_SECTION(96);			\
 	sync;						\
diff --git a/arch/powerpc/include/asm/vdso/timebase.h b/arch/powerpc/include/asm/vdso/timebase.h
index 891c9d5eaabe..e9245f86a46c 100644
--- a/arch/powerpc/include/asm/vdso/timebase.h
+++ b/arch/powerpc/include/asm/vdso/timebase.h
@@ -12,7 +12,7 @@
  * We use __powerpc64__ here because we want the compat VDSO to use the 32-bit
  * version below in the else case of the ifdef.
  */
-#if defined(__powerpc64__) && (defined(CONFIG_PPC_CELL) || defined(CONFIG_E500))
+#if defined(__powerpc64__) && (defined(CONFIG_PPC_CELL) || defined(CONFIG_PPC_E500))
 #define mftb()		({unsigned long rval;				\
 			asm volatile(					\
 				"90:	mfspr %0, %2;\n"		\
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 4483cae7dc9f..33dafd12e81d 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -101,7 +101,7 @@ obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
 obj-$(CONFIG_FA_DUMP)		+= fadump.o
 obj-$(CONFIG_PRESERVE_FA_DUMP)	+= fadump.o
 ifdef CONFIG_PPC32
-obj-$(CONFIG_E500)		+= idle_e500.o
+obj-$(CONFIG_PPC_E500)		+= idle_e500.o
 endif
 obj-$(CONFIG_PPC_BOOK3S_32)	+= idle_6xx.o l2cr_6xx.o cpu_setup_6xx.o
 obj-$(CONFIG_TAU)		+= tau_6xx.o
diff --git a/arch/powerpc/kernel/cpu_setup_fsl_booke.S b/arch/powerpc/kernel/cpu_setup_fsl_booke.S
index 4bf33f1b4193..058336079069 100644
--- a/arch/powerpc/kernel/cpu_setup_fsl_booke.S
+++ b/arch/powerpc/kernel/cpu_setup_fsl_booke.S
@@ -108,7 +108,7 @@ _GLOBAL(__setup_cpu_e6500)
 #endif /* CONFIG_PPC_E500MC */
 
 #ifdef CONFIG_PPC32
-#ifdef CONFIG_E500
+#ifdef CONFIG_PPC_E500
 #ifndef CONFIG_PPC_E500MC
 _GLOBAL(__setup_cpu_e500v1)
 _GLOBAL(__setup_cpu_e500v2)
@@ -156,7 +156,7 @@ _GLOBAL(__setup_cpu_e5500)
 	mtlr	r5
 	blr
 #endif /* CONFIG_PPC_E500MC */
-#endif /* CONFIG_E500 */
+#endif /* CONFIG_PPC_E500 */
 #endif /* CONFIG_PPC32 */
 
 #ifdef CONFIG_PPC_BOOK3E_64
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 1d599df6f169..e6d5fe3a8585 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -49,7 +49,7 @@
  */
 	.align	12
 
-#if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_E500)
+#if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_PPC_E500)
 	.globl	prepare_transfer_to_handler
 prepare_transfer_to_handler:
 	/* if from kernel, check interrupted DOZE/NAP mode */
@@ -71,7 +71,7 @@ prepare_transfer_to_handler:
 	lwz	r2, GPR2(r11)
 	b	fast_exception_return
 _ASM_NOKPROBE_SYMBOL(prepare_transfer_to_handler)
-#endif /* CONFIG_PPC_BOOK3S_32 || CONFIG_E500 */
+#endif /* CONFIG_PPC_BOOK3S_32 || CONFIG_PPC_E500 */
 
 #if defined(CONFIG_PPC_KUEP) && defined(CONFIG_PPC_BOOK3S_32)
 	.globl	__kuep_lock
diff --git a/arch/powerpc/kernel/head_85xx.S b/arch/powerpc/kernel/head_85xx.S
index 48b168b5dc57..52c0ab416326 100644
--- a/arch/powerpc/kernel/head_85xx.S
+++ b/arch/powerpc/kernel/head_85xx.S
@@ -912,7 +912,7 @@ get_phys_addr:
  * Global functions
  */
 
-#ifdef CONFIG_E500
+#ifdef CONFIG_PPC_E500
 #ifndef CONFIG_PPC_E500MC
 /* Adjust or setup IVORs for e500v1/v2 */
 _GLOBAL(__setup_e500_ivors)
@@ -955,7 +955,7 @@ _GLOBAL(__setup_ehv_ivors)
 	sync
 	blr
 #endif /* CONFIG_PPC_E500MC */
-#endif /* CONFIG_E500 */
+#endif /* CONFIG_PPC_E500 */
 
 #ifdef CONFIG_SPE
 /*
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index bb6d5d0fc4ac..a2f82ced6e4a 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -103,7 +103,7 @@ END_BTB_FLUSH_SECTION
 .endm
 
 .macro prepare_transfer_to_handler
-#ifdef CONFIG_E500
+#ifdef CONFIG_PPC_E500
 	andi.	r12,r9,MSR_PR
 	bne	777f
 	bl	prepare_transfer_to_handler
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index 813261789303..b761cc1a403c 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -207,7 +207,7 @@ void __init setup_power_save(void)
 		ppc_md.power_save = ppc6xx_idle;
 #endif
 
-#ifdef CONFIG_E500
+#ifdef CONFIG_PPC_E500
 	if (cpu_has_feature(CPU_FTR_CAN_DOZE) ||
 	    cpu_has_feature(CPU_FTR_CAN_NAP))
 		ppc_md.power_save = e500_idle;
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index f181c434289e..62ec50a7a8ef 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -600,7 +600,7 @@ static inline int check_io_access(struct pt_regs *regs)
 
 #define inst_length(reason)	(((reason) & REASON_PREFIXED) ? 8 : 4)
 
-#if defined(CONFIG_E500)
+#if defined(CONFIG_PPC_E500)
 int machine_check_e500mc(struct pt_regs *regs)
 {
 	unsigned long mcsr = mfspr(SPRN_MCSR);
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index dcb398d5e009..61cdd782d3c5 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -189,7 +189,7 @@ config KVM_EXIT_TIMING
 
 config KVM_E500V2
 	bool "KVM support for PowerPC E500v2 processors"
-	depends on E500 && !PPC_E500MC
+	depends on PPC_E500 && !PPC_E500MC
 	select KVM
 	select KVM_MMIO
 	select MMU_NOTIFIER
@@ -220,7 +220,7 @@ config KVM_E500MC
 
 config KVM_MPIC
 	bool "KVM in-kernel MPIC emulation"
-	depends on KVM && E500
+	depends on KVM && PPC_E500
 	select HAVE_KVM_IRQCHIP
 	select HAVE_KVM_IRQFD
 	select HAVE_KVM_IRQ_ROUTING
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index d63b6386a974..5b065186ace5 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -33,7 +33,7 @@ config PPC_BOOK3S_32
 
 config PPC_85xx
 	bool "Freescale 85xx"
-	select E500
+	select PPC_E500
 
 config PPC_8xx
 	bool "Freescale 8xx"
@@ -108,7 +108,7 @@ config PPC_BOOK3S_64
 config PPC_BOOK3E_64
 	bool "Embedded processors"
 	select PPC_FSL_BOOK3E
-	select E500
+	select PPC_E500
 	select PPC_E500MC
 	select PPC_FPU # Make it a choice ?
 	select PPC_SMP_MUXED_IPI
@@ -175,11 +175,11 @@ config POWER9_CPU
 
 config E5500_CPU
 	bool "Freescale e5500"
-	depends on PPC64 && E500
+	depends on PPC64 && PPC_E500
 
 config E6500_CPU
 	bool "Freescale e6500"
-	depends on PPC64 && E500
+	depends on PPC64 && PPC_E500
 
 config 405_CPU
 	bool "40x family"
@@ -257,7 +257,7 @@ config PPC_BOOK3S
 	def_bool y
 	depends on PPC_BOOK3S_32 || PPC_BOOK3S_64
 
-config E500
+config PPC_E500
 	select FSL_EMB_PERFMON
 	select PPC_FSL_BOOK3E
 	bool
@@ -266,7 +266,7 @@ config PPC_E500MC
 	bool "e500mc Support"
 	select PPC_FPU
 	select COMMON_CLK
-	depends on E500
+	depends on PPC_E500
 	help
 	  This must be enabled for running on e500mc (and derivatives
 	  such as e5500/e6500), and must be disabled for running on
@@ -289,7 +289,7 @@ config PPC_FPU
 
 config FSL_EMB_PERFMON
 	bool "Freescale Embedded Perfmon"
-	depends on E500 || PPC_83xx
+	depends on PPC_E500 || PPC_83xx
 	help
 	  This is the Performance Monitor support found on the e500 core
 	  and some e300 cores (c3 and c4).  Select this only if your
@@ -302,7 +302,7 @@ config FSL_EMB_PERF_EVENT
 
 config FSL_EMB_PERF_EVENT_E500
 	bool
-	depends on FSL_EMB_PERF_EVENT && E500
+	depends on FSL_EMB_PERF_EVENT && PPC_E500
 	default y
 
 config 4xx
@@ -312,7 +312,7 @@ config 4xx
 
 config BOOKE
 	bool
-	depends on E500 || 44x || PPC_BOOK3E_64
+	depends on PPC_E500 || 44x || PPC_BOOK3E_64
 	default y
 
 config BOOKE_OR_40x
@@ -332,12 +332,12 @@ config PPC_FSL_BOOK3E
 
 config PTE_64BIT
 	bool
-	depends on 44x || E500 || PPC_86xx
+	depends on 44x || PPC_E500 || PPC_86xx
 	default y if PHYS_64BIT
 
 config PHYS_64BIT
-	bool 'Large physical address support' if E500 || PPC_86xx
-	depends on (44x || E500 || PPC_86xx) && !PPC_83xx && !PPC_82xx
+	bool 'Large physical address support' if PPC_E500 || PPC_86xx
+	depends on (44x || PPC_E500 || PPC_86xx) && !PPC_83xx && !PPC_82xx
 	select PHYS_ADDR_T_64BIT
 	help
 	  This option enables kernel support for larger than 32-bit physical
@@ -384,7 +384,7 @@ config VSX
 
 config SPE_POSSIBLE
 	def_bool y
-	depends on E500 && !PPC_E500MC
+	depends on PPC_E500 && !PPC_E500MC
 
 config SPE
 	bool "SPE Support"
diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index 1ef7400ef244..974d3db6faab 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -943,7 +943,7 @@ u64 fsl_pci_immrbar_base(struct pci_controller *hose)
 	return 0;
 }
 
-#ifdef CONFIG_E500
+#ifdef CONFIG_PPC_E500
 static int mcheck_handle_load(struct pt_regs *regs, u32 inst)
 {
 	unsigned int rd, ra, rb, d;
diff --git a/arch/powerpc/sysdev/fsl_rio.c b/arch/powerpc/sysdev/fsl_rio.c
index 4647c6074f3b..c8f044d62fe2 100644
--- a/arch/powerpc/sysdev/fsl_rio.c
+++ b/arch/powerpc/sysdev/fsl_rio.c
@@ -98,7 +98,7 @@ resource_size_t rio_law_start;
 struct fsl_rio_dbell *dbell;
 struct fsl_rio_pw *pw;
 
-#ifdef CONFIG_E500
+#ifdef CONFIG_PPC_E500
 int fsl_rio_mcheck_exception(struct pt_regs *regs)
 {
 	const struct exception_table_entry *entry;
-- 
2.37.1

