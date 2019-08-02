Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 124857F67E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 14:07:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460Qrv4G1hzDqJ2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 22:07:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JSqg+jxG"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PN34YZnzDqXX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:00:51 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id a93so33461220pla.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KVtu+A6BXsgzeQYDX+GRpbBIAnEKupkzDi8ewqNk3j0=;
 b=JSqg+jxGwywYD1RW+Qnnr+x/Th7DEI0iUWYOiMpeB1UukZRFlPcOXhO6lQ2YxwxUcU
 oAtvyKIFURRvORyFK9ImATaGz5boM1tvVgu/jzQn3rz6OmjWEp76noI1oOo0SndsYdy4
 1joitegVMTp/xdNPsZHJ7Be3wGTxl33dRdj+x+hbXGSHKY2FNSvnktsqAeTpr+fKwmAc
 97S+q5AFJ/CRSao6TavAehTtI9zaq6cgklGYVwrEMvLKGJ+Ja5wTdKX5bAWnBubdUxHJ
 8UKwfjz8x7az4Pq7MimghaA/ND9iDRcCt2nBVo2XE9B0ykpXv9WlkS3hjslXC1lCk0nB
 8s2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KVtu+A6BXsgzeQYDX+GRpbBIAnEKupkzDi8ewqNk3j0=;
 b=ove4vf/9bymhjQ8BIUX++yznk35VDvWEfVk0OUrCjGOVHw7mUnxlHDh5Kb0fgCb6M4
 XFVvuiZzqd0L+s9M6WTkRb/g7+uGvAAJ7LjR6kvscQNxRcM9+kZIB19mvH9o/ymA0oGH
 56CIr/Lnnc+GJwh5692D81goD0jHBZBN51fm6muAjXhBmuHP9y6HHBP9AS9q+1ZkOJcW
 YS/F/fW2OOWFVRpD0ezTGMUUqFApoF5yMkGJFe1ZPCukadR1utOdJpxUxuh5ArVt5JlC
 nvCWBf/MWKZyjJTKof327zwMVXN9gM6yXQZ88dHua5Aslof5hI8y9yaMIqyOrvd/yUFw
 vLLw==
X-Gm-Message-State: APjAAAXwLnHjezBXC3DVxqiyrs2T4ATubmvM8Vij8U6Gkz9qthOwlmLG
 bhPJ44P2Kv6GrflLRWS7sRYv5lrTBp8=
X-Google-Smtp-Source: APXvYqyyaWWdpVJS4XMMpCukPTf7hQcyaXY2LEEJGQZGA0uSvsvnXZTK7uPmFUSjtppuzPlI9FKIIA==
X-Received: by 2002:a17:902:110b:: with SMTP id
 d11mr136399538pla.213.1564743649047; 
 Fri, 02 Aug 2019 04:00:49 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.00.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:00:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 29/44] powerpc/64s/exception: Add INT_COMMON gas macro to
 generate common exception code
Date: Fri,  2 Aug 2019 20:56:54 +1000
Message-Id: <20190802105709.27696-30-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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
index 2b07dc49d14d..0781e3573a0e 100644
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

