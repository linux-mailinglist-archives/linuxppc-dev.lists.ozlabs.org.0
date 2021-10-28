Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A18C43E0F7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 14:26:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg4YK09XBz3dd4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 23:26:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg4WC5cTJz30Pj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 23:24:39 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Hg4Vq43CJz9sTB;
 Thu, 28 Oct 2021 14:24:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4QgjcO61GqGT; Thu, 28 Oct 2021 14:24:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Hg4Vl5ZYfz9sT4;
 Thu, 28 Oct 2021 14:24:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A7F578B790;
 Thu, 28 Oct 2021 14:24:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hRVvgn6jIpfN; Thu, 28 Oct 2021 14:24:15 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.214])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2768B8B787;
 Thu, 28 Oct 2021 14:24:15 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19SCO8hL194404
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 14:24:08 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19SCO8T4194403;
 Thu, 28 Oct 2021 14:24:08 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH v1 5/5] powerpc/ftrace: Add support for livepatch to PPC32
Date: Thu, 28 Oct 2021 14:24:05 +0200
Message-Id: <b73d053c145245499511c4827890c9411c8b3a5a.1635423081.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635423081.git.christophe.leroy@csgroup.eu>
References: <cover.1635423081.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1635423844; l=4541; s=20211009;
 h=from:subject:message-id; bh=mq9s4eHxuC1bZRD9QPlTzVCTZ9AR7dRdociEo6K2Lk8=;
 b=j+JHR6B2ZEwqQWAnOV0uTfyLqlr5amNNwi/eJ4/n12jOw/uATyRW/aATB/XM/+lO+dvC+/5f8MKM
 fXjpDKInCAeWNeUrGa0hM5UiPsE4kZY5ryjW8SDTUhUSRZ/TBYXP
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is heavily copied from PPC64. Not much to say about it.

Livepatch sample modules all work.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                  |  2 +-
 arch/powerpc/include/asm/livepatch.h  |  4 +-
 arch/powerpc/kernel/trace/ftrace_32.S | 69 +++++++++++++++++++++++++++
 3 files changed, 72 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index f66eb1984b00..eceee3b814b9 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -230,7 +230,7 @@ config PPC
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_KRETPROBES
 	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
-	select HAVE_LIVEPATCH			if HAVE_DYNAMIC_FTRACE_WITH_REGS && PPC64
+	select HAVE_LIVEPATCH			if HAVE_DYNAMIC_FTRACE_WITH_REGS
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
 	select HAVE_OPTPROBES
diff --git a/arch/powerpc/include/asm/livepatch.h b/arch/powerpc/include/asm/livepatch.h
index 4fe018cc207b..daf24d837241 100644
--- a/arch/powerpc/include/asm/livepatch.h
+++ b/arch/powerpc/include/asm/livepatch.h
@@ -23,8 +23,8 @@ static inline void klp_arch_set_pc(struct ftrace_regs *fregs, unsigned long ip)
 static inline unsigned long klp_get_ftrace_location(unsigned long faddr)
 {
 	/*
-	 * Live patch works only with -mprofile-kernel on PPC. In this case,
-	 * the ftrace location is always within the first 16 bytes.
+	 * Live patch works on PPC32 and only with -mprofile-kernel on PPC64. In
+	 * both cases, the ftrace location is always within the first 16 bytes.
 	 */
 	return ftrace_location_range(faddr, faddr + 16);
 }
diff --git a/arch/powerpc/kernel/trace/ftrace_32.S b/arch/powerpc/kernel/trace/ftrace_32.S
index 0a02c0cb12d9..2545d6bb9f02 100644
--- a/arch/powerpc/kernel/trace/ftrace_32.S
+++ b/arch/powerpc/kernel/trace/ftrace_32.S
@@ -10,6 +10,7 @@
 #include <asm/ftrace.h>
 #include <asm/export.h>
 #include <asm/ptrace.h>
+#include <asm/bug.h>
 
 _GLOBAL(mcount)
 _GLOBAL(_mcount)
@@ -83,6 +84,9 @@ _GLOBAL(ftrace_regs_caller)
 	lis	r3,function_trace_op@ha
 	lwz	r5,function_trace_op@l(r3)
 
+#ifdef CONFIG_LIVEPATCH
+	mr	r14,r7		/* remember old NIP */
+#endif
 	/* Calculate ip from nip-4 into r3 for call below */
 	subi    r3, r7, MCOUNT_INSN_SIZE
 
@@ -107,6 +111,9 @@ ftrace_regs_call:
 	/* Load ctr with the possibly modified NIP */
 	lwz	r3, _NIP(r1)
 	mtctr	r3
+#ifdef CONFIG_LIVEPATCH
+	cmpw	r14, r3		/* has NIP been altered? */
+#endif
 
 	/* Restore gprs */
 	lmw	r2, GPR2(r1)
@@ -118,8 +125,70 @@ ftrace_regs_call:
 	/* Pop our stack frame */
 	addi r1, r1, INT_FRAME_SIZE
 
+#ifdef CONFIG_LIVEPATCH
+        /* Based on the cmpw above, if the NIP was altered handle livepatch */
+	bne-	livepatch_handler
+#endif
 	b	ftrace_caller_common
 
+#ifdef CONFIG_LIVEPATCH
+	/*
+	 * This function runs in the mcount context, between two functions. As
+	 * such it can only clobber registers which are volatile and used in
+	 * function linkage.
+	 *
+	 * We get here when a function A, calls another function B, but B has
+	 * been live patched with a new function C.
+	 *
+	 * On entry:
+	 *  - we have no stack frame and can not allocate one
+	 *  - LR points back to the original caller (in A)
+	 *  - CTR holds the new NIP in C
+	 *  - r0, r11 & r12 are free
+	 */
+livepatch_handler:
+	/* Allocate 2 x 8 bytes */
+	lwz	r11, TI_livepatch_sp+THREAD(r2)
+	addi	r11, r11, 16
+	stw	r11, TI_livepatch_sp+THREAD(r2)
+
+	/* Save real LR on livepatch stack */
+	mflr	r12
+	stw	r12, -16(r11)
+
+	/* Store stack end marker */
+	lis     r12, STACK_END_MAGIC@h
+	ori     r12, r12, STACK_END_MAGIC@l
+	stw	r12, -4(r11)
+
+	/* Branch to ctr */
+	bctrl
+
+	/*
+	 * Now we are returning from the patched function to the original
+	 * caller A. We are free to use r11 and r12.
+	 */
+
+	lwz	r11, TI_livepatch_sp+THREAD(r2)
+
+	/* Check stack marker hasn't been trashed */
+	lwz	r12, -4(r11)
+	subis	r12, r12, STACK_END_MAGIC@h
+1:	twnei	r12, STACK_END_MAGIC@l
+	EMIT_BUG_ENTRY 1b, __FILE__, __LINE__ - 1, 0
+
+	/* Restore LR from livepatch stack */
+	lwz	r12, -16(r11)
+	mtlr	r12
+
+	/* Pop livepatch stack frame */
+	subi	r11, r11, 16
+	stw	r11, TI_livepatch_sp+THREAD(r2)
+
+	/* Return to original caller of live patched function */
+	blr
+#endif /* CONFIG_LIVEPATCH */
+
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 _GLOBAL(ftrace_graph_caller)
 	stwu	r1,-48(r1)
-- 
2.31.1

