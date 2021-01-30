Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F041B309573
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 14:40:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSb1s5P1NzDqQ1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 00:40:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dQKzE0Zb; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZLD0lmKzDrTC
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:09:40 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id g15so8494178pgu.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1JuI3VBPIXDrq46gac4glssKFenTBLQSHobdLMO5dU4=;
 b=dQKzE0ZbTR1cVu3xOibTg01FLmbGvOfMgZLup9Yks+H+9/4Ft2f9lfVbnMlCwtx8sd
 9flbJIpRKXYUMQ6ZZ4CJvUl4x1ysgwxmJhWYRwH1MRDqnbuKbxSvxdnggEIJIiMX2Did
 Z9kCViBnQ0ULPruTCHg8AybzrRO7cyAD9s0TlUf/yoaB2u/nKxtlyPLEkHYK8t6RDlgD
 LjVS53Tu46Pk/xABF3BsnkImULitObvCP3J5w1HpXnI6o9TzwjLVatA113DSoB2Olkvk
 vcC2I24dvUuB/ZUI5+cHXRy4rCh41aJJPs84zve9flZHACLf0khowr8SW85MQFB/Zegm
 aElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1JuI3VBPIXDrq46gac4glssKFenTBLQSHobdLMO5dU4=;
 b=M/MlbZqh+GXg6tNEHEs/5buRvCCiiGDEqgApU2BSTjiGU31EWU5HvLr/KYjqyXcxOj
 Kqceplb9ShWT7WFEu68stPp+41uykbXei7h86D6CEm0knlmus3gtVM4BZIo5cNNIkgi6
 R3BiGfhsegeBM3N3hjVzG0rbTPuSab4KHLlF1rrrISxI4hN2I9CU3foa51utX7BngHAc
 xS7lWI5GlvAYYfIFz11tV8YqiC3ezGFsyr9N4w5ObC5hxM3JmthP9o5vswUulcE1Ur7Q
 1isuhvoPR440DNpn2YjwHqS54oGGuKBZSnTg7KK8WOcVl6ksrY6b7rNKb7uh/uueO+An
 sjtg==
X-Gm-Message-State: AOAM533J7gJmV0xqoNByAM6SsNC8qQwdmdmF6XMJSDQU7DVxF6Rn7yz5
 JxOVtZTcNGfOj2pS45HdB2m36F/6GeM=
X-Google-Smtp-Source: ABdhPJynioIJx4SHuxyro7xC1JBqFC5XwSSn+tSWe4wc1l9f38FS6fak4D50Qf+ad6KFxsph455CIQ==
X-Received: by 2002:a65:6453:: with SMTP id s19mr8791716pgv.280.1612012178014; 
 Sat, 30 Jan 2021 05:09:38 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:09:37 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 09/42] powerpc: DebugException remove args
Date: Sat, 30 Jan 2021 23:08:19 +1000
Message-Id: <20210130130852.2952424-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Like other interrupt handler conversions, switch to getting registers
from the pt_regs argument.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64e.S | 2 --
 arch/powerpc/kernel/head_40x.S       | 1 +
 arch/powerpc/kernel/head_booke.h     | 2 ++
 arch/powerpc/kernel/traps.c          | 4 +++-
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 43e71d86dcbf..1a7291daadfd 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -791,7 +791,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	EXCEPTION_COMMON_CRIT(0xd00)
 	std	r14,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	mr	r4,r14
 	ld	r14,PACA_EXCRIT+EX_R14(r13)
 	ld	r15,PACA_EXCRIT+EX_R15(r13)
 	bl	save_nvgprs
@@ -864,7 +863,6 @@ kernel_dbg_exc:
 	INTS_DISABLE
 	std	r14,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	mr	r4,r14
 	ld	r14,PACA_EXDBG+EX_R14(r13)
 	ld	r15,PACA_EXDBG+EX_R15(r13)
 	bl	save_nvgprs
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 3c5577ac4dc8..24724a7dad49 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -476,6 +476,7 @@ _ENTRY(saved_ksp_limit)
 
 	/* continue normal handling for a critical exception... */
 2:	mfspr	r4,SPRN_DBSR
+	stw	r4,_ESR(r11)		/* DebugException takes DBSR in _ESR */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_TEMPLATE(DebugException, 0x2002, \
 		(MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), \
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 0fbdacc7fab7..bf33af714d11 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -406,6 +406,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 									      \
 	/* continue normal handling for a debug exception... */		      \
 2:	mfspr	r4,SPRN_DBSR;						      \
+	stw	r4,_ESR(r11);		/* DebugException takes DBSR in _ESR */\
 	addi	r3,r1,STACK_FRAME_OVERHEAD;				      \
 	EXC_XFER_TEMPLATE(DebugException, 0x2008, (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), debug_transfer_to_handler, ret_from_debug_exc)
 
@@ -459,6 +460,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 									      \
 	/* continue normal handling for a critical exception... */	      \
 2:	mfspr	r4,SPRN_DBSR;						      \
+	stw	r4,_ESR(r11);		/* DebugException takes DBSR in _ESR */\
 	addi	r3,r1,STACK_FRAME_OVERHEAD;				      \
 	EXC_XFER_TEMPLATE(DebugException, 0x2002, (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), crit_transfer_to_handler, ret_from_crit_exc)
 
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 1c77b1a8f7c9..dfb0d3325f4b 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1957,8 +1957,10 @@ static void handle_debug(struct pt_regs *regs, unsigned long debug_status)
 		mtspr(SPRN_DBCR0, current->thread.debug.dbcr0);
 }
 
-void DebugException(struct pt_regs *regs, unsigned long debug_status)
+void DebugException(struct pt_regs *regs)
 {
+	unsigned long debug_status = regs->dsisr;
+
 	current->thread.debug.dbsr = debug_status;
 
 	/* Hack alert: On BookE, Branch Taken stops on the branch itself, while
-- 
2.23.0

