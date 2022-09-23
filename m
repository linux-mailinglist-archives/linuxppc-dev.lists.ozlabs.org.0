Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5262B5E726A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 05:26:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYcxz0PWXz3cdp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 13:26:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gfRO+OPa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gfRO+OPa;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYcwl6ZK6z30R7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 13:25:27 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so4119005pjh.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 20:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7HohsPoOU+JBoKiiNQQ0dbLDKqmT3ZPslWyovDAUDnY=;
        b=gfRO+OPaFfp/KW5lTlW39U4OtYJ9WgHnJtnsxFcS6bsxf9v4NB9230jV+8VDSAxc+2
         V8GfpChNo4qNqtB16CJw0sBxlKglzJqsje7pLaBG5U5V0+yCKSC1jx4Aa7Qpv2LO6Duo
         cwMQb/OepNzC2LFgsMxLy+o36MchkQbSr4ACTdP3yshobnzMK3o7us17OPlJTRG5YF5m
         j8Cz5wzBTn/4yjZp35Jm0uC7wW+NiKNmVDMmLtKuVu4LhToo5tP0WVUgVYGQfKc5MUm/
         XmYZybDccBfLSTGTQthDFJR+HWXnwIcbopHjNh/RjkDyA93JXlZt2T8le5uB43WyG3RT
         QdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7HohsPoOU+JBoKiiNQQ0dbLDKqmT3ZPslWyovDAUDnY=;
        b=MIMgZrBFR7bakbguNTFsulVffwoTSn/ggx7to6lb+HR5UsYR/7pxgLuo6JrpRAkPdo
         irSPhFQH9KnrqXIUgX+GrO9rmeZV8xd12jPqDJQ00WFBC4HWKSYjbnz902FNOQWXrHun
         8F2ND5VcUoWIZHbVGEgugHXsYJ6zsODrejj2Dg4phHyTuGwhGoXmz67mNphf+yGQ2WS9
         f3sn/NjuKafQh5SirnxWSJJYDQnoFI1JecoasOWz7yo+D2o3g3GoJgHjWSqJL2KlCh6Q
         RkI+GQsvAKGZpixoFX0sGXFKkqZmVgKb5h7OvyBCaLyiW23S0SrAVegz/Tjt2nWIUnhS
         QU8w==
X-Gm-Message-State: ACrzQf2PfRRn19rNPHshGDh9aWhCHv2mKF+7mzDPzesMNoNA/Hi5qDO9
	A/iPGTbQXxYLrVjhn7DwldoYKJhf1KM+FQ==
X-Google-Smtp-Source: AMsMyM6oZMqg/l17L7BZONxjxm9R9LDpqVETpdW8KTPTo8bB3FFz/jPahlwOQQh9ahW0nT9Rmst5Cg==
X-Received: by 2002:a17:902:ce11:b0:172:6f2c:a910 with SMTP id k17-20020a170902ce1100b001726f2ca910mr6701816plg.156.1663903524160;
        Thu, 22 Sep 2022 20:25:24 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902f78300b001752216ca51sm4895224pln.39.2022.09.22.20.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 20:25:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/5] powerpc/64: use 32-bit immediate for STACK_FRAME_REGS_MARKER
Date: Fri, 23 Sep 2022 13:25:08 +1000
Message-Id: <20220923032512.535725-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220923032512.535725-1-npiggin@gmail.com>
References: <20220923032512.535725-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Using a 32-bit constant for this marker allows it to be loaded with
two ALU instructions, like 32-bit. This avoids a TOC entry and a
TOC load that depends on the r2 value that has just been loaded from
the PACA.

This changes the value for 32-bit as well, so both have the same
value in the low 4 bytes and 64-bit has 0xffffffff in the top bytes.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h    | 5 +++--
 arch/powerpc/kernel/entry_32.S       | 6 +++---
 arch/powerpc/kernel/exceptions-64e.S | 8 +-------
 arch/powerpc/kernel/exceptions-64s.S | 2 +-
 arch/powerpc/kernel/head_64.S        | 7 -------
 arch/powerpc/kernel/interrupt_64.S   | 6 +++---
 6 files changed, 11 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index a03403695cd4..49d720bb888b 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -99,6 +99,9 @@ struct pt_regs
 
 #define STACK_FRAME_WITH_PT_REGS (STACK_FRAME_OVERHEAD + sizeof(struct pt_regs))
 
+/* 0xffffffff8d9a988d on 64-bit */
+#define STACK_FRAME_REGS_MARKER	ASM_CONST(-0x72656773) /* 0x8d9a988d */
+
 #ifdef __powerpc64__
 
 /*
@@ -115,7 +118,6 @@ struct pt_regs
 
 #define STACK_FRAME_OVERHEAD	112	/* size of minimum stack frame */
 #define STACK_FRAME_LR_SAVE	2	/* Location of LR in stack frame */
-#define STACK_FRAME_REGS_MARKER	ASM_CONST(0x7265677368657265)
 #define STACK_INT_FRAME_SIZE	(sizeof(struct pt_regs) + \
 				 STACK_FRAME_OVERHEAD + KERNEL_REDZONE_SIZE)
 #define STACK_FRAME_MARKER	12
@@ -136,7 +138,6 @@ struct pt_regs
 #define KERNEL_REDZONE_SIZE	0
 #define STACK_FRAME_OVERHEAD	16	/* size of minimum stack frame */
 #define STACK_FRAME_LR_SAVE	1	/* Location of LR in stack frame */
-#define STACK_FRAME_REGS_MARKER	ASM_CONST(0x72656773)
 #define STACK_INT_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD)
 #define STACK_FRAME_MARKER	2
 #define STACK_FRAME_MIN_SIZE	STACK_FRAME_OVERHEAD
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 1d599df6f169..c2516f982cfa 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -265,7 +265,7 @@ fast_exception_return:
 	mtcr	r10
 	lwz	r10,_LINK(r11)
 	mtlr	r10
-	/* Clear the exception_marker on the stack to avoid confusing stacktrace */
+	/* Clear the exception marker on the stack to avoid confusing stacktrace */
 	li	r10, 0
 	stw	r10, 8(r11)
 	REST_GPR(10, r11)
@@ -322,7 +322,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	li	r0,0
 
 	/*
-	 * Leaving a stale exception_marker on the stack can confuse
+	 * Leaving a stale exception marker on the stack can confuse
 	 * the reliable stack unwinder later on. Clear it.
 	 */
 	stw	r0,8(r1)
@@ -374,7 +374,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	mtspr	SPRN_XER,r5
 
 	/*
-	 * Leaving a stale exception_marker on the stack can confuse
+	 * Leaving a stale exception marker on the stack can confuse
 	 * the reliable stack unwinder later on. Clear it.
 	 */
 	stw	r0,8(r1)
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 67dc4e3179a0..08a3139079b7 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -389,7 +389,7 @@ exc_##n##_common:							    \
 	ld	r9,excf+EX_R1(r13);	/* load orig r1 back from PACA */   \
 	lwz	r10,excf+EX_CR(r13);	/* load orig CR back from PACA	*/  \
 	lbz	r11,PACAIRQSOFTMASK(r13); /* get current IRQ softe */	    \
-	ld	r12,exception_marker@toc(r2);				    \
+	LOAD_REG_IMMEDIATE(r12, STACK_FRAME_REGS_MARKER);		    \
 	li	r0,0;							    \
 	std	r3,GPR10(r1);		/* save r10 to stackframe */	    \
 	std	r4,GPR11(r1);		/* save r11 to stackframe */	    \
@@ -470,12 +470,6 @@ exc_##n##_bad_stack:							    \
 	bl	hdlr;							\
 	b	interrupt_return
 
-/* This value is used to mark exception frames on the stack. */
-	.section	".toc","aw"
-exception_marker:
-	.tc	ID_EXC_MARKER[TC],STACK_FRAME_REGS_MARKER
-
-
 /*
  * And here we have the exception vectors !
  */
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 3d0dc133a9ae..9d375ea58add 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -589,7 +589,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	li	r9,IVEC
 	std	r9,_TRAP(r1)		/* set trap number		*/
 	li	r10,0
-	ld	r11,exception_marker@toc(r2)
+	LOAD_REG_IMMEDIATE(r11, STACK_FRAME_REGS_MARKER)
 	std	r10,RESULT(r1)		/* clear regs->result		*/
 	std	r11,STACK_FRAME_OVERHEAD-16(r1) /* mark the frame	*/
 .endm
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index cf2c08902c05..cac3e1b58360 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -192,13 +192,6 @@ __secondary_hold:
 #endif
 CLOSE_FIXED_SECTION(first_256B)
 
-/* This value is used to mark exception frames on the stack. */
-	.section ".toc","aw"
-/* This value is used to mark exception frames on the stack. */
-exception_marker:
-	.tc	ID_EXC_MARKER[TC],STACK_FRAME_REGS_MARKER
-	.previous
-
 /*
  * On server, we include the exception vectors code here as it
  * relies on absolute addressing which is only possible within
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index ce25b28cf418..ee2d2d410c5a 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -92,7 +92,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
 	std	r11,_TRAP(r1)
 	std	r12,_CCR(r1)
 	addi	r10,r1,STACK_FRAME_OVERHEAD
-	ld	r11,exception_marker@toc(r2)
+	LOAD_REG_IMMEDIATE(r11, STACK_FRAME_REGS_MARKER)
 	std	r11,-16(r10)		/* "regshere" marker */
 
 BEGIN_FTR_SECTION
@@ -276,7 +276,7 @@ END_BTB_FLUSH_SECTION
 	std	r11,_TRAP(r1)
 	std	r12,_CCR(r1)
 	addi	r10,r1,STACK_FRAME_OVERHEAD
-	ld	r11,exception_marker@toc(r2)
+	LOAD_REG_IMMEDIATE(r11, STACK_FRAME_REGS_MARKER)
 	std	r11,-16(r10)		/* "regshere" marker */
 
 #ifdef CONFIG_PPC_BOOK3S
@@ -619,7 +619,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	mtspr	SPRN_XER,r5
 
 	/*
-	 * Leaving a stale exception_marker on the stack can confuse
+	 * Leaving a stale STACK_FRAME_REGS_MARKER on the stack can confuse
 	 * the reliable stack unwinder later on. Clear it.
 	 */
 	std	r0,STACK_FRAME_OVERHEAD-16(r1)
-- 
2.37.2

