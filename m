Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCE15A0A1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 18:16:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45b22B5S5czDqKK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 02:16:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="bRxw57ZP"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45b1Zh3kHFzDqGB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 01:55:56 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45b1ZZ5XL8zB09ZQ;
 Fri, 28 Jun 2019 17:55:50 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=bRxw57ZP; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 9uujxn9F6OOl; Fri, 28 Jun 2019 17:55:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45b1ZZ4WPCzB09ZP;
 Fri, 28 Jun 2019 17:55:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1561737350; bh=R+Pqs0Guh4Zj9Xos+EjWx2t1Cce4u53eeSKBdU+J5cY=;
 h=From:Subject:To:Cc:Date:From;
 b=bRxw57ZPJq0Z/eFYvtMNaRnm9nNz/i3hxx+reMM0dGHTTIBlZi+kziVunG0UQCsCA
 0c8TpfCzcyZ0jSvxdsLKS6b+f2BJu5W7UV0jcFnemcsBNr3oaDFjHGILfAcT3x5p8v
 zcCaKvwAYQ2aaLSkVTGPA6QHbrhM7CjviRQfC9pA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 453C48B975;
 Fri, 28 Jun 2019 17:55:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NJCT1fiEC2uU; Fri, 28 Jun 2019 17:55:52 +0200 (CEST)
Received: from localhost.localdomain (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 276278B955;
 Fri, 28 Jun 2019 17:55:52 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 1525E68DBC; Fri, 28 Jun 2019 15:55:52 +0000 (UTC)
Message-Id: <f8cdc3f1c66ad3c43ebc568abcc6c39ed4676284.1561737231.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/hw_breakpoint: move instruction stepping out of
 hw_breakpoint_handler()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 28 Jun 2019 15:55:52 +0000 (UTC)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8xx, breakpoints stop after executing the instruction, so
stepping/emulation is not needed. Move it into a sub-function and
remove the #ifdefs.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/hw_breakpoint.c | 60 ++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index a293a53b4365..a94142e729bf 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -198,15 +198,43 @@ void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs)
 /*
  * Handle debug exception notifications.
  */
+static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp,
+			     unsigned long addr)
+{
+	int stepped;
+	unsigned int instr;
+
+	/* Do not emulate user-space instructions, instead single-step them */
+	if (user_mode(regs)) {
+		current->thread.last_hit_ubp = bp;
+		regs->msr |= MSR_SE;
+		return false;
+	}
+
+	stepped = 0;
+	instr = 0;
+	if (!__get_user_inatomic(instr, (unsigned int *)regs->nip))
+		stepped = emulate_step(regs, instr);
+
+	/*
+	 * emulate_step() could not execute it. We've failed in reliably
+	 * handling the hw-breakpoint. Unregister it and throw a warning
+	 * message to let the user know about it.
+	 */
+	if (!stepped) {
+		WARN(1, "Unable to handle hardware breakpoint. Breakpoint at "
+			"0x%lx will be disabled.", addr);
+		perf_event_disable_inatomic(bp);
+		return false;
+	}
+	return true;
+}
+
 int hw_breakpoint_handler(struct die_args *args)
 {
 	int rc = NOTIFY_STOP;
 	struct perf_event *bp;
 	struct pt_regs *regs = args->regs;
-#ifndef CONFIG_PPC_8xx
-	int stepped = 1;
-	unsigned int instr;
-#endif
 	struct arch_hw_breakpoint *info;
 	unsigned long dar = regs->dar;
 
@@ -251,32 +279,10 @@ int hw_breakpoint_handler(struct die_args *args)
 	      (dar - bp->attr.bp_addr < bp->attr.bp_len)))
 		info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
 
-#ifndef CONFIG_PPC_8xx
-	/* Do not emulate user-space instructions, instead single-step them */
-	if (user_mode(regs)) {
-		current->thread.last_hit_ubp = bp;
-		regs->msr |= MSR_SE;
+	if (!IS_ENABLED(CONFIG_PPC_8xx) && !stepping_handler(regs, bp, info->address))
 		goto out;
-	}
-
-	stepped = 0;
-	instr = 0;
-	if (!__get_user_inatomic(instr, (unsigned int *) regs->nip))
-		stepped = emulate_step(regs, instr);
 
 	/*
-	 * emulate_step() could not execute it. We've failed in reliably
-	 * handling the hw-breakpoint. Unregister it and throw a warning
-	 * message to let the user know about it.
-	 */
-	if (!stepped) {
-		WARN(1, "Unable to handle hardware breakpoint. Breakpoint at "
-			"0x%lx will be disabled.", info->address);
-		perf_event_disable_inatomic(bp);
-		goto out;
-	}
-#endif
-	/*
 	 * As a policy, the callback is invoked in a 'trigger-after-execute'
 	 * fashion
 	 */
-- 
2.13.3

