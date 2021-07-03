Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BEC3BA807
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jul 2021 11:15:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GH5rx26nSz3bZ1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jul 2021 19:15:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=kEiSQ9TB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kEiSQ9TB; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GH5rT16Jrz2ykQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Jul 2021 19:15:04 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id ie21so6306941pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Jul 2021 02:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q552D0JruYZ/dre9jP5S3+gtoeHUVCf+2R2/tEK645o=;
 b=kEiSQ9TBtqyyZTUduFUru1XYlEOlkwz1qmtEQlaY3onNGbCpfzuWAZDXBb/Zd23G0K
 AU/OLvXtgtqGA7CLuNNDIHOfQXBixnjKanot1ldfwsFnKfnV6Ua9tcVM8n7IpMLXmQYI
 DPwe4MuCyQbxpDV0HeQKdjyuXacstM9HoZPLw5BxK5aeAcMEEjbCHqZrvupmomdvJbRH
 HS97gqpQ6CE9ErGfyE0DQ5sFxJF8Sj3YBFkKWUq5QR9rIaSNZ5un6FDFZBSCHLaf4AZr
 izdH50i8qHxi17V5gmWn4PowLHIpRmJApeq29aYrokIOK6Dj5hoyUWtI1TEDGG1hfC0/
 CjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q552D0JruYZ/dre9jP5S3+gtoeHUVCf+2R2/tEK645o=;
 b=ZyOPZCuyO/uzJ2t1PLRU21XJcFjU0XrcN6PHv2pDGdM3jCmy82niwkN/fxiKgBou0L
 pV9Y3AWRL3H+bNutuoEN6cJUzwQA6ST/g253gJ6bbRYAqid2wa3rqntezhlIkZrUgKqn
 7tecqnGrT2UdKfR4Lr7bKWb4VjS+wztdtf57Beh3BXkJywnjCbaynCAqRNbNkAZ0lLC0
 0bydrnhodAe2Y22XN5ZhXzNHNmclHfHywsVGjSqWp7eTB9psWTdh/8gNLDC3XVFZvxOx
 Y2Gf0NTgi5VyVv18Km8yTJCI6Zq0BNopXQ4H+ZdEa/1+eiTZbM6zRqMzgD14OSV4c5Wt
 Fhkg==
X-Gm-Message-State: AOAM530Rm+G3Prq9UHYK5wlrJtDoep1/sVDhNaMnAM2CcggLzbDgPucj
 1DRe074AKy2jwR/aQaSzaBiXGpkx/C8=
X-Google-Smtp-Source: ABdhPJzDBX6eJ0pluNhLMjV3mOd3ebelpF9OpFubpkkktVln5rpEJJHMPmIhDJFWHCyC5nLb6EESEw==
X-Received: by 2002:a17:90a:558d:: with SMTP id
 c13mr3719551pji.203.1625303699050; 
 Sat, 03 Jul 2021 02:14:59 -0700 (PDT)
Received: from bobo.ibm.com ([118.209.250.144])
 by smtp.gmail.com with ESMTPSA id y4sm6769223pfc.15.2021.07.03.02.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 02:14:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] powerpc: flexible register range save/restore macros
Date: Sat,  3 Jul 2021 19:14:52 +1000
Message-Id: <20210703091452.352816-1-npiggin@gmail.com>
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

Introduce macros that operate on a (start, end) range of registers,
which reduces lines of code and need to do mental arithmetic while
reading the code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/boot/crt0.S                      | 31 ++++---
 arch/powerpc/crypto/md5-asm.S                 | 10 +--
 arch/powerpc/crypto/sha1-powerpc-asm.S        |  6 +-
 arch/powerpc/include/asm/ppc_asm.h            | 81 +++++++++----------
 arch/powerpc/kernel/cpu_setup_6xx.S           |  2 +-
 arch/powerpc/kernel/entry_32.S                | 23 +++---
 arch/powerpc/kernel/exceptions-64e.S          | 14 +---
 arch/powerpc/kernel/exceptions-64s.S          |  6 +-
 arch/powerpc/kernel/fpu.S                     | 28 +++----
 arch/powerpc/kernel/head_32.h                 |  3 +-
 arch/powerpc/kernel/head_booke.h              |  3 +-
 arch/powerpc/kernel/interrupt_64.S            | 34 +++-----
 arch/powerpc/kernel/optprobes_head.S          |  4 +-
 arch/powerpc/kernel/tm.S                      | 47 +++++------
 .../powerpc/kernel/trace/ftrace_64_mprofile.S | 14 ++--
 arch/powerpc/kernel/vector.S                  |  8 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S       |  5 +-
 .../lib/test_emulate_step_exec_instr.S        |  8 +-
 18 files changed, 140 insertions(+), 187 deletions(-)

diff --git a/arch/powerpc/boot/crt0.S b/arch/powerpc/boot/crt0.S
index 1d83966f5ef6..349279ba8ce7 100644
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
+#define SAVE_GPR(n, base)		SAVE_GPRS(n, n, base)
+#define REST_GPRS(start, end, base)	OP_REGS ld, 8, start, end, base, 0
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
index 948d100a2934..8f335a3f8430 100644
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
+	REST_GPRS(14, 26, r1);		/* pop registers from stack	*/
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
index 116c1519728a..97fa10e13bd7 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -15,56 +15,53 @@
 
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
+#define SAVE_GPR(n, base)		SAVE_GPRS(n, n, base)
+#define REST_GPRS(start, end, base)	OP_REGS ld, 8, start, end, base, GPR0
+#define REST_GPR(n, base)		REST_GPRS(n, n, base)
+#define SAVE_NVGPRS(base)		SAVE_GPRS(14, 31, base)
+#define REST_NVGPRS(base)		REST_GPRS(14, 31, base)
 #else
-#define SAVE_GPR(n, base)	stw	n,GPR0+4*(n)(base)
-#define REST_GPR(n, base)	lwz	n,GPR0+4*(n)(base)
-#define SAVE_NVGPRS(base)	stmw	13, GPR0+4*13(base)
-#define REST_NVGPRS(base)	lmw	13, GPR0+4*13(base)
+#define SAVE_GPRS(start, end, base)	OP_REGS stw, 4, start, end, base, GPR0
+#define SAVE_GPR(n, base)		SAVE_GPRS(n, n, base)
+#define REST_GPRS(start, end, base)	OP_REGS lwz, 4, start, end, base, GPR0
+#define REST_GPR(n, base)		REST_GPRS(n, n, base)
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
-
-#define SAVE_FPR(n, base)	stfd	n,8*TS_FPRWIDTH*(n)(base)
-#define SAVE_2FPRS(n, base)	SAVE_FPR(n, base); SAVE_FPR(n+1, base)
-#define SAVE_4FPRS(n, base)	SAVE_2FPRS(n, base); SAVE_2FPRS(n+2, base)
-#define SAVE_8FPRS(n, base)	SAVE_4FPRS(n, base); SAVE_4FPRS(n+4, base)
-#define SAVE_16FPRS(n, base)	SAVE_8FPRS(n, base); SAVE_8FPRS(n+8, base)
-#define SAVE_32FPRS(n, base)	SAVE_16FPRS(n, base); SAVE_16FPRS(n+16, base)
-#define REST_FPR(n, base)	lfd	n,8*TS_FPRWIDTH*(n)(base)
-#define REST_2FPRS(n, base)	REST_FPR(n, base); REST_FPR(n+1, base)
-#define REST_4FPRS(n, base)	REST_2FPRS(n, base); REST_2FPRS(n+2, base)
-#define REST_8FPRS(n, base)	REST_4FPRS(n, base); REST_4FPRS(n+4, base)
-#define REST_16FPRS(n, base)	REST_8FPRS(n, base); REST_8FPRS(n+8, base)
-#define REST_32FPRS(n, base)	REST_16FPRS(n, base); REST_16FPRS(n+16, base)
-
-#define SAVE_VR(n,b,base)	li b,16*(n);  stvx n,base,b
-#define SAVE_2VRS(n,b,base)	SAVE_VR(n,b,base); SAVE_VR(n+1,b,base)
-#define SAVE_4VRS(n,b,base)	SAVE_2VRS(n,b,base); SAVE_2VRS(n+2,b,base)
-#define SAVE_8VRS(n,b,base)	SAVE_4VRS(n,b,base); SAVE_4VRS(n+4,b,base)
-#define SAVE_16VRS(n,b,base)	SAVE_8VRS(n,b,base); SAVE_8VRS(n+8,b,base)
-#define SAVE_32VRS(n,b,base)	SAVE_16VRS(n,b,base); SAVE_16VRS(n+16,b,base)
-#define REST_VR(n,b,base)	li b,16*(n); lvx n,base,b
-#define REST_2VRS(n,b,base)	REST_VR(n,b,base); REST_VR(n+1,b,base)
-#define REST_4VRS(n,b,base)	REST_2VRS(n,b,base); REST_2VRS(n+2,b,base)
-#define REST_8VRS(n,b,base)	REST_4VRS(n,b,base); REST_4VRS(n+4,b,base)
-#define REST_16VRS(n,b,base)	REST_8VRS(n,b,base); REST_8VRS(n+8,b,base)
-#define REST_32VRS(n,b,base)	REST_16VRS(n,b,base); REST_16VRS(n+16,b,base)
+#define SAVE_FPRS(start, end, base)	OP_REGS stfd, 8*TS_FPRWIDTH, start, end, base, 0
+#define SAVE_FPR(n, base)		SAVE_FPRS(n, n, base)
+
+#define REST_FPRS(start, end, base)	OP_REGS lfd, 8*TS_FPRWIDTH, start, end, base, 0
+#define REST_FPR(n, base)		REST_FPRS(n, n, base)
+
+#define SAVE_VRS(start, end, reg, base)	OP_REGS_IDX stvx, 16, start, end, reg, base
+#define SAVE_VR(n, reg, base)		SAVE_VRS(n, n, reg, base)
+#define REST_VRS(start, end, reg, base)	OP_REGS_IDX lvx, 16, start, end, reg, base
+#define REST_VR(n, reg, base)		REST_VRS(n, n, reg, base)
 
 #ifdef __BIG_ENDIAN__
 #define STXVD2X_ROT(n,b,base)		STXVD2X(n,b,base)
diff --git a/arch/powerpc/kernel/cpu_setup_6xx.S b/arch/powerpc/kernel/cpu_setup_6xx.S
index f8b5ff64b604..a77e7fb06278 100644
--- a/arch/powerpc/kernel/cpu_setup_6xx.S
+++ b/arch/powerpc/kernel/cpu_setup_6xx.S
@@ -283,7 +283,7 @@ _GLOBAL(__init_fpu_registers)
 	isync
 	addis	r9,r3,empty_zero_page@ha
 	addi	r9,r9,empty_zero_page@l
-	REST_32FPRS(0,r9)
+	REST_FPRS(0, 31, r9)
 	sync
 	mtmsr	r10
 	isync
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 0273a1349006..299b50279882 100644
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
index 1401787b0b93..947d4a83704b 100644
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
 	std	r11,_DSISR(r1)
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
index 4aec59a77d4c..4084a049a8ed 100644
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
diff --git a/arch/powerpc/kernel/fpu.S b/arch/powerpc/kernel/fpu.S
index 6010adcee16e..79b01610dae2 100644
--- a/arch/powerpc/kernel/fpu.S
+++ b/arch/powerpc/kernel/fpu.S
@@ -23,29 +23,29 @@
 #include <asm/feature-fixups.h>
 
 #ifdef CONFIG_VSX
-#define __REST_32FPVSRS(n,c,base)					\
+#define __REST_32FPVSRS(c, base)					\
 BEGIN_FTR_SECTION							\
 	b	2f;							\
 END_FTR_SECTION_IFSET(CPU_FTR_VSX);					\
-	REST_32FPRS(n,base);						\
+	REST_FPRS(0, 31, base);						\
 	b	3f;							\
-2:	REST_32VSRS(n,c,base);						\
+2:	REST_32VSRS(0, c, base);					\
 3:
 
-#define __SAVE_32FPVSRS(n,c,base)					\
+#define __SAVE_32FPVSRS(c, base)					\
 BEGIN_FTR_SECTION							\
 	b	2f;							\
 END_FTR_SECTION_IFSET(CPU_FTR_VSX);					\
-	SAVE_32FPRS(n,base);						\
+	SAVE_FPRS(0, 31, base);						\
 	b	3f;							\
-2:	SAVE_32VSRS(n,c,base);						\
+2:	SAVE_32VSRS(0, c, base);					\
 3:
 #else
-#define __REST_32FPVSRS(n,b,base)	REST_32FPRS(n, base)
-#define __SAVE_32FPVSRS(n,b,base)	SAVE_32FPRS(n, base)
+#define __REST_32FPVSRS(c, base)	REST_FPRS(0, 31, base)
+#define __SAVE_32FPVSRS(c, base)	SAVE_FPRS(0, 31, base)
 #endif
-#define REST_32FPVSRS(n,c,base) __REST_32FPVSRS(n,__REG_##c,__REG_##base)
-#define SAVE_32FPVSRS(n,c,base) __SAVE_32FPVSRS(n,__REG_##c,__REG_##base)
+#define REST_32FPVSRS(c, base) __REST_32FPVSRS(__REG_##c, __REG_##base)
+#define SAVE_32FPVSRS(c, base) __SAVE_32FPVSRS(__REG_##c, __REG_##base)
 
 /*
  * Load state from memory into FP registers including FPSCR.
@@ -54,7 +54,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX);					\
 _GLOBAL(load_fp_state)
 	lfd	fr0,FPSTATE_FPSCR(r3)
 	MTFSF_L(fr0)
-	REST_32FPVSRS(0, R4, R3)
+	REST_32FPVSRS(R4, R3)
 	blr
 EXPORT_SYMBOL(load_fp_state)
 _ASM_NOKPROBE_SYMBOL(load_fp_state); /* used by restore_math */
@@ -64,7 +64,7 @@ _ASM_NOKPROBE_SYMBOL(load_fp_state); /* used by restore_math */
  * Assumes the caller has enabled FP in the MSR.
  */
 _GLOBAL(store_fp_state)
-	SAVE_32FPVSRS(0, R4, R3)
+	SAVE_32FPVSRS(R4, R3)
 	mffs	fr0
 	stfd	fr0,FPSTATE_FPSCR(r3)
 	blr
@@ -113,7 +113,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 	addi	r10,r5,THREAD_FPSTATE
 	lfd	fr0,FPSTATE_FPSCR(r10)
 	MTFSF_L(fr0)
-	REST_32FPVSRS(0, R4, R10)
+	REST_32FPVSRS(R4, R10)
 	/* restore registers and return */
 	/* we haven't used ctr or xer or lr */
 	blr
@@ -131,7 +131,7 @@ _GLOBAL(save_fpu)
 	PPC_LCMPI	0,r6,0
 	bne	2f
 	addi	r6,r3,THREAD_FPSTATE
-2:	SAVE_32FPVSRS(0, R4, R6)
+2:	SAVE_32FPVSRS(R4, R6)
 	mffs	fr0
 	stfd	fr0,FPSTATE_FPSCR(r6)
 	blr
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
index 87b806e8eded..5691e49d3368 100644
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
index 4063e8a3f704..03d053ff87c7 100644
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
 
@@ -383,10 +381,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
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
 
@@ -397,8 +394,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	mtctr	r3
 	mtspr	SPRN_XER,r4
 	ld	r0,GPR0(r1)
-	REST_8GPRS(4, r1)
-	ld	r12,GPR12(r1)
+	REST_GPRS(4, 12, r1)
 	b	.Lsyscall_restore_regs_cont
 .Lsyscall_rst_end:
 
@@ -555,17 +551,14 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
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
@@ -662,8 +655,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	ld	r6,_CCR(r1)
 	li	r0,0
 
-	REST_4GPRS(7, r1)
-	REST_2GPRS(11, r1)
+	REST_GPRS(7, 12, r1)
 
 	mtlr	r3
 	mtctr	r4
@@ -675,7 +667,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
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
index 2b91f233b05d..dd382ba5926a 100644
--- a/arch/powerpc/kernel/tm.S
+++ b/arch/powerpc/kernel/tm.S
@@ -17,30 +17,30 @@
 
 #ifdef CONFIG_VSX
 /* See fpu.S, this is borrowed from there */
-#define __SAVE_32FPRS_VSRS(n,c,base)		\
+#define __SAVE_32FPRS_VSRS(c, base)		\
 BEGIN_FTR_SECTION				\
 	b	2f;				\
 END_FTR_SECTION_IFSET(CPU_FTR_VSX);		\
-	SAVE_32FPRS(n,base);			\
+	SAVE_FPRS(0, 31, base);			\
 	b	3f;				\
-2:	SAVE_32VSRS(n,c,base);			\
+2:	SAVE_32VSRS(0, c, base);		\
 3:
-#define __REST_32FPRS_VSRS(n,c,base)		\
+#define __REST_32FPRS_VSRS(c, base)		\
 BEGIN_FTR_SECTION				\
 	b	2f;				\
 END_FTR_SECTION_IFSET(CPU_FTR_VSX);		\
-	REST_32FPRS(n,base);			\
+	REST_FPRS(0, 31, base);			\
 	b	3f;				\
-2:	REST_32VSRS(n,c,base);			\
+2:	REST_32VSRS(0, c, base);		\
 3:
 #else
-#define __SAVE_32FPRS_VSRS(n,c,base)	SAVE_32FPRS(n, base)
-#define __REST_32FPRS_VSRS(n,c,base)	REST_32FPRS(n, base)
+#define __SAVE_32FPRS_VSRS(c,base)	SAVE_FPRS(0, 31, base)
+#define __REST_32FPRS_VSRS(c,base)	REST_FPRS(0, 31, base)
 #endif
-#define SAVE_32FPRS_VSRS(n,c,base) \
-	__SAVE_32FPRS_VSRS(n,__REG_##c,__REG_##base)
-#define REST_32FPRS_VSRS(n,c,base) \
-	__REST_32FPRS_VSRS(n,__REG_##c,__REG_##base)
+#define SAVE_32FPRS_VSRS(c, base) \
+	__SAVE_32FPRS_VSRS(__REG_##c, __REG_##base)
+#define REST_32FPRS_VSRS(c, base) \
+	__REST_32FPRS_VSRS(__REG_##c, __REG_##base)
 
 /* Stack frame offsets for local variables. */
 #define TM_FRAME_L0	TM_FRAME_SIZE-16
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
@@ -290,7 +287,7 @@ _GLOBAL(tm_reclaim)
 
 	/* Altivec (VEC/VMX/VR)*/
 	addi	r7, r3, THREAD_CKVRSTATE
-	SAVE_32VRS(0, r6, r7)	/* r6 scratch, r7 ckvr_state */
+	SAVE_VRS(0, 31, r6, r7)	/* r6 scratch, r7 ckvr_state */
 	mfvscr	v0
 	li	r6, VRSTATE_VSCR
 	stvx	v0, r7, r6
@@ -301,7 +298,7 @@ _GLOBAL(tm_reclaim)
 
 	/* Floating Point (FP) */
 	addi	r7, r3, THREAD_CKFPSTATE
-	SAVE_32FPRS_VSRS(0, R6, R7)	/* r6 scratch, r7 ckfp_state */
+	SAVE_32FPRS_VSRS(R6, R7)	/* r6 scratch, r7 ckfp_state */
 	mffs    fr0
 	stfd    fr0,FPSTATE_FPSCR(r7)
 
@@ -409,7 +406,7 @@ _GLOBAL(__tm_recheckpoint)
 	li	r5, VRSTATE_VSCR
 	lvx	v0, r8, r5
 	mtvscr	v0
-	REST_32VRS(0, r5, r8)			/* r5 scratch, r8 ptr */
+	REST_VRS(0, 31, r5, r8)			/* r5 scratch, r8 ptr */
 	ld	r5, THREAD_CKVRSAVE(r3)
 	mtspr	SPRN_VRSAVE, r5
 #endif
@@ -417,7 +414,7 @@ _GLOBAL(__tm_recheckpoint)
 	addi	r8, r3, THREAD_CKFPSTATE
 	lfd	fr0, FPSTATE_FPSCR(r8)
 	MTFSF_L(fr0)
-	REST_32FPRS_VSRS(0, R4, R8)
+	REST_32FPRS_VSRS(R4, R8)
 
 	mtmsr	r6				/* FP/Vec off again! */
 
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
diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
index fc120fac1910..66071dc19452 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -18,7 +18,7 @@ _GLOBAL(load_vr_state)
 	li	r4,VRSTATE_VSCR
 	lvx	v0,r4,r3
 	mtvscr	v0
-	REST_32VRS(0,r4,r3)
+	REST_VRS(0, 31, r4, r3)
 	blr
 EXPORT_SYMBOL(load_vr_state)
 _ASM_NOKPROBE_SYMBOL(load_vr_state); /* used by restore_math */
@@ -28,7 +28,7 @@ _ASM_NOKPROBE_SYMBOL(load_vr_state); /* used by restore_math */
  * Assumes the caller has enabled VMX in the MSR.
  */
 _GLOBAL(store_vr_state)
-	SAVE_32VRS(0, r4, r3)
+	SAVE_VRS(0, 31, r4, r3)
 	mfvscr	v0
 	li	r4, VRSTATE_VSCR
 	stvx	v0, r4, r3
@@ -86,7 +86,7 @@ _GLOBAL(load_up_altivec)
 	stw	r4,THREAD_USED_VR(r5)
 	lvx	v0,r10,r6
 	mtvscr	v0
-	REST_32VRS(0,r4,r6)
+	REST_VRS(0, 31, r4, r6)
 	/* restore registers and return */
 	blr
 _ASM_NOKPROBE_SYMBOL(load_up_altivec)
@@ -102,7 +102,7 @@ _GLOBAL(save_altivec)
 	PPC_LCMPI	0,r7,0
 	bne	2f
 	addi	r7,r3,THREAD_VRSTATE
-2:	SAVE_32VRS(0,r4,r7)
+2:	SAVE_VRS(0, 31, r4, r7)
 	mfvscr	v0
 	li	r4,VRSTATE_VSCR
 	stvx	v0,r4,r7
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 8dd437d7a2c6..37ee440cc35e 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -2715,8 +2715,7 @@ kvmppc_bad_host_intr:
 	std	r0, GPR0(r1)
 	std	r9, GPR1(r1)
 	std	r2, GPR2(r1)
-	SAVE_4GPRS(3, r1)
-	SAVE_2GPRS(7, r1)
+	SAVE_GPRS(3, 8, r1)
 	srdi	r0, r12, 32
 	clrldi	r12, r12, 32
 	std	r0, _CCR(r1)
@@ -2739,7 +2738,7 @@ kvmppc_bad_host_intr:
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

