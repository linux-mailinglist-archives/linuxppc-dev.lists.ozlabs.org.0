Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8858579F9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 11:11:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tbnkw2hvCz3vY7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 21:11:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbnkV5Cbdz3btZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 21:10:41 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4TbnkQ4JZhz9syV;
	Fri, 16 Feb 2024 11:10:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HuB_5vFxQkNh; Fri, 16 Feb 2024 11:10:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4TbnkQ3gyQz9syQ;
	Fri, 16 Feb 2024 11:10:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7A7148B786;
	Fri, 16 Feb 2024 11:10:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id vPXdAzl_fD0h; Fri, 16 Feb 2024 11:10:38 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.102])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 19F748B765;
	Fri, 16 Feb 2024 11:10:38 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc: Use user_mode() macro when possible
Date: Fri, 16 Feb 2024 11:10:36 +0100
Message-ID: <fbf74887dcf1f1ba9e1680fc3247cbb581b00662.1708078228.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708078237; l=6868; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=qBSXF9Zc1QKlrZ+06XqkLDFWW0lt4a3ZfZcT0bPy+94=; b=BWteZ+EaPU7+bUG/td5WmSid8nuSCQibIVyuztn2t8Faibsom32MAAUA97mbccszmMWiG5vd7 zApsEaiaNYIASZl4rZBOJwaJs5EAuPEEQIFgyX7abcCBj2pyZz1KIW9
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

There is a nice macro to check user mode.

Use it instead of open coding anding with MSR_PR to increase
readability and avoid having to comment what that anding is for.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/interrupt.h |  2 +-
 arch/powerpc/kernel/syscall.c        |  2 +-
 arch/powerpc/kernel/traps.c          |  4 ++--
 arch/powerpc/lib/sstep.c             | 23 +++++++++++------------
 arch/powerpc/perf/core-book3s.c      |  2 +-
 arch/powerpc/xmon/xmon.c             |  4 ++--
 6 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index a4196ab1d016..7b610864b364 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -97,7 +97,7 @@ DECLARE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
 
 static inline bool is_implicit_soft_masked(struct pt_regs *regs)
 {
-	if (regs->msr & MSR_PR)
+	if (user_mode(regs))
 		return false;
 
 	if (regs->nip >= (unsigned long)__end_soft_masked)
diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index 77fedb190c93..f6f868e817e6 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -31,7 +31,7 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
 	user_exit_irqoff();
 
 	BUG_ON(regs_is_unrecoverable(regs));
-	BUG_ON(!(regs->msr & MSR_PR));
+	BUG_ON(!user_mode(regs));
 	BUG_ON(arch_irq_disabled_regs(regs));
 
 #ifdef CONFIG_PPC_PKEY
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 11e062b47d3f..f23430adb68a 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -404,7 +404,7 @@ noinstr void hv_nmi_check_nonrecoverable(struct pt_regs *regs)
 		return;
 	if (!(regs->msr & MSR_HV))
 		return;
-	if (regs->msr & MSR_PR)
+	if (user_mode(regs))
 		return;
 
 	/*
@@ -1510,7 +1510,7 @@ static void do_program_check(struct pt_regs *regs)
 		if (!is_kernel_addr(bugaddr) && !(regs->msr & MSR_IR))
 			bugaddr += PAGE_OFFSET;
 
-		if (!(regs->msr & MSR_PR) &&  /* not user-mode */
+		if (!user_mode(regs) &&
 		    report_bug(bugaddr, regs) == BUG_TRAP_TYPE_WARN) {
 			regs_add_return_ip(regs, 4);
 			return;
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 5766180f5380..e65f3fb68d06 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1429,7 +1429,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			return 1;
 
 		case 18:	/* rfid, scary */
-			if (regs->msr & MSR_PR)
+			if (user_mode(regs))
 				goto priv;
 			op->type = RFI;
 			return 0;
@@ -1742,13 +1742,13 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			return 1;
 #endif
 		case 83:	/* mfmsr */
-			if (regs->msr & MSR_PR)
+			if (user_mode(regs))
 				goto priv;
 			op->type = MFMSR;
 			op->reg = rd;
 			return 0;
 		case 146:	/* mtmsr */
-			if (regs->msr & MSR_PR)
+			if (user_mode(regs))
 				goto priv;
 			op->type = MTMSR;
 			op->reg = rd;
@@ -1756,7 +1756,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			return 0;
 #ifdef CONFIG_PPC64
 		case 178:	/* mtmsrd */
-			if (regs->msr & MSR_PR)
+			if (user_mode(regs))
 				goto priv;
 			op->type = MTMSR;
 			op->reg = rd;
@@ -3437,14 +3437,14 @@ int emulate_loadstore(struct pt_regs *regs, struct instruction_op *op)
 		 * stored in the thread_struct.  If the instruction is in
 		 * the kernel, we must not touch the state in the thread_struct.
 		 */
-		if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_FP))
+		if (!user_mode(regs) && !(regs->msr & MSR_FP))
 			return 0;
 		err = do_fp_load(op, ea, regs, cross_endian);
 		break;
 #endif
 #ifdef CONFIG_ALTIVEC
 	case LOAD_VMX:
-		if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_VEC))
+		if (!user_mode(regs) && !(regs->msr & MSR_VEC))
 			return 0;
 		err = do_vec_load(op->reg, ea, size, regs, cross_endian);
 		break;
@@ -3459,7 +3459,7 @@ int emulate_loadstore(struct pt_regs *regs, struct instruction_op *op)
 		 */
 		if (op->reg >= 32 && (op->vsx_flags & VSX_CHECK_VEC))
 			msrbit = MSR_VEC;
-		if (!(regs->msr & MSR_PR) && !(regs->msr & msrbit))
+		if (!user_mode(regs) && !(regs->msr & msrbit))
 			return 0;
 		err = do_vsx_load(op, ea, regs, cross_endian);
 		break;
@@ -3495,8 +3495,7 @@ int emulate_loadstore(struct pt_regs *regs, struct instruction_op *op)
 		}
 #endif
 		if ((op->type & UPDATE) && size == sizeof(long) &&
-		    op->reg == 1 && op->update_reg == 1 &&
-		    !(regs->msr & MSR_PR) &&
+		    op->reg == 1 && op->update_reg == 1 && !user_mode(regs) &&
 		    ea >= regs->gpr[1] - STACK_INT_FRAME_SIZE) {
 			err = handle_stack_update(ea, regs);
 			break;
@@ -3508,14 +3507,14 @@ int emulate_loadstore(struct pt_regs *regs, struct instruction_op *op)
 
 #ifdef CONFIG_PPC_FPU
 	case STORE_FP:
-		if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_FP))
+		if (!user_mode(regs) && !(regs->msr & MSR_FP))
 			return 0;
 		err = do_fp_store(op, ea, regs, cross_endian);
 		break;
 #endif
 #ifdef CONFIG_ALTIVEC
 	case STORE_VMX:
-		if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_VEC))
+		if (!user_mode(regs) && !(regs->msr & MSR_VEC))
 			return 0;
 		err = do_vec_store(op->reg, ea, size, regs, cross_endian);
 		break;
@@ -3530,7 +3529,7 @@ int emulate_loadstore(struct pt_regs *regs, struct instruction_op *op)
 		 */
 		if (op->reg >= 32 && (op->vsx_flags & VSX_CHECK_VEC))
 			msrbit = MSR_VEC;
-		if (!(regs->msr & MSR_PR) && !(regs->msr & msrbit))
+		if (!user_mode(regs) && !(regs->msr & msrbit))
 			return 0;
 		err = do_vsx_store(op, ea, regs, cross_endian);
 		break;
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index b7ff680cde96..01d14523c938 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -256,7 +256,7 @@ static bool regs_sipr(struct pt_regs *regs)
 
 static inline u32 perf_flags_from_msr(struct pt_regs *regs)
 {
-	if (regs->msr & MSR_PR)
+	if (user_mode(regs))
 		return PERF_RECORD_MISC_USER;
 	if ((regs->msr & MSR_HV) && freeze_events_kernel != MMCR0_FCHV)
 		return PERF_RECORD_MISC_HYPERVISOR;
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index b3b94cd37713..c79bed133f44 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1820,8 +1820,8 @@ static void print_bug_trap(struct pt_regs *regs)
 	const struct bug_entry *bug;
 	unsigned long addr;
 
-	if (regs->msr & MSR_PR)
-		return;		/* not in kernel */
+	if (user_mode(regs))
+		return;
 	addr = regs->nip;	/* address of trap instruction */
 	if (!is_kernel_addr(addr))
 		return;
-- 
2.43.0

