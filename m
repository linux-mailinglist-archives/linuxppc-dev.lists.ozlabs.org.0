Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FDA1CD66F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 12:22:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LH712gr3zDqBx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 20:22:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vXB6wiE6; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LH4M4gMWzDqG6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 20:20:03 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id q24so7563538pjd.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 03:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lWGsRtH2XMW2rPY3p1C94aocYTIL8g4D9f9hR1eGgQI=;
 b=vXB6wiE69pu1Uu0bKA2JpDdRBjKfcFk4wTNwwP+2nSKWYme7T0F2lwVyrz2ps2bFdB
 avPGYB9+UalxKXKe63AIt52kiQqolbGuI4Y9mhq4AuELiDTdOCyAQmA0OU+ZjQ+BGE1H
 svk66yb1ManJhdxIM1h5r7gq+OtDSG6Ao7Q2BZFzro1FDAZHXMID3muIUpX5fysZJd7E
 hqLgmUzYqzBNmX/hxQwjDTtoZx2yRQ42RagVaB42PXW6WwQwmRyComc45p5HRl1Syb2k
 75Wt1p5hJ00wE1bDeXk3JsqA/3aFlqeG1TXooJq+EHjhynjX9rxTFQdypSrRabmlQ3GA
 2R7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lWGsRtH2XMW2rPY3p1C94aocYTIL8g4D9f9hR1eGgQI=;
 b=ZjXrsJTSFQNZ7Xyr479TE1wuppT+VUE7xqPRKYcIXyTrnii7GfG5wBv6tN6pnWcrWC
 Hckf+bGVPbus18Qfd/J4ujekmcNBHKm/nCo6PhYoO8M7l2zz0WyhsQSo3G6MwXH4AGCE
 1tAZynIw9IdnPFsBjGyMhTvd455/gCLeiwBYnEOZk6nYxfHWowA/q1QyLdEOhVZcHaLE
 9sJOf0eQ/kPNxgp6BieO98kXZzvxCTGxg9h5NiVL5qThMByjqppY1l0um09eHrGvnlr3
 6jit22ejIFFhwneRFqwPC/rVFEFUPUgkAV60aZ7fE1YTlz8CSLcy7FiCqYkp1v7b3ar+
 dP1g==
X-Gm-Message-State: AGi0PuY+rs6GIFa+WEzUH595XnZuQStATN1+oDf8kC1b69J3PNQzZMtr
 TiL9+ma1+1vjmg6xMnQkE64h9x8L
X-Google-Smtp-Source: APiQypKy48Dlvj3xcSRpPL6hi5Bv1WYVAafHEsCNhoPDY5Ys0DBYAGdhqSeqe0zdgLMiEIaCfWlsBQ==
X-Received: by 2002:a17:902:b948:: with SMTP id
 h8mr14070829pls.309.1589192401072; 
 Mon, 11 May 2020 03:20:01 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id a22sm7605061pga.28.2020.05.11.03.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:20:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/64/signal: balance return predictor stack in
 signal trampoline
Date: Mon, 11 May 2020 20:19:52 +1000
Message-Id: <20200511101952.1463138-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Returning from an interrupt or syscall to a signal handler currently
begins execution directly at the handler's entry point, with LR set to
the address of the sigreturn trampoline. When the signal handler
function returns, it runs the trampoline. It looks like this:

    # interrupt at user address xyz
    # kernel stuff... signal is raised
    rfid
    # void handler(int sig)
    addis 2,12,.TOC.-.LCF0@ha
    addi 2,2,.TOC.-.LCF0@l
    mflr 0
    std 0,16(1)
    stdu 1,-96(1)
    # handler stuff
    ld 0,16(1)
    mtlr 0
    blr
    # __kernel_sigtramp_rt64
    addi    r1,r1,__SIGNAL_FRAMESIZE
    li      r0,__NR_rt_sigreturn
    sc
    # kernel executes rt_sigreturn
    rfid
    # back to user address xyz

Note the blr with no matching bl. This can corrupt the return predictor.

Solve this by instead resuming execution at the signal trampoline which
then calls the signal handler. qtrace-tools link_stack checker confirms
the entire user/kernel/vdso cycle is balanced after this patch, whereas
it's not upstream.

Alan confirms the dwarf unwind info still looks good. gdb still
recognises the signal frame and can step into parent frames if it break
inside a signal handler.

Performance is pretty noisy, not a very significant change on a POWER9
here, but branch misses are consistently a lot lower on a microbenchmark:

 Performance counter stats for './signal':

         13,085.72 msec task-clock                #    1.000 CPUs utilized
    45,024,760,101      cycles                    #    3.441 GHz
    65,102,895,542      instructions              #    1.45  insn per cycle
    11,271,673,787      branches                  #  861.372 M/sec
        59,468,979      branch-misses             #    0.53% of all branches

         12,989.09 msec task-clock                #    1.000 CPUs utilized
    44,692,719,559      cycles                    #    3.441 GHz
    65,109,984,964      instructions              #    1.46  insn per cycle
    11,282,136,057      branches                  #  868.585 M/sec
        39,786,942      branch-misses             #    0.35% of all branches

Cc: Alan Modra <amodra@gmail.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v1:
- Fix for the legacy on-stack trampoline path (TRAMP_TRACEBACK was not
  updated to 4).
- Tested legacy case (must also disable no-exec stack to test this).

 arch/powerpc/include/asm/ppc-opcode.h |  1 +
 arch/powerpc/kernel/signal_64.c       | 22 ++++++++++++----------
 arch/powerpc/kernel/vdso64/sigtramp.S | 13 +++++--------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index c1df75edde44..747b37f1ce09 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -329,6 +329,7 @@
 #define PPC_INST_BLR			0x4e800020
 #define PPC_INST_BLRL			0x4e800021
 #define PPC_INST_BCTR			0x4e800420
+#define PPC_INST_BCTRL			0x4e800421
 #define PPC_INST_MULLD			0x7c0001d2
 #define PPC_INST_MULLW			0x7c0001d6
 #define PPC_INST_MULHWU			0x7c000016
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index adfde59cf4ba..6bb14cdf256f 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -40,8 +40,8 @@
 #define GP_REGS_SIZE	min(sizeof(elf_gregset_t), sizeof(struct pt_regs))
 #define FP_REGS_SIZE	sizeof(elf_fpregset_t)
 
-#define TRAMP_TRACEBACK	3
-#define TRAMP_SIZE	6
+#define TRAMP_TRACEBACK	4
+#define TRAMP_SIZE	7
 
 /*
  * When we have signals to deliver, we set up on the user stack,
@@ -603,13 +603,15 @@ static long setup_trampoline(unsigned int syscall, unsigned int __user *tramp)
 	int i;
 	long err = 0;
 
+	/* bctrl # call the handler */
+	err |= __put_user(PPC_INST_BCTRL, &tramp[0]);
 	/* addi r1, r1, __SIGNAL_FRAMESIZE  # Pop the dummy stackframe */
 	err |= __put_user(PPC_INST_ADDI | __PPC_RT(R1) | __PPC_RA(R1) |
-			  (__SIGNAL_FRAMESIZE & 0xffff), &tramp[0]);
+			  (__SIGNAL_FRAMESIZE & 0xffff), &tramp[1]);
 	/* li r0, __NR_[rt_]sigreturn| */
-	err |= __put_user(PPC_INST_ADDI | (syscall & 0xffff), &tramp[1]);
+	err |= __put_user(PPC_INST_ADDI | (syscall & 0xffff), &tramp[2]);
 	/* sc */
-	err |= __put_user(PPC_INST_SC, &tramp[2]);
+	err |= __put_user(PPC_INST_SC, &tramp[3]);
 
 	/* Minimal traceback info */
 	for (i=TRAMP_TRACEBACK; i < TRAMP_SIZE ;i++)
@@ -867,12 +869,12 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 
 	/* Set up to return from userspace. */
 	if (vdso64_rt_sigtramp && tsk->mm->context.vdso_base) {
-		regs->link = tsk->mm->context.vdso_base + vdso64_rt_sigtramp;
+		regs->nip = tsk->mm->context.vdso_base + vdso64_rt_sigtramp;
 	} else {
 		err |= setup_trampoline(__NR_rt_sigreturn, &frame->tramp[0]);
 		if (err)
 			goto badframe;
-		regs->link = (unsigned long) &frame->tramp[0];
+		regs->nip = (unsigned long) &frame->tramp[0];
 	}
 
 	/* Allocate a dummy caller frame for the signal handler. */
@@ -881,8 +883,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 
 	/* Set up "regs" so we "return" to the signal handler. */
 	if (is_elf2_task()) {
-		regs->nip = (unsigned long) ksig->ka.sa.sa_handler;
-		regs->gpr[12] = regs->nip;
+		regs->ctr = (unsigned long) ksig->ka.sa.sa_handler;
+		regs->gpr[12] = regs->ctr;
 	} else {
 		/* Handler is *really* a pointer to the function descriptor for
 		 * the signal routine.  The first entry in the function
@@ -892,7 +894,7 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 		func_descr_t __user *funct_desc_ptr =
 			(func_descr_t __user *) ksig->ka.sa.sa_handler;
 
-		err |= get_user(regs->nip, &funct_desc_ptr->entry);
+		err |= get_user(regs->ctr, &funct_desc_ptr->entry);
 		err |= get_user(regs->gpr[2], &funct_desc_ptr->toc);
 	}
 
diff --git a/arch/powerpc/kernel/vdso64/sigtramp.S b/arch/powerpc/kernel/vdso64/sigtramp.S
index a8cc0409d7d2..bbf68cd01088 100644
--- a/arch/powerpc/kernel/vdso64/sigtramp.S
+++ b/arch/powerpc/kernel/vdso64/sigtramp.S
@@ -6,6 +6,7 @@
  * Copyright (C) 2004 Benjamin Herrenschmuidt (benh@kernel.crashing.org), IBM Corp.
  * Copyright (C) 2004 Alan Modra (amodra@au.ibm.com)), IBM Corp.
  */
+#include <asm/cache.h>		/* IFETCH_ALIGN_BYTES */
 #include <asm/processor.h>
 #include <asm/ppc_asm.h>
 #include <asm/unistd.h>
@@ -14,21 +15,17 @@
 
 	.text
 
-/* The nop here is a hack.  The dwarf2 unwind routines subtract 1 from
-   the return address to get an address in the middle of the presumed
-   call instruction.  Since we don't have a call here, we artificially
-   extend the range covered by the unwind info by padding before the
-   real start.  */
-	nop
 	.balign 8
+	.balign IFETCH_ALIGN_BYTES
 V_FUNCTION_BEGIN(__kernel_sigtramp_rt64)
-.Lsigrt_start = . - 4
+.Lsigrt_start:
+	bctrl	/* call the handler */
 	addi	r1, r1, __SIGNAL_FRAMESIZE
 	li	r0,__NR_rt_sigreturn
 	sc
 .Lsigrt_end:
 V_FUNCTION_END(__kernel_sigtramp_rt64)
-/* The ".balign 8" above and the following zeros mimic the old stack
+/* The .balign 8 above and the following zeros mimic the old stack
    trampoline layout.  The last magic value is the ucontext pointer,
    chosen in such a way that older libgcc unwind code returns a zero
    for a sigcontext pointer.  */
-- 
2.23.0

