Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A76E3501FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 16:15:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9SyL1YSRz3c6s
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 01:15:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9Sy03HwFz30hc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 01:15:01 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F9Sxs54h1z9v329;
 Wed, 31 Mar 2021 16:14:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id X2hGRp9Wscd2; Wed, 31 Mar 2021 16:14:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F9Sxs44DJz9v328;
 Wed, 31 Mar 2021 16:14:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8B7968B829;
 Wed, 31 Mar 2021 16:14:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xx8qZEUczKKW; Wed, 31 Mar 2021 16:14:58 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 31E078B828;
 Wed, 31 Mar 2021 16:14:58 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0C9B767626; Wed, 31 Mar 2021 14:14:58 +0000 (UTC)
Message-Id: <9121a44a2d50ba1af18d8aa5ada06c9a3bea8afd.1617200085.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/ptrace: Don't return error when getting/setting FP
 regs without CONFIG_PPC_FPU_REGS
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 31 Mar 2021 14:14:58 +0000 (UTC)
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

An #ifdef CONFIG_PPC_FPU_REGS is missing in arch_ptrace() leading
to the following Oops because [REGSET_FPR] entry is not initialised in
native_regsets[].

[   41.917608] BUG: Unable to handle kernel instruction fetch
[   41.922849] Faulting instruction address: 0xff8fd228
[   41.927760] Oops: Kernel access of bad area, sig: 11 [#1]
[   41.933089] BE PAGE_SIZE=4K PREEMPT CMPC885
[   41.940753] Modules linked in:
[   41.943768] CPU: 0 PID: 366 Comm: gdb Not tainted 5.12.0-rc5-s3k-dev-01666-g7aac86a0f057-dirty #4835
[   41.952800] NIP:  ff8fd228 LR: c004d9e0 CTR: ff8fd228
[   41.957790] REGS: caae9df0 TRAP: 0400   Not tainted  (5.12.0-rc5-s3k-dev-01666-g7aac86a0f057-dirty)
[   41.966741] MSR:  40009032 <EE,ME,IR,DR,RI>  CR: 82004248  XER: 20000000
[   41.973540]
[   41.973540] GPR00: c004d9b4 caae9eb0 c1b64f60 c1b64520 c0713cd4 caae9eb8 c1bacdfc 00000004
[   41.973540] GPR08: 00000200 ff8fd228 c1bac700 00001032 28004242 1061aaf4 00000001 106d64a0
[   41.973540] GPR16: 00000000 00000000 7fa0a774 10610000 7fa0aef9 00000000 10610000 7fa0a538
[   41.973540] GPR24: 7fa0a580 7fa0a570 c1bacc00 c1b64520 c1bacc00 caae9ee8 00000108 c0713cd4
[   42.009685] NIP [ff8fd228] 0xff8fd228
[   42.013300] LR [c004d9e0] __regset_get+0x100/0x124
[   42.018036] Call Trace:
[   42.020443] [caae9eb0] [c004d9b4] __regset_get+0xd4/0x124 (unreliable)
[   42.026899] [caae9ee0] [c004da94] copy_regset_to_user+0x5c/0xb0
[   42.032751] [caae9f10] [c002f640] sys_ptrace+0xe4/0x588
[   42.037915] [caae9f30] [c0011010] ret_from_syscall+0x0/0x28
[   42.043422] --- interrupt: c00 at 0xfd1f8e4
[   42.047553] NIP:  0fd1f8e4 LR: 1004a688 CTR: 00000000
[   42.052544] REGS: caae9f40 TRAP: 0c00   Not tainted  (5.12.0-rc5-s3k-dev-01666-g7aac86a0f057-dirty)
[   42.061494] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 48004442  XER: 00000000
[   42.068551]
[   42.068551] GPR00: 0000001a 7fa0a040 77dad7e0 0000000e 00000170 00000000 7fa0a078 00000004
[   42.068551] GPR08: 00000000 108deb88 108dda40 106d6010 44004442 1061aaf4 00000001 106d64a0
[   42.068551] GPR16: 00000000 00000000 7fa0a774 10610000 7fa0aef9 00000000 10610000 7fa0a538
[   42.068551] GPR24: 7fa0a580 7fa0a570 1078fe00 1078fd70 1078fd70 00000170 0fdd3244 0000000d
[   42.104696] NIP [0fd1f8e4] 0xfd1f8e4
[   42.108225] LR [1004a688] 0x1004a688
[   42.111753] --- interrupt: c00
[   42.114768] Instruction dump:
[   42.117698] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
[   42.125443] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
[   42.133195] ---[ end trace d35616f22ab2100c ]---

Adding the missing #ifdef is not good because gdb doesn't like getting
an error when getting registers.

Instead, make ptrace return 0s when CONFIG_PPC_FPU_REGS is not set.

Fixes: b6254ced4da6 ("powerpc/signal: Don't manage floating point regs when no FPU")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/ptrace/Makefile       |  4 ++--
 arch/powerpc/kernel/ptrace/ptrace-decl.h  | 14 --------------
 arch/powerpc/kernel/ptrace/ptrace-fpu.c   | 10 ++++++++++
 arch/powerpc/kernel/ptrace/ptrace-novsx.c |  8 ++++++++
 arch/powerpc/kernel/ptrace/ptrace-view.c  |  2 --
 5 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/Makefile b/arch/powerpc/kernel/ptrace/Makefile
index 8ebc11d1168d..77abd1a5a508 100644
--- a/arch/powerpc/kernel/ptrace/Makefile
+++ b/arch/powerpc/kernel/ptrace/Makefile
@@ -6,11 +6,11 @@
 CFLAGS_ptrace-view.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"'
 
 obj-y				+= ptrace.o ptrace-view.o
-obj-$(CONFIG_PPC_FPU_REGS)	+= ptrace-fpu.o
+obj-y				+= ptrace-fpu.o
 obj-$(CONFIG_COMPAT)		+= ptrace32.o
 obj-$(CONFIG_VSX)		+= ptrace-vsx.o
 ifneq ($(CONFIG_VSX),y)
-obj-$(CONFIG_PPC_FPU_REGS)	+= ptrace-novsx.o
+obj-y				+= ptrace-novsx.o
 endif
 obj-$(CONFIG_ALTIVEC)		+= ptrace-altivec.o
 obj-$(CONFIG_SPE)		+= ptrace-spe.o
diff --git a/arch/powerpc/kernel/ptrace/ptrace-decl.h b/arch/powerpc/kernel/ptrace/ptrace-decl.h
index 3487f2c9735c..eafe5f0f6289 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-decl.h
+++ b/arch/powerpc/kernel/ptrace/ptrace-decl.h
@@ -165,22 +165,8 @@ int ptrace_put_reg(struct task_struct *task, int regno, unsigned long data);
 extern const struct user_regset_view user_ppc_native_view;
 
 /* ptrace-fpu */
-#ifdef CONFIG_PPC_FPU_REGS
 int ptrace_get_fpr(struct task_struct *child, int index, unsigned long *data);
 int ptrace_put_fpr(struct task_struct *child, int index, unsigned long data);
-#else
-static inline int
-ptrace_get_fpr(struct task_struct *child, int index, unsigned long *data)
-{
-	return -EIO;
-}
-
-static inline int
-ptrace_put_fpr(struct task_struct *child, int index, unsigned long data)
-{
-	return -EIO;
-}
-#endif
 
 /* ptrace-(no)adv */
 void ppc_gethwdinfo(struct ppc_debug_info *dbginfo);
diff --git a/arch/powerpc/kernel/ptrace/ptrace-fpu.c b/arch/powerpc/kernel/ptrace/ptrace-fpu.c
index 8301cb52dd99..5dca19361316 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-fpu.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-fpu.c
@@ -8,32 +8,42 @@
 
 int ptrace_get_fpr(struct task_struct *child, int index, unsigned long *data)
 {
+#ifdef CONFIG_PPC_FPU_REGS
 	unsigned int fpidx = index - PT_FPR0;
+#endif
 
 	if (index > PT_FPSCR)
 		return -EIO;
 
+#ifdef CONFIG_PPC_FPU_REGS
 	flush_fp_to_thread(child);
 	if (fpidx < (PT_FPSCR - PT_FPR0))
 		memcpy(data, &child->thread.TS_FPR(fpidx), sizeof(long));
 	else
 		*data = child->thread.fp_state.fpscr;
+#else
+	*data = 0;
+#endif
 
 	return 0;
 }
 
 int ptrace_put_fpr(struct task_struct *child, int index, unsigned long data)
 {
+#ifdef CONFIG_PPC_FPU_REGS
 	unsigned int fpidx = index - PT_FPR0;
+#endif
 
 	if (index > PT_FPSCR)
 		return -EIO;
 
+#ifdef CONFIG_PPC_FPU_REGS
 	flush_fp_to_thread(child);
 	if (fpidx < (PT_FPSCR - PT_FPR0))
 		memcpy(&child->thread.TS_FPR(fpidx), &data, sizeof(long));
 	else
 		child->thread.fp_state.fpscr = data;
+#endif
 
 	return 0;
 }
diff --git a/arch/powerpc/kernel/ptrace/ptrace-novsx.c b/arch/powerpc/kernel/ptrace/ptrace-novsx.c
index b3b36835658a..7433f3db979a 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-novsx.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-novsx.c
@@ -21,12 +21,16 @@
 int fpr_get(struct task_struct *target, const struct user_regset *regset,
 	    struct membuf to)
 {
+#ifdef CONFIG_PPC_FPU_REGS
 	BUILD_BUG_ON(offsetof(struct thread_fp_state, fpscr) !=
 		     offsetof(struct thread_fp_state, fpr[32]));
 
 	flush_fp_to_thread(target);
 
 	return membuf_write(&to, &target->thread.fp_state, 33 * sizeof(u64));
+#else
+	return membuf_write(&to, &empty_zero_page, 33 * sizeof(u64));
+#endif
 }
 
 /*
@@ -46,6 +50,7 @@ int fpr_set(struct task_struct *target, const struct user_regset *regset,
 	    unsigned int pos, unsigned int count,
 	    const void *kbuf, const void __user *ubuf)
 {
+#ifdef CONFIG_PPC_FPU_REGS
 	BUILD_BUG_ON(offsetof(struct thread_fp_state, fpscr) !=
 		     offsetof(struct thread_fp_state, fpr[32]));
 
@@ -53,4 +58,7 @@ int fpr_set(struct task_struct *target, const struct user_regset *regset,
 
 	return user_regset_copyin(&pos, &count, &kbuf, &ubuf,
 				  &target->thread.fp_state, 0, -1);
+#else
+	return 0;
+#endif
 }
diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
index 0923c94f684e..3579217ca9b0 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -522,13 +522,11 @@ static const struct user_regset native_regsets[] = {
 		.size = sizeof(long), .align = sizeof(long),
 		.regset_get = gpr_get, .set = gpr_set
 	},
-#ifdef CONFIG_PPC_FPU_REGS
 	[REGSET_FPR] = {
 		.core_note_type = NT_PRFPREG, .n = ELF_NFPREG,
 		.size = sizeof(double), .align = sizeof(double),
 		.regset_get = fpr_get, .set = fpr_set
 	},
-#endif
 #ifdef CONFIG_ALTIVEC
 	[REGSET_VMX] = {
 		.core_note_type = NT_PPC_VMX, .n = 34,
-- 
2.25.0

