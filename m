Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3ED16ED63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 19:00:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Rmtf1GVQzDqDf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:00:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rzCOXVcw; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmRG3P9JzDqNB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:40:10 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id j4so7228862pgi.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A2WATMxIBX6Lmrumy91t8BoQmgOnSibfXCVuSFcnTqA=;
 b=rzCOXVcw0uaIJxzREbjzOcrgEjGrzJohe2tOMC8eOyJLfevYsIBnTePs3/khicTiu8
 JKYjrPAUcxumcr53yuEw92+cJ4eQOPW8wZu6p6SzFAeURVcj9Tiu4hoBaglHBQa0VCUj
 iAa1L6X5EJbxx5fFSJrJ1vjYR76ejdhoD5/4HPrfEL1cmSpJSnLRWcT/PtVs5Aju7qML
 E6VYlb1YAgmHddcn69CJf0b4nUbtzEZsaCScMdvUsxCnOMZvfDPmG+mi0HVkxoPB2Fmo
 0x3BGO/oqs97AKYO4U1VQN85a5fSo8qG0yWlsH5sLhdIw0zTNUsAmD4N8AFdw5kjMAE6
 S5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A2WATMxIBX6Lmrumy91t8BoQmgOnSibfXCVuSFcnTqA=;
 b=LbZfhR7ZjVVyZqeMyFVYSbWBevemd58UfW7qpgE9Jjk6qylHwr8YQk2z0Mskl32HvD
 tliCiBR/wrgcpG3W0Bs+r21+DrC+knI6Ts3akzu+1sWaZIpHKmFdLcnRryyCVsq/zXk2
 fDgCxly5KNX2ejsMft6Im2n+VS6BBh1L4RT+gHJzToxB4EbuSJ02Zbbl6YNZaJywbzNi
 OWrTCzMWeqp0jo6co5srcQvu1+/3bMwxO10MMDtu22HvxrRvJ1Uzl1Kkp6PovwMu/NWh
 ghh5D0+K2TuMyH7wVBEjO2B31R0lh5a7Mm8/rEFQMNXkGIC7VdhNbkgDt4bIPGa+vwQe
 Y67Q==
X-Gm-Message-State: APjAAAVdP234sn5HQWxebBngjbAZciJEETbn+lCIAVGd9q3QjjsruLdb
 3YWVUl1bx9uD/EBmVVEleYsKz0Qw
X-Google-Smtp-Source: APXvYqwZJdnktUzA+S+W1DNwTr+GISGtopz/jzKNqQm6MXEptoYfP1hPM0DAt7p6dhPKR+Y8lsRJHg==
X-Received: by 2002:a63:3802:: with SMTP id f2mr57319380pga.395.1582652404822; 
 Tue, 25 Feb 2020 09:40:04 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:40:04 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 07/32] powerpc/64s/exception: Remove old INT_COMMON macro
Date: Wed, 26 Feb 2020 03:35:16 +1000
Message-Id: <20200225173541.1549955-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225173541.1549955-1-npiggin@gmail.com>
References: <20200225173541.1549955-1-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 51 +++++++++++++---------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 74bf6e0bf61f..90514766dc7d 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -591,8 +591,8 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
  * If stack=0, then the stack is already set in r1, and r1 is saved in r10.
  * PPR save and CPU accounting is not done for the !stack case (XXX why not?)
  */
-.macro INT_COMMON vec, area, stack, kuap, reconcile, dar, dsisr
-	.if \stack
+.macro GEN_COMMON name
+	.if ISTACK
 	andi.	r10,r12,MSR_PR		/* See if coming from user	*/
 	mr	r10,r1			/* Save r1			*/
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc frame on kernel stack	*/
@@ -609,54 +609,54 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	std	r0,GPR0(r1)		/* save r0 in stackframe	*/
 	std	r10,GPR1(r1)		/* save r1 in stackframe	*/
 
-	.if \stack
-	.if \kuap
+	.if ISTACK
+	.if IKUAP
 	kuap_save_amr_and_lock r9, r10, cr1, cr0
 	.endif
 	beq	101f			/* if from kernel mode		*/
 	ACCOUNT_CPU_USER_ENTRY(r13, r9, r10)
-	SAVE_PPR(\area, r9)
+	SAVE_PPR(IAREA, r9)
 101:
 	.else
-	.if \kuap
+	.if IKUAP
 	kuap_save_amr_and_lock r9, r10, cr1
 	.endif
 	.endif
 
 	/* Save original regs values from save area to stack frame. */
-	ld	r9,\area+EX_R9(r13)	/* move r9, r10 to stackframe	*/
-	ld	r10,\area+EX_R10(r13)
+	ld	r9,IAREA+EX_R9(r13)	/* move r9, r10 to stackframe	*/
+	ld	r10,IAREA+EX_R10(r13)
 	std	r9,GPR9(r1)
 	std	r10,GPR10(r1)
-	ld	r9,\area+EX_R11(r13)	/* move r11 - r13 to stackframe	*/
-	ld	r10,\area+EX_R12(r13)
-	ld	r11,\area+EX_R13(r13)
+	ld	r9,IAREA+EX_R11(r13)	/* move r11 - r13 to stackframe	*/
+	ld	r10,IAREA+EX_R12(r13)
+	ld	r11,IAREA+EX_R13(r13)
 	std	r9,GPR11(r1)
 	std	r10,GPR12(r1)
 	std	r11,GPR13(r1)
-	.if \dar
-	.if \dar == 2
+	.if IDAR
+	.if IDAR == 2
 	ld	r10,_NIP(r1)
 	.else
-	ld	r10,\area+EX_DAR(r13)
+	ld	r10,IAREA+EX_DAR(r13)
 	.endif
 	std	r10,_DAR(r1)
 	.endif
-	.if \dsisr
-	.if \dsisr == 2
+	.if IDSISR
+	.if IDSISR == 2
 	ld	r10,_MSR(r1)
 	lis	r11,DSISR_SRR1_MATCH_64S@h
 	and	r10,r10,r11
 	.else
-	lwz	r10,\area+EX_DSISR(r13)
+	lwz	r10,IAREA+EX_DSISR(r13)
 	.endif
 	std	r10,_DSISR(r1)
 	.endif
 BEGIN_FTR_SECTION_NESTED(66)
-	ld	r10,\area+EX_CFAR(r13)
+	ld	r10,IAREA+EX_CFAR(r13)
 	std	r10,ORIG_GPR3(r1)
 END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66)
-	GET_CTR(r10, \area)
+	GET_CTR(r10, IAREA)
 	std	r10,_CTR(r1)
 	std	r2,GPR2(r1)		/* save r2 in stackframe	*/
 	SAVE_4GPRS(3, r1)		/* save r3 - r6 in stackframe   */
@@ -668,26 +668,22 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66)
 	mfspr	r11,SPRN_XER		/* save XER in stackframe	*/
 	std	r10,SOFTE(r1)
 	std	r11,_XER(r1)
-	li	r9,(\vec)+1
+	li	r9,(IVEC)+1
 	std	r9,_TRAP(r1)		/* set trap number		*/
 	li	r10,0
 	ld	r11,exception_marker@toc(r2)
 	std	r10,RESULT(r1)		/* clear regs->result		*/
 	std	r11,STACK_FRAME_OVERHEAD-16(r1) /* mark the frame	*/
 
-	.if \stack
+	.if ISTACK
 	ACCOUNT_STOLEN_TIME
 	.endif
 
-	.if \reconcile
+	.if IRECONCILE
 	RECONCILE_IRQ_STATE(r10, r11)
 	.endif
 .endm
 
-.macro GEN_COMMON name
-	INT_COMMON IVEC, IAREA, ISTACK, IKUAP, IRECONCILE, IDAR, IDSISR
-.endm
-
 /*
  * Restore all registers including H/SRR0/1 saved in a stack frame of a
  * standard exception.
@@ -2387,7 +2383,8 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	mr	r10,r1
 	ld	r1,PACAEMERGSP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
-	INT_COMMON 0x900, PACA_EXGEN, 0, 1, 1, 0, 0
+	__ISTACK(decrementer)=0
+	GEN_COMMON decrementer
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	soft_nmi_interrupt
-- 
2.23.0

