Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E03944F632
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 16:33:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WJ2Y1t37zDqc2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 00:33:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KhZnJnZP"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WGLD2SxNzDqbf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 23:17:08 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id t7so4331191plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 06:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LGFcjNVvoeg/pe/Cvxw/EyGLw9YoJZKeXFzBwz1DMHc=;
 b=KhZnJnZPAmwW+jCxPDct+hAXjO9KNew5qDr9wvrl1Czjl/k9rLsm+RaL90wWIR4clY
 gx325qXwET8uxw/u+DsAtARADH3NE35nuhZdrO0f+BS5SwUQI0xQopl/F5XReoZO7m9d
 rY7MfXKe2DNEKMci/dmsCXXSorRbtLvCBIyrPFBcNz7kHnl7obbDkUu8umN/nZv8AF0F
 8RYmowGrdkRecQg/2/n4oCMv+SubPIekPsueitRTele0i61ETCi1y2Tqt48v1+mO5kDI
 6UTSQ9rNjR2TG9Xc+WxRkGeBSVpjph/HwQW7dtSaDr3VLFcFHsoXFC1ASEFhB64WfRoL
 2uEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LGFcjNVvoeg/pe/Cvxw/EyGLw9YoJZKeXFzBwz1DMHc=;
 b=LKN49DsgoqE09SDZThT7cxSU2IP/bp6t5OyzU5pnffLWSUWLZLOcXhSaJvmAQ+gYEP
 XqT/27XfIVk7oFB/xynFtqldTEu2MOP+GIp//NlnLDhXuS8TCc0YIuQhJEHkUM5acyKm
 dJEaxZ13veVpQkKiJ1UKk+xYi+5ROGWMyRf79mTmUAYnThrlyNPGbtowSHar8107mn5A
 lNh2mq3qRg+9+DFIYepJcHvAsOD8siZ+XWmGkK2KwGp3tmwYkDhXdF0dqmdAS9MKQIWc
 8diLhzQo0jZqnYTmcHlen6VghEcYF4MJAbS7N3MPYXmFjvxJWdwJejL1uqrr7AD4prSw
 5E8A==
X-Gm-Message-State: APjAAAVXnjRw0M3/c+rgQ6w7t4yVHpo7+WlXtGdXBAuSuEnokIL6daD3
 TG/t/P/S47MeBMcQTYJHk8k1W9uObZw=
X-Google-Smtp-Source: APXvYqygcSU97lq7W7ZgFCHweu4un7NIKMl1I04+ljnhFXkWTTiMMI2m6/k28JyMHp+okRfVAhEhIA==
X-Received: by 2002:a17:902:868f:: with SMTP id
 g15mr136507911plo.67.1561209426043; 
 Sat, 22 Jun 2019 06:17:06 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.144.136.2])
 by smtp.gmail.com with ESMTPSA id n1sm5192471pgv.15.2019.06.22.06.17.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 06:17:05 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 24/25] powerpc/64s/exception: remove pointless
 EXCEPTION_PROLOG macro indirection
Date: Sat, 22 Jun 2019 23:15:34 +1000
Message-Id: <20190622131535.20996-25-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190622131535.20996-1-npiggin@gmail.com>
References: <20190622131535.20996-1-npiggin@gmail.com>
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

No generated code change. File is change is in bug table line numbers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 108 +++++++++++++--------------
 1 file changed, 51 insertions(+), 57 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 144cc9b063ef..af8939582ffd 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -326,40 +326,6 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	std	r0,GPR0(r1);		/* save r0 in stackframe	*/ \
 	std	r10,GPR1(r1);		/* save r1 in stackframe	*/ \
 
-
-/*
- * The common exception prolog is used for all except a few exceptions
- * such as a segment miss on a kernel address.  We have to be prepared
- * to take another exception from the point where we first touch the
- * kernel stack onwards.
- *
- * On entry r13 points to the paca, r9-r13 are saved in the paca,
- * r9 contains the saved CR, r11 and r12 contain the saved SRR0 and
- * SRR1, and relocation is on.
- */
-#define EXCEPTION_PROLOG_COMMON(n, area)				   \
-	andi.	r10,r12,MSR_PR;		/* See if coming from user	*/ \
-	mr	r10,r1;			/* Save r1			*/ \
-	subi	r1,r1,INT_FRAME_SIZE;	/* alloc frame on kernel stack	*/ \
-	beq-	1f;							   \
-	ld	r1,PACAKSAVE(r13);	/* kernel stack to use		*/ \
-1:	cmpdi	cr1,r1,-INT_FRAME_SIZE;	/* check if r1 is in userspace	*/ \
-	blt+	cr1,3f;			/* abort if it is		*/ \
-	li	r1,(n);			/* will be reloaded later	*/ \
-	sth	r1,PACA_TRAP_SAVE(r13);					   \
-	std	r3,area+EX_R3(r13);					   \
-	addi	r3,r13,area;		/* r3 -> where regs are saved*/	   \
-	RESTORE_CTR(r1, area);						   \
-	b	bad_stack;						   \
-3:	EXCEPTION_PROLOG_COMMON_1();					   \
-	kuap_save_amr_and_lock r9, r10, cr1, cr0;			   \
-	beq	4f;			/* if from kernel mode		*/ \
-	ACCOUNT_CPU_USER_ENTRY(r13, r9, r10);				   \
-	SAVE_PPR(area, r9);						   \
-4:	EXCEPTION_PROLOG_COMMON_2(area)					   \
-	EXCEPTION_PROLOG_COMMON_3(n)					   \
-	ACCOUNT_STOLEN_TIME
-
 /* Save original regs values from save area to stack frame. */
 #define EXCEPTION_PROLOG_COMMON_2(area)					   \
 	ld	r9,area+EX_R9(r13);	/* move r9, r10 to stackframe	*/ \
@@ -379,7 +345,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);			   \
 	GET_CTR(r10, area);						   \
 	std	r10,_CTR(r1);
 
-#define EXCEPTION_PROLOG_COMMON_3(n)					   \
+#define EXCEPTION_PROLOG_COMMON_3(trap)					   \
 	std	r2,GPR2(r1);		/* save r2 in stackframe	*/ \
 	SAVE_4GPRS(3, r1);		/* save r3 - r6 in stackframe   */ \
 	SAVE_2GPRS(7, r1);		/* save r7, r8 in stackframe	*/ \
@@ -390,26 +356,45 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);			   \
 	mfspr	r11,SPRN_XER;		/* save XER in stackframe	*/ \
 	std	r10,SOFTE(r1);						   \
 	std	r11,_XER(r1);						   \
-	li	r9,(n)+1;						   \
+	li	r9,(trap)+1;						   \
 	std	r9,_TRAP(r1);		/* set trap number		*/ \
 	li	r10,0;							   \
 	ld	r11,exception_marker@toc(r2);				   \
 	std	r10,RESULT(r1);		/* clear regs->result		*/ \
 	std	r11,STACK_FRAME_OVERHEAD-16(r1); /* mark the frame	*/
 
-#define RUNLATCH_ON				\
-BEGIN_FTR_SECTION				\
-	ld	r3, PACA_THREAD_INFO(r13);	\
-	ld	r4,TI_LOCAL_FLAGS(r3);		\
-	andi.	r0,r4,_TLF_RUNLATCH;		\
-	beql	ppc64_runlatch_on_trampoline;	\
-END_FTR_SECTION_IFSET(CPU_FTR_CTRL)
+/*
+ * On entry r13 points to the paca, r9-r13 are saved in the paca,
+ * r9 contains the saved CR, r11 and r12 contain the saved SRR0 and
+ * SRR1, and relocation is on.
+ */
+#define EXCEPTION_COMMON(area, trap)					   \
+	andi.	r10,r12,MSR_PR;		/* See if coming from user	*/ \
+	mr	r10,r1;			/* Save r1			*/ \
+	subi	r1,r1,INT_FRAME_SIZE;	/* alloc frame on kernel stack	*/ \
+	beq-	1f;							   \
+	ld	r1,PACAKSAVE(r13);	/* kernel stack to use		*/ \
+1:	cmpdi	cr1,r1,-INT_FRAME_SIZE;	/* check if r1 is in userspace	*/ \
+	blt+	cr1,3f;			/* abort if it is		*/ \
+	li	r1,(trap);		/* will be reloaded later	*/ \
+	sth	r1,PACA_TRAP_SAVE(r13);					   \
+	std	r3,area+EX_R3(r13);					   \
+	addi	r3,r13,area;		/* r3 -> where regs are saved*/	   \
+	RESTORE_CTR(r1, area);						   \
+	b	bad_stack;						   \
+3:	EXCEPTION_PROLOG_COMMON_1();					   \
+	kuap_save_amr_and_lock r9, r10, cr1, cr0;			   \
+	beq	4f;			/* if from kernel mode		*/ \
+	ACCOUNT_CPU_USER_ENTRY(r13, r9, r10);				   \
+	SAVE_PPR(area, r9);						   \
+4:	EXCEPTION_PROLOG_COMMON_2(area);				   \
+	EXCEPTION_PROLOG_COMMON_3(trap);				   \
+	ACCOUNT_STOLEN_TIME
 
-#define EXCEPTION_COMMON(area, trap)				\
-	EXCEPTION_PROLOG_COMMON(trap, area);			\
 
 /*
- * Exception where stack is already set in r1, r1 is saved in r10
+ * Exception where stack is already set in r1, r1 is saved in r10.
+ * PPR save and CPU accounting is not done (for some reason).
  */
 #define EXCEPTION_COMMON_STACK(area, trap)			\
 	EXCEPTION_PROLOG_COMMON_1();				\
@@ -417,6 +402,15 @@ END_FTR_SECTION_IFSET(CPU_FTR_CTRL)
 	EXCEPTION_PROLOG_COMMON_2(area);			\
 	EXCEPTION_PROLOG_COMMON_3(trap)
 
+
+#define RUNLATCH_ON				\
+BEGIN_FTR_SECTION				\
+	ld	r3, PACA_THREAD_INFO(r13);	\
+	ld	r4,TI_LOCAL_FLAGS(r3);		\
+	andi.	r0,r4,_TLF_RUNLATCH;		\
+	beql	ppc64_runlatch_on_trampoline;	\
+END_FTR_SECTION_IFSET(CPU_FTR_CTRL)
+
 /*
  * When the idle code in power4_idle puts the CPU into NAP mode,
  * it has to do so in a loop, and relies on the external interrupt
@@ -1048,7 +1042,7 @@ EXC_COMMON_BEGIN(machine_check_common)
 	std	r10,PACA_EXMC+EX_DAR(r13)
 	mfspr	r10,SPRN_DSISR
 	stw	r10,PACA_EXMC+EX_DSISR(r13)
-	EXCEPTION_PROLOG_COMMON(0x200, PACA_EXMC)
+	EXCEPTION_COMMON(PACA_EXMC, 0x200)
 	FINISH_NAP
 	RECONCILE_IRQ_STATE(r10, r11)
 	ld	r3,PACA_EXMC+EX_DAR(r13)
@@ -1299,7 +1293,7 @@ EXC_COMMON_BEGIN(data_access_common)
 	 * r9 - r13 are saved in paca->exgen.
 	 * EX_DAR and EX_DSISR have saved DAR/DSISR
 	 */
-	EXCEPTION_PROLOG_COMMON(0x300, PACA_EXGEN)
+	EXCEPTION_COMMON(PACA_EXGEN, 0x300)
 	RECONCILE_IRQ_STATE(r10, r11)
 	ld	r12,_MSR(r1)
 	ld	r3,PACA_EXGEN+EX_DAR(r13)
@@ -1338,7 +1332,7 @@ EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
 TRAMP_KVM_SKIP(PACA_EXSLB, 0x380)
 
 EXC_COMMON_BEGIN(data_access_slb_common)
-	EXCEPTION_PROLOG_COMMON(0x380, PACA_EXSLB)
+	EXCEPTION_COMMON(PACA_EXSLB, 0x380)
 	ld	r4,PACA_EXSLB+EX_DAR(r13)
 	std	r4,_DAR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -1368,7 +1362,7 @@ EXC_VIRT(instruction_access, 0x4400, 0x80, 0x400)
 TRAMP_KVM(PACA_EXGEN, 0x400)
 
 EXC_COMMON_BEGIN(instruction_access_common)
-	EXCEPTION_PROLOG_COMMON(0x400, PACA_EXGEN)
+	EXCEPTION_COMMON(PACA_EXGEN, 0x400)
 	RECONCILE_IRQ_STATE(r10, r11)
 	ld	r12,_MSR(r1)
 	ld	r3,_NIP(r1)
@@ -1388,7 +1382,7 @@ __EXC_VIRT(instruction_access_slb, 0x4480, 0x80, 0x480, PACA_EXSLB)
 TRAMP_KVM(PACA_EXSLB, 0x480)
 
 EXC_COMMON_BEGIN(instruction_access_slb_common)
-	EXCEPTION_PROLOG_COMMON(0x480, PACA_EXSLB)
+	EXCEPTION_COMMON(PACA_EXSLB, 0x480)
 	ld	r4,_NIP(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
@@ -1465,7 +1459,7 @@ EXC_VIRT_END(alignment, 0x4600, 0x100)
 
 TRAMP_KVM(PACA_EXGEN, 0x600)
 EXC_COMMON_BEGIN(alignment_common)
-	EXCEPTION_PROLOG_COMMON(0x600, PACA_EXGEN)
+	EXCEPTION_COMMON(PACA_EXGEN, 0x600)
 	ld	r3,PACA_EXGEN+EX_DAR(r13)
 	lwz	r4,PACA_EXGEN+EX_DSISR(r13)
 	std	r3,_DAR(r1)
@@ -1503,7 +1497,7 @@ EXC_COMMON_BEGIN(program_check_common)
 	ld	r1,PACAEMERGSP(r13)	/* Use emergency stack		*/
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
 	b 3f				/* Jump into the macro !!	*/
-1:	EXCEPTION_PROLOG_COMMON(0x700, PACA_EXGEN)
+1:	EXCEPTION_COMMON(PACA_EXGEN, 0x700)
 	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -1515,7 +1509,7 @@ EXC_REAL(fp_unavailable, 0x800, 0x100)
 EXC_VIRT(fp_unavailable, 0x4800, 0x100, 0x800)
 TRAMP_KVM(PACA_EXGEN, 0x800)
 EXC_COMMON_BEGIN(fp_unavailable_common)
-	EXCEPTION_PROLOG_COMMON(0x800, PACA_EXGEN)
+	EXCEPTION_COMMON(PACA_EXGEN, 0x800)
 	bne	1f			/* if from user, just load it up */
 	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
@@ -1728,7 +1722,7 @@ EXC_COMMON_BEGIN(h_data_storage_common)
 	std     r10,PACA_EXGEN+EX_DAR(r13)
 	mfspr   r10,SPRN_HDSISR
 	stw     r10,PACA_EXGEN+EX_DSISR(r13)
-	EXCEPTION_PROLOG_COMMON(0xe00, PACA_EXGEN)
+	EXCEPTION_COMMON(PACA_EXGEN, 0xe00)
 	bl      save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi    r3,r1,STACK_FRAME_OVERHEAD
@@ -1860,7 +1854,7 @@ EXC_REAL_OOL(altivec_unavailable, 0xf20, 0x20)
 EXC_VIRT_OOL(altivec_unavailable, 0x4f20, 0x20, 0xf20)
 TRAMP_KVM(PACA_EXGEN, 0xf20)
 EXC_COMMON_BEGIN(altivec_unavailable_common)
-	EXCEPTION_PROLOG_COMMON(0xf20, PACA_EXGEN)
+	EXCEPTION_COMMON(PACA_EXGEN, 0xf20)
 #ifdef CONFIG_ALTIVEC
 BEGIN_FTR_SECTION
 	beq	1f
@@ -1897,7 +1891,7 @@ EXC_REAL_OOL(vsx_unavailable, 0xf40, 0x20)
 EXC_VIRT_OOL(vsx_unavailable, 0x4f40, 0x20, 0xf40)
 TRAMP_KVM(PACA_EXGEN, 0xf40)
 EXC_COMMON_BEGIN(vsx_unavailable_common)
-	EXCEPTION_PROLOG_COMMON(0xf40, PACA_EXGEN)
+	EXCEPTION_COMMON(PACA_EXGEN, 0xf40)
 #ifdef CONFIG_VSX
 BEGIN_FTR_SECTION
 	beq	1f
-- 
2.20.1

