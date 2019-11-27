Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 438C510AE84
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 12:12:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NJ5825R9zDqjV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 22:12:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NHMb6XvZzDqbW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 21:39:39 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AD535B45B;
 Wed, 27 Nov 2019 10:39:33 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 rebase 10/34] powerpc/64s/exception: move real->virt switch
 into the common handler
Date: Wed, 27 Nov 2019 11:38:46 +0100
Message-Id: <a7e1411b8da4f16b8ba19e107f2e36f020b89257.1574803685.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1574803684.git.msuchanek@suse.de>
References: <cover.1574803684.git.msuchanek@suse.de>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, David Howells <dhowells@redhat.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, Christian Brauner <christian@brauner.io>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Nicolai Stange <nstange@suse.de>, Diana Craciun <diana.craciun@nxp.com>,
 Firoz Khan <firoz.khan@linaro.org>, Allison Randal <allison@lohutok.net>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Michal Suchanek <msuchanek@suse.de>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Jagadeesh Pagadala <jagdsh.linux@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Dmitry Vyukov <dvyukov@google.com>, Daniel Axtens <dja@axtens.net>,
 Gustavo Romero <gromero@linux.ibm.com>, Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oleg Nesterov <oleg@redhat.com>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Brajeswar Ghosh <brajeswar.linux@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

The real mode interrupt entry points currently use rfid to branch to
the common handler in virtual mode. This is a significant amount of
code, and forces other code (notably the KVM test) to live in the
real mode handler.

In the interest of minimising the amount of code that runs unrelocated
move the switch to virt mode into the common code, and do it with
mtmsrd, which avoids clobbering SRRs (although the post-KVMTEST
performance of real-mode interrupt handlers is not a big concern these
days).

This requires CTR to always be saved (real-mode needs to reach 0xc...)
but that's not a huge impact these days. It could be optimized away in
future.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h |   4 -
 arch/powerpc/kernel/exceptions-64s.S     | 251 ++++++++++-------------
 2 files changed, 109 insertions(+), 146 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 33f4f72eb035..47bd4ea0837d 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -33,11 +33,7 @@
 #include <asm/feature-fixups.h>
 
 /* PACA save area size in u64 units (exgen, exmc, etc) */
-#if defined(CONFIG_RELOCATABLE)
 #define EX_SIZE		10
-#else
-#define EX_SIZE		9
-#endif
 
 /*
  * maximum recursive depth of MCE exceptions
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index b8588618cdc3..5803ce3b9404 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -32,16 +32,10 @@
 #define EX_CCR		52
 #define EX_CFAR		56
 #define EX_PPR		64
-#if defined(CONFIG_RELOCATABLE)
 #define EX_CTR		72
 .if EX_SIZE != 10
 	.error "EX_SIZE is wrong"
 .endif
-#else
-.if EX_SIZE != 9
-	.error "EX_SIZE is wrong"
-.endif
-#endif
 
 /*
  * Following are fixed section helper macros.
@@ -124,22 +118,6 @@ name:
 #define EXC_HV		1
 #define EXC_STD		0
 
-#if defined(CONFIG_RELOCATABLE)
-/*
- * If we support interrupts with relocation on AND we're a relocatable kernel,
- * we need to use CTR to get to the 2nd level handler.  So, save/restore it
- * when required.
- */
-#define SAVE_CTR(reg, area)	mfctr	reg ; 	std	reg,area+EX_CTR(r13)
-#define GET_CTR(reg, area) 			ld	reg,area+EX_CTR(r13)
-#define RESTORE_CTR(reg, area)	ld	reg,area+EX_CTR(r13) ; mtctr reg
-#else
-/* ...else CTR is unused and in register. */
-#define SAVE_CTR(reg, area)
-#define GET_CTR(reg, area) 	mfctr	reg
-#define RESTORE_CTR(reg, area)
-#endif
-
 /*
  * PPR save/restore macros used in exceptions-64s.S
  * Used for P7 or later processors
@@ -199,6 +177,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #define IVEC		.L_IVEC_\name\()
 #define IHSRR		.L_IHSRR_\name\()
 #define IAREA		.L_IAREA_\name\()
+#define IVIRT		.L_IVIRT_\name\()
 #define IISIDE		.L_IISIDE_\name\()
 #define IDAR		.L_IDAR_\name\()
 #define IDSISR		.L_IDSISR_\name\()
@@ -232,6 +211,9 @@ do_define_int n
 	.ifndef IAREA
 		IAREA=PACA_EXGEN
 	.endif
+	.ifndef IVIRT
+		IVIRT=1
+	.endif
 	.ifndef IISIDE
 		IISIDE=0
 	.endif
@@ -325,7 +307,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	 * outside the head section. CONFIG_RELOCATABLE KVM expects CTR
 	 * to be saved in HSTATE_SCRATCH1.
 	 */
-	mfctr	r9
+	ld	r9,IAREA+EX_CTR(r13)
 	std	r9,HSTATE_SCRATCH1(r13)
 	__LOAD_FAR_HANDLER(r9, kvmppc_interrupt)
 	mtctr	r9
@@ -362,101 +344,6 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 .endm
 #endif
 
-.macro INT_SAVE_SRR_AND_JUMP label, hsrr, set_ri
-	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
-	.if ! \set_ri
-	xori	r10,r10,MSR_RI		/* Clear MSR_RI */
-	.endif
-	.if \hsrr == EXC_HV_OR_STD
-	BEGIN_FTR_SECTION
-	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
-	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
-	mtspr	SPRN_HSRR1,r10
-	FTR_SECTION_ELSE
-	mfspr	r11,SPRN_SRR0		/* save SRR0 */
-	mfspr	r12,SPRN_SRR1		/* and SRR1 */
-	mtspr	SPRN_SRR1,r10
-	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
-	.elseif \hsrr
-	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
-	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
-	mtspr	SPRN_HSRR1,r10
-	.else
-	mfspr	r11,SPRN_SRR0		/* save SRR0 */
-	mfspr	r12,SPRN_SRR1		/* and SRR1 */
-	mtspr	SPRN_SRR1,r10
-	.endif
-	LOAD_HANDLER(r10, \label\())
-	.if \hsrr == EXC_HV_OR_STD
-	BEGIN_FTR_SECTION
-	mtspr	SPRN_HSRR0,r10
-	HRFI_TO_KERNEL
-	FTR_SECTION_ELSE
-	mtspr	SPRN_SRR0,r10
-	RFI_TO_KERNEL
-	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
-	.elseif \hsrr
-	mtspr	SPRN_HSRR0,r10
-	HRFI_TO_KERNEL
-	.else
-	mtspr	SPRN_SRR0,r10
-	RFI_TO_KERNEL
-	.endif
-	b	.	/* prevent speculative execution */
-.endm
-
-/* INT_SAVE_SRR_AND_JUMP works for real or virt, this is faster but virt only */
-.macro INT_VIRT_SAVE_SRR_AND_JUMP label, hsrr
-#ifdef CONFIG_RELOCATABLE
-	.if \hsrr == EXC_HV_OR_STD
-	BEGIN_FTR_SECTION
-	mfspr	r11,SPRN_HSRR0	/* save HSRR0 */
-	FTR_SECTION_ELSE
-	mfspr	r11,SPRN_SRR0	/* save SRR0 */
-	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
-	.elseif \hsrr
-	mfspr	r11,SPRN_HSRR0	/* save HSRR0 */
-	.else
-	mfspr	r11,SPRN_SRR0	/* save SRR0 */
-	.endif
-	LOAD_HANDLER(r12, \label\())
-	mtctr	r12
-	.if \hsrr == EXC_HV_OR_STD
-	BEGIN_FTR_SECTION
-	mfspr	r12,SPRN_HSRR1	/* and HSRR1 */
-	FTR_SECTION_ELSE
-	mfspr	r12,SPRN_SRR1	/* and HSRR1 */
-	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
-	.elseif \hsrr
-	mfspr	r12,SPRN_HSRR1	/* and HSRR1 */
-	.else
-	mfspr	r12,SPRN_SRR1	/* and HSRR1 */
-	.endif
-	li	r10,MSR_RI
-	mtmsrd 	r10,1		/* Set RI (EE=0) */
-	bctr
-#else
-	.if \hsrr == EXC_HV_OR_STD
-	BEGIN_FTR_SECTION
-	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
-	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
-	FTR_SECTION_ELSE
-	mfspr	r11,SPRN_SRR0		/* save SRR0 */
-	mfspr	r12,SPRN_SRR1		/* and SRR1 */
-	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
-	.elseif \hsrr
-	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
-	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
-	.else
-	mfspr	r11,SPRN_SRR0		/* save SRR0 */
-	mfspr	r12,SPRN_SRR1		/* and SRR1 */
-	.endif
-	li	r10,MSR_RI
-	mtmsrd 	r10,1			/* Set RI (EE=0) */
-	b	\label
-#endif
-.endm
-
 /*
  * This is the BOOK3S interrupt entry code macro.
  *
@@ -477,6 +364,23 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
  * - Fall through and continue executing in real, unrelocated mode.
  *   This is done if early=2.
  */
+
+.macro GEN_BRANCH_TO_COMMON name, virt
+	.if \virt
+#ifndef CONFIG_RELOCATABLE
+	b	\name\()_common_virt
+#else
+	LOAD_HANDLER(r10, \name\()_common_virt)
+	mtctr	r10
+	bctr
+#endif
+	.else
+	LOAD_HANDLER(r10, \name\()_common_real)
+	mtctr	r10
+	bctr
+	.endif
+.endm
+
 .macro GEN_INT_ENTRY name, virt, ool=0
 	SET_SCRATCH0(r13)			/* save r13 */
 	GET_PACA(r13)
@@ -500,8 +404,10 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	OPT_SAVE_REG_TO_PACA(IAREA+EX_PPR, r9, CPU_FTR_HAS_PPR)
 	OPT_SAVE_REG_TO_PACA(IAREA+EX_CFAR, r10, CPU_FTR_CFAR)
 	INTERRUPT_TO_KERNEL
-	SAVE_CTR(r10, IAREA)
+	mfctr	r10
+	std	r10,IAREA+EX_CTR(r13)
 	mfcr	r9
+
 	.if (!\virt && IKVM_REAL) || (\virt && IKVM_VIRT)
 		KVMTEST \name IHSRR IVEC
 	.endif
@@ -566,27 +472,58 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	.if IEARLY == 2
 	/* nothing more */
 	.elseif IEARLY
-	mfctr	r10			/* save ctr, even for !RELOCATABLE */
 	BRANCH_TO_C000(r11, \name\()_common)
-	.elseif !\virt
-	INT_SAVE_SRR_AND_JUMP \name\()_common, IHSRR, ISET_RI
 	.else
-	INT_VIRT_SAVE_SRR_AND_JUMP \name\()_common, IHSRR
+	.if IHSRR == EXC_HV_OR_STD
+	BEGIN_FTR_SECTION
+	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
+	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
+	FTR_SECTION_ELSE
+	mfspr	r11,SPRN_SRR0		/* save SRR0 */
+	mfspr	r12,SPRN_SRR1		/* and SRR1 */
+	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+	.elseif IHSRR
+	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
+	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
+	.else
+	mfspr	r11,SPRN_SRR0		/* save SRR0 */
+	mfspr	r12,SPRN_SRR1		/* and SRR1 */
 	.endif
+	GEN_BRANCH_TO_COMMON \name \virt
+	.endif
+
 	.if \ool
 	.popsection
 	.endif
 .endm
 
 /*
- * On entry r13 points to the paca, r9-r13 are saved in the paca,
- * r9 contains the saved CR, r11 and r12 contain the saved SRR0 and
- * SRR1, and relocation is on.
- *
- * If stack=0, then the stack is already set in r1, and r1 is saved in r10.
- * PPR save and CPU accounting is not done for the !stack case (XXX why not?)
+ * __GEN_COMMON_ENTRY is required to receive the branch from interrupt
+ * entry, except in the case of the IEARLY handlers.
+ * This switches to virtual mode and sets MSR[RI].
  */
-.macro GEN_COMMON name
+.macro __GEN_COMMON_ENTRY name
+DEFINE_FIXED_SYMBOL(\name\()_common_real)
+\name\()_common_real:
+	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
+	/* MSR[RI] is clear iff using SRR regs */
+	.if IHSRR == EXC_HV_OR_STD
+	BEGIN_FTR_SECTION
+	xori	r10,r10,MSR_RI
+	END_FTR_SECTION_IFCLR(CPU_FTR_HVMODE)
+	.elseif ! IHSRR
+	xori	r10,r10,MSR_RI
+	.endif
+	mtmsrd	r10
+
+	.if IVIRT
+	.balign IFETCH_ALIGN_BYTES
+DEFINE_FIXED_SYMBOL(\name\()_common_virt)
+\name\()_common_virt:
+	.endif /* IVIRT */
+.endm
+
+.macro __GEN_COMMON_BODY name
 	.if ISTACK
 	andi.	r10,r12,MSR_PR		/* See if coming from user	*/
 	mr	r10,r1			/* Save r1			*/
@@ -604,6 +541,11 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	std	r0,GPR0(r1)		/* save r0 in stackframe	*/
 	std	r10,GPR1(r1)		/* save r1 in stackframe	*/
 
+	.if ISET_RI
+	li	r10,MSR_RI
+	mtmsrd	r10,1			/* Set MSR_RI */
+	.endif
+
 	.if ISTACK
 	.if IKUAP
 	kuap_save_amr_and_lock r9, r10, cr1, cr0
@@ -654,7 +596,7 @@ BEGIN_FTR_SECTION_NESTED(66)
 	ld	r10,IAREA+EX_CFAR(r13)
 	std	r10,ORIG_GPR3(r1)
 END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66)
-	GET_CTR(r10, IAREA)
+	ld	r10,IAREA+EX_CTR(r13)
 	std	r10,_CTR(r1)
 	std	r2,GPR2(r1)		/* save r2 in stackframe	*/
 	SAVE_4GPRS(3, r1)		/* save r3 - r6 in stackframe   */
@@ -682,6 +624,19 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66)
 	.endif
 .endm
 
+/*
+ * On entry r13 points to the paca, r9-r13 are saved in the paca,
+ * r9 contains the saved CR, r11 and r12 contain the saved SRR0 and
+ * SRR1, and relocation is on.
+ *
+ * If stack=0, then the stack is already set in r1, and r1 is saved in r10.
+ * PPR save and CPU accounting is not done for the !stack case (XXX why not?)
+ */
+.macro GEN_COMMON name
+	__GEN_COMMON_ENTRY \name
+	__GEN_COMMON_BODY \name
+.endm
+
 /*
  * Restore all registers including H/SRR0/1 saved in a stack frame of a
  * standard exception.
@@ -834,6 +789,7 @@ EXC_VIRT_NONE(0x4000, 0x100)
 INT_DEFINE_BEGIN(system_reset)
 	IVEC=0x100
 	IAREA=PACA_EXNMI
+	IVIRT=0 /* no virt entry point */
 	/*
 	 * MSR_RI is not enabled, because PACA_EXNMI and nmi stack is
 	 * being used, so a nested NMI exception would corrupt it.
@@ -913,6 +869,7 @@ TRAMP_REAL_BEGIN(system_reset_fwnmi)
 #endif /* CONFIG_PPC_PSERIES */
 
 EXC_COMMON_BEGIN(system_reset_common)
+	__GEN_COMMON_ENTRY system_reset
 	/*
 	 * Increment paca->in_nmi then enable MSR_RI. SLB or MCE will be able
 	 * to recover, but nested NMI will notice in_nmi and not recover
@@ -928,7 +885,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 	mr	r10,r1
 	ld	r1,PACA_NMI_EMERG_SP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
-	GEN_COMMON system_reset
+	__GEN_COMMON_BODY system_reset
 	bl	save_nvgprs
 	/*
 	 * Set IRQS_ALL_DISABLED unconditionally so arch_irqs_disabled does
@@ -973,6 +930,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 INT_DEFINE_BEGIN(machine_check_early)
 	IVEC=0x200
 	IAREA=PACA_EXMC
+	IVIRT=0 /* no virt entry point */
 	/*
 	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
 	 * nested machine check corrupts it. machine_check_common enables
@@ -990,6 +948,7 @@ INT_DEFINE_END(machine_check_early)
 INT_DEFINE_BEGIN(machine_check)
 	IVEC=0x200
 	IAREA=PACA_EXMC
+	IVIRT=0 /* no virt entry point */
 	ISET_RI=0
 	IDAR=1
 	IDSISR=1
@@ -1022,7 +981,6 @@ TRAMP_KVM_BEGIN(machine_check_kvm)
 	EXCEPTION_RESTORE_REGS EXC_STD
 
 EXC_COMMON_BEGIN(machine_check_early_common)
-	mtctr	r10			/* Restore ctr */
 	mfspr	r11,SPRN_SRR0
 	mfspr	r12,SPRN_SRR1
 
@@ -1061,7 +1019,7 @@ EXC_COMMON_BEGIN(machine_check_early_common)
 	bgt	cr1,unrecoverable_mce	/* Check if we hit limit of 4 */
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame */
 
-	GEN_COMMON machine_check_early
+	__GEN_COMMON_BODY machine_check_early
 
 BEGIN_FTR_SECTION
 	bl	enable_machine_check
@@ -1448,6 +1406,8 @@ EXC_VIRT_END(program_check, 0x4700, 0x100)
 TRAMP_KVM_BEGIN(program_check_kvm)
 	GEN_KVM program_check
 EXC_COMMON_BEGIN(program_check_common)
+	__GEN_COMMON_ENTRY program_check
+
 	/*
 	 * It's possible to receive a TM Bad Thing type program check with
 	 * userspace register values (in particular r1), but with SRR1 reporting
@@ -1473,11 +1433,11 @@ EXC_COMMON_BEGIN(program_check_common)
 	ld	r1,PACAEMERGSP(r13)	/* Use emergency stack		*/
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
 	__ISTACK(program_check)=0
-	GEN_COMMON program_check
+	__GEN_COMMON_BODY program_check
 	b 3f
 2:
 	__ISTACK(program_check)=1
-	GEN_COMMON program_check
+	__GEN_COMMON_BODY program_check
 3:
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -1874,14 +1834,13 @@ TRAMP_KVM_BEGIN(hmi_exception_kvm)
 	GEN_KVM hmi_exception
 
 EXC_COMMON_BEGIN(hmi_exception_early_common)
-	mtctr	r10			/* Restore ctr */
 	mfspr	r11,SPRN_HSRR0		/* Save HSRR0 */
 	mfspr	r12,SPRN_HSRR1		/* Save HSRR1 */
 	mr	r10,r1			/* Save r1 */
 	ld	r1,PACAEMERGSP(r13)	/* Use emergency stack for realmode */
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
 
-	GEN_COMMON hmi_exception_early
+	__GEN_COMMON_BODY hmi_exception_early
 
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	hmi_exception_realmode
@@ -2208,7 +2167,9 @@ EXC_REAL_BEGIN(denorm_exception, 0x1500, 0x100)
 	bne+	denorm_assist
 #endif
 	KVMTEST denorm_exception, EXC_HV, 0x1500
-	INT_SAVE_SRR_AND_JUMP denorm_exception_common, EXC_HV, 1
+	mfspr	r11,SPRN_HSRR0
+	mfspr	r12,SPRN_HSRR1
+	GEN_BRANCH_TO_COMMON denorm_exception, virt=0
 EXC_REAL_END(denorm_exception, 0x1500, 0x100)
 #ifdef CONFIG_PPC_DENORMALISATION
 EXC_VIRT_BEGIN(denorm_exception, 0x5500, 0x100)
@@ -2216,7 +2177,9 @@ EXC_VIRT_BEGIN(denorm_exception, 0x5500, 0x100)
 	mfspr	r10,SPRN_HSRR1
 	andis.	r10,r10,(HSRR1_DENORM)@h /* denorm? */
 	bne+	denorm_assist
-	INT_VIRT_SAVE_SRR_AND_JUMP denorm_exception_common, EXC_HV
+	mfspr	r11,SPRN_HSRR0
+	mfspr	r12,SPRN_HSRR1
+	GEN_BRANCH_TO_COMMON denorm_exception, virt=1
 EXC_VIRT_END(denorm_exception, 0x5500, 0x100)
 #else
 EXC_VIRT_NONE(0x5500, 0x100)
@@ -2387,7 +2350,11 @@ EXC_VIRT_NONE(0x5800, 0x100)
 	std	r12,PACA_EXGEN+EX_R12(r13);		\
 	GET_SCRATCH0(r10);				\
 	std	r10,PACA_EXGEN+EX_R13(r13);		\
-	INT_SAVE_SRR_AND_JUMP soft_nmi_common, _H, 1
+	mfspr	r11,SPRN_SRR0;		/* save SRR0 */	\
+	mfspr	r12,SPRN_SRR1;		/* and SRR1 */	\
+	LOAD_HANDLER(r10, soft_nmi_common);		\
+	mtctr	r10;					\
+	bctr
 
 /*
  * Branch to soft_nmi_interrupt using the emergency stack. The emergency
@@ -2403,7 +2370,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	ld	r1,PACAEMERGSP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
 	__ISTACK(decrementer)=0
-	GEN_COMMON decrementer
+	__GEN_COMMON_BODY decrementer
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	soft_nmi_interrupt
-- 
2.23.0

