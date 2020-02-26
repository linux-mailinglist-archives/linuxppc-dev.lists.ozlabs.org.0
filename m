Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC1B16FEE0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 13:25:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SFPD6zV3zDqGW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 23:25:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=LFwWfh6P; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SDjT1k9TzDqcH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 22:54:05 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48SDjP0m8tz9txV9;
 Wed, 26 Feb 2020 12:54:01 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=LFwWfh6P; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id GCbZPTQw_oi2; Wed, 26 Feb 2020 12:54:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48SDjN6ldFz9txV6;
 Wed, 26 Feb 2020 12:54:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582718040; bh=hZJ8DAtTC1Z2/C6P5EMPVp5wTV/U8ti8cfqvLkroIAM=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=LFwWfh6PjRAUGUp/onB29AmkXsFwqQX2juvO59LrabKsos592BaibxXh+uOFvJfje
 o+bl+26WvCes25KxnXZ71CTbSN6ID5x8x/aBmmsMe23yIzML+ggLq3lDdNvn/H5K0l
 elg4va43fCCTN5L7VDZ0IsWMaTKPYZmwzvCIX1Kc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 342F68B847;
 Wed, 26 Feb 2020 12:54:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7cnHcLgZXpo2; Wed, 26 Feb 2020 12:54:02 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E72228B776;
 Wed, 26 Feb 2020 12:54:01 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BD0A565400; Wed, 26 Feb 2020 11:54:01 +0000 (UTC)
Message-Id: <5a8ea6405d7cd6b6ca5854d56042416a62ede2cf.1582717645.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1582717645.git.christophe.leroy@c-s.fr>
References: <cover.1582717645.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 11/13] powerpc/ptrace: create ptrace_get_debugreg()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 mikey@neuling.org
Date: Wed, 26 Feb 2020 11:54:01 +0000 (UTC)
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
index eebcd41edc3d..c71bedd54a8b 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-adv.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-adv.c
@@ -56,6 +56,15 @@ void user_disable_single_step(struct task_struct *task)
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
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
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
index cf05fadba0d5..9c1ef9c2ffd4 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-noadv.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
@@ -39,6 +39,19 @@ void user_disable_single_step(struct task_struct *task)
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
index d566a8a13c80..0242b93e8c55 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -189,23 +189,9 @@ long arch_ptrace(struct task_struct *child, long request,
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
2.25.0

