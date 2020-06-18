Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F40C91FE942
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 05:11:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nRmQ0bn3zDr5l
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 13:11:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=0msqEyRd; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nPHL64RgzDqvH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 11:19:42 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 650EF21D7E;
 Thu, 18 Jun 2020 01:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592443180;
 bh=8a3tUOm2vgVqs8IpP9QtpGew4aOxWC26/iz4AFhWBmo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0msqEyRd4O2ZJuGWAeCJURUl2mdQ6AbLjvjdUCR3fVrba/mx2vZWIqsyKmCocAkcH
 K/SFp2JXCf0//tF/TDlD7JbYgU/SjJq2pX+oBjkzJRVItQ9Tp7CZGEDoHGONr3tn+k
 zTZ4A9eI0bXMoLV7v3hBLWufAdcHg/qSaPCtKwtU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 142/266] powerpc/64: Don't initialise
 init_task->thread.regs
Date: Wed, 17 Jun 2020 21:14:27 -0400
Message-Id: <20200618011631.604574-142-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618011631.604574-1-sashal@kernel.org>
References: <20200618011631.604574-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit 7ffa8b7dc11752827329e4e84a574ea6aaf24716 ]

Aneesh increased the size of struct pt_regs by 16 bytes and started
seeing this WARN_ON:

  smp: Bringing up secondary CPUs ...
  ------------[ cut here ]------------
  WARNING: CPU: 0 PID: 0 at arch/powerpc/kernel/process.c:455 giveup_all+0xb4/0x110
  Modules linked in:
  CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.7.0-rc2-gcc-8.2.0-1.g8f6a41f-default+ #318
  NIP:  c00000000001a2b4 LR: c00000000001a29c CTR: c0000000031d0000
  REGS: c0000000026d3980 TRAP: 0700   Not tainted  (5.7.0-rc2-gcc-8.2.0-1.g8f6a41f-default+)
  MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 48048224  XER: 00000000
  CFAR: c000000000019cc8 IRQMASK: 1
  GPR00: c00000000001a264 c0000000026d3c20 c0000000026d7200 800000000280b033
  GPR04: 0000000000000001 0000000000000000 0000000000000077 30206d7372203164
  GPR08: 0000000000002000 0000000002002000 800000000280b033 3230303030303030
  GPR12: 0000000000008800 c0000000031d0000 0000000000800050 0000000002000066
  GPR16: 000000000309a1a0 000000000309a4b0 000000000309a2d8 000000000309a890
  GPR20: 00000000030d0098 c00000000264da40 00000000fd620000 c0000000ff798080
  GPR24: c00000000264edf0 c0000001007469f0 00000000fd620000 c0000000020e5e90
  GPR28: c00000000264edf0 c00000000264d200 000000001db60000 c00000000264d200
  NIP [c00000000001a2b4] giveup_all+0xb4/0x110
  LR [c00000000001a29c] giveup_all+0x9c/0x110
  Call Trace:
  [c0000000026d3c20] [c00000000001a264] giveup_all+0x64/0x110 (unreliable)
  [c0000000026d3c90] [c00000000001ae34] __switch_to+0x104/0x480
  [c0000000026d3cf0] [c000000000e0b8a0] __schedule+0x320/0x970
  [c0000000026d3dd0] [c000000000e0c518] schedule_idle+0x38/0x70
  [c0000000026d3df0] [c00000000019c7c8] do_idle+0x248/0x3f0
  [c0000000026d3e70] [c00000000019cbb8] cpu_startup_entry+0x38/0x40
  [c0000000026d3ea0] [c000000000011bb0] rest_init+0xe0/0xf8
  [c0000000026d3ed0] [c000000002004820] start_kernel+0x990/0x9e0
  [c0000000026d3f90] [c00000000000c49c] start_here_common+0x1c/0x400

Which was unexpected. The warning is checking the thread.regs->msr
value of the task we are switching from:

  usermsr = tsk->thread.regs->msr;
  ...
  WARN_ON((usermsr & MSR_VSX) && !((usermsr & MSR_FP) && (usermsr & MSR_VEC)));

ie. if MSR_VSX is set then both of MSR_FP and MSR_VEC are also set.

Dumping tsk->thread.regs->msr we see that it's: 0x1db60000

Which is not a normal looking MSR, in fact the only valid bit is
MSR_VSX, all the other bits are reserved in the current definition of
the MSR.

We can see from the oops that it was swapper/0 that we were switching
from when we hit the warning, ie. init_task. So its thread.regs points
to the base (high addresses) in init_stack.

Dumping the content of init_task->thread.regs, with the members of
pt_regs annotated (the 16 bytes larger version), we see:

  0000000000000000 c000000002780080    gpr[0]     gpr[1]
  0000000000000000 c000000002666008    gpr[2]     gpr[3]
  c0000000026d3ed0 0000000000000078    gpr[4]     gpr[5]
  c000000000011b68 c000000002780080    gpr[6]     gpr[7]
  0000000000000000 0000000000000000    gpr[8]     gpr[9]
  c0000000026d3f90 0000800000002200    gpr[10]    gpr[11]
  c000000002004820 c0000000026d7200    gpr[12]    gpr[13]
  000000001db60000 c0000000010aabe8    gpr[14]    gpr[15]
  c0000000010aabe8 c0000000010aabe8    gpr[16]    gpr[17]
  c00000000294d598 0000000000000000    gpr[18]    gpr[19]
  0000000000000000 0000000000001ff8    gpr[20]    gpr[21]
  0000000000000000 c00000000206d608    gpr[22]    gpr[23]
  c00000000278e0cc 0000000000000000    gpr[24]    gpr[25]
  000000002fff0000 c000000000000000    gpr[26]    gpr[27]
  0000000002000000 0000000000000028    gpr[28]    gpr[29]
  000000001db60000 0000000004750000    gpr[30]    gpr[31]
  0000000002000000 000000001db60000    nip        msr
  0000000000000000 0000000000000000    orig_r3    ctr
  c00000000000c49c 0000000000000000    link       xer
  0000000000000000 0000000000000000    ccr        softe
  0000000000000000 0000000000000000    trap       dar
  0000000000000000 0000000000000000    dsisr      result
  0000000000000000 0000000000000000    ppr        kuap
  0000000000000000 0000000000000000    pad[2]     pad[3]

This looks suspiciously like stack frames, not a pt_regs. If we look
closely we can see return addresses from the stack trace above,
c000000002004820 (start_kernel) and c00000000000c49c (start_here_common).

init_task->thread.regs is setup at build time in processor.h:

  #define INIT_THREAD  { \
  	.ksp = INIT_SP, \
  	.regs = (struct pt_regs *)INIT_SP - 1, /* XXX bogus, I think */ \

The early boot code where we setup the initial stack is:

  LOAD_REG_ADDR(r3,init_thread_union)

  /* set up a stack pointer */
  LOAD_REG_IMMEDIATE(r1,THREAD_SIZE)
  add	r1,r3,r1
  li	r0,0
  stdu	r0,-STACK_FRAME_OVERHEAD(r1)

Which creates a stack frame of size 112 bytes (STACK_FRAME_OVERHEAD).
Which is far too small to contain a pt_regs.

So the result is init_task->thread.regs is pointing at some stack
frames on the init stack, not at a pt_regs.

We have gotten away with this for so long because with pt_regs at its
current size the MSR happens to point into the first frame, at a
location that is not written to by the early asm. With the 16 byte
expansion the MSR falls into the second frame, which is used by the
compiler, and collides with a saved register that tends to be
non-zero.

As far as I can see this has been wrong since the original merge of
64-bit ppc support, back in 2002.

Conceptually swapper should have no regs, it never entered from
userspace, and in fact that's what we do on 32-bit. It's also
presumably what the "bogus" comment is referring to.

So I think the right fix is to just not-initialise regs at all. I'm
slightly worried this will break some code that isn't prepared for a
NULL regs, but we'll have to see.

Remove the comment in head_64.S which refers to us setting up the
regs (even though we never did), and is otherwise not really accurate
any more.

Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20200428123130.73078-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/processor.h | 1 -
 arch/powerpc/kernel/head_64.S        | 9 +--------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index a9993e7a443b..64b998db9d3e 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -291,7 +291,6 @@ struct thread_struct {
 #else
 #define INIT_THREAD  { \
 	.ksp = INIT_SP, \
-	.regs = (struct pt_regs *)INIT_SP - 1, /* XXX bogus, I think */ \
 	.addr_limit = KERNEL_DS, \
 	.fpexc_mode = 0, \
 	.fscr = FSCR_TAR | FSCR_EBB \
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index ad79fddb974d..780f527eabd2 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -945,15 +945,8 @@ start_here_multiplatform:
 	std	r0,0(r4)
 #endif
 
-	/* The following gets the stack set up with the regs */
-	/* pointing to the real addr of the kernel stack.  This is   */
-	/* all done to support the C function call below which sets  */
-	/* up the htab.  This is done because we have relocated the  */
-	/* kernel but are still running in real mode. */
-
-	LOAD_REG_ADDR(r3,init_thread_union)
-
 	/* set up a stack pointer */
+	LOAD_REG_ADDR(r3,init_thread_union)
 	LOAD_REG_IMMEDIATE(r1,THREAD_SIZE)
 	add	r1,r3,r1
 	li	r0,0
-- 
2.25.1

