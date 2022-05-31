Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF0753958E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 19:48:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCKWm5R8Lz3brR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 03:48:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCKWK3X4xz3bdK
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 03:48:10 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LCKW8531mz9sqJ;
	Tue, 31 May 2022 19:48:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n05tsKMX32A7; Tue, 31 May 2022 19:48:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LCKW840B3z9sgg;
	Tue, 31 May 2022 19:48:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 72E9F8B7A7;
	Tue, 31 May 2022 19:48:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id e91tJem3a6a0; Tue, 31 May 2022 19:48:04 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.5.212])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 295E38B763;
	Tue, 31 May 2022 19:48:04 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 24VHlrEC393857
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 31 May 2022 19:47:54 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 24VHlplc393849;
	Tue, 31 May 2022 19:47:51 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/2] powerpc/irq: Make __do_irq() static
Date: Tue, 31 May 2022 19:47:43 +0200
Message-Id: <3e3b3135a59396debd091db9c63e61b24f4ad430.1654019236.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1654019262; l=2894; s=20211009; h=from:subject:message-id; bh=D/YnwbpsLRuA5tJYiZC5RVaVHXgdTEiVTKEkUJ95FSE=; b=OylgGlkl6Dbk7YWsZJZ5zTBlUWCt7FP6kx4bEY1k6NHLAky3Z3OjtIEEJkT1fF53GqKOu6P2RN1b Vs4g6AM8AvEk1Hk7cV2sBhE8+4TsuKBrKZKbUObTiQ9qnYJeHfRy
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

Since commit 48cf12d88969 ("powerpc/irq: Inline call_do_irq() and
call_do_softirq()"), __do_irq() is not used outside irq.c

Reorder functions and make __do_irq() static and
drop the declaration in irq.h.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/irq.h |  1 -
 arch/powerpc/kernel/irq.c      | 46 +++++++++++++++++-----------------
 2 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
index 13f0409dd617..5c1516a5ba8f 100644
--- a/arch/powerpc/include/asm/irq.h
+++ b/arch/powerpc/include/asm/irq.h
@@ -54,7 +54,6 @@ extern void *softirq_ctx[NR_CPUS];
 
 void __do_IRQ(struct pt_regs *regs);
 extern void __init init_IRQ(void);
-extern void __do_irq(struct pt_regs *regs);
 
 int irq_choose_cpu(const struct cpumask *mask);
 
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 873e6dffb868..370434f6c316 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -219,31 +219,9 @@ static __always_inline void call_do_softirq(const void *sp)
 	);
 }
 
-static __always_inline void call_do_irq(struct pt_regs *regs, void *sp)
-{
-	register unsigned long r3 asm("r3") = (unsigned long)regs;
-
-	/* Temporarily switch r1 to sp, call __do_irq() then restore r1. */
-	asm volatile (
-		 PPC_STLU "	%%r1, %[offset](%[sp])	;"
-		"mr		%%r1, %[sp]		;"
-		"bl		%[callee]		;"
-		 PPC_LL "	%%r1, 0(%%r1)		;"
-		 : // Outputs
-		   "+r" (r3)
-		 : // Inputs
-		   [sp] "b" (sp), [offset] "i" (THREAD_SIZE - STACK_FRAME_OVERHEAD),
-		   [callee] "i" (__do_irq)
-		 : // Clobbers
-		   "lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6",
-		   "cr7", "r0", "r4", "r5", "r6", "r7", "r8", "r9", "r10",
-		   "r11", "r12"
-	);
-}
-
 DEFINE_STATIC_CALL_RET0(ppc_get_irq, *ppc_md.get_irq);
 
-void __do_irq(struct pt_regs *regs)
+static void __do_irq(struct pt_regs *regs)
 {
 	unsigned int irq;
 
@@ -269,6 +247,28 @@ void __do_irq(struct pt_regs *regs)
 	trace_irq_exit(regs);
 }
 
+static __always_inline void call_do_irq(struct pt_regs *regs, void *sp)
+{
+	register unsigned long r3 asm("r3") = (unsigned long)regs;
+
+	/* Temporarily switch r1 to sp, call __do_irq() then restore r1. */
+	asm volatile (
+		 PPC_STLU "	%%r1, %[offset](%[sp])	;"
+		"mr		%%r1, %[sp]		;"
+		"bl		%[callee]		;"
+		 PPC_LL "	%%r1, 0(%%r1)		;"
+		 : // Outputs
+		   "+r" (r3)
+		 : // Inputs
+		   [sp] "b" (sp), [offset] "i" (THREAD_SIZE - STACK_FRAME_OVERHEAD),
+		   [callee] "i" (__do_irq)
+		 : // Clobbers
+		   "lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6",
+		   "cr7", "r0", "r4", "r5", "r6", "r7", "r8", "r9", "r10",
+		   "r11", "r12"
+	);
+}
+
 void __do_IRQ(struct pt_regs *regs)
 {
 	struct pt_regs *old_regs = set_irq_regs(regs);
-- 
2.35.3

