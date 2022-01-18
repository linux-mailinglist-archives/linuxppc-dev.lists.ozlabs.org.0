Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5184F491F32
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 06:59:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdJ4Z1lrMz3bSl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 16:59:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fAaProH5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fAaProH5; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdJ3w1C39z2yg4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 16:58:34 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id t18so23400855plg.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 21:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R1R8PIalRbg4dF7FI7hA5O7ms3DuV4TIUZt7kO37XJw=;
 b=fAaProH5gIaATncPS75vBWvO1ivVoqzDlm8h/YX/mkZLdyCu/SHOdihji/nnXk00TS
 Z5yEriU3jpfNznkBLtg1PjQajpLO8XSG7Uwmw3x8ZtLGzJxR6rbOZ4NFchZLGolaYcV4
 9s9bFzgAeeV5Lc6KXB5q7Uw0c8nmTdpHUkCHUATjvTB1tTcfhe9e3ZMrspRIjK+aOBX+
 K3in17Gy8P3Nb2IxC97XGV4TIfNX+a5MDv2s+Lzye0qMHG9bVi8lUB2B4WV+2pH9+ozo
 DFcfzO02e2Cn28Fub00qrQ2B8YEvJeavUhm1R5Gkcti2+RZKGPxqQ7JwtpTxW0oDObvw
 /pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R1R8PIalRbg4dF7FI7hA5O7ms3DuV4TIUZt7kO37XJw=;
 b=gpX9de9cbe04+yWZNaPS+M80k+nsD7eDMkFBagEOarqoFZeUmlF74z4ap5vAiPlmes
 qHBahvaT+5ya6LViRyVVBzLax0SZoc2RAreC2w63mamxjwIR1lY7y7eC0BK4mtWSs8ov
 lIDEnpuUf5NDKEJDlCqHCOGFCQW4Fa8SXu7JKCdc9NSbA4nQ1C+01iG5iQNE++j8bU++
 SPY730uja3SwdWKW2eSrcjjAIBiwCiJDkIwu4xTiWArLBWmYduL1uikjqNC7N2t2T5o8
 rp1PabWdZ2bOIG33jGtoiy/F7Ab4PNOtM9HZMMmotlop+C6sOHH/I8Fjil2SI03kBKpM
 7z4g==
X-Gm-Message-State: AOAM533dxxrfgcNEEYIaUiQadC4riugyAO3uswIwpqYG+DN9vTquJMtk
 0miALL//dVluWa15nm7SR70qC6nMASs=
X-Google-Smtp-Source: ABdhPJx3w+cAfRdaFiGbLxdMAYN4fyASX6vvz7iQ4u47h6ev/2NgrE85vamg7pyMYgwSutcixsCKpg==
X-Received: by 2002:a17:902:6908:b0:149:b26a:b9b5 with SMTP id
 j8-20020a170902690800b00149b26ab9b5mr26468454plk.169.1642485510066; 
 Mon, 17 Jan 2022 21:58:30 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (124-171-74-95.tpgi.com.au. [124.171.74.95])
 by smtp.gmail.com with ESMTPSA id h2sm1141137pjc.31.2022.01.17.21.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 21:58:29 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/2] powerpc/64: remove system call instruction emulation
Date: Tue, 18 Jan 2022 15:58:20 +1000
Message-Id: <20220118055821.3065241-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220118055821.3065241-1-npiggin@gmail.com>
References: <20220118055821.3065241-1-npiggin@gmail.com>
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
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
there was any upstream instructions or this was used by out of tree
modules. So system call emulation is not required by the above users.

uprobes uses emulate_step and it appears possible to emulate sc
instruction in userspace. This type of system call emulation is broken
and it's not clear it ever worked well.

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
it is a big complexity to support this just for uprobes.

uprobes emulates the instruction rather than stepping for performance
reasons. System calls instructions should not be a significant source
of uprobes and already expensive, so skipping emulation should not be
a significant problem.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/sstep.c | 36 ------------------------------------
 1 file changed, 36 deletions(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index a94b0cd0bdc5..ee3bc45fb23b 100644
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
@@ -3650,39 +3647,6 @@ int emulate_step(struct pt_regs *regs, ppc_inst_t instr)
 		goto instr_done;
 
 #ifdef CONFIG_PPC64
-	case SYSCALL:	/* sc */
-		/*
-		 * N.B. this uses knowledge about how the syscall
-		 * entry code works.  If that is changed, this will
-		 * need to be changed also.
-		 */
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
-#ifdef CONFIG_PPC_BOOK3S_64
-	case SYSCALL_VECTORED_0:	/* scv 0 */
-		regs->gpr[9] = regs->gpr[13];
-		regs->gpr[10] = MSR_KERNEL;
-		regs->gpr[11] = regs->nip + 4;
-		regs->gpr[12] = regs->msr & MSR_MASK;
-		regs->gpr[13] = (unsigned long) get_paca();
-		regs_set_return_ip(regs, (unsigned long) &system_call_vectored_emulate);
-		regs_set_return_msr(regs, MSR_KERNEL);
-		return 1;
-#endif
-
 	case RFI:
 		return -1;
 #endif
-- 
2.23.0

