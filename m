Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4142278EAE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 17:05:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y2zd2v2yzDqKW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 01:05:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MTX4Hhb5"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y1rl6RtlzDqGT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:13:59 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id i2so27595970plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 07:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y/xHN687Z2CRDgAncYWGTenvCJ1Jnknr1wbJ1mVkJ+k=;
 b=MTX4Hhb5k6XWVcwQN58mCwfdT/0hKDywuS2u9x31nO8zsbrDJXqrJ0lKk6kqQOgeRF
 hJSrrCyRxBVGLIJNGTxcQMXASMg+/Zivfn0dYT9V5FOVFx4Y9Q2apZlEcY3PD2ARKZzT
 ExyAu6ZZkfNzVNHCUHySCxR/zXDSRVXm+tgAPMxtCsyS0Msq8hmfiQwwa7Nu9a77oUa4
 rJnh0RjGYSX/59QuK2HFNdkM0sXq6cudXgCPGhwy3xyGowJhSsav3geXOKycKiMa5toX
 VJjwKKDJzZq3V3yy589Sympb6yPScjTabvqV6Jk4oY7Cx03hXdXOq9Zi1ZfDg24OnfGB
 Ie/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y/xHN687Z2CRDgAncYWGTenvCJ1Jnknr1wbJ1mVkJ+k=;
 b=CrHW6QC35tuJisMFXqrXqvoDAUctjaXjJkzFfa3AO8nVG4TpCplR5BHlZCR+RWL4F3
 +2PRIHK0T0cROBPeA2fx9AYswQfkRBzr9QcUOp6LQny5y2lkkga5cvCl6X8+HT1vEIiY
 y3645UFfYr2+tweyWlCjDb7cU31GuWKnbqNPCSssMV+aM4ddzfkj10e8lqYJ2fnkn1dm
 FYeOLajGFvuMqPD6pKfNL2ZflknwhcSMx4IzkoEoOGXE6+kf1T//67f9Wws9RrmcinU0
 RQevPC04CrdWJVczccPE8OZIrCYEiJn9htA2PBmydvjeGSKOllx/ZCeqBkpbsS90Qhow
 wmpQ==
X-Gm-Message-State: APjAAAXGhqGRU9uhEEqtNlrwFGgvcvYFFyvLOUBWN7LXhlTce/IRym67
 IBHMjU6/3EU1DCnd3EL7u1OzcZHsXts=
X-Google-Smtp-Source: APXvYqwzXm728oottUR4iQFcYByIVZQv0jh03HIqONTQCfaW6ceXJ3N0/4B3eEeP7n5t07IAFyBqHA==
X-Received: by 2002:a17:902:e512:: with SMTP id
 ck18mr104694041plb.53.1564409637765; 
 Mon, 29 Jul 2019 07:13:57 -0700 (PDT)
Received: from bobo.local0.net (61-68-184-39.tpgi.com.au. [61.68.184.39])
 by smtp.gmail.com with ESMTPSA id u7sm53960083pfm.96.2019.07.29.07.13.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 07:13:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 13/18] powerpc/64s/exception: Add INT_COMMON gas macro to
 generate common exception code
Date: Tue, 30 Jul 2019 00:12:42 +1000
Message-Id: <20190729141247.26762-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729141247.26762-1-npiggin@gmail.com>
References: <20190729141247.26762-1-npiggin@gmail.com>
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

No generated code change except BUG line number constants.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 52 +++++++++++++++++-----------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 565b9c18aa0c..3d5ded748de6 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -463,6 +463,18 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);			   \
 	kuap_save_amr_and_lock r9, r10, cr1;			\
 	EXCEPTION_PROLOG_COMMON_2(area, trap)
 
+.macro INT_COMMON vec, area, stack, kaup
+	.if \stack
+	EXCEPTION_COMMON(\area, \vec)
+	.else
+	EXCEPTION_PROLOG_COMMON_1()
+	.if \kaup
+	kuap_save_amr_and_lock r9, r10, cr1
+	.endif
+	EXCEPTION_PROLOG_COMMON_2(\area, \vec)
+	.endif
+.endm
+
 /*
  * Restore all registers including H/SRR0/1 saved in a stack frame of a
  * standard exception.
@@ -658,7 +670,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define EXC_COMMON(name, realvec, hdlr)					\
 	EXC_COMMON_BEGIN(name);						\
-	EXCEPTION_COMMON(PACA_EXGEN, realvec);				\
+	INT_COMMON realvec, PACA_EXGEN, 1, 1 ;				\
 	bl	save_nvgprs;						\
 	RECONCILE_IRQ_STATE(r10, r11);					\
 	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
@@ -671,7 +683,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
  */
 #define EXC_COMMON_ASYNC(name, realvec, hdlr)				\
 	EXC_COMMON_BEGIN(name);						\
-	EXCEPTION_COMMON(PACA_EXGEN, realvec);				\
+	INT_COMMON realvec, PACA_EXGEN, 1, 1 ;				\
 	FINISH_NAP;							\
 	RECONCILE_IRQ_STATE(r10, r11);					\
 	RUNLATCH_ON;							\
@@ -852,7 +864,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 	mr	r10,r1
 	ld	r1,PACA_NMI_EMERG_SP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
-	EXCEPTION_COMMON_STACK(PACA_EXNMI, 0x100)
+	INT_COMMON 0x100, PACA_EXNMI, 0, 1
 	bl	save_nvgprs
 	/*
 	 * Set IRQS_ALL_DISABLED unconditionally so arch_irqs_disabled does
@@ -962,9 +974,8 @@ EXC_COMMON_BEGIN(machine_check_early_common)
 	bgt	cr1,unrecoverable_mce	/* Check if we hit limit of 4 */
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame */
 
-	EXCEPTION_PROLOG_COMMON_1()
 	/* We don't touch AMR here, we never go to virtual mode */
-	EXCEPTION_PROLOG_COMMON_2(PACA_EXMC, 0x200)
+	INT_COMMON 0x200, PACA_EXMC, 0, 0
 
 	ld	r3,PACA_EXMC+EX_DAR(r13)
 	lwz	r4,PACA_EXMC+EX_DSISR(r13)
@@ -1064,7 +1075,7 @@ EXC_COMMON_BEGIN(machine_check_common)
 	 * Machine check is different because we use a different
 	 * save area: PACA_EXMC instead of PACA_EXGEN.
 	 */
-	EXCEPTION_COMMON(PACA_EXMC, 0x200)
+	INT_COMMON 0x200, PACA_EXMC, 1, 1
 	FINISH_NAP
 	RECONCILE_IRQ_STATE(r10, r11)
 	ld	r3,PACA_EXMC+EX_DAR(r13)
@@ -1156,7 +1167,7 @@ EXC_COMMON_BEGIN(data_access_common)
 	 * r9 - r13 are saved in paca->exgen.
 	 * EX_DAR and EX_DSISR have saved DAR/DSISR
 	 */
-	EXCEPTION_COMMON(PACA_EXGEN, 0x300)
+	INT_COMMON 0x300, PACA_EXGEN, 1, 1
 	RECONCILE_IRQ_STATE(r10, r11)
 	ld	r12,_MSR(r1)
 	ld	r3,PACA_EXGEN+EX_DAR(r13)
@@ -1179,7 +1190,7 @@ EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
 EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
 INT_KVM_HANDLER 0x380, EXC_STD, PACA_EXSLB, 1
 EXC_COMMON_BEGIN(data_access_slb_common)
-	EXCEPTION_COMMON(PACA_EXSLB, 0x380)
+	INT_COMMON 0x380, PACA_EXSLB, 1, 1
 	ld	r4,PACA_EXSLB+EX_DAR(r13)
 	std	r4,_DAR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -1212,7 +1223,7 @@ EXC_VIRT_BEGIN(instruction_access, 0x4400, 0x80)
 EXC_VIRT_END(instruction_access, 0x4400, 0x80)
 INT_KVM_HANDLER 0x400, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(instruction_access_common)
-	EXCEPTION_COMMON(PACA_EXGEN, 0x400)
+	INT_COMMON 0x400, PACA_EXGEN, 1, 1
 	RECONCILE_IRQ_STATE(r10, r11)
 	ld	r12,_MSR(r1)
 	ld	r3,_NIP(r1)
@@ -1235,7 +1246,7 @@ EXC_VIRT_BEGIN(instruction_access_slb, 0x4480, 0x80)
 EXC_VIRT_END(instruction_access_slb, 0x4480, 0x80)
 INT_KVM_HANDLER 0x480, EXC_STD, PACA_EXSLB, 0
 EXC_COMMON_BEGIN(instruction_access_slb_common)
-	EXCEPTION_COMMON(PACA_EXSLB, 0x480)
+	INT_COMMON 0x480, PACA_EXSLB, 1, 1
 	ld	r4,_NIP(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
@@ -1277,7 +1288,7 @@ EXC_VIRT_BEGIN(alignment, 0x4600, 0x100)
 EXC_VIRT_END(alignment, 0x4600, 0x100)
 INT_KVM_HANDLER 0x600, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(alignment_common)
-	EXCEPTION_COMMON(PACA_EXGEN, 0x600)
+	INT_COMMON 0x600, PACA_EXGEN, 1, 1
 	ld	r3,PACA_EXGEN+EX_DAR(r13)
 	lwz	r4,PACA_EXGEN+EX_DSISR(r13)
 	std	r3,_DAR(r1)
@@ -1323,7 +1334,7 @@ EXC_COMMON_BEGIN(program_check_common)
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
 	b 3f				/* Jump into the macro !!	*/
 2:
-	EXCEPTION_COMMON(PACA_EXGEN, 0x700)
+	INT_COMMON 0x700, PACA_EXGEN, 1, 1
 	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -1339,7 +1350,7 @@ EXC_VIRT_BEGIN(fp_unavailable, 0x4800, 0x100)
 EXC_VIRT_END(fp_unavailable, 0x4800, 0x100)
 INT_KVM_HANDLER 0x800, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(fp_unavailable_common)
-	EXCEPTION_COMMON(PACA_EXGEN, 0x800)
+	INT_COMMON 0x800, PACA_EXGEN, 1, 1
 	bne	1f			/* if from user, just load it up */
 	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
@@ -1556,7 +1567,7 @@ EXC_VIRT_BEGIN(h_data_storage, 0x4e00, 0x20)
 EXC_VIRT_END(h_data_storage, 0x4e00, 0x20)
 INT_KVM_HANDLER 0xe00, EXC_HV, PACA_EXGEN, 1
 EXC_COMMON_BEGIN(h_data_storage_common)
-	EXCEPTION_COMMON(PACA_EXGEN, 0xe00)
+	INT_COMMON 0xe00, PACA_EXGEN, 1, 1
 	bl      save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi    r3,r1,STACK_FRAME_OVERHEAD
@@ -1610,9 +1621,10 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 	mr	r10,r1			/* Save r1 */
 	ld	r1,PACAEMERGSP(r13)	/* Use emergency stack for realmode */
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
-	EXCEPTION_PROLOG_COMMON_1()
+
 	/* We don't touch AMR here, we never go to virtual mode */
-	EXCEPTION_PROLOG_COMMON_2(PACA_EXGEN, 0xe60)
+	INT_COMMON 0xe60, PACA_EXGEN, 0, 0
+
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	hmi_exception_realmode
 	cmpdi	cr0,r3,0
@@ -1630,7 +1642,7 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 	INT_HANDLER hmi_exception, 0xe60, 0, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
 
 EXC_COMMON_BEGIN(hmi_exception_common)
-	EXCEPTION_COMMON(PACA_EXGEN, 0xe60)
+	INT_COMMON 0xe60, PACA_EXGEN, 1, 1
 	FINISH_NAP
 	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
@@ -1688,7 +1700,7 @@ EXC_VIRT_BEGIN(altivec_unavailable, 0x4f20, 0x20)
 EXC_VIRT_END(altivec_unavailable, 0x4f20, 0x20)
 INT_KVM_HANDLER 0xf20, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(altivec_unavailable_common)
-	EXCEPTION_COMMON(PACA_EXGEN, 0xf20)
+	INT_COMMON 0xf20, PACA_EXGEN, 1, 1
 #ifdef CONFIG_ALTIVEC
 BEGIN_FTR_SECTION
 	beq	1f
@@ -1729,7 +1741,7 @@ EXC_VIRT_BEGIN(vsx_unavailable, 0x4f40, 0x20)
 EXC_VIRT_END(vsx_unavailable, 0x4f40, 0x20)
 INT_KVM_HANDLER 0xf40, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(vsx_unavailable_common)
-	EXCEPTION_COMMON(PACA_EXGEN, 0xf40)
+	INT_COMMON 0xf40, PACA_EXGEN, 1, 1
 #ifdef CONFIG_VSX
 BEGIN_FTR_SECTION
 	beq	1f
@@ -1980,7 +1992,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	mr	r10,r1
 	ld	r1,PACAEMERGSP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
-	EXCEPTION_COMMON_STACK(PACA_EXGEN, 0x900)
+	INT_COMMON 0x900, PACA_EXGEN, 0, 1
 	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-- 
2.22.0

