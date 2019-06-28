Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E40E95A02E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 18:04:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45b1mD1ZlHzDqpL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 02:04:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="frYHewT2"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45b1Pc3B5czDqt0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 01:48:04 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45b1PW4jwPzB09ZP;
 Fri, 28 Jun 2019 17:47:59 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=frYHewT2; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hcihPcxjSc7Z; Fri, 28 Jun 2019 17:47:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45b1PW3RCmzB09ZQ;
 Fri, 28 Jun 2019 17:47:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1561736879; bh=SqjEUXYvT8sVFpmMwykbw4gz6034bxL6k1oKbXzt/pM=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=frYHewT2D5auK2s1xL/2VK9D1wDhSJpKurCgVOYv2M06utEw09VbzoDp5ZE8omKmY
 bSal3EeJ5UKqjz+wH0euptFW97bFb2C7r7GhVIJ1nb5klGxG+jtbNS1srvdLPUbSin
 2sfV+CWNGSTlH9fNraAlAhVCTAGaAyw0EZgp6OUk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3CD7E8B955;
 Fri, 28 Jun 2019 17:48:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fpqZqhbDnebk; Fri, 28 Jun 2019 17:48:00 +0200 (CEST)
Received: from localhost.localdomain (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1249E8B975;
 Fri, 28 Jun 2019 17:48:00 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 0212368DBC; Fri, 28 Jun 2019 15:47:59 +0000 (UTC)
Message-Id: <483ffd1c62d270d7079b41e1747f34d254390c24.1561735588.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1561735587.git.christophe.leroy@c-s.fr>
References: <cover.1561735587.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 10/12] powerpc/ptrace: create ptrace_get_debugreg()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 mikey@neuling.org
Date: Fri, 28 Jun 2019 15:47:59 +0000 (UTC)
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

Create ptrace_get_debugreg() to handle PTRACE_GET_DEBUGREG and
reduce ifdef mess

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/ptrace/ptrace-adv.c   |  9 +++++++++
 arch/powerpc/kernel/ptrace/ptrace-decl.h  |  2 ++
 arch/powerpc/kernel/ptrace/ptrace-noadv.c | 13 +++++++++++++
 arch/powerpc/kernel/ptrace/ptrace.c       | 18 ++----------------
 4 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace-adv.c b/arch/powerpc/kernel/ptrace/ptrace-adv.c
index 86e71fa6c5c8..dcc765940344 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-adv.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-adv.c
@@ -83,6 +83,15 @@ void user_disable_single_step(struct task_struct *task)
 	clear_tsk_thread_flag(task, TIF_SINGLESTEP);
 }
 
+int ptrace_get_debugreg(struct task_struct *child, unsigned long addr,
+			unsigned long __user *datalp)
+{
+	/* We only support one DABR and no IABRS at the moment */
+	if (addr > 0)
+		return -EINVAL;
+	return put_user(child->thread.debug.dac1, datalp);
+}
+
 int ptrace_set_debugreg(struct task_struct *task, unsigned long addr, unsigned long data)
 {
 	/* For ppc64 we support one DABR and no IABR's at the moment (ppc64).
diff --git a/arch/powerpc/kernel/ptrace/ptrace-decl.h b/arch/powerpc/kernel/ptrace/ptrace-decl.h
index bdba09a87aea..4b4b6a1d508a 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-decl.h
+++ b/arch/powerpc/kernel/ptrace/ptrace-decl.h
@@ -176,6 +176,8 @@ int tm_cgpr32_set(struct task_struct *target, const struct user_regset *regset,
 extern const struct user_regset_view user_ppc_native_view;
 
 /* ptrace-(no)adv */
+int ptrace_get_debugreg(struct task_struct *child, unsigned long addr,
+			unsigned long __user *datalp);
 int ptrace_set_debugreg(struct task_struct *task, unsigned long addr, unsigned long data);
 long ppc_set_hwdebug(struct task_struct *child, struct ppc_hw_breakpoint *bp_info);
 long ppc_del_hwdebug(struct task_struct *child, long data);
diff --git a/arch/powerpc/kernel/ptrace/ptrace-noadv.c b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
index 7db330c94538..985cca136f85 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-noadv.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
@@ -64,6 +64,19 @@ void user_disable_single_step(struct task_struct *task)
 	clear_tsk_thread_flag(task, TIF_SINGLESTEP);
 }
 
+int ptrace_get_debugreg(struct task_struct *child, unsigned long addr,
+			unsigned long __user *datalp)
+{
+	unsigned long dabr_fake;
+
+	/* We only support one DABR and no IABRS at the moment */
+	if (addr > 0)
+		return -EINVAL;
+	dabr_fake = ((child->thread.hw_brk.address & (~HW_BRK_TYPE_DABR)) |
+		     (child->thread.hw_brk.type & HW_BRK_TYPE_DABR));
+	return put_user(dabr_fake, datalp);
+}
+
 int ptrace_set_debugreg(struct task_struct *task, unsigned long addr, unsigned long data)
 {
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 377e0e541d5f..e789afae6f56 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -211,23 +211,9 @@ long arch_ptrace(struct task_struct *child, long request,
 		break;
 	}
 
-	case PTRACE_GET_DEBUGREG: {
-#ifndef CONFIG_PPC_ADV_DEBUG_REGS
-		unsigned long dabr_fake;
-#endif
-		ret = -EINVAL;
-		/* We only support one DABR and no IABRS at the moment */
-		if (addr > 0)
-			break;
-#ifdef CONFIG_PPC_ADV_DEBUG_REGS
-		ret = put_user(child->thread.debug.dac1, datalp);
-#else
-		dabr_fake = ((child->thread.hw_brk.address & (~HW_BRK_TYPE_DABR)) |
-			     (child->thread.hw_brk.type & HW_BRK_TYPE_DABR));
-		ret = put_user(dabr_fake, datalp);
-#endif
+	case PTRACE_GET_DEBUGREG:
+		ret = ptrace_get_debugreg(child, addr, datalp);
 		break;
-	}
 
 	case PTRACE_SET_DEBUGREG:
 		ret = ptrace_set_debugreg(child, addr, data);
-- 
2.13.3

