Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6DB639AB1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 13:58:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKpYL3DkKz3fD4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 23:57:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h1xo1neI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h1xo1neI;
	dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKpNM4lnXz3cKG
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 23:50:11 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id 4so7814312pli.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 04:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmjKgSAGe24fh8mE9Bd1HDUuXjREa41anQKMfPsocTI=;
        b=h1xo1neIzQ5BYOsdWiR9OkLp/eN4JqA/VkxuW/EMAaNf5HjcayLbqZvpz/y1C4NUbJ
         TvFnsdwT9T0DvccR3WyrB+5fXaRS/4gLsvG+8WkPo5Sz346XHCaWnO2OICOOrgKSTKGD
         K5Sm+VQdcU4Z20JCqKUXu1T7n3w18ZI3CL8llHEo6JRE/MfRzAu3ttXpkqfsV6At0iVn
         j4lt4+090keIKDAlq5J6pWX8QRo2VOjGC1A5xAJGqMdyTOvxP8ZhEiRP94gz4cujKxw/
         M1v6EXsKcjpwuUMGsXAuaOBdBbrWu3W8fIOVYI8deb9klBhXmqErGXfFAS2As41/dfbg
         2gnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmjKgSAGe24fh8mE9Bd1HDUuXjREa41anQKMfPsocTI=;
        b=upwamx50X7IXi9/s84mIKA+Yr0IDU7tco9U4dkLek+IGZQ5q/HDkKARrPfow4pi9YY
         KrBLC4TKPeoAiVLn9vT6rP5+XGQwE0Q6eY1Na3VwBKFaSpRroBQtYYM1DiYaaYfcAAi5
         +tgKzslV1j/p8hiuYgbx8+Dpf+LOHkKhx5hJvgGO9E26D64wFnJMGHQPYZZtDu5Nz/iy
         oG90JakRm2p+em4RVojSANBl0k0cukp5/CYcKZxvxHjrkqFAr7BSOTPp00/sVNqjoJJ8
         QfErM+IInpnbTAEDUwndnF9mle5X1BCLXrjs7WQVUCVfBghnw7f1jFqiI9Vs+NHxvjkS
         /tsg==
X-Gm-Message-State: ANoB5pkERFaAH+x9mEfC8KASvSlJNDO6ETE1I48kzwKN9yWdM84UvSFk
	MPjSXgVY8/fTWlR1QBJ/Y6eVdB2hV8npIg==
X-Google-Smtp-Source: AA0mqf7VuAruj23tj1h81ZEBwys+jIst0HCmedZCjOvVh96xM/8OaBaFh9jFkBWkV+RIS3qfJhJ1PQ==
X-Received: by 2002:a17:902:b707:b0:189:5f3c:fb25 with SMTP id d7-20020a170902b70700b001895f3cfb25mr14874558pls.123.1669553408707;
        Sun, 27 Nov 2022 04:50:08 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id q13-20020a63e20d000000b00473c36ea150sm5102287pgh.92.2022.11.27.04.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:50:08 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 08/17] powerpc: add a definition for the marker offset within the interrupt frame
Date: Sun, 27 Nov 2022 22:49:33 +1000
Message-Id: <20221127124942.1665522-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221127124942.1665522-1-npiggin@gmail.com>
References: <20221127124942.1665522-1-npiggin@gmail.com>
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
index 62033d022e0a..b9cec22df9f9 100644
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
index 29b78536ca59..ac3b0580224e 100644
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
index 49d585eae7c8..321992c1c9f9 100644
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
@@ -637,7 +637,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
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

