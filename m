Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8E1313874
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 16:49:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZ9Sj5HxbzDvWP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 02:49:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZ8bh4mgkzDr3l
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 02:10:40 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZ8bX2G7gzB09ZK;
 Mon,  8 Feb 2021 16:10:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Zg5dZFKNrisp; Mon,  8 Feb 2021 16:10:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZ8bX1Q2RzB09ZC;
 Mon,  8 Feb 2021 16:10:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7242F8B7BC;
 Mon,  8 Feb 2021 16:10:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1wUE7LSTTWPV; Mon,  8 Feb 2021 16:10:37 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 013EF8B7B2;
 Mon,  8 Feb 2021 16:10:36 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id EAB206733E; Mon,  8 Feb 2021 15:10:36 +0000 (UTC)
Message-Id: <fc3afe1870f943b2010805fcb045b718a638b3c6.1612796617.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612796617.git.christophe.leroy@csgroup.eu>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v5 17/22] powerpc/syscall: Do not check unsupported scv vector
 on PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Mon,  8 Feb 2021 15:10:36 +0000 (UTC)
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

Only PPC64 has scv. No need to check the 0x7ff0 trap on PPC32.
For that, add a helper trap_is_unsupported_scv() similar to
trap_is_scv().

And ignore the scv parameter in syscall_exit_prepare (Save 14 cycles
346 => 332 cycles)

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v5: Added a helper trap_is_unsupported_scv()
---
 arch/powerpc/include/asm/ptrace.h | 5 +++++
 arch/powerpc/kernel/entry_32.S    | 1 -
 arch/powerpc/kernel/interrupt.c   | 7 +++++--
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 58f9dc060a7b..2c842b11a924 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -229,6 +229,11 @@ static inline bool trap_is_scv(struct pt_regs *regs)
 	return (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && TRAP(regs) == 0x3000);
 }
 
+static inline bool trap_is_unsupported_scv(struct pt_regs *regs)
+{
+	return (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && TRAP(regs) == 0x7ff0);
+}
+
 static inline bool trap_is_syscall(struct pt_regs *regs)
 {
 	return (trap_is_scv(regs) || TRAP(regs) == 0xc00);
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index cffe58e63356..7c824e8928d0 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -344,7 +344,6 @@ transfer_to_syscall:
 
 ret_from_syscall:
 	addi    r4,r1,STACK_FRAME_OVERHEAD
-	li	r5,0
 	bl	syscall_exit_prepare
 #if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
 	/* If the process has its own DBCR0 value, load it up.  The internal
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 205902052112..8fafca727b8b 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -88,7 +88,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	local_irq_enable();
 
 	if (unlikely(current_thread_info()->flags & _TIF_SYSCALL_DOTRACE)) {
-		if (unlikely(regs->trap == 0x7ff0)) {
+		if (unlikely(trap_is_unsupported_scv(regs))) {
 			/* Unsupported scv vector */
 			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
 			return regs->gpr[3];
@@ -111,7 +111,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 		r8 = regs->gpr[8];
 
 	} else if (unlikely(r0 >= NR_syscalls)) {
-		if (unlikely(regs->trap == 0x7ff0)) {
+		if (unlikely(trap_is_unsupported_scv(regs))) {
 			/* Unsupported scv vector */
 			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
 			return regs->gpr[3];
@@ -224,6 +224,9 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	unsigned long ti_flags;
 	unsigned long ret = 0;
 
+	if (IS_ENABLED(CONFIG_PPC32))
+		scv = 0;
+
 	CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 #ifdef CONFIG_PPC64
-- 
2.25.0

