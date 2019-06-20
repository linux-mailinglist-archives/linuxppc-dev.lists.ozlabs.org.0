Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AE84C73F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:09:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Trxs4GnFzDr3t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:09:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="df+3yGiT"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqlx2FhPzDqw4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:15:57 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id q10so957289pff.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mJ/llcbKS2JS9OhsKK+PVwGrvrVTXD2YaS4afOkaTSs=;
 b=df+3yGiTMlnBYTrf40Tk9Sggj2SDcDc2OPAhhkY+x6gKh2wSjp2i9qCWiUsc6XaHX7
 v4ZQMHeODfS8t6Awe1odUp9AfydAJsqyMLIGhBPBUKOMmeizd3kR3q8rHSQmwBxyF3lU
 Knck2jUay8i8E6NSvnVRR8/DEPtmRtyCbV2PysrDgaCzplZ1JZMGAPh3UfnFU8t1fEu5
 wGOZGkVEBMWloCquce9LHs05DMdEQ79ZeDz1qGr57sAnGUJJpaQvMGwIlfgNUXAdZkw2
 aHl6RbV0XR1Fwi6tuRJoVsRW1fZPXtWcb4avLcJcgN1rwj+iaWJrK+V63e8vZIPrS06V
 uafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mJ/llcbKS2JS9OhsKK+PVwGrvrVTXD2YaS4afOkaTSs=;
 b=sXS6ZVF4x0Of5L+M9UGKtu62O+VOSdvH/PnSasno6EyVJtIyOZpdfJ/kslWw3Ar0ZT
 MZoh7XQ4Yyxiw27TUHCxybDQPG9gO7H+QwTvxiBN53BMqi9Z9wgj4+0EYY3M2B38mpch
 EWEDu84u/qVh+d1b0vF4wkZq447ggJwkyC/8bX3SmzMzVrcegE2gNqtW4gnh9PeR9NRs
 ebc0gNAgdrdNYw90m+HMv8skuSjvNAbEKUt9GhiyRKrPcEdXtbvg5q/dpT+QABr/HXY7
 kJCcYKphjxsF/DF8Bn0Y2eNDweSPHrs7fjA+1GS5a3IHa6qhevMr9i6eDpdtKH6yXHo7
 +XVA==
X-Gm-Message-State: APjAAAV3cKMeUcTMlCiA0yYH3sgynx7L3Ts2J3ykfkIgdX15zDigsQ2u
 TWMGz8AXJJEZvB89/yidcjZ2Ai21
X-Google-Smtp-Source: APXvYqyWyoyRdVjq8z5zUBUkcfG3SJ3QJUzUa3mz5RloRBi/btlAG0ysHlmPL6dvafaIJNV/W4+CZg==
X-Received: by 2002:a63:e649:: with SMTP id p9mr11129394pgj.276.1561007755385; 
 Wed, 19 Jun 2019 22:15:55 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.15.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:15:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 26/52] powerpc/64s/exception: remove pointless
 EXCEPTION_PROLOG macro indirection
Date: Thu, 20 Jun 2019 15:14:33 +1000
Message-Id: <20190620051459.29573-27-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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
 arch/powerpc/kernel/exceptions-64s.S | 97 +++++++++++++---------------
 1 file changed, 45 insertions(+), 52 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 6c0321e128da..4b4bb8f43f55 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -326,34 +326,6 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
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
-1:	tdgei	r1,-INT_FRAME_SIZE;	/* trap if r1 is in userspace	*/ \
-	EMIT_BUG_ENTRY 1b,__FILE__,__LINE__,0;				   \
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
@@ -373,7 +345,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);			   \
 	GET_CTR(r10, area);						   \
 	std	r10,_CTR(r1);
 
-#define EXCEPTION_PROLOG_COMMON_3(n)					   \
+#define EXCEPTION_PROLOG_COMMON_3(trap)					   \
 	std	r2,GPR2(r1);		/* save r2 in stackframe	*/ \
 	SAVE_4GPRS(3, r1);		/* save r3 - r6 in stackframe   */ \
 	SAVE_2GPRS(7, r1);		/* save r7, r8 in stackframe	*/ \
@@ -384,26 +356,38 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66);			   \
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
-
-#define EXCEPTION_COMMON(area, trap)				\
-	EXCEPTION_PROLOG_COMMON(trap, area);			\
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
+1:	tdgei	r1,-INT_FRAME_SIZE;	/* trap if r1 is in userspace	*/ \
+	EMIT_BUG_ENTRY 1b,__FILE__,__LINE__,0;				   \
+3:	EXCEPTION_PROLOG_COMMON_1();					   \
+	kuap_save_amr_and_lock r9, r10, cr1, cr0;			   \
+	beq	4f;			/* if from kernel mode		*/ \
+	ACCOUNT_CPU_USER_ENTRY(r13, r9, r10);				   \
+	SAVE_PPR(area, r9);						   \
+4:	EXCEPTION_PROLOG_COMMON_2(area)					   \
+	EXCEPTION_PROLOG_COMMON_3(trap)					   \
+	ACCOUNT_STOLEN_TIME
 
 /*
- * Exception where stack is already set in r1, r1 is saved in r10
+ * Exception where stack is already set in r1, r1 is saved in r10.
+ * PPR save and CPU accounting is not done (for some reason).
  */
 #define EXCEPTION_COMMON_STACK(area, trap)			\
 	EXCEPTION_PROLOG_COMMON_1();				\
@@ -411,6 +395,15 @@ END_FTR_SECTION_IFSET(CPU_FTR_CTRL)
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
@@ -1042,7 +1035,7 @@ EXC_COMMON_BEGIN(machine_check_common)
 	std	r10,PACA_EXMC+EX_DAR(r13)
 	mfspr	r10,SPRN_DSISR
 	stw	r10,PACA_EXMC+EX_DSISR(r13)
-	EXCEPTION_PROLOG_COMMON(0x200, PACA_EXMC)
+	EXCEPTION_COMMON(PACA_EXMC, 0x200)
 	FINISH_NAP
 	RECONCILE_IRQ_STATE(r10, r11)
 	ld	r3,PACA_EXMC+EX_DAR(r13)
@@ -1293,7 +1286,7 @@ EXC_COMMON_BEGIN(data_access_common)
 	 * r9 - r13 are saved in paca->exgen.
 	 * EX_DAR and EX_DSISR have saved DAR/DSISR
 	 */
-	EXCEPTION_PROLOG_COMMON(0x300, PACA_EXGEN)
+	EXCEPTION_COMMON(PACA_EXGEN, 0x300)
 	RECONCILE_IRQ_STATE(r10, r11)
 	ld	r12,_MSR(r1)
 	ld	r3,PACA_EXGEN+EX_DAR(r13)
@@ -1332,7 +1325,7 @@ EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
 TRAMP_KVM_SKIP(PACA_EXSLB, 0x380)
 
 EXC_COMMON_BEGIN(data_access_slb_common)
-	EXCEPTION_PROLOG_COMMON(0x380, PACA_EXSLB)
+	EXCEPTION_COMMON(PACA_EXSLB, 0x380)
 	ld	r4,PACA_EXSLB+EX_DAR(r13)
 	std	r4,_DAR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -1362,7 +1355,7 @@ EXC_VIRT(instruction_access, 0x4400, 0x80, 0x400)
 TRAMP_KVM(PACA_EXGEN, 0x400)
 
 EXC_COMMON_BEGIN(instruction_access_common)
-	EXCEPTION_PROLOG_COMMON(0x400, PACA_EXGEN)
+	EXCEPTION_COMMON(PACA_EXGEN, 0x400)
 	RECONCILE_IRQ_STATE(r10, r11)
 	ld	r12,_MSR(r1)
 	ld	r3,_NIP(r1)
@@ -1382,7 +1375,7 @@ __EXC_VIRT(instruction_access_slb, 0x4480, 0x80, 0x480, PACA_EXSLB)
 TRAMP_KVM(PACA_EXSLB, 0x480)
 
 EXC_COMMON_BEGIN(instruction_access_slb_common)
-	EXCEPTION_PROLOG_COMMON(0x480, PACA_EXSLB)
+	EXCEPTION_COMMON(PACA_EXSLB, 0x480)
 	ld	r4,_NIP(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
@@ -1459,7 +1452,7 @@ EXC_VIRT_END(alignment, 0x4600, 0x100)
 
 TRAMP_KVM(PACA_EXGEN, 0x600)
 EXC_COMMON_BEGIN(alignment_common)
-	EXCEPTION_PROLOG_COMMON(0x600, PACA_EXGEN)
+	EXCEPTION_COMMON(PACA_EXGEN, 0x600)
 	ld	r3,PACA_EXGEN+EX_DAR(r13)
 	lwz	r4,PACA_EXGEN+EX_DSISR(r13)
 	std	r3,_DAR(r1)
@@ -1501,7 +1494,7 @@ EXC_COMMON_BEGIN(program_check_common)
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
 	b 3f				/* Jump into the macro !!	*/
 2:
-	EXCEPTION_PROLOG_COMMON(0x700, PACA_EXGEN)
+	EXCEPTION_COMMON(PACA_EXGEN, 0x700)
 	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -1513,7 +1506,7 @@ EXC_REAL(fp_unavailable, 0x800, 0x100)
 EXC_VIRT(fp_unavailable, 0x4800, 0x100, 0x800)
 TRAMP_KVM(PACA_EXGEN, 0x800)
 EXC_COMMON_BEGIN(fp_unavailable_common)
-	EXCEPTION_PROLOG_COMMON(0x800, PACA_EXGEN)
+	EXCEPTION_COMMON(PACA_EXGEN, 0x800)
 	bne	1f			/* if from user, just load it up */
 	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
@@ -1726,7 +1719,7 @@ EXC_COMMON_BEGIN(h_data_storage_common)
 	std     r10,PACA_EXGEN+EX_DAR(r13)
 	mfspr   r10,SPRN_HDSISR
 	stw     r10,PACA_EXGEN+EX_DSISR(r13)
-	EXCEPTION_PROLOG_COMMON(0xe00, PACA_EXGEN)
+	EXCEPTION_COMMON(PACA_EXGEN, 0xe00)
 	bl      save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi    r3,r1,STACK_FRAME_OVERHEAD
@@ -1858,7 +1851,7 @@ EXC_REAL_OOL(altivec_unavailable, 0xf20, 0x20)
 EXC_VIRT_OOL(altivec_unavailable, 0x4f20, 0x20, 0xf20)
 TRAMP_KVM(PACA_EXGEN, 0xf20)
 EXC_COMMON_BEGIN(altivec_unavailable_common)
-	EXCEPTION_PROLOG_COMMON(0xf20, PACA_EXGEN)
+	EXCEPTION_COMMON(PACA_EXGEN, 0xf20)
 #ifdef CONFIG_ALTIVEC
 BEGIN_FTR_SECTION
 	beq	1f
@@ -1895,7 +1888,7 @@ EXC_REAL_OOL(vsx_unavailable, 0xf40, 0x20)
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

