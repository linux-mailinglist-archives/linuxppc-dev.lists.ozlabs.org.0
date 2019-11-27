Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8525B10AE7F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 12:07:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NHzj2hfWzDqjX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 22:07:29 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NHMZ35dSzDqjp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 21:39:38 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 387D3B2E4;
 Wed, 27 Nov 2019 10:39:35 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 rebase 11/34] powerpc/64s/exception: move soft-mask test to
 common code
Date: Wed, 27 Nov 2019 11:38:47 +0100
Message-Id: <93789e5d2de7ea6e4e8cb528fee8e1bbdbb06f11.1574803685.git.msuchanek@suse.de>
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

As well as moving code out of the unrelocated vectors, this allows the
masked handlers to be moved to common code, and allows the soft_nmi
handler to be generated more like a regular handler.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 106 +++++++++++++--------------
 1 file changed, 49 insertions(+), 57 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 5803ce3b9404..fbc3fbb293f7 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -411,36 +411,6 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	.if (!\virt && IKVM_REAL) || (\virt && IKVM_VIRT)
 		KVMTEST \name IHSRR IVEC
 	.endif
-	.if IMASK
-		lbz	r10,PACAIRQSOFTMASK(r13)
-		andi.	r10,r10,IMASK
-		/* Associate vector numbers with bits in paca->irq_happened */
-		.if IVEC == 0x500 || IVEC == 0xea0
-		li	r10,PACA_IRQ_EE
-		.elseif IVEC == 0x900
-		li	r10,PACA_IRQ_DEC
-		.elseif IVEC == 0xa00 || IVEC == 0xe80
-		li	r10,PACA_IRQ_DBELL
-		.elseif IVEC == 0xe60
-		li	r10,PACA_IRQ_HMI
-		.elseif IVEC == 0xf00
-		li	r10,PACA_IRQ_PMI
-		.else
-		.abort "Bad maskable vector"
-		.endif
-
-		.if IHSRR == EXC_HV_OR_STD
-		BEGIN_FTR_SECTION
-		bne	masked_Hinterrupt
-		FTR_SECTION_ELSE
-		bne	masked_interrupt
-		ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
-		.elseif IHSRR
-		bne	masked_Hinterrupt
-		.else
-		bne	masked_interrupt
-		.endif
-	.endif
 
 	std	r11,IAREA+EX_R11(r13)
 	std	r12,IAREA+EX_R12(r13)
@@ -524,6 +494,37 @@ DEFINE_FIXED_SYMBOL(\name\()_common_virt)
 .endm
 
 .macro __GEN_COMMON_BODY name
+	.if IMASK
+		lbz	r10,PACAIRQSOFTMASK(r13)
+		andi.	r10,r10,IMASK
+		/* Associate vector numbers with bits in paca->irq_happened */
+		.if IVEC == 0x500 || IVEC == 0xea0
+		li	r10,PACA_IRQ_EE
+		.elseif IVEC == 0x900
+		li	r10,PACA_IRQ_DEC
+		.elseif IVEC == 0xa00 || IVEC == 0xe80
+		li	r10,PACA_IRQ_DBELL
+		.elseif IVEC == 0xe60
+		li	r10,PACA_IRQ_HMI
+		.elseif IVEC == 0xf00
+		li	r10,PACA_IRQ_PMI
+		.else
+		.abort "Bad maskable vector"
+		.endif
+
+		.if IHSRR == EXC_HV_OR_STD
+		BEGIN_FTR_SECTION
+		bne	masked_Hinterrupt
+		FTR_SECTION_ELSE
+		bne	masked_interrupt
+		ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+		.elseif IHSRR
+		bne	masked_Hinterrupt
+		.else
+		bne	masked_interrupt
+		.endif
+	.endif
+
 	.if ISTACK
 	andi.	r10,r12,MSR_PR		/* See if coming from user	*/
 	mr	r10,r1			/* Save r1			*/
@@ -2343,18 +2344,10 @@ EXC_VIRT_NONE(0x5800, 0x100)
 
 #ifdef CONFIG_PPC_WATCHDOG
 
-#define MASKED_DEC_HANDLER_LABEL 3f
-
-#define MASKED_DEC_HANDLER(_H)				\
-3: /* soft-nmi */					\
-	std	r12,PACA_EXGEN+EX_R12(r13);		\
-	GET_SCRATCH0(r10);				\
-	std	r10,PACA_EXGEN+EX_R13(r13);		\
-	mfspr	r11,SPRN_SRR0;		/* save SRR0 */	\
-	mfspr	r12,SPRN_SRR1;		/* and SRR1 */	\
-	LOAD_HANDLER(r10, soft_nmi_common);		\
-	mtctr	r10;					\
-	bctr
+INT_DEFINE_BEGIN(soft_nmi)
+	IVEC=0x900
+	ISTACK=0
+INT_DEFINE_END(soft_nmi)
 
 /*
  * Branch to soft_nmi_interrupt using the emergency stack. The emergency
@@ -2366,19 +2359,16 @@ EXC_VIRT_NONE(0x5800, 0x100)
  * and run it entirely with interrupts hard disabled.
  */
 EXC_COMMON_BEGIN(soft_nmi_common)
+	mfspr	r11,SPRN_SRR0
 	mr	r10,r1
 	ld	r1,PACAEMERGSP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
-	__ISTACK(decrementer)=0
-	__GEN_COMMON_BODY decrementer
+	__GEN_COMMON_BODY soft_nmi
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	soft_nmi_interrupt
 	b	ret_from_except
 
-#else /* CONFIG_PPC_WATCHDOG */
-#define MASKED_DEC_HANDLER_LABEL 2f /* normal return */
-#define MASKED_DEC_HANDLER(_H)
 #endif /* CONFIG_PPC_WATCHDOG */
 
 /*
@@ -2397,7 +2387,6 @@ masked_Hinterrupt:
 	.else
 masked_interrupt:
 	.endif
-	std	r11,PACA_EXGEN+EX_R11(r13)
 	lbz	r11,PACAIRQHAPPENED(r13)
 	or	r11,r11,r10
 	stb	r11,PACAIRQHAPPENED(r13)
@@ -2406,26 +2395,30 @@ masked_interrupt:
 	lis	r10,0x7fff
 	ori	r10,r10,0xffff
 	mtspr	SPRN_DEC,r10
-	b	MASKED_DEC_HANDLER_LABEL
+#ifdef CONFIG_PPC_WATCHDOG
+	b	soft_nmi_common
+#else
+	b	2f
+#endif
 1:	andi.	r10,r10,PACA_IRQ_MUST_HARD_MASK
 	beq	2f
+	xori	r12,r12,MSR_EE	/* clear MSR_EE */
 	.if \hsrr
-	mfspr	r10,SPRN_HSRR1
-	xori	r10,r10,MSR_EE	/* clear MSR_EE */
-	mtspr	SPRN_HSRR1,r10
+	mtspr	SPRN_HSRR1,r12
 	.else
-	mfspr	r10,SPRN_SRR1
-	xori	r10,r10,MSR_EE	/* clear MSR_EE */
-	mtspr	SPRN_SRR1,r10
+	mtspr	SPRN_SRR1,r12
 	.endif
 	ori	r11,r11,PACA_IRQ_HARD_DIS
 	stb	r11,PACAIRQHAPPENED(r13)
 2:	/* done */
+	ld	r10,PACA_EXGEN+EX_CTR(r13)
+	mtctr	r10
 	mtcrf	0x80,r9
 	std	r1,PACAR1(r13)
 	ld	r9,PACA_EXGEN+EX_R9(r13)
 	ld	r10,PACA_EXGEN+EX_R10(r13)
 	ld	r11,PACA_EXGEN+EX_R11(r13)
+	ld	r12,PACA_EXGEN+EX_R12(r13)
 	/* returns to kernel where r13 must be set up, so don't restore it */
 	.if \hsrr
 	HRFI_TO_KERNEL
@@ -2433,7 +2426,6 @@ masked_interrupt:
 	RFI_TO_KERNEL
 	.endif
 	b	.
-	MASKED_DEC_HANDLER(\hsrr\())
 .endm
 
 TRAMP_REAL_BEGIN(stf_barrier_fallback)
@@ -2540,7 +2532,7 @@ TRAMP_REAL_BEGIN(hrfi_flush_fallback)
  * instruction code patches (which end up in the common .text area)
  * cannot reach these if they are put there.
  */
-USE_FIXED_SECTION(virt_trampolines)
+USE_TEXT_SECTION()
 	MASKED_INTERRUPT EXC_STD
 	MASKED_INTERRUPT EXC_HV
 
-- 
2.23.0

