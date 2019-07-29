Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2895978EE8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 17:15:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y3D61q14zDqFF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 01:15:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="U9i3tRvm"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y1rv1fslzDqLt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:14:07 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id p184so28104623pfp.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 07:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mfJuZlq4UDH2PHJMNdWLWwvu/4h0q/DbQ9KlBnJtri0=;
 b=U9i3tRvmr153OVQMD4AdI7g/ps6Qd8UcVFx5QwAjUkBfm/2uGJq3X4Q4OSQLO0mUMQ
 IT0TokwvnfeJuRHZZTFzqGFrIGkZUi6sOVLA5ze8oGbtKbasRCMMLOaN3RCQG9UurygH
 mVZIr/iwdDV15JALtKZFjIBwIQ+/jtS15VRHd9zqBfMn5Vncki09XHdrY+UcQpwVyQ31
 PQ95s0WlbZUuuWy8tvQ1lBo3PxbQSL6oF7rQ2DyMogaeuocGk2ytDfnpmf5sCku5QwZb
 OJF/SvowL7V20L4dwhoPxnDq50V3djeAxYtdx7prY1XQYVT+ip+ry3INZv+bIZ4OnGZV
 lpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mfJuZlq4UDH2PHJMNdWLWwvu/4h0q/DbQ9KlBnJtri0=;
 b=ANJRGgTvBn9FSjW++z4cn6kgZ30wHdXmDHxBDELW9zbZUmTYV0QW/8ZDCMFARRQ6BO
 7to0Y/rfUn3rZQgYE+Jf5ivm4U7pt1CBj9XuxxSIH7enPT+JlmKvNYVKWr4Lif41lyME
 aZv5N8Dd7ar2tC4oM1+ZXQdUJMcmbMBNENcjEBiXBuvddw/hLO2rt8NwQvenX7VMue1H
 eK3J4xXSTChgdbLeYMHyuXy04GSE7YP94eTR8/fKsr0F/h6CJH6xFQf9MFpYv8WZeGfF
 2mP1Qxl2YV8ZrYq3+xbHxGCQmQmJMJYmwStFelrFAL7fKyJCv+CY+KGwR+IsgwbutRdK
 w5pg==
X-Gm-Message-State: APjAAAWkfa3+1sT4WU6+VPCKGj++0lgzFy7AypiyenLXvsHRYQS9wVJS
 +6kW7mXwLoOa10sOxXXGPJG2L/STsxk=
X-Google-Smtp-Source: APXvYqzX9XTDhhyLSzIN7HsKmT3wm+MRnVeadOGpSih3nFQoUGzNROKR5A0CInbi4P8s2GIEcK0tUw==
X-Received: by 2002:a17:90a:35e5:: with SMTP id
 r92mr113949677pjb.34.1564409644368; 
 Mon, 29 Jul 2019 07:14:04 -0700 (PDT)
Received: from bobo.local0.net (61-68-184-39.tpgi.com.au. [61.68.184.39])
 by smtp.gmail.com with ESMTPSA id u7sm53960083pfm.96.2019.07.29.07.14.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 07:14:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 16/18] powerpc/64s/exception: INT_COMMON add DIR, DSISR,
 reconcile options
Date: Tue, 30 Jul 2019 00:12:45 +1000
Message-Id: <20190729141247.26762-17-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 111 ++++++++++++---------------
 1 file changed, 51 insertions(+), 60 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index dcb60f082fdc..456926439e41 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -398,7 +398,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
  * If stack=0, then the stack is already set in r1, and r1 is saved in r10.
  * PPR save and CPU accounting is not done for the !stack case (XXX why not?)
  */
-.macro INT_COMMON vec, area, stack, kaup
+.macro INT_COMMON vec, area, stack, kaup, reconcile, dar, dsisr
 	.if \stack
 	andi.	r10,r12,MSR_PR		/* See if coming from user	*/
 	mr	r10,r1			/* Save r1			*/
@@ -442,6 +442,24 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	std	r9,GPR11(r1)
 	std	r10,GPR12(r1)
 	std	r11,GPR13(r1)
+	.if \dar
+	.if \dar == 2
+	ld	r10,_NIP(r1)
+	.else
+	ld	r10,\area+EX_DAR(r13)
+	.endif
+	std	r10,_DAR(r1)
+	.endif
+	.if \dsisr
+	.if \dsisr == 2
+	ld	r10,_MSR(r1)
+	lis	r11,DSISR_SRR1_MATCH_64S@h
+	and	r10,r10,r11
+	.else
+	lwz	r10,\area+EX_DSISR(r13)
+	.endif
+	std	r10,_DSISR(r1)
+	.endif
 BEGIN_FTR_SECTION_NESTED(66)
 	ld	r10,\area+EX_CFAR(r13)
 	std	r10,ORIG_GPR3(r1)
@@ -468,6 +486,10 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66)
 	.if \stack
 	ACCOUNT_STOLEN_TIME
 	.endif
+
+	.if \reconcile
+	RECONCILE_IRQ_STATE(r10, r11)
+	.endif
 .endm
 
 /*
@@ -665,9 +687,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define EXC_COMMON(name, realvec, hdlr)					\
 	EXC_COMMON_BEGIN(name);						\
-	INT_COMMON realvec, PACA_EXGEN, 1, 1 ;				\
+	INT_COMMON realvec, PACA_EXGEN, 1, 1, 1, 0, 0 ;			\
 	bl	save_nvgprs;						\
-	RECONCILE_IRQ_STATE(r10, r11);					\
 	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
 	bl	hdlr;							\
 	b	ret_from_except
@@ -678,9 +699,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
  */
 #define EXC_COMMON_ASYNC(name, realvec, hdlr)				\
 	EXC_COMMON_BEGIN(name);						\
-	INT_COMMON realvec, PACA_EXGEN, 1, 1 ;				\
+	INT_COMMON realvec, PACA_EXGEN, 1, 1, 1, 0, 0 ;			\
 	FINISH_NAP;							\
-	RECONCILE_IRQ_STATE(r10, r11);					\
 	RUNLATCH_ON;							\
 	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
 	bl	hdlr;							\
@@ -859,7 +879,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 	mr	r10,r1
 	ld	r1,PACA_NMI_EMERG_SP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
-	INT_COMMON 0x100, PACA_EXNMI, 0, 1
+	INT_COMMON 0x100, PACA_EXNMI, 0, 1, 0, 0, 0
 	bl	save_nvgprs
 	/*
 	 * Set IRQS_ALL_DISABLED unconditionally so arch_irqs_disabled does
@@ -970,12 +990,7 @@ EXC_COMMON_BEGIN(machine_check_early_common)
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame */
 
 	/* We don't touch AMR here, we never go to virtual mode */
-	INT_COMMON 0x200, PACA_EXMC, 0, 0
-
-	ld	r3,PACA_EXMC+EX_DAR(r13)
-	lwz	r4,PACA_EXMC+EX_DSISR(r13)
-	std	r3,_DAR(r1)
-	std	r4,_DSISR(r1)
+	INT_COMMON 0x200, PACA_EXMC, 0, 0, 0, 1, 1
 
 BEGIN_FTR_SECTION
 	bl	enable_machine_check
@@ -1070,16 +1085,11 @@ EXC_COMMON_BEGIN(machine_check_common)
 	 * Machine check is different because we use a different
 	 * save area: PACA_EXMC instead of PACA_EXGEN.
 	 */
-	INT_COMMON 0x200, PACA_EXMC, 1, 1
+	INT_COMMON 0x200, PACA_EXMC, 1, 1, 1, 1, 1
 	FINISH_NAP
-	RECONCILE_IRQ_STATE(r10, r11)
-	ld	r3,PACA_EXMC+EX_DAR(r13)
-	lwz	r4,PACA_EXMC+EX_DSISR(r13)
 	/* Enable MSR_RI when finished with PACA_EXMC */
 	li	r10,MSR_RI
 	mtmsrd 	r10,1
-	std	r3,_DAR(r1)
-	std	r4,_DSISR(r1)
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_exception
@@ -1162,14 +1172,11 @@ EXC_COMMON_BEGIN(data_access_common)
 	 * r9 - r13 are saved in paca->exgen.
 	 * EX_DAR and EX_DSISR have saved DAR/DSISR
 	 */
-	INT_COMMON 0x300, PACA_EXGEN, 1, 1
-	RECONCILE_IRQ_STATE(r10, r11)
+	INT_COMMON 0x300, PACA_EXGEN, 1, 1, 1, 1, 1
 	ld	r12,_MSR(r1)
-	ld	r3,PACA_EXGEN+EX_DAR(r13)
-	lwz	r4,PACA_EXGEN+EX_DSISR(r13)
+	ld	r3,_DAR(r1)
+	ld	r4,_DSISR(r1)
 	li	r5,0x300
-	std	r3,_DAR(r1)
-	std	r4,_DSISR(r1)
 BEGIN_MMU_FTR_SECTION
 	b	do_hash_page		/* Try to handle as hpte fault */
 MMU_FTR_SECTION_ELSE
@@ -1185,9 +1192,8 @@ EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
 EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
 INT_KVM_HANDLER 0x380, EXC_STD, PACA_EXSLB, 1
 EXC_COMMON_BEGIN(data_access_slb_common)
-	INT_COMMON 0x380, PACA_EXSLB, 1, 1
-	ld	r4,PACA_EXSLB+EX_DAR(r13)
-	std	r4,_DAR(r1)
+	INT_COMMON 0x380, PACA_EXSLB, 1, 1, 0, 1, 0
+	ld	r4,_DAR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
 	/* HPT case, do SLB fault */
@@ -1218,14 +1224,11 @@ EXC_VIRT_BEGIN(instruction_access, 0x4400, 0x80)
 EXC_VIRT_END(instruction_access, 0x4400, 0x80)
 INT_KVM_HANDLER 0x400, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(instruction_access_common)
-	INT_COMMON 0x400, PACA_EXGEN, 1, 1
-	RECONCILE_IRQ_STATE(r10, r11)
-	ld	r12,_MSR(r1)
-	ld	r3,_NIP(r1)
-	andis.	r4,r12,DSISR_SRR1_MATCH_64S@h
+	INT_COMMON 0x400, PACA_EXGEN, 1, 1, 1, 2, 2
+	ld      r12,_MSR(r1)
+	ld	r3,_DAR(r1)
+	ld	r4,_DSISR(r1)
 	li	r5,0x400
-	std	r3,_DAR(r1)
-	std	r4,_DSISR(r1)
 BEGIN_MMU_FTR_SECTION
 	b	do_hash_page		/* Try to handle as hpte fault */
 MMU_FTR_SECTION_ELSE
@@ -1241,8 +1244,8 @@ EXC_VIRT_BEGIN(instruction_access_slb, 0x4480, 0x80)
 EXC_VIRT_END(instruction_access_slb, 0x4480, 0x80)
 INT_KVM_HANDLER 0x480, EXC_STD, PACA_EXSLB, 0
 EXC_COMMON_BEGIN(instruction_access_slb_common)
-	INT_COMMON 0x480, PACA_EXSLB, 1, 1
-	ld	r4,_NIP(r1)
+	INT_COMMON 0x480, PACA_EXSLB, 1, 1, 0, 2, 0
+	ld	r4,_DAR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
 	/* HPT case, do SLB fault */
@@ -1258,7 +1261,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
 	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
-	ld	r4,_NIP(r1)
+	ld	r4,_DAR(r1)
 	ld	r5,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
@@ -1283,13 +1286,8 @@ EXC_VIRT_BEGIN(alignment, 0x4600, 0x100)
 EXC_VIRT_END(alignment, 0x4600, 0x100)
 INT_KVM_HANDLER 0x600, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(alignment_common)
-	INT_COMMON 0x600, PACA_EXGEN, 1, 1
-	ld	r3,PACA_EXGEN+EX_DAR(r13)
-	lwz	r4,PACA_EXGEN+EX_DSISR(r13)
-	std	r3,_DAR(r1)
-	std	r4,_DSISR(r1)
+	INT_COMMON 0x600, PACA_EXGEN, 1, 1, 1, 1, 1
 	bl	save_nvgprs
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	alignment_exception
 	b	ret_from_except
@@ -1329,9 +1327,8 @@ EXC_COMMON_BEGIN(program_check_common)
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
 	b 3f				/* Jump into the macro !!	*/
 2:
-	INT_COMMON 0x700, PACA_EXGEN, 1, 1
+	INT_COMMON 0x700, PACA_EXGEN, 1, 1, 1, 0, 0
 	bl	save_nvgprs
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	program_check_exception
 	b	ret_from_except
@@ -1345,7 +1342,7 @@ EXC_VIRT_BEGIN(fp_unavailable, 0x4800, 0x100)
 EXC_VIRT_END(fp_unavailable, 0x4800, 0x100)
 INT_KVM_HANDLER 0x800, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(fp_unavailable_common)
-	INT_COMMON 0x800, PACA_EXGEN, 1, 1
+	INT_COMMON 0x800, PACA_EXGEN, 1, 1, 0, 0, 0
 	bne	1f			/* if from user, just load it up */
 	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
@@ -1562,15 +1559,11 @@ EXC_VIRT_BEGIN(h_data_storage, 0x4e00, 0x20)
 EXC_VIRT_END(h_data_storage, 0x4e00, 0x20)
 INT_KVM_HANDLER 0xe00, EXC_HV, PACA_EXGEN, 1
 EXC_COMMON_BEGIN(h_data_storage_common)
-	INT_COMMON 0xe00, PACA_EXGEN, 1, 1
+	INT_COMMON 0xe00, PACA_EXGEN, 1, 1, 1, 1, 1
 	bl      save_nvgprs
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi    r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
-	ld	r4,PACA_EXGEN+EX_DAR(r13)
-	lwz	r5,PACA_EXGEN+EX_DSISR(r13)
-	std	r4,_DAR(r1)
-	std	r5,_DSISR(r1)
+	ld	r4,_DAR(r1)
 	li	r5,SIGSEGV
 	bl      bad_page_fault
 MMU_FTR_SECTION_ELSE
@@ -1618,7 +1611,7 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
 
 	/* We don't touch AMR here, we never go to virtual mode */
-	INT_COMMON 0xe60, PACA_EXGEN, 0, 0
+	INT_COMMON 0xe60, PACA_EXGEN, 0, 0, 0, 0, 0
 
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	hmi_exception_realmode
@@ -1637,11 +1630,10 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 	INT_HANDLER hmi_exception, 0xe60, 0, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
 
 EXC_COMMON_BEGIN(hmi_exception_common)
-	INT_COMMON 0xe60, PACA_EXGEN, 1, 1
+	INT_COMMON 0xe60, PACA_EXGEN, 1, 1, 1, 0, 0
 	FINISH_NAP
-	bl	save_nvgprs
-	RECONCILE_IRQ_STATE(r10, r11)
 	RUNLATCH_ON
+	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	handle_hmi_exception
 	b	ret_from_except
@@ -1695,7 +1687,7 @@ EXC_VIRT_BEGIN(altivec_unavailable, 0x4f20, 0x20)
 EXC_VIRT_END(altivec_unavailable, 0x4f20, 0x20)
 INT_KVM_HANDLER 0xf20, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(altivec_unavailable_common)
-	INT_COMMON 0xf20, PACA_EXGEN, 1, 1
+	INT_COMMON 0xf20, PACA_EXGEN, 1, 1, 0, 0, 0
 #ifdef CONFIG_ALTIVEC
 BEGIN_FTR_SECTION
 	beq	1f
@@ -1736,7 +1728,7 @@ EXC_VIRT_BEGIN(vsx_unavailable, 0x4f40, 0x20)
 EXC_VIRT_END(vsx_unavailable, 0x4f40, 0x20)
 INT_KVM_HANDLER 0xf40, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(vsx_unavailable_common)
-	INT_COMMON 0xf40, PACA_EXGEN, 1, 1
+	INT_COMMON 0xf40, PACA_EXGEN, 1, 1, 0, 0, 0
 #ifdef CONFIG_VSX
 BEGIN_FTR_SECTION
 	beq	1f
@@ -1987,9 +1979,8 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	mr	r10,r1
 	ld	r1,PACAEMERGSP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
-	INT_COMMON 0x900, PACA_EXGEN, 0, 1
+	INT_COMMON 0x900, PACA_EXGEN, 0, 1, 1, 0, 0
 	bl	save_nvgprs
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	soft_nmi_interrupt
 	b	ret_from_except
-- 
2.22.0

