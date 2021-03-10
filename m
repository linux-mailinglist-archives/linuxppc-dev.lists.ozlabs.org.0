Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4F033460D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 18:59:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dwfwy4qzLz3gTr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 04:59:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwfsz3MTlz3cZw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 04:57:11 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dwfsv2Q51z9tytT;
 Wed, 10 Mar 2021 18:57:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Dg8VJeDLXicS; Wed, 10 Mar 2021 18:57:07 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dwfsv1g16zB09Zh;
 Wed, 10 Mar 2021 18:57:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CA8218B78D;
 Wed, 10 Mar 2021 18:57:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id f0QSKwE9ox9m; Wed, 10 Mar 2021 18:57:08 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E5958B77E;
 Wed, 10 Mar 2021 18:57:08 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id ACC486756B; Wed, 10 Mar 2021 17:57:07 +0000 (UTC)
Message-Id: <bdcb8652c3bb4ab5b8b3bfd08147434be8fc04c9.1615398498.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615398498.git.christophe.leroy@csgroup.eu>
References: <cover.1615398498.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 8/8] powerpc/ptrace: Convert gpr32_set_common() to user
 access block
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 10 Mar 2021 17:57:07 +0000 (UTC)
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

Use user access block in gpr32_set_common() instead of
repetitive __get_user() which imply repetitive KUAP open/close.

To get it clean, force inlining of the small set of tiny functions
called inside the block.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ptrace.h        |  2 +-
 arch/powerpc/kernel/ptrace/ptrace-view.c | 30 ++++++++++++++----------
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 975ba260006a..cb154fb7b605 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -222,7 +222,7 @@ do {									      \
 } while (0)
 #endif /* __powerpc64__ */
 
-static inline void set_trap(struct pt_regs *regs, unsigned long val)
+static __always_inline void set_trap(struct pt_regs *regs, unsigned long val)
 {
 	regs->trap = (regs->trap & TRAP_FLAGS_MASK) | (val & ~TRAP_FLAGS_MASK);
 }
diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
index 2bad8068f598..0923c94f684e 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -111,7 +111,7 @@ static unsigned long get_user_msr(struct task_struct *task)
 	return task->thread.regs->msr | task->thread.fpexc_mode;
 }
 
-static int set_user_msr(struct task_struct *task, unsigned long msr)
+static __always_inline int set_user_msr(struct task_struct *task, unsigned long msr)
 {
 	task->thread.regs->msr &= ~MSR_DEBUGCHANGE;
 	task->thread.regs->msr |= msr & MSR_DEBUGCHANGE;
@@ -147,7 +147,7 @@ static int set_user_dscr(struct task_struct *task, unsigned long dscr)
  * We prevent mucking around with the reserved area of trap
  * which are used internally by the kernel.
  */
-static int set_user_trap(struct task_struct *task, unsigned long trap)
+static __always_inline int set_user_trap(struct task_struct *task, unsigned long trap)
 {
 	set_trap(task->thread.regs, trap);
 	return 0;
@@ -661,6 +661,9 @@ int gpr32_set_common(struct task_struct *target,
 	const compat_ulong_t __user *u = ubuf;
 	compat_ulong_t reg;
 
+	if (!kbuf && !user_read_access_begin(u, count))
+		return -EFAULT;
+
 	pos /= sizeof(reg);
 	count /= sizeof(reg);
 
@@ -669,8 +672,7 @@ int gpr32_set_common(struct task_struct *target,
 			regs[pos++] = *k++;
 	else
 		for (; count > 0 && pos < PT_MSR; --count) {
-			if (__get_user(reg, u++))
-				return -EFAULT;
+			unsafe_get_user(reg, u++, Efault);
 			regs[pos++] = reg;
 		}
 
@@ -678,8 +680,8 @@ int gpr32_set_common(struct task_struct *target,
 	if (count > 0 && pos == PT_MSR) {
 		if (kbuf)
 			reg = *k++;
-		else if (__get_user(reg, u++))
-			return -EFAULT;
+		else
+			unsafe_get_user(reg, u++, Efault);
 		set_user_msr(target, reg);
 		++pos;
 		--count;
@@ -692,24 +694,24 @@ int gpr32_set_common(struct task_struct *target,
 			++k;
 	} else {
 		for (; count > 0 && pos <= PT_MAX_PUT_REG; --count) {
-			if (__get_user(reg, u++))
-				return -EFAULT;
+			unsafe_get_user(reg, u++, Efault);
 			regs[pos++] = reg;
 		}
 		for (; count > 0 && pos < PT_TRAP; --count, ++pos)
-			if (__get_user(reg, u++))
-				return -EFAULT;
+			unsafe_get_user(reg, u++, Efault);
 	}
 
 	if (count > 0 && pos == PT_TRAP) {
 		if (kbuf)
 			reg = *k++;
-		else if (__get_user(reg, u++))
-			return -EFAULT;
+		else
+			unsafe_get_user(reg, u++, Efault);
 		set_user_trap(target, reg);
 		++pos;
 		--count;
 	}
+	if (!kbuf)
+		user_read_access_end();
 
 	kbuf = k;
 	ubuf = u;
@@ -717,6 +719,10 @@ int gpr32_set_common(struct task_struct *target,
 	count *= sizeof(reg);
 	return user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
 					 (PT_TRAP + 1) * sizeof(reg), -1);
+
+Efault:
+	user_read_access_end();
+	return -EFAULT;
 }
 
 static int gpr32_get(struct task_struct *target,
-- 
2.25.0

