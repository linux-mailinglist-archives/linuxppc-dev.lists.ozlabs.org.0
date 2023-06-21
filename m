Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D620737F9C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 12:38:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmKhv2TLsz3bn3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 20:38:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmKhK4Vt1z2ykB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 20:37:34 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4QmKh92qDZz9s92;
	Wed, 21 Jun 2023 12:37:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4xhzUEe5FVJi; Wed, 21 Jun 2023 12:37:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4QmKh925rBz9s7p;
	Wed, 21 Jun 2023 12:37:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 44CB98B779;
	Wed, 21 Jun 2023 12:37:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id SZKo2q5ARpRi; Wed, 21 Jun 2023 12:37:29 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2484E8B763;
	Wed, 21 Jun 2023 12:37:29 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 35LAbS2a2082505
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 12:37:28 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 35LAbRh92082499;
	Wed, 21 Jun 2023 12:37:27 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/ptrace: Split gpr32_set_common
Date: Wed, 21 Jun 2023 12:37:19 +0200
Message-Id: <3086d189fa629e6c7bf800832921669450cc09bf.1687343697.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687343837; l=4896; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=87jZTsLox0Q+cISFx/4st2uh+EnbYxcjB3dk0hf51i4=; b=4QNxwZVKp7QycY3Ewc2GtTiWsHvK2ton7tYsHpd5ctrmGjBW2pJi8WyE8tmY2NR9aCm1Y4UDY SCXHJlsKW4nDj1jupHWwpd1E95nx8Lq8qsO5XNojnmGKF09J6snxYLG
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

objtool report the following warning:

  arch/powerpc/kernel/ptrace/ptrace-view.o: warning: objtool:
    gpr32_set_common+0x23c (.text+0x860): redundant UACCESS disable

gpr32_set_common() conditionnaly opens and closes UACCESS based on
whether kbuf point is NULL or not. This is wackelig.

Split gpr32_set_common() in two fonctions, one for user one for
kernel.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/ptrace/ptrace-view.c | 106 ++++++++++++++---------
 1 file changed, 67 insertions(+), 39 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
index 3910cd7bb2d9..1b0c2a234a7e 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -716,73 +716,89 @@ int gpr32_get_common(struct task_struct *target,
 	return membuf_zero(&to, (ELF_NGREG - PT_REGS_COUNT) * sizeof(u32));
 }
 
-int gpr32_set_common(struct task_struct *target,
-		     const struct user_regset *regset,
-		     unsigned int pos, unsigned int count,
-		     const void *kbuf, const void __user *ubuf,
-		     unsigned long *regs)
+int gpr32_set_common_kernel(struct task_struct *target,
+			    const struct user_regset *regset,
+			    unsigned int pos, unsigned int count,
+			    const void *kbuf, unsigned long *regs)
 {
 	const compat_ulong_t *k = kbuf;
+
+	pos /= sizeof(compat_ulong_t);
+	count /= sizeof(compat_ulong_t);
+
+	for (; count > 0 && pos < PT_MSR; --count)
+		regs[pos++] = *k++;
+
+	if (count > 0 && pos == PT_MSR) {
+		set_user_msr(target, *k++);
+		++pos;
+		--count;
+	}
+
+	for (; count > 0 && pos <= PT_MAX_PUT_REG; --count)
+		regs[pos++] = *k++;
+	for (; count > 0 && pos < PT_TRAP; --count, ++pos)
+		++k;
+
+	if (count > 0 && pos == PT_TRAP) {
+		set_user_trap(target, *k++);
+		++pos;
+		--count;
+	}
+
+	kbuf = k;
+	pos *= sizeof(compat_ulong_t);
+	count *= sizeof(compat_ulong_t);
+	user_regset_copyin_ignore(&pos, &count, &kbuf, NULL,
+				  (PT_TRAP + 1) * sizeof(compat_ulong_t), -1);
+	return 0;
+}
+
+int gpr32_set_common_user(struct task_struct *target,
+			  const struct user_regset *regset,
+			  unsigned int pos, unsigned int count,
+			  const void __user *ubuf, unsigned long *regs)
+{
 	const compat_ulong_t __user *u = ubuf;
 	compat_ulong_t reg;
 
-	if (!kbuf && !user_read_access_begin(u, count))
+	if (!user_read_access_begin(u, count))
 		return -EFAULT;
 
 	pos /= sizeof(reg);
 	count /= sizeof(reg);
 
-	if (kbuf)
-		for (; count > 0 && pos < PT_MSR; --count)
-			regs[pos++] = *k++;
-	else
-		for (; count > 0 && pos < PT_MSR; --count) {
-			unsafe_get_user(reg, u++, Efault);
-			regs[pos++] = reg;
-		}
-
+	for (; count > 0 && pos < PT_MSR; --count) {
+		unsafe_get_user(reg, u++, Efault);
+		regs[pos++] = reg;
+	}
 
 	if (count > 0 && pos == PT_MSR) {
-		if (kbuf)
-			reg = *k++;
-		else
-			unsafe_get_user(reg, u++, Efault);
+		unsafe_get_user(reg, u++, Efault);
 		set_user_msr(target, reg);
 		++pos;
 		--count;
 	}
 
-	if (kbuf) {
-		for (; count > 0 && pos <= PT_MAX_PUT_REG; --count)
-			regs[pos++] = *k++;
-		for (; count > 0 && pos < PT_TRAP; --count, ++pos)
-			++k;
-	} else {
-		for (; count > 0 && pos <= PT_MAX_PUT_REG; --count) {
-			unsafe_get_user(reg, u++, Efault);
-			regs[pos++] = reg;
-		}
-		for (; count > 0 && pos < PT_TRAP; --count, ++pos)
-			unsafe_get_user(reg, u++, Efault);
+	for (; count > 0 && pos <= PT_MAX_PUT_REG; --count) {
+		unsafe_get_user(reg, u++, Efault);
+		regs[pos++] = reg;
 	}
+	for (; count > 0 && pos < PT_TRAP; --count, ++pos)
+		unsafe_get_user(reg, u++, Efault);
 
 	if (count > 0 && pos == PT_TRAP) {
-		if (kbuf)
-			reg = *k++;
-		else
-			unsafe_get_user(reg, u++, Efault);
+		unsafe_get_user(reg, u++, Efault);
 		set_user_trap(target, reg);
 		++pos;
 		--count;
 	}
-	if (!kbuf)
-		user_read_access_end();
+	user_read_access_end();
 
-	kbuf = k;
 	ubuf = u;
 	pos *= sizeof(reg);
 	count *= sizeof(reg);
-	user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
+	user_regset_copyin_ignore(&pos, &count, NULL, &ubuf,
 				  (PT_TRAP + 1) * sizeof(reg), -1);
 	return 0;
 
@@ -791,6 +807,18 @@ int gpr32_set_common(struct task_struct *target,
 	return -EFAULT;
 }
 
+int gpr32_set_common(struct task_struct *target,
+		     const struct user_regset *regset,
+		     unsigned int pos, unsigned int count,
+		     const void *kbuf, const void __user *ubuf,
+		     unsigned long *regs)
+{
+	if (kbuf)
+		return gpr32_set_common_kernel(target, regset, pos, count, kbuf, regs);
+	else
+		return gpr32_set_common_user(target, regset, pos, count, ubuf, regs);
+}
+
 static int gpr32_get(struct task_struct *target,
 		     const struct user_regset *regset,
 		     struct membuf to)
-- 
2.40.1

