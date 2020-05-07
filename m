Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FA61C8A4A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 14:18:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HstD3QNrzDqFv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 22:17:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Hsmz1C4hzDqKW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 22:13:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=FcCUxLx2; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49Hsmz0Jywz9sSg; Thu,  7 May 2020 22:13:23 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49Hsmy6bJgz9sSt; Thu,  7 May 2020 22:13:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588853602;
 bh=3045QiGhulKh1ICuBxcnsh+yy0cc7pm5Tb7dz0oZB/M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FcCUxLx2MQDWiyvr2IZRAFO/NDttChKxHhk0O2KrowHC36axrAwEt3MfqsC1/5Syy
 2MxuozYZa4T8q+8hIWNWgN/Ws8qfGhfVBBAoaumlI206w3B++Lhr6f9wRqb4Fbf6oZ
 k9J4T8DcAYPWHjQ0J7LNl4j7AFACx9Br329meP2EVvuJyRvQ6byAnnanqT7/1CIx+8
 K/zWoYsJOM5xdu9kceAmhZWhxgA436DTVuFw5Dl3dQ250nvx8DET8gXKMYg6jNiX5M
 /xGY0gFbaCtDLRcXuTgRf4dW9RO84Kz8vlxnCdZMjGVFaQdPmdMEyGS0UGf7Q3O23p
 TdPpR8ueEStRw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 2/4] powerpc: Use set_trap() and avoid open-coding trap
 masking
Date: Thu,  7 May 2020 22:13:30 +1000
Message-Id: <20200507121332.2233629-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507121332.2233629-1-mpe@ellerman.id.au>
References: <20200507121332.2233629-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

The pt_regs.trap field keeps 4 low bits for some metadata about the
trap or how it was handled, which is masked off in order to test the
architectural trap number.

Add a set_trap() accessor to set this, equivalent to TRAP() for
returning it. This is actually not quite the equivalent of TRAP()
because it always clears the low bits, which may be harmless if
it can only be updated via ptrace syscall, but it seems dangerous.

In fact settting TRAP from ptrace doesn't seem like a great idea
so maybe it's better deleted.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
[mpe: Make it a static inline rather than a shouty macro]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/ptrace.h        | 8 ++++++++
 arch/powerpc/kernel/ptrace/ptrace-tm.c   | 2 +-
 arch/powerpc/kernel/ptrace/ptrace-view.c | 2 +-
 arch/powerpc/xmon/xmon.c                 | 2 +-
 4 files changed, 11 insertions(+), 3 deletions(-)

v2: mpe: Make it a static inline rather than a shouty macro

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 89f31d5a8062..7c585bddc06e 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -182,10 +182,12 @@ extern int ptrace_put_reg(struct task_struct *task, int regno,
 
 #ifdef __powerpc64__
 #ifdef CONFIG_PPC_BOOK3S
+#define TRAP_FLAGS_MASK		0
 #define TRAP(regs)		((regs)->trap)
 #define FULL_REGS(regs)		true
 #define SET_FULL_REGS(regs)	do { } while (0)
 #else
+#define TRAP_FLAGS_MASK		0x1
 #define TRAP(regs)		((regs)->trap & ~0x1)
 #define FULL_REGS(regs)		(((regs)->trap & 1) == 0)
 #define SET_FULL_REGS(regs)	((regs)->trap |= 1)
@@ -200,6 +202,7 @@ extern int ptrace_put_reg(struct task_struct *task, int regno,
  * On 4xx we use the next bit to indicate whether the exception
  * is a critical exception (1 means it is).
  */
+#define TRAP_FLAGS_MASK		0xF
 #define TRAP(regs)		((regs)->trap & ~0xF)
 #define FULL_REGS(regs)		(((regs)->trap & 1) == 0)
 #define SET_FULL_REGS(regs)	((regs)->trap |= 1)
@@ -214,6 +217,11 @@ do {									      \
 } while (0)
 #endif /* __powerpc64__ */
 
+static inline void set_trap(struct pt_regs *regs, unsigned long val)
+{
+	regs->trap = (regs->trap & TRAP_FLAGS_MASK) | (val & ~TRAP_FLAGS_MASK);
+}
+
 #define arch_has_single_step()	(1)
 #ifndef CONFIG_BOOK3S_601
 #define arch_has_block_step()	(true)
diff --git a/arch/powerpc/kernel/ptrace/ptrace-tm.c b/arch/powerpc/kernel/ptrace/ptrace-tm.c
index d75aff31f637..32d62c606681 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-tm.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-tm.c
@@ -43,7 +43,7 @@ static int set_user_ckpt_msr(struct task_struct *task, unsigned long msr)
 
 static int set_user_ckpt_trap(struct task_struct *task, unsigned long trap)
 {
-	task->thread.ckpt_regs.trap = trap & 0xfff0;
+	set_trap(&task->thread.ckpt_regs, trap);
 	return 0;
 }
 
diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
index 15e3b79b6395..caeb5822a8f4 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -149,7 +149,7 @@ static int set_user_dscr(struct task_struct *task, unsigned long dscr)
  */
 static int set_user_trap(struct task_struct *task, unsigned long trap)
 {
-	task->thread.regs->trap = trap & 0xfff0;
+	set_trap(task->thread.regs, trap);
 	return 0;
 }
 
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 7af840c0fc93..92761e47fb5c 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1178,7 +1178,7 @@ static int do_step(struct pt_regs *regs)
 				return 0;
 			}
 			if (stepped > 0) {
-				regs->trap = 0xd00 | (regs->trap & 1);
+				set_trap(regs, 0xd00);
 				printf("stepped to ");
 				xmon_print_symbol(regs->nip, " ", "\n");
 				ppc_inst_dump(regs->nip, 1, 0);
-- 
2.25.1

