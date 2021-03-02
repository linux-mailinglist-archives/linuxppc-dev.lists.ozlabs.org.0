Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A85329D5A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 12:57:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqbGn3K02z3dM1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 22:57:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QMFDe8K/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QMFDe8K/; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqbF46XmFz3cZs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 22:56:08 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0ADDA64F27;
 Tue,  2 Mar 2021 11:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614686166;
 bh=gJfELmqvWVs1hUT+FMssjHU8ltU0BGH5VFallq3Fy5Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QMFDe8K/uSM5bdzgaUuxLzWeejjpgXoKqtKgUyMOep97P4Z+lKlb/pEtfG5A4FL4Y
 qExibxrQMhpdKjufMJyYc3cRp9GjpUqDfIFLt7xp2tzpJBl+9U9/9eWkMKTBs5dkV6
 iTGIhM4GBl5VuprPQTTvWjQjqRAz692c3QWAUk5OLo1KUYyyep2QNtE6xc0wJvLv7e
 eZby6hGHKGMRtkWkN2MxtZJHX7AB4c9h4eKqlX1GRrw8CHbRvDFgfpmHhCElVppJQ6
 wYafdS5Pu6GwQUbSMdfaKDKiDaJjcPRp27IGROvT+hXywYEhgHVrX6KIwf+CI9JnT9
 75wxK5fXQkZAQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 24/52] powerpc/64: Fix stack trace not displaying
 final frame
Date: Tue,  2 Mar 2021 06:55:05 -0500
Message-Id: <20210302115534.61800-24-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302115534.61800-1-sashal@kernel.org>
References: <20210302115534.61800-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit e3de1e291fa58a1ab0f471a4b458eff2514e4b5f ]

In commit bf13718bc57a ("powerpc: show registers when unwinding
interrupt frames") we changed our stack dumping logic to show the full
registers whenever we find an interrupt frame on the stack.

However we didn't notice that on 64-bit this doesn't show the final
frame, ie. the interrupt that brought us in from userspace, whereas on
32-bit it does.

That is due to confusion about the size of that last frame. The code
in show_stack() calls validate_sp(), passing it STACK_INT_FRAME_SIZE
to check the sp is at least that far below the top of the stack.

However on 64-bit that size is too large for the final frame, because
it includes the red zone, but we don't allocate a red zone for the
first frame.

So add a new define that encodes the correct size for 32-bit and
64-bit, and use it in show_stack().

This results in the full trace being shown on 64-bit, eg:

  sysrq: Trigger a crash
  Kernel panic - not syncing: sysrq triggered crash
  CPU: 0 PID: 83 Comm: sh Not tainted 5.11.0-rc2-gcc-8.2.0-00188-g571abcb96b10-dirty #649
  Call Trace:
  [c00000000a1c3ac0] [c000000000897b70] dump_stack+0xc4/0x114 (unreliable)
  [c00000000a1c3b00] [c00000000014334c] panic+0x178/0x41c
  [c00000000a1c3ba0] [c00000000094e600] sysrq_handle_crash+0x40/0x50
  [c00000000a1c3c00] [c00000000094ef98] __handle_sysrq+0xd8/0x210
  [c00000000a1c3ca0] [c00000000094f820] write_sysrq_trigger+0x100/0x188
  [c00000000a1c3ce0] [c0000000005559dc] proc_reg_write+0x10c/0x1b0
  [c00000000a1c3d10] [c000000000479950] vfs_write+0xf0/0x360
  [c00000000a1c3d60] [c000000000479d9c] ksys_write+0x7c/0x140
  [c00000000a1c3db0] [c00000000002bf5c] system_call_exception+0x19c/0x2c0
  [c00000000a1c3e10] [c00000000000d35c] system_call_common+0xec/0x278
  --- interrupt: c00 at 0x7fff9fbab428
  NIP:  00007fff9fbab428 LR: 000000001000b724 CTR: 0000000000000000
  REGS: c00000000a1c3e80 TRAP: 0c00   Not tainted  (5.11.0-rc2-gcc-8.2.0-00188-g571abcb96b10-dirty)
  MSR:  900000000280f033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 22002884  XER: 00000000
  IRQMASK: 0
  GPR00: 0000000000000004 00007fffc3cb8960 00007fff9fc59900 0000000000000001
  GPR04: 000000002a4b32d0 0000000000000002 0000000000000063 0000000000000063
  GPR08: 000000002a4b32d0 0000000000000000 0000000000000000 0000000000000000
  GPR12: 0000000000000000 00007fff9fcca9a0 0000000000000000 0000000000000000
  GPR16: 0000000000000000 0000000000000000 0000000000000000 00000000100b8fd0
  GPR20: 000000002a4b3485 00000000100b8f90 0000000000000000 0000000000000000
  GPR24: 000000002a4b0440 00000000100e77b8 0000000000000020 000000002a4b32d0
  GPR28: 0000000000000001 0000000000000002 000000002a4b32d0 0000000000000001
  NIP [00007fff9fbab428] 0x7fff9fbab428
  LR [000000001000b724] 0x1000b724
  --- interrupt: c00

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20210209141627.2898485-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/ptrace.h | 3 +++
 arch/powerpc/kernel/asm-offsets.c | 2 +-
 arch/powerpc/kernel/process.c     | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 58f9dc060a7b..8236c5e749e4 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -70,6 +70,9 @@ struct pt_regs
 };
 #endif
 
+
+#define STACK_FRAME_WITH_PT_REGS (STACK_FRAME_OVERHEAD + sizeof(struct pt_regs))
+
 #ifdef __powerpc64__
 
 /*
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index b12d7c049bfe..989006b5ad0f 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -309,7 +309,7 @@ int main(void)
 
 	/* Interrupt register frame */
 	DEFINE(INT_FRAME_SIZE, STACK_INT_FRAME_SIZE);
-	DEFINE(SWITCH_FRAME_SIZE, STACK_FRAME_OVERHEAD + sizeof(struct pt_regs));
+	DEFINE(SWITCH_FRAME_SIZE, STACK_FRAME_WITH_PT_REGS);
 	STACK_PT_REGS_OFFSET(GPR0, gpr[0]);
 	STACK_PT_REGS_OFFSET(GPR1, gpr[1]);
 	STACK_PT_REGS_OFFSET(GPR2, gpr[2]);
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index a66f435dabbf..b65a73e4d642 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2176,7 +2176,7 @@ void show_stack(struct task_struct *tsk, unsigned long *stack,
 		 * See if this is an exception frame.
 		 * We look for the "regshere" marker in the current frame.
 		 */
-		if (validate_sp(sp, tsk, STACK_INT_FRAME_SIZE)
+		if (validate_sp(sp, tsk, STACK_FRAME_WITH_PT_REGS)
 		    && stack[STACK_FRAME_MARKER] == STACK_FRAME_REGS_MARKER) {
 			struct pt_regs *regs = (struct pt_regs *)
 				(sp + STACK_FRAME_OVERHEAD);
-- 
2.30.1

