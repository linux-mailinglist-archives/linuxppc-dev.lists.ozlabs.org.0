Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4305A10A580
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 21:32:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MwZS4ZVrzDqfK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 07:32:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Mw906S7KzDqW0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 07:14:12 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DA842B147;
 Tue, 26 Nov 2019 20:14:09 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 07/35] powerpc/64s/exception: Remove old INT_COMMON macro
Date: Tue, 26 Nov 2019 21:13:21 +0100
Message-Id: <229a46517d86a0ba3cfdc11ac3d86d693939f396.1574798487.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1574798487.git.msuchanek@suse.de>
References: <cover.1574798487.git.msuchanek@suse.de>
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
 arch/powerpc/kernel/exceptions-64s.S | 51 +++++++++++++---------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index ba2dcd91aaaf..f318869607db 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -591,8 +591,8 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
  * If stack=0, then the stack is already set in r1, and r1 is saved in r10.
  * PPR save and CPU accounting is not done for the !stack case (XXX why not?)
  */
-.macro INT_COMMON vec, area, stack, kaup, reconcile, dar, dsisr
-	.if \stack
+.macro GEN_COMMON name
+	.if ISTACK
 	andi.	r10,r12,MSR_PR		/* See if coming from user	*/
 	mr	r10,r1			/* Save r1			*/
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc frame on kernel stack	*/
@@ -609,54 +609,54 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	std	r0,GPR0(r1)		/* save r0 in stackframe	*/
 	std	r10,GPR1(r1)		/* save r1 in stackframe	*/
 
-	.if \stack
-	.if \kaup
+	.if ISTACK
+	.if IKUAP
 	kuap_save_amr_and_lock r9, r10, cr1, cr0
 	.endif
 	beq	101f			/* if from kernel mode		*/
 	ACCOUNT_CPU_USER_ENTRY(r13, r9, r10)
-	SAVE_PPR(\area, r9)
+	SAVE_PPR(IAREA, r9)
 101:
 	.else
-	.if \kaup
+	.if IKUAP
 	kuap_save_amr_and_lock r9, r10, cr1
 	.endif
 	.endif
 
 	/* Save original regs values from save area to stack frame. */
-	ld	r9,\area+EX_R9(r13)	/* move r9, r10 to stackframe	*/
-	ld	r10,\area+EX_R10(r13)
+	ld	r9,IAREA+EX_R9(r13)	/* move r9, r10 to stackframe	*/
+	ld	r10,IAREA+EX_R10(r13)
 	std	r9,GPR9(r1)
 	std	r10,GPR10(r1)
-	ld	r9,\area+EX_R11(r13)	/* move r11 - r13 to stackframe	*/
-	ld	r10,\area+EX_R12(r13)
-	ld	r11,\area+EX_R13(r13)
+	ld	r9,IAREA+EX_R11(r13)	/* move r11 - r13 to stackframe	*/
+	ld	r10,IAREA+EX_R12(r13)
+	ld	r11,IAREA+EX_R13(r13)
 	std	r9,GPR11(r1)
 	std	r10,GPR12(r1)
 	std	r11,GPR13(r1)
-	.if \dar
-	.if \dar == 2
+	.if IDAR
+	.if IDAR == 2
 	ld	r10,_NIP(r1)
 	.else
-	ld	r10,\area+EX_DAR(r13)
+	ld	r10,IAREA+EX_DAR(r13)
 	.endif
 	std	r10,_DAR(r1)
 	.endif
-	.if \dsisr
-	.if \dsisr == 2
+	.if IDSISR
+	.if IDSISR == 2
 	ld	r10,_MSR(r1)
 	lis	r11,DSISR_SRR1_MATCH_64S@h
 	and	r10,r10,r11
 	.else
-	lwz	r10,\area+EX_DSISR(r13)
+	lwz	r10,IAREA+EX_DSISR(r13)
 	.endif
 	std	r10,_DSISR(r1)
 	.endif
 BEGIN_FTR_SECTION_NESTED(66)
-	ld	r10,\area+EX_CFAR(r13)
+	ld	r10,IAREA+EX_CFAR(r13)
 	std	r10,ORIG_GPR3(r1)
 END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66)
-	GET_CTR(r10, \area)
+	GET_CTR(r10, IAREA)
 	std	r10,_CTR(r1)
 	std	r2,GPR2(r1)		/* save r2 in stackframe	*/
 	SAVE_4GPRS(3, r1)		/* save r3 - r6 in stackframe   */
@@ -668,26 +668,22 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66)
 	mfspr	r11,SPRN_XER		/* save XER in stackframe	*/
 	std	r10,SOFTE(r1)
 	std	r11,_XER(r1)
-	li	r9,(\vec)+1
+	li	r9,(IVEC)+1
 	std	r9,_TRAP(r1)		/* set trap number		*/
 	li	r10,0
 	ld	r11,exception_marker@toc(r2)
 	std	r10,RESULT(r1)		/* clear regs->result		*/
 	std	r11,STACK_FRAME_OVERHEAD-16(r1) /* mark the frame	*/
 
-	.if \stack
+	.if ISTACK
 	ACCOUNT_STOLEN_TIME
 	.endif
 
-	.if \reconcile
+	.if IRECONCILE
 	RECONCILE_IRQ_STATE(r10, r11)
 	.endif
 .endm
 
-.macro GEN_COMMON name
-	INT_COMMON IVEC, IAREA, ISTACK, IKUAP, IRECONCILE, IDAR, IDSISR
-.endm
-
 /*
  * Restore all registers including H/SRR0/1 saved in a stack frame of a
  * standard exception.
@@ -2400,7 +2396,8 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	mr	r10,r1
 	ld	r1,PACAEMERGSP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
-	INT_COMMON 0x900, PACA_EXGEN, 0, 1, 1, 0, 0
+	__ISTACK(decrementer)=0
+	GEN_COMMON decrementer
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	soft_nmi_interrupt
-- 
2.23.0

