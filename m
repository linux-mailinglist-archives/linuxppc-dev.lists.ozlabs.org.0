Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F18406DA9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 16:36:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5dj239flz2ywv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 00:36:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VOM0bi8D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VOM0bi8D; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5dhH0fmcz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Sep 2021 00:35:26 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id k17so1300632pls.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Sep 2021 07:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3PI4Y/9xoFkGDjNoRbQWKsxEresJlCWFGfGdcwKuzY0=;
 b=VOM0bi8DvGaiyb1TvrQI3XwiyF+KuYFYudN2q0FZ/YjKKwvxzeCKfuhWNAFrun74yL
 a8fU/Fx++ekBFK6jLW4wm494mGxcrfUZvoS/mD9JrKfgMGbVJIk/PYae+7S4mzs6NF1q
 Aab5Emw/xR2Mu/kYj2QvVBYkzIAr3AwOjCzheGB4zG/d6DZSAjbya+QmrFOwaF8A6UPP
 2aMfJQKIn4vfRmDQe+y2/muSh+tnAWTAwTRY/FnEaYlAkPhCBCezG+bz0Q+DpW3ubbRL
 3tGtkFyhOL8+GEDSmhp+GnJCSMM0BAOW9NwM77qiCAUO9+XnDNeFu3o3DA7OJumJZGnT
 KnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3PI4Y/9xoFkGDjNoRbQWKsxEresJlCWFGfGdcwKuzY0=;
 b=GH82T44wrt1lFW0+FsJlG+4qZtcIWMzUEQ5zDoxPgTFOhaibZ8eG4mAy2x4+p2pmQb
 ypeTCHIotKmZRTChSzfSn/7MAOZiEQY+9gmbzXJN1pFuA1Zpn0x0solKEomDqYCsfRs1
 GwFUDzmnD0p+xNAcCpVtB5nZLpNVIXLeSkUDTxu5WSI2hsDdtk4Wf6yjO7i4vwxmpmAI
 Ke6UzHYi8lS8puJ9t9D0UM9AEdLHLwza4CWEy1g/x6eVSxnNy8x4NxOnedm6NKZmOlC9
 HHkBXdL1eQmLu4JHMj8wO8zmMeHwww+wIsMbTkHJkp2YI2wiVfCSYUfZPMfW4wZbcogU
 hADg==
X-Gm-Message-State: AOAM531t1jxhMC9GNJjJ2i+mVbSvBGpB2+DMWvtUKtIUW+SEIPqZ4anN
 DIYgLQVpeujjEIdQxeB5vbFqrYdUFi0=
X-Google-Smtp-Source: ABdhPJy5qIzPvSj2LUsfhqA+FC5i99oGgKSXCAlAfYCK9xwKE1eXuq1N+8w6gbumU7IK6UTPrt9ePw==
X-Received: by 2002:a17:90a:de04:: with SMTP id
 m4mr9930129pjv.187.1631284522267; 
 Fri, 10 Sep 2021 07:35:22 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-207-17.tpgi.com.au. [115.64.207.17])
 by smtp.gmail.com with ESMTPSA id l12sm5260203pff.182.2021.09.10.07.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 07:35:21 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1] powerpc: flexible GPR range save/restore macros
Date: Sat, 11 Sep 2021 00:35:11 +1000
Message-Id: <20210910143511.375177-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce macros that operate on a (start, end) range of GPRs, which
reduces lines of code and need to do mental arithmetic while reading the
code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since RFC:
- Removed FP / VMX regs changes from the patch

 arch/powerpc/boot/crt0.S                      | 31 +++++++------
 arch/powerpc/crypto/md5-asm.S                 | 10 ++---
 arch/powerpc/crypto/sha1-powerpc-asm.S        |  6 +--
 arch/powerpc/include/asm/ppc_asm.h            | 43 ++++++++++++-------
 arch/powerpc/kernel/entry_32.S                | 23 ++++------
 arch/powerpc/kernel/exceptions-64e.S          | 14 ++----
 arch/powerpc/kernel/exceptions-64s.S          |  6 +--
 arch/powerpc/kernel/head_32.h                 |  3 +-
 arch/powerpc/kernel/head_booke.h              |  3 +-
 arch/powerpc/kernel/interrupt_64.S            | 34 ++++++---------
 arch/powerpc/kernel/optprobes_head.S          |  4 +-
 arch/powerpc/kernel/tm.S                      | 15 ++-----
 .../powerpc/kernel/trace/ftrace_64_mprofile.S | 14 +++---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S       |  5 +--
 .../lib/test_emulate_step_exec_instr.S        |  8 ++--
 15 files changed, 93 insertions(+), 126 deletions(-)

diff --git a/arch/powerpc/boot/crt0.S b/arch/powerpc/boot/crt0.S
index 1d83966f5ef6..e8f10a599659 100644
--- a/arch/powerpc/boot/crt0.S
+++ b/arch/powerpc/boot/crt0.S
@@ -226,16 +226,19 @@ p_base:	mflr	r10		/* r10 now points to runtime addr of p_base */
 #ifdef __powerpc64__
 
 #define PROM_FRAME_SIZE 512
-#define SAVE_GPR(n, base)       std     n,8*(n)(base)
-#define REST_GPR(n, base)       ld      n,8*(n)(base)
-#define SAVE_2GPRS(n, base)     SAVE_GPR(n, base); SAVE_GPR(n+1, base)
-#define SAVE_4GPRS(n, base)     SAVE_2GPRS(n, base); SAVE_2GPRS(n+2, base)
-#define SAVE_8GPRS(n, base)     SAVE_4GPRS(n, base); SAVE_4GPRS(n+4, base)
-#define SAVE_10GPRS(n, base)    SAVE_8GPRS(n, base); SAVE_2GPRS(n+8, base)
-#define REST_2GPRS(n, base)     REST_GPR(n, base); REST_GPR(n+1, base)
-#define REST_4GPRS(n, base)     REST_2GPRS(n, base); REST_2GPRS(n+2, base)
-#define REST_8GPRS(n, base)     REST_4GPRS(n, base); REST_4GPRS(n+4, base)
-#define REST_10GPRS(n, base)    REST_8GPRS(n, base); REST_2GPRS(n+8, base)
+
+.macro OP_REGS op, width, start, end, base, offset
+	.Lreg=\start
+	.rept (\end - \start + 1)
+	\op	.Lreg,\offset+\width*.Lreg(\base)
+	.Lreg=.Lreg+1
+	.endr
+.endm
+
+#define SAVE_GPRS(start, end, base)	OP_REGS std, 8, start, end, base, 0
+#define REST_GPRS(start, end, base)	OP_REGS ld, 8, start, end, base, 0
+#define SAVE_GPR(n, base)		SAVE_GPRS(n, n, base)
+#define REST_GPR(n, base)		REST_GPRS(n, n, base)
 
 /* prom handles the jump into and return from firmware.  The prom args pointer
    is loaded in r3. */
@@ -246,9 +249,7 @@ prom:
 	stdu	r1,-PROM_FRAME_SIZE(r1) /* Save SP and create stack space */
 
 	SAVE_GPR(2, r1)
-	SAVE_GPR(13, r1)
-	SAVE_8GPRS(14, r1)
-	SAVE_10GPRS(22, r1)
+	SAVE_GPRS(13, 31, r1)
 	mfcr    r10
 	std     r10,8*32(r1)
 	mfmsr   r10
@@ -283,9 +284,7 @@ prom:
 
 	/* Restore other registers */
 	REST_GPR(2, r1)
-	REST_GPR(13, r1)
-	REST_8GPRS(14, r1)
-	REST_10GPRS(22, r1)
+	REST_GPRS(13, 31, r1)
 	ld      r10,8*32(r1)
 	mtcr	r10
 
diff --git a/arch/powerpc/crypto/md5-asm.S b/arch/powerpc/crypto/md5-asm.S
index 948d100a2934..fa6bc440cf4a 100644
--- a/arch/powerpc/crypto/md5-asm.S
+++ b/arch/powerpc/crypto/md5-asm.S
@@ -38,15 +38,11 @@
 
 #define INITIALIZE \
 	PPC_STLU r1,-INT_FRAME_SIZE(r1); \
-	SAVE_8GPRS(14, r1);		/* push registers onto stack	*/ \
-	SAVE_4GPRS(22, r1);						   \
-	SAVE_GPR(26, r1)
+	SAVE_GPRS(14, 26, r1)		/* push registers onto stack	*/
 
 #define FINALIZE \
-	REST_8GPRS(14, r1);		/* pop registers from stack	*/ \
-	REST_4GPRS(22, r1);						   \
-	REST_GPR(26, r1);						   \
-	addi	r1,r1,INT_FRAME_SIZE;
+	REST_GPRS(14, 26, r1);		/* pop registers from stack	*/ \
+	addi	r1,r1,INT_FRAME_SIZE
 
 #ifdef __BIG_ENDIAN__
 #define LOAD_DATA(reg, off) \
diff --git a/arch/powerpc/crypto/sha1-powerpc-asm.S b/arch/powerpc/crypto/sha1-powerpc-asm.S
index 23e248beff71..f0d5ed557ab1 100644
--- a/arch/powerpc/crypto/sha1-powerpc-asm.S
+++ b/arch/powerpc/crypto/sha1-powerpc-asm.S
@@ -125,8 +125,7 @@
 
 _GLOBAL(powerpc_sha_transform)
 	PPC_STLU r1,-INT_FRAME_SIZE(r1)
-	SAVE_8GPRS(14, r1)
-	SAVE_10GPRS(22, r1)
+	SAVE_GPRS(14, 31, r1)
 
 	/* Load up A - E */
 	lwz	RA(0),0(r3)	/* A */
@@ -184,7 +183,6 @@ _GLOBAL(powerpc_sha_transform)
 	stw	RD(0),12(r3)
 	stw	RE(0),16(r3)
 
-	REST_8GPRS(14, r1)
-	REST_10GPRS(22, r1)
+	REST_GPRS(14, 31, r1)
 	addi	r1,r1,INT_FRAME_SIZE
 	blr
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 1c538a9a11e0..8c84fde90440 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -16,30 +16,41 @@
 
 #define SZL			(BITS_PER_LONG/8)
 
+.macro OP_REGS op, width, start, end, base, offset
+	.Lreg=\start
+	.rept (\end - \start + 1)
+	\op	.Lreg, \offset + \width * .Lreg(\base)
+	.Lreg=.Lreg+1
+	.endr
+.endm
+
+.macro OP_REGS_IDX op, width, start, end, tmpreg, base
+	.Lreg=\start
+	.rept (\end - \start + 1)
+	li	\tmpreg, \width * .Lreg
+	\op	.Lreg, \tmpreg, \base
+	.Lreg=.Lreg+1
+	.endr
+.endm
+
 /*
  * Macros for storing registers into and loading registers from
  * exception frames.
  */
 #ifdef __powerpc64__
-#define SAVE_GPR(n, base)	std	n,GPR0+8*(n)(base)
-#define REST_GPR(n, base)	ld	n,GPR0+8*(n)(base)
-#define SAVE_NVGPRS(base)	SAVE_8GPRS(14, base); SAVE_10GPRS(22, base)
-#define REST_NVGPRS(base)	REST_8GPRS(14, base); REST_10GPRS(22, base)
+#define SAVE_GPRS(start, end, base)	OP_REGS std, 8, start, end, base, GPR0
+#define REST_GPRS(start, end, base)	OP_REGS ld, 8, start, end, base, GPR0
+#define SAVE_NVGPRS(base)		SAVE_GPRS(14, 31, base)
+#define REST_NVGPRS(base)		REST_GPRS(14, 31, base)
 #else
-#define SAVE_GPR(n, base)	stw	n,GPR0+4*(n)(base)
-#define REST_GPR(n, base)	lwz	n,GPR0+4*(n)(base)
-#define SAVE_NVGPRS(base)	stmw	13, GPR0+4*13(base)
-#define REST_NVGPRS(base)	lmw	13, GPR0+4*13(base)
+#define SAVE_GPRS(start, end, base)	OP_REGS stw, 4, start, end, base, GPR0
+#define REST_GPRS(start, end, base)	OP_REGS lwz, 4, start, end, base, GPR0
+#define SAVE_NVGPRS(base)		stmw	13, GPR0+4*13(base)
+#define REST_NVGPRS(base)		lmw	13, GPR0+4*13(base)
 #endif
 
-#define SAVE_2GPRS(n, base)	SAVE_GPR(n, base); SAVE_GPR(n+1, base)
-#define SAVE_4GPRS(n, base)	SAVE_2GPRS(n, base); SAVE_2GPRS(n+2, base)
-#define SAVE_8GPRS(n, base)	SAVE_4GPRS(n, base); SAVE_4GPRS(n+4, base)
-#define SAVE_10GPRS(n, base)	SAVE_8GPRS(n, base); SAVE_2GPRS(n+8, base)
-#define REST_2GPRS(n, base)	REST_GPR(n, base); REST_GPR(n+1, base)
-#define REST_4GPRS(n, base)	REST_2GPRS(n, base); REST_2GPRS(n+2, base)
-#define REST_8GPRS(n, base)	REST_4GPRS(n, base); REST_4GPRS(n+4, base)
-#define REST_10GPRS(n, base)	REST_8GPRS(n, base); REST_2GPRS(n+8, base)
+#define SAVE_GPR(n, base)		SAVE_GPRS(n, n, base)
+#define REST_GPR(n, base)		REST_GPRS(n, n, base)
 
 #define SAVE_FPR(n, base)	stfd	n,8*TS_FPRWIDTH*(n)(base)
 #define SAVE_2FPRS(n, base)	SAVE_FPR(n, base); SAVE_FPR(n+1, base)
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 61fdd53cdd9a..c62dd9815965 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -90,8 +90,7 @@ transfer_to_syscall:
 	stw	r12,8(r1)
 	stw	r2,_TRAP(r1)
 	SAVE_GPR(0, r1)
-	SAVE_4GPRS(3, r1)
-	SAVE_2GPRS(7, r1)
+	SAVE_GPRS(3, 8, r1)
 	addi	r2,r10,-THREAD
 	SAVE_NVGPRS(r1)
 
@@ -139,7 +138,7 @@ syscall_exit_finish:
 	mtxer	r5
 	lwz	r0,GPR0(r1)
 	lwz	r3,GPR3(r1)
-	REST_8GPRS(4,r1)
+	REST_GPRS(4, 11, r1)
 	lwz	r12,GPR12(r1)
 	b	1b
 
@@ -232,9 +231,9 @@ fast_exception_return:
 	beq	3f			/* if not, we've got problems */
 #endif
 
-2:	REST_4GPRS(3, r11)
+2:	REST_GPRS(3, 6, r11)
 	lwz	r10,_CCR(r11)
-	REST_2GPRS(1, r11)
+	REST_GPRS(1, 2, r11)
 	mtcr	r10
 	lwz	r10,_LINK(r11)
 	mtlr	r10
@@ -298,16 +297,14 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	 * the reliable stack unwinder later on. Clear it.
 	 */
 	stw	r0,8(r1)
-	REST_4GPRS(7, r1)
-	REST_2GPRS(11, r1)
+	REST_GPRS(7, 12, r1)
 
 	mtcr	r3
 	mtlr	r4
 	mtctr	r5
 	mtspr	SPRN_XER,r6
 
-	REST_4GPRS(2, r1)
-	REST_GPR(6, r1)
+	REST_GPRS(2, 6, r1)
 	REST_GPR(0, r1)
 	REST_GPR(1, r1)
 	rfi
@@ -341,8 +338,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	lwz	r6,_CCR(r1)
 	li	r0,0
 
-	REST_4GPRS(7, r1)
-	REST_2GPRS(11, r1)
+	REST_GPRS(7, 12, r1)
 
 	mtlr	r3
 	mtctr	r4
@@ -354,7 +350,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	 */
 	stw	r0,8(r1)
 
-	REST_4GPRS(2, r1)
+	REST_GPRS(2, 5, r1)
 
 	bne-	cr1,1f /* emulate stack store */
 	mtcr	r6
@@ -430,8 +426,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
 	bne	interrupt_return;					\
 	lwz	r0,GPR0(r1);						\
 	lwz	r2,GPR2(r1);						\
-	REST_4GPRS(3, r1);						\
-	REST_2GPRS(7, r1);						\
+	REST_GPRS(3, 8, r1);						\
 	lwz	r10,_XER(r1);						\
 	lwz	r11,_CTR(r1);						\
 	mtspr	SPRN_XER,r10;						\
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 711c66b76df1..67dc4e3179a0 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -198,8 +198,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
 
 	stdcx.	r0,0,r1		/* to clear the reservation */
 
-	REST_4GPRS(2, r1)
-	REST_4GPRS(6, r1)
+	REST_GPRS(2, 9, r1)
 
 	ld	r10,_CTR(r1)
 	ld	r11,_XER(r1)
@@ -375,9 +374,7 @@ ret_from_mc_except:
 exc_##n##_common:							    \
 	std	r0,GPR0(r1);		/* save r0 in stackframe */	    \
 	std	r2,GPR2(r1);		/* save r2 in stackframe */	    \
-	SAVE_4GPRS(3, r1);		/* save r3 - r6 in stackframe */    \
-	SAVE_2GPRS(7, r1);		/* save r7, r8 in stackframe */	    \
-	std	r9,GPR9(r1);		/* save r9 in stackframe */	    \
+	SAVE_GPRS(3, 9, r1);		/* save r3 - r9 in stackframe */    \
 	std	r10,_NIP(r1);		/* save SRR0 to stackframe */	    \
 	std	r11,_MSR(r1);		/* save SRR1 to stackframe */	    \
 	beq	2f;			/* if from kernel mode */	    \
@@ -1061,9 +1058,7 @@ bad_stack_book3e:
 	std	r11,_ESR(r1)
 	std	r0,GPR0(r1);		/* save r0 in stackframe */	    \
 	std	r2,GPR2(r1);		/* save r2 in stackframe */	    \
-	SAVE_4GPRS(3, r1);		/* save r3 - r6 in stackframe */    \
-	SAVE_2GPRS(7, r1);		/* save r7, r8 in stackframe */	    \
-	std	r9,GPR9(r1);		/* save r9 in stackframe */	    \
+	SAVE_GPRS(3, 9, r1);		/* save r3 - r9 in stackframe */    \
 	ld	r3,PACA_EXGEN+EX_R10(r13);/* get back r10 */		    \
 	ld	r4,PACA_EXGEN+EX_R11(r13);/* get back r11 */		    \
 	mfspr	r5,SPRN_SPRG_GEN_SCRATCH;/* get back r13 XXX can be wrong */ \
@@ -1077,8 +1072,7 @@ bad_stack_book3e:
 	std	r10,_LINK(r1)
 	std	r11,_CTR(r1)
 	std	r12,_XER(r1)
-	SAVE_10GPRS(14,r1)
-	SAVE_8GPRS(24,r1)
+	SAVE_GPRS(14, 31, r1)
 	lhz	r12,PACA_TRAP_SAVE(r13)
 	std	r12,_TRAP(r1)
 	addi	r11,r1,INT_FRAME_SIZE
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 37859e62a8dc..28ad5c1d883a 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -574,8 +574,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	ld	r10,IAREA+EX_CTR(r13)
 	std	r10,_CTR(r1)
 	std	r2,GPR2(r1)		/* save r2 in stackframe	*/
-	SAVE_4GPRS(3, r1)		/* save r3 - r6 in stackframe   */
-	SAVE_2GPRS(7, r1)		/* save r7, r8 in stackframe	*/
+	SAVE_GPRS(3, 8, r1)		/* save r3 - r8 in stackframe   */
 	mflr	r9			/* Get LR, later save to stack	*/
 	ld	r2,PACATOC(r13)		/* get kernel TOC into r2	*/
 	std	r9,_LINK(r1)
@@ -693,8 +692,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	mtlr	r9
 	ld	r9,_CCR(r1)
 	mtcr	r9
-	REST_8GPRS(2, r1)
-	REST_4GPRS(10, r1)
+	REST_GPRS(2, 13, r1)
 	REST_GPR(0, r1)
 	/* restore original r1. */
 	ld	r1,GPR1(r1)
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 6b1ec9e3541b..25887303651a 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -115,8 +115,7 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 	stw	r10,8(r1)
 	li	r10, \trapno
 	stw	r10,_TRAP(r1)
-	SAVE_4GPRS(3, r1)
-	SAVE_2GPRS(7, r1)
+	SAVE_GPRS(3, 8, r1)
 	SAVE_NVGPRS(r1)
 	stw	r2,GPR2(r1)
 	stw	r12,_NIP(r1)
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index e5503420b6c6..0ae26396639d 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -87,8 +87,7 @@ END_BTB_FLUSH_SECTION
 	stw	r10, 8(r1)
 	li	r10, \trapno
 	stw	r10,_TRAP(r1)
-	SAVE_4GPRS(3, r1)
-	SAVE_2GPRS(7, r1)
+	SAVE_GPRS(3, 8, r1)
 	SAVE_NVGPRS(r1)
 	stw	r2,GPR2(r1)
 	stw	r12,_NIP(r1)
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index d4212d2ff0b5..f090224c2a6e 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -169,10 +169,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	 * The value of AMR only matters while we're in the kernel.
 	 */
 	mtcr	r2
-	ld	r2,GPR2(r1)
-	ld	r3,GPR3(r1)
-	ld	r13,GPR13(r1)
-	ld	r1,GPR1(r1)
+	REST_GPRS(2, 3, r1)
+	REST_GPR(13, r1)
+	REST_GPR(1, r1)
 	RFSCV_TO_USER
 	b	.	/* prevent speculative execution */
 
@@ -190,9 +189,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	mtctr	r3
 	mtlr	r4
 	mtspr	SPRN_XER,r5
-	REST_10GPRS(2, r1)
-	REST_2GPRS(12, r1)
-	ld	r1,GPR1(r1)
+	REST_GPRS(2, 13, r1)
+	REST_GPR(1, r1)
 	RFI_TO_USER
 .Lsyscall_vectored_\name\()_rst_end:
 
@@ -387,10 +385,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	 * The value of AMR only matters while we're in the kernel.
 	 */
 	mtcr	r2
-	ld	r2,GPR2(r1)
-	ld	r3,GPR3(r1)
-	ld	r13,GPR13(r1)
-	ld	r1,GPR1(r1)
+	REST_GPRS(2, 3, r1)
+	REST_GPR(13, r1)
+	REST_GPR(1, r1)
 	RFI_TO_USER
 	b	.	/* prevent speculative execution */
 
@@ -401,8 +398,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	mtctr	r3
 	mtspr	SPRN_XER,r4
 	ld	r0,GPR0(r1)
-	REST_8GPRS(4, r1)
-	ld	r12,GPR12(r1)
+	REST_GPRS(4, 12, r1)
 	b	.Lsyscall_restore_regs_cont
 .Lsyscall_rst_end:
 
@@ -559,17 +555,14 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	ld	r6,_XER(r1)
 	li	r0,0
 
-	REST_4GPRS(7, r1)
-	REST_2GPRS(11, r1)
-	REST_GPR(13, r1)
+	REST_GPRS(7, 13, r1)
 
 	mtcr	r3
 	mtlr	r4
 	mtctr	r5
 	mtspr	SPRN_XER,r6
 
-	REST_4GPRS(2, r1)
-	REST_GPR(6, r1)
+	REST_GPRS(2, 6, r1)
 	REST_GPR(0, r1)
 	REST_GPR(1, r1)
 	.ifc \srr,srr
@@ -666,8 +659,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	ld	r6,_CCR(r1)
 	li	r0,0
 
-	REST_4GPRS(7, r1)
-	REST_2GPRS(11, r1)
+	REST_GPRS(7, 12, r1)
 
 	mtlr	r3
 	mtctr	r4
@@ -679,7 +671,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	 */
 	std	r0,STACK_FRAME_OVERHEAD-16(r1)
 
-	REST_4GPRS(2, r1)
+	REST_GPRS(2, 5, r1)
 
 	bne-	cr1,1f /* emulate stack store */
 	mtcr	r6
diff --git a/arch/powerpc/kernel/optprobes_head.S b/arch/powerpc/kernel/optprobes_head.S
index 19ea3312403c..5c7f0b4b784b 100644
--- a/arch/powerpc/kernel/optprobes_head.S
+++ b/arch/powerpc/kernel/optprobes_head.S
@@ -10,8 +10,8 @@
 #include <asm/asm-offsets.h>
 
 #ifdef CONFIG_PPC64
-#define SAVE_30GPRS(base) SAVE_10GPRS(2,base); SAVE_10GPRS(12,base); SAVE_10GPRS(22,base)
-#define REST_30GPRS(base) REST_10GPRS(2,base); REST_10GPRS(12,base); REST_10GPRS(22,base)
+#define SAVE_30GPRS(base) SAVE_GPRS(2, 31, base)
+#define REST_30GPRS(base) REST_GPRS(2, 31, base)
 #define TEMPLATE_FOR_IMM_LOAD_INSNS	nop; nop; nop; nop; nop
 #else
 #define SAVE_30GPRS(base) stmw	r2, GPR2(base)
diff --git a/arch/powerpc/kernel/tm.S b/arch/powerpc/kernel/tm.S
index 2b91f233b05d..3beecc32940b 100644
--- a/arch/powerpc/kernel/tm.S
+++ b/arch/powerpc/kernel/tm.S
@@ -226,11 +226,8 @@ _GLOBAL(tm_reclaim)
 
 	/* Sync the userland GPRs 2-12, 14-31 to thread->regs: */
 	SAVE_GPR(0, r7)				/* user r0 */
-	SAVE_GPR(2, r7)				/* user r2 */
-	SAVE_4GPRS(3, r7)			/* user r3-r6 */
-	SAVE_GPR(8, r7)				/* user r8 */
-	SAVE_GPR(9, r7)				/* user r9 */
-	SAVE_GPR(10, r7)			/* user r10 */
+	SAVE_GPRS(2, 6, r7)			/* user r2-r6 */
+	SAVE_GPRS(8, 10, r7)			/* user r8-r10 */
 	ld	r3, GPR1(r1)			/* user r1 */
 	ld	r4, GPR7(r1)			/* user r7 */
 	ld	r5, GPR11(r1)			/* user r11 */
@@ -445,12 +442,8 @@ restore_gprs:
 	ld	r6, THREAD_TM_PPR(r3)
 
 	REST_GPR(0, r7)				/* GPR0 */
-	REST_2GPRS(2, r7)			/* GPR2-3 */
-	REST_GPR(4, r7)				/* GPR4 */
-	REST_4GPRS(8, r7)			/* GPR8-11 */
-	REST_2GPRS(12, r7)			/* GPR12-13 */
-
-	REST_NVGPRS(r7)				/* GPR14-31 */
+	REST_GPRS(2, 4, r7)			/* GPR2-4 */
+	REST_GPRS(8, 31, r7)			/* GPR8-31 */
 
 	/* Load up PPR and DSCR here so we don't run with user values for long */
 	mtspr	SPRN_DSCR, r5
diff --git a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S b/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
index f9fd5f743eba..dd5e720fe44b 100644
--- a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
+++ b/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
@@ -41,15 +41,14 @@ _GLOBAL(ftrace_regs_caller)
 
 	/* Save all gprs to pt_regs */
 	SAVE_GPR(0, r1)
-	SAVE_10GPRS(2, r1)
+	SAVE_GPRS(2, 11, r1)
 
 	/* Ok to continue? */
 	lbz	r3, PACA_FTRACE_ENABLED(r13)
 	cmpdi	r3, 0
 	beq	ftrace_no_trace
 
-	SAVE_10GPRS(12, r1)
-	SAVE_10GPRS(22, r1)
+	SAVE_GPRS(12, 31, r1)
 
 	/* Save previous stack pointer (r1) */
 	addi	r8, r1, SWITCH_FRAME_SIZE
@@ -108,10 +107,7 @@ ftrace_regs_call:
 #endif
 
 	/* Restore gprs */
-	REST_GPR(0,r1)
-	REST_10GPRS(2,r1)
-	REST_10GPRS(12,r1)
-	REST_10GPRS(22,r1)
+	REST_GPRS(2, 31, r1)
 
 	/* Restore possibly modified LR */
 	ld	r0, _LINK(r1)
@@ -157,7 +153,7 @@ _GLOBAL(ftrace_caller)
 	stdu	r1, -SWITCH_FRAME_SIZE(r1)
 
 	/* Save all gprs to pt_regs */
-	SAVE_8GPRS(3, r1)
+	SAVE_GPRS(3, 10, r1)
 
 	lbz	r3, PACA_FTRACE_ENABLED(r13)
 	cmpdi	r3, 0
@@ -194,7 +190,7 @@ ftrace_call:
 	mtctr	r3
 
 	/* Restore gprs */
-	REST_8GPRS(3,r1)
+	REST_GPRS(3, 10, r1)
 
 	/* Restore callee's TOC */
 	ld	r2, 24(r1)
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 75079397c2a5..62b692159d6f 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -2673,8 +2673,7 @@ kvmppc_bad_host_intr:
 	std	r0, GPR0(r1)
 	std	r9, GPR1(r1)
 	std	r2, GPR2(r1)
-	SAVE_4GPRS(3, r1)
-	SAVE_2GPRS(7, r1)
+	SAVE_GPRS(3, 8, r1)
 	srdi	r0, r12, 32
 	clrldi	r12, r12, 32
 	std	r0, _CCR(r1)
@@ -2697,7 +2696,7 @@ kvmppc_bad_host_intr:
 	ld	r9, HSTATE_SCRATCH2(r13)
 	ld	r12, HSTATE_SCRATCH0(r13)
 	GET_SCRATCH0(r0)
-	SAVE_4GPRS(9, r1)
+	SAVE_GPRS(9, 12, r1)
 	std	r0, GPR13(r1)
 	SAVE_NVGPRS(r1)
 	ld	r5, HSTATE_CFAR(r13)
diff --git a/arch/powerpc/lib/test_emulate_step_exec_instr.S b/arch/powerpc/lib/test_emulate_step_exec_instr.S
index 9ef941d958d8..5473f9d03df3 100644
--- a/arch/powerpc/lib/test_emulate_step_exec_instr.S
+++ b/arch/powerpc/lib/test_emulate_step_exec_instr.S
@@ -37,7 +37,7 @@ _GLOBAL(exec_instr)
 	 * The stack pointer (GPR1) and the thread pointer (GPR13) are not
 	 * saved as these should not be modified anyway.
 	 */
-	SAVE_2GPRS(2, r1)
+	SAVE_GPRS(2, 3, r1)
 	SAVE_NVGPRS(r1)
 
 	/*
@@ -75,8 +75,7 @@ _GLOBAL(exec_instr)
 
 	/* Load GPRs from pt_regs */
 	REST_GPR(0, r31)
-	REST_10GPRS(2, r31)
-	REST_GPR(12, r31)
+	REST_GPRS(2, 12, r31)
 	REST_NVGPRS(r31)
 
 	/* Placeholder for the test instruction */
@@ -99,8 +98,7 @@ _GLOBAL(exec_instr)
 	subi	r3, r3, GPR0
 	SAVE_GPR(0, r3)
 	SAVE_GPR(2, r3)
-	SAVE_8GPRS(4, r3)
-	SAVE_GPR(12, r3)
+	SAVE_GPRS(4, 12, r3)
 	SAVE_NVGPRS(r3)
 
 	/* Save resulting LR to pt_regs */
-- 
2.23.0

