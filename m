Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D80F96DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 18:16:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CDtd53DJzF5Hg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 04:16:41 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CDMp2mDkzF18B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 03:53:26 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4D72FB312;
 Tue, 12 Nov 2019 16:53:23 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/33] powerpc/64s/exception: Remove old INT_ENTRY macro
Date: Tue, 12 Nov 2019 17:52:04 +0100
Message-Id: <419bffb38de391d451c9395d10ceeb906e2578e1.1573576649.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1573576649.git.msuchanek@suse.de>
References: <cover.1573576649.git.msuchanek@suse.de>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 68 ++++++++++++----------------
 1 file changed, 30 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index b5decc9a0cbf..ba2dcd91aaaf 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -482,13 +482,13 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
  * - Fall through and continue executing in real, unrelocated mode.
  *   This is done if early=2.
  */
-.macro INT_HANDLER name, vec, ool=0, early=0, virt=0, hsrr=0, area=PACA_EXGEN, ri=1, dar=0, dsisr=0, bitmask=0, kvm=0
+.macro GEN_INT_ENTRY name, virt, ool=0
 	SET_SCRATCH0(r13)			/* save r13 */
 	GET_PACA(r13)
-	std	r9,\area\()+EX_R9(r13)		/* save r9 */
+	std	r9,IAREA+EX_R9(r13)		/* save r9 */
 	OPT_GET_SPR(r9, SPRN_PPR, CPU_FTR_HAS_PPR)
 	HMT_MEDIUM
-	std	r10,\area\()+EX_R10(r13)	/* save r10 - r12 */
+	std	r10,IAREA+EX_R10(r13)		/* save r10 - r12 */
 	OPT_GET_SPR(r10, SPRN_CFAR, CPU_FTR_CFAR)
 	.if \ool
 	.if !\virt
@@ -502,47 +502,47 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	.endif
 	.endif
 
-	OPT_SAVE_REG_TO_PACA(\area\()+EX_PPR, r9, CPU_FTR_HAS_PPR)
-	OPT_SAVE_REG_TO_PACA(\area\()+EX_CFAR, r10, CPU_FTR_CFAR)
+	OPT_SAVE_REG_TO_PACA(IAREA+EX_PPR, r9, CPU_FTR_HAS_PPR)
+	OPT_SAVE_REG_TO_PACA(IAREA+EX_CFAR, r10, CPU_FTR_CFAR)
 	INTERRUPT_TO_KERNEL
-	SAVE_CTR(r10, \area\())
+	SAVE_CTR(r10, IAREA)
 	mfcr	r9
-	.if \kvm
-		KVMTEST \name \hsrr \vec
+	.if (!\virt && IKVM_REAL) || (\virt && IKVM_VIRT)
+		KVMTEST \name IHSRR IVEC
 	.endif
-	.if \bitmask
+	.if IMASK
 		lbz	r10,PACAIRQSOFTMASK(r13)
-		andi.	r10,r10,\bitmask
+		andi.	r10,r10,IMASK
 		/* Associate vector numbers with bits in paca->irq_happened */
-		.if \vec == 0x500 || \vec == 0xea0
+		.if IVEC == 0x500 || IVEC == 0xea0
 		li	r10,PACA_IRQ_EE
-		.elseif \vec == 0x900
+		.elseif IVEC == 0x900
 		li	r10,PACA_IRQ_DEC
-		.elseif \vec == 0xa00 || \vec == 0xe80
+		.elseif IVEC == 0xa00 || IVEC == 0xe80
 		li	r10,PACA_IRQ_DBELL
-		.elseif \vec == 0xe60
+		.elseif IVEC == 0xe60
 		li	r10,PACA_IRQ_HMI
-		.elseif \vec == 0xf00
+		.elseif IVEC == 0xf00
 		li	r10,PACA_IRQ_PMI
 		.else
 		.abort "Bad maskable vector"
 		.endif
 
-		.if \hsrr == EXC_HV_OR_STD
+		.if IHSRR == EXC_HV_OR_STD
 		BEGIN_FTR_SECTION
 		bne	masked_Hinterrupt
 		FTR_SECTION_ELSE
 		bne	masked_interrupt
 		ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
-		.elseif \hsrr
+		.elseif IHSRR
 		bne	masked_Hinterrupt
 		.else
 		bne	masked_interrupt
 		.endif
 	.endif
 
-	std	r11,\area\()+EX_R11(r13)
-	std	r12,\area\()+EX_R12(r13)
+	std	r11,IAREA+EX_R11(r13)
+	std	r12,IAREA+EX_R12(r13)
 
 	/*
 	 * DAR/DSISR, SCRATCH0 must be read before setting MSR[RI],
@@ -550,47 +550,39 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	 * not recoverable if they are live.
 	 */
 	GET_SCRATCH0(r10)
-	std	r10,\area\()+EX_R13(r13)
-	.if \dar == 1
-	.if \hsrr
+	std	r10,IAREA+EX_R13(r13)
+	.if IDAR == 1
+	.if IHSRR
 	mfspr	r10,SPRN_HDAR
 	.else
 	mfspr	r10,SPRN_DAR
 	.endif
-	std	r10,\area\()+EX_DAR(r13)
+	std	r10,IAREA+EX_DAR(r13)
 	.endif
-	.if \dsisr == 1
-	.if \hsrr
+	.if IDSISR == 1
+	.if IHSRR
 	mfspr	r10,SPRN_HDSISR
 	.else
 	mfspr	r10,SPRN_DSISR
 	.endif
-	stw	r10,\area\()+EX_DSISR(r13)
+	stw	r10,IAREA+EX_DSISR(r13)
 	.endif
 
-	.if \early == 2
+	.if IEARLY == 2
 	/* nothing more */
-	.elseif \early
+	.elseif IEARLY
 	mfctr	r10			/* save ctr, even for !RELOCATABLE */
 	BRANCH_TO_C000(r11, \name\()_common)
 	.elseif !\virt
-	INT_SAVE_SRR_AND_JUMP \name\()_common, \hsrr, \ri
+	INT_SAVE_SRR_AND_JUMP \name\()_common, IHSRR, ISET_RI
 	.else
-	INT_VIRT_SAVE_SRR_AND_JUMP \name\()_common, \hsrr
+	INT_VIRT_SAVE_SRR_AND_JUMP \name\()_common, IHSRR
 	.endif
 	.if \ool
 	.popsection
 	.endif
 .endm
 
-.macro GEN_INT_ENTRY name, virt, ool=0
-	.if ! \virt
-		INT_HANDLER \name, IVEC, \ool, IEARLY, \virt, IHSRR, IAREA, ISET_RI, IDAR, IDSISR, IMASK, IKVM_REAL
-	.else
-		INT_HANDLER \name, IVEC, \ool, IEARLY, \virt, IHSRR, IAREA, ISET_RI, IDAR, IDSISR, IMASK, IKVM_VIRT
-	.endif
-.endm
-
 /*
  * On entry r13 points to the paca, r9-r13 are saved in the paca,
  * r9 contains the saved CR, r11 and r12 contain the saved SRR0 and
-- 
2.23.0

