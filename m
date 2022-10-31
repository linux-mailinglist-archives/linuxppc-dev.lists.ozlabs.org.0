Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 628F0613019
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 07:02:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N12cs1Vx9z3fDS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 17:02:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IL8J3tHl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IL8J3tHl;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N12Ry3GX5z3c1x
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 16:55:09 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id p21so5982906plr.7
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 22:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNsywg7Vi14WO9VWIecI1w/mf0lb0nZewd4PZmb5DS8=;
        b=IL8J3tHlkWJqRqn4Y0DQIcbm0w7+dNLBwG6O0aXJqMhR4/vf6nx/ua0AaPTyCJdzMw
         2cOrIiEn21h+Iw3wCQOH3fT9ozLSsiUWdusZfAyoMa/OjVsZdJ6vXAjN3mgUo4JIdr4O
         xgspcOlWjvuO63dHH4M+BMtIeU6RIVUPbNcal04Xnr+nP9QimO8HS6C40V8G2WcWOhSZ
         aMDQy+YvAIQC3JymImce6JUSbspOSrNQlo3e24t4bu1Qcy2F1mELHRGcGD9rahAti4lx
         rP+OfX8qyjUjLkmd5oW0v7ce+uX8WRn10R6KTdJkcKUR9lAUnRDWqXreZ+obQlqI1Hoj
         uIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNsywg7Vi14WO9VWIecI1w/mf0lb0nZewd4PZmb5DS8=;
        b=LoIRAxL7fBTS7zLy9xiuRwitiOvChKQeucE+dO/QM2K/FZvLSq2PDJmARrGho6ecKZ
         oSeb8mk5Z+dvSkrWfeAtQHnZXWTFxLeCwbagu3rYypLOFquGnDvdVSZInbjN2S2pQEQF
         Hh7wNzbqAUwba56PHXNpz2BovJ5tMHqh5DzyXvZFqBkW5wz9OsZVSBjBVlipUTBZN74k
         q3pKmje/kxAPAEZ3q/gaO/jmg045a0er7qvVwUhpRYHVj3kGAHTEdEXPPKcPeb6Edoyk
         Dx33sO+VH+E50uVnXCKkc3qB5rrUfY5yxWIRRWqaHOzp8XZXvzpysXY3rA5jocWcSwdN
         7A4Q==
X-Gm-Message-State: ACrzQf21FoncdicHY1a3mZZ6+XP5D+end3fBxenCWK2SZqk/8H4sm1Yl
	VzPSeM5QJdSCKLtpo2pqIeynllwAFv4=
X-Google-Smtp-Source: AMsMyM4fi0D0ZXd5HehrrhlyWk+KpEnZ5UfKZB9GzvfDBvlXSe4E/XLKoDbbL1UmBaRS5MQ9WyJftg==
X-Received: by 2002:a17:902:be03:b0:17b:80c1:78c2 with SMTP id r3-20020a170902be0300b0017b80c178c2mr12748046pls.34.1667195707345;
        Sun, 30 Oct 2022 22:55:07 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm3599599pfa.191.2022.10.30.22.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:55:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 08/19] powerpc: add a definition for the marker offset within the interrupt frame
Date: Mon, 31 Oct 2022 15:54:29 +1000
Message-Id: <20221031055440.3594315-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221031055440.3594315-1-npiggin@gmail.com>
References: <20221031055440.3594315-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Define a constant rather than open-code the offset for the
"regs" marker.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h       |  2 ++
 arch/powerpc/kernel/entry_32.S          |  2 +-
 arch/powerpc/kernel/exceptions-64e.S    |  2 +-
 arch/powerpc/kernel/exceptions-64s.S    |  2 +-
 arch/powerpc/kernel/head_32.h           |  2 +-
 arch/powerpc/kernel/head_booke.h        |  2 +-
 arch/powerpc/kernel/interrupt_64.S      | 10 +++++-----
 arch/powerpc/kvm/book3s_hv_rmhandlers.S |  2 +-
 8 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index a4ae67aa9b76..8a9f4cf8c4c5 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -125,6 +125,7 @@ struct pt_regs
 #define STACK_INT_FRAME_SIZE	(sizeof(struct pt_regs) + \
 				 STACK_FRAME_OVERHEAD + KERNEL_REDZONE_SIZE)
 #define STACK_INT_FRAME_REGS	STACK_FRAME_OVERHEAD
+#define STACK_INT_FRAME_MARKER	(STACK_FRAME_OVERHEAD - 16)
 #define STACK_FRAME_MARKER	12
 
 #ifdef CONFIG_PPC64_ELF_ABI_V2
@@ -145,6 +146,7 @@ struct pt_regs
 #define STACK_FRAME_LR_SAVE	1	/* Location of LR in stack frame */
 #define STACK_INT_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD)
 #define STACK_INT_FRAME_REGS	STACK_FRAME_OVERHEAD
+#define STACK_INT_FRAME_MARKER	(STACK_FRAME_OVERHEAD - 8)
 #define STACK_FRAME_MARKER	2
 #define STACK_FRAME_MIN_SIZE	STACK_FRAME_OVERHEAD
 
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 24c8d84a56c9..2f61b7d3677c 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -114,7 +114,7 @@ transfer_to_syscall:
 	addi	r12,r12,STACK_FRAME_REGS_MARKER@l
 	stw	r9,_MSR(r1)
 	li	r2, INTERRUPT_SYSCALL
-	stw	r12,8(r1)
+	stw	r12,STACK_INT_FRAME_MARKER(r1)
 	stw	r2,_TRAP(r1)
 	SAVE_GPR(0, r1)
 	SAVE_GPRS(3, 8, r1)
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index f6b36083a8c2..d74c2a53af13 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -391,7 +391,7 @@ exc_##n##_common:							    \
 	std	r10,_CCR(r1);		/* store orig CR in stackframe */   \
 	std	r9,GPR1(r1);		/* store stack frame back link */   \
 	std	r11,SOFTE(r1);		/* and save it to stackframe */     \
-	std	r12,STACK_FRAME_OVERHEAD-16(r1); /* mark the frame */	    \
+	std	r12,STACK_INT_FRAME_MARKER(r1); /* mark the frame */	    \
 	std	r3,_TRAP(r1);		/* set trap number		*/  \
 	std	r0,RESULT(r1);		/* clear regs->result */	    \
 	SAVE_NVGPRS(r1);
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 907054940a07..39f08ec56126 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -591,7 +591,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	li	r10,0
 	LOAD_REG_IMMEDIATE(r11, STACK_FRAME_REGS_MARKER)
 	std	r10,RESULT(r1)		/* clear regs->result		*/
-	std	r11,STACK_FRAME_OVERHEAD-16(r1) /* mark the frame	*/
+	std	r11,STACK_INT_FRAME_MARKER(r1) /* mark the frame	*/
 .endm
 
 /*
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 117d25330e13..f8e2911478a7 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -112,7 +112,7 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 	stw	r0,GPR0(r1)
 	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
 	addi	r10,r10,STACK_FRAME_REGS_MARKER@l
-	stw	r10,8(r1)
+	stw	r10,STACK_INT_FRAME_MARKER(r1)
 	li	r10, \trapno
 	stw	r10,_TRAP(r1)
 	SAVE_GPRS(3, 8, r1)
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 3149ac20b18e..37d43c172676 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -84,7 +84,7 @@ END_BTB_FLUSH_SECTION
 	stw	r0,GPR0(r1)
 	lis	r10, STACK_FRAME_REGS_MARKER@ha	/* exception frame marker */
 	addi	r10, r10, STACK_FRAME_REGS_MARKER@l
-	stw	r10, 8(r1)
+	stw	r10, STACK_INT_FRAME_MARKER(r1)
 	li	r10, \trapno
 	stw	r10,_TRAP(r1)
 	SAVE_GPRS(3, 8, r1)
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 12807d5298a3..2306b979e71f 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -77,11 +77,11 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
 	std	r11,_TRAP(r1)
 	std	r12,_CCR(r1)
 	std	r3,ORIG_GPR3(r1)
+	LOAD_REG_IMMEDIATE(r11, STACK_FRAME_REGS_MARKER)
+	std	r11,STACK_INT_FRAME_MARKER(r1)		/* "regs" marker */
 	/* Calling convention has r3 = regs, r4 = orig r0 */
 	addi	r3,r1,STACK_INT_FRAME_REGS
 	mr	r4,r0
-	LOAD_REG_IMMEDIATE(r11, STACK_FRAME_REGS_MARKER)
-	std	r11,-16(r3)		/* "regshere" marker */
 
 BEGIN_FTR_SECTION
 	HMT_MEDIUM
@@ -250,11 +250,11 @@ END_BTB_FLUSH_SECTION
 	std	r11,_TRAP(r1)
 	std	r12,_CCR(r1)
 	std	r3,ORIG_GPR3(r1)
+	LOAD_REG_IMMEDIATE(r11, STACK_FRAME_REGS_MARKER)
+	std	r11,STACK_INT_FRAME_MARKER(r1)		/* "regs" marker */
 	/* Calling convention has r3 = regs, r4 = orig r0 */
 	addi	r3,r1,STACK_INT_FRAME_REGS
 	mr	r4,r0
-	LOAD_REG_IMMEDIATE(r11, STACK_FRAME_REGS_MARKER)
-	std	r11,-16(r3)		/* "regshere" marker */
 
 #ifdef CONFIG_PPC_BOOK3S
 	li	r11,1
@@ -628,7 +628,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	 * Leaving a stale STACK_FRAME_REGS_MARKER on the stack can confuse
 	 * the reliable stack unwinder later on. Clear it.
 	 */
-	std	r0,STACK_FRAME_OVERHEAD-16(r1)
+	std	r0,STACK_INT_FRAME_MARKER(r1)
 
 	REST_GPRS(2, 5, r1)
 
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 37f50861dd98..a9e162a1deec 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -2729,7 +2729,7 @@ kvmppc_bad_host_intr:
 	std	r6, SOFTE(r1)
 	LOAD_PACA_TOC()
 	LOAD_REG_IMMEDIATE(3, STACK_FRAME_REGS_MARKER)
-	std	r3, STACK_FRAME_OVERHEAD-16(r1)
+	std	r3, STACK_INT_FRAME_MARKER(r1)
 
 	/*
 	 * XXX On POWER7 and POWER8, we just spin here since we don't
-- 
2.37.2

