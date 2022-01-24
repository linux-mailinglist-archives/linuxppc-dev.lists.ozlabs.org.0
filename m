Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BF14978BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 06:58:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jhzn36Rlrz3bV0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 16:58:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YRDa6qBU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YRDa6qBU; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JhzmK3D7Jz30D5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 16:57:51 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id
 l24-20020a17090aec1800b001b55738f633so2720322pjy.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 21:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vy6DOciF4L5omWyt7qehFiCwVe4AUoW6Gi1RHxk27h8=;
 b=YRDa6qBUSw8/Qm+bSTjQ9pDsP5W8zYIw47iQ1pgbqHCUk/CGu+zlIg+2RRuUl7J4Kp
 H4iLa3l84fm/rRxrqWPosJBIc5Ib+sNmTbkThwPTGqFO7Y0ackoRUasLD93Ou5uCC9b6
 YTjWB5L5OLPVi4/FO7VDzR4lR2ii/OLVJa0rySevTOfGCTuQgBVURz3CjmraBBMKyv9G
 xRrgJvUDdkZhgmCS3ggs0OZqKS3zxaoLOP27PxSwq44OosnBSkpr+2CwbTv0o/W7+1hF
 fC/BermIAczwvDWrQtmUYA+tIKm7M6hvJOWxsYt7VmpTrpBeBAwsq2tZYyKnQLUavGx7
 s/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vy6DOciF4L5omWyt7qehFiCwVe4AUoW6Gi1RHxk27h8=;
 b=AI7ZQGu5yS9UZ6gb3rBCsUcVRB56XKvXJUaoPRBBOeJsnrTc3LhtCV7Y8z/C8wjJ+i
 34OWH7ry2DgmqgEueuscm8se/6zfktzDQZH7kdSk1LaQJ3NsWBFyfNDkaD/p/FtMsPPY
 zN8CjBK4TjbHN7uQAELyTpbKJwAX2g43sR0kTXJ5t05AJbuKKcQjoWoKwohglsVvpjEE
 5MEM8RiVOCKOpkm2OZAWjLFOsx4KF2qjEuzu0wHw87FOI1gzqAFXLZoPlaZmYQTv8nQH
 0R9/SgsjrnRHfRY6BDmDFV2N+Avi2onEHb50cHg9Q537EDIeczl5AeX/lrriXBZU4cSc
 zyQQ==
X-Gm-Message-State: AOAM530nANyzGnP4B/wYFwj4NHJWI4wX2m9D6n4sO+7/O5r0e7przGN+
 Ohoc699+SSM4kF2Lico5NoZ8sQeh0+k=
X-Google-Smtp-Source: ABdhPJwwzdmGqN9YCgc0I1Xm7MOnQ03AVG2LbxA7ub2GBRHFTTZH128FuGnKRN+BvuS1bFm/PPB6MA==
X-Received: by 2002:a17:902:9695:b0:149:208f:d9f9 with SMTP id
 n21-20020a170902969500b00149208fd9f9mr13135803plp.139.1643003870230; 
 Sun, 23 Jan 2022 21:57:50 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id f8sm15045859pfe.67.2022.01.23.21.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 21:57:49 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/64: remove system call instruction emulation
Date: Mon, 24 Jan 2022 15:57:40 +1000
Message-Id: <20220124055741.3686496-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220124055741.3686496-1-npiggin@gmail.com>
References: <20220124055741.3686496-1-npiggin@gmail.com>
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

emulate_step instruction emulation including sc instruction emulation
initially appeared in xmon. It then emulation code was then moved into
sstep.c where kprobes could use it too, and later hw_breakpoint and
uprobes started to use it.

Until uprobes, the only instruction emulation users were for kernel
mode instructions.

- xmon only steps / breaks on kernel addresses.
- kprobes is kernel only.
- hw_breakpoint only emulates kernel instructions, single steps user.

At one point there was support for the kernel to execute sc
instructions, although that is long removed and it's not clear whether
there was any in-tree code. So system call emulation is not required by
the above users.

uprobes uses emulate_step and it appears possible to emulate sc
instruction in userspace. Userspace system call emulation is broken and
it's not clear it ever worked well.

The big complication is that userspace takes an interrupt to the kernel
to emulate the instruction. The user->kernel interrupt sets up registers
and interrupt stack frame expecting to return to userspace, then system
call instruction emulation re-directs that stack frame to the kernel,
early in the system call interrupt handler. This means the the interrupt
return code takes the kernel->kernel restore path, which does not restore
everything as the system call interrupt handler would expect coming from
userspace. regs->iamr appears to get lost for example, because the
kernel->kernel return does not restore the user iamr. Accounting such as
irqflags tracing and CPU accounting does not get flipped back to user
mode as the system call handler expects, so those appear to enter the
kernel twice without returning to userspace.

These things may be individually fixable with various complication, but
it is a big complexity for unclear real benefit.

This patch removes system call emulation and disables stepping system
calls (because they don't work with trace interrupts, as commented).

Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt_64.S | 10 -------
 arch/powerpc/lib/sstep.c           | 42 ++++++++----------------------
 2 files changed, 11 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 7bab2d7de372..6471034c7909 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -219,16 +219,6 @@ system_call_vectored common 0x3000
  */
 system_call_vectored sigill 0x7ff0
 
-
-/*
- * Entered via kernel return set up by kernel/sstep.c, must match entry regs
- */
-	.globl system_call_vectored_emulate
-system_call_vectored_emulate:
-_ASM_NOKPROBE_SYMBOL(system_call_vectored_emulate)
-	li	r10,IRQS_ALL_DISABLED
-	stb	r10,PACAIRQSOFTMASK(r13)
-	b	system_call_vectored_common
 #endif /* CONFIG_PPC_BOOK3S */
 
 	.balign IFETCH_ALIGN_BYTES
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index a94b0cd0bdc5..5f317b12b2db 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -15,9 +15,6 @@
 #include <asm/cputable.h>
 #include <asm/disassemble.h>
 
-extern char system_call_common[];
-extern char system_call_vectored_emulate[];
-
 #ifdef CONFIG_PPC64
 /* Bits in SRR1 that are copied from MSR */
 #define MSR_MASK	0xffffffff87c0ffffUL
@@ -3650,39 +3647,22 @@ int emulate_step(struct pt_regs *regs, ppc_inst_t instr)
 		goto instr_done;
 
 #ifdef CONFIG_PPC64
-	case SYSCALL:	/* sc */
 		/*
-		 * N.B. this uses knowledge about how the syscall
-		 * entry code works.  If that is changed, this will
-		 * need to be changed also.
+		 * Per ISA v3.1, section 7.5.15 'Trace Interrupt', we can't
+		 * single step a system call instruction:
+		 *
+		 *   Successful completion for an instruction means that the
+		 *   instruction caused no other interrupt. Thus a Trace
+		 *   interrupt never occurs for a System Call or System Call
+		 *   Vectored instruction, or for a Trap instruction that
+		 *   traps.
 		 */
-		if (IS_ENABLED(CONFIG_PPC_FAST_ENDIAN_SWITCH) &&
-				cpu_has_feature(CPU_FTR_REAL_LE) &&
-				regs->gpr[0] == 0x1ebe) {
-			regs_set_return_msr(regs, regs->msr ^ MSR_LE);
-			goto instr_done;
-		}
-		regs->gpr[9] = regs->gpr[13];
-		regs->gpr[10] = MSR_KERNEL;
-		regs->gpr[11] = regs->nip + 4;
-		regs->gpr[12] = regs->msr & MSR_MASK;
-		regs->gpr[13] = (unsigned long) get_paca();
-		regs_set_return_ip(regs, (unsigned long) &system_call_common);
-		regs_set_return_msr(regs, MSR_KERNEL);
-		return 1;
-
+	case SYSCALL:	/* sc */
+		return -1;
 #ifdef CONFIG_PPC_BOOK3S_64
 	case SYSCALL_VECTORED_0:	/* scv 0 */
-		regs->gpr[9] = regs->gpr[13];
-		regs->gpr[10] = MSR_KERNEL;
-		regs->gpr[11] = regs->nip + 4;
-		regs->gpr[12] = regs->msr & MSR_MASK;
-		regs->gpr[13] = (unsigned long) get_paca();
-		regs_set_return_ip(regs, (unsigned long) &system_call_vectored_emulate);
-		regs_set_return_msr(regs, MSR_KERNEL);
-		return 1;
+		return -1;
 #endif
-
 	case RFI:
 		return -1;
 #endif
-- 
2.23.0

