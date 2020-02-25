Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B18C916EDD4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 19:19:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RnJQ08FzzDqCs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:19:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uLAb9lAU; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmRb1J06zDqN6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:40:27 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id y8so60235pll.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mMThGSTd+ZXp76/mBOEgSpCFnjmCl4F2LTgOAc7ziTE=;
 b=uLAb9lAUVqUsSBFNi/B6Y30vHxooyWMtEnyFkwA1EgszVbooD2jEu2+RPnH9193ASF
 PYYhwcxo0nbOMUDkBcn7874Qo/6L6hxcib/TsXKhpNG2EsxJQC3oMfojC82qqUPsJsGE
 EVGWObBKGLmhoZK7wnTxG3Qej/q6JxfSdCaIk0NSI0T/mLpbdPdgp22fN35afEHLtlKI
 3T9Qd8HNzqbuDgTuMlTX0Eb93Ey0E4nAJL1KVQKrQls7hALfeij3F47i8hiG0aEK0O5M
 UUxrfqoRkCL6QKNkp523+OUscYnnEyrcZiRsZ+UXz40kKgiTJnnq29AsNEiNfWtVZeD2
 Lrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mMThGSTd+ZXp76/mBOEgSpCFnjmCl4F2LTgOAc7ziTE=;
 b=H3rv5Nec/fhZgBokmFpM21UUoNmTgbLvO6EWg+Eb1KT4E49o7itBDnAjKNZneZO7RT
 o8ljWyA4DDY0BdSgLItwep8oBOfkAyfJk2ZvDm6hEzG9KzE7GICQryj9C0UOxi98/O5m
 2xgoAIrFLNCTg5edvcD0B9Devmb36xEuago9kV/8vsEJqDApkz1gGyXjc/gBBy3DnvMn
 PpbPmFIKhdsETYkwlplz4dJAcxJG1FxoVGR2iIyNbM3qFxll2+AZvnMXbNOCf7k5iq3o
 LYx2Ze+6yOvzT/Qbu9Xd8hFo3axqFXLB773RUTwi10J8/19LqWJyvL35a0MuSxJMj9lL
 5dpg==
X-Gm-Message-State: APjAAAUeH3v//fbavtlqWJ9hFpMgS7ApXq+W2Nxcyr7QKEwc7lE9NnSj
 +p3ocuP5fiNVA4+Y0qPJ4TjeMGVb
X-Google-Smtp-Source: APXvYqz8p/0lm5f5PN1joI0P1z7qv3KjhCk3AuJIvj9L5Kf/wApUJJcWcm6PPvWsBVFhroQoNgkXeQ==
X-Received: by 2002:a17:902:bf41:: with SMTP id
 u1mr55478283pls.207.1582652424481; 
 Tue, 25 Feb 2020 09:40:24 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:40:24 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 14/32] powerpc/64s/exception: remove the SPR saving patch
 code macros
Date: Wed, 26 Feb 2020 03:35:23 +1000
Message-Id: <20200225173541.1549955-15-npiggin@gmail.com>
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

These are used infrequently enough they don't provide much help, so
inline them.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 82 ++++++++++------------------
 1 file changed, 28 insertions(+), 54 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index f4f35d01fe00..feb563416abd 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -110,46 +110,6 @@ name:
 #define EXC_HV		1
 #define EXC_STD		0
 
-/*
- * PPR save/restore macros used in exceptions-64s.S
- * Used for P7 or later processors
- */
-#define SAVE_PPR(area, ra)						\
-BEGIN_FTR_SECTION_NESTED(940)						\
-	ld	ra,area+EX_PPR(r13);	/* Read PPR from paca */	\
-	std	ra,_PPR(r1);						\
-END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,940)
-
-#define RESTORE_PPR_PACA(area, ra)					\
-BEGIN_FTR_SECTION_NESTED(941)						\
-	ld	ra,area+EX_PPR(r13);					\
-	mtspr	SPRN_PPR,ra;						\
-END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,941)
-
-/*
- * Get an SPR into a register if the CPU has the given feature
- */
-#define OPT_GET_SPR(ra, spr, ftr)					\
-BEGIN_FTR_SECTION_NESTED(943)						\
-	mfspr	ra,spr;							\
-END_FTR_SECTION_NESTED(ftr,ftr,943)
-
-/*
- * Set an SPR from a register if the CPU has the given feature
- */
-#define OPT_SET_SPR(ra, spr, ftr)					\
-BEGIN_FTR_SECTION_NESTED(943)						\
-	mtspr	spr,ra;							\
-END_FTR_SECTION_NESTED(ftr,ftr,943)
-
-/*
- * Save a register to the PACA if the CPU has the given feature
- */
-#define OPT_SAVE_REG_TO_PACA(offset, ra, ftr)				\
-BEGIN_FTR_SECTION_NESTED(943)						\
-	std	ra,offset(r13);						\
-END_FTR_SECTION_NESTED(ftr,ftr,943)
-
 /*
  * Branch to label using its 0xC000 address. This results in instruction
  * address suitable for MSR[IR]=0 or 1, which allows relocation to be turned
@@ -278,18 +238,18 @@ do_define_int n
 	cmpwi	r10,KVM_GUEST_MODE_SKIP
 	beq	89f
 	.else
-BEGIN_FTR_SECTION_NESTED(947)
+BEGIN_FTR_SECTION
 	ld	r10,IAREA+EX_CFAR(r13)
 	std	r10,HSTATE_CFAR(r13)
-END_FTR_SECTION_NESTED(CPU_FTR_CFAR,CPU_FTR_CFAR,947)
+END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	.endif
 
 	ld	r10,PACA_EXGEN+EX_CTR(r13)
 	mtctr	r10
-BEGIN_FTR_SECTION_NESTED(948)
+BEGIN_FTR_SECTION
 	ld	r10,IAREA+EX_PPR(r13)
 	std	r10,HSTATE_PPR(r13)
-END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	ld	r11,IAREA+EX_R11(r13)
 	ld	r12,IAREA+EX_R12(r13)
 	std	r12,HSTATE_SCRATCH0(r13)
@@ -386,10 +346,14 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	SET_SCRATCH0(r13)			/* save r13 */
 	GET_PACA(r13)
 	std	r9,IAREA+EX_R9(r13)		/* save r9 */
-	OPT_GET_SPR(r9, SPRN_PPR, CPU_FTR_HAS_PPR)
+BEGIN_FTR_SECTION
+	mfspr	r9,SPRN_PPR
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	HMT_MEDIUM
 	std	r10,IAREA+EX_R10(r13)		/* save r10 - r12 */
-	OPT_GET_SPR(r10, SPRN_CFAR, CPU_FTR_CFAR)
+BEGIN_FTR_SECTION
+	mfspr	r10,SPRN_CFAR
+END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	.if \ool
 	.if !\virt
 	b	tramp_real_\name
@@ -402,8 +366,12 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	.endif
 	.endif
 
-	OPT_SAVE_REG_TO_PACA(IAREA+EX_PPR, r9, CPU_FTR_HAS_PPR)
-	OPT_SAVE_REG_TO_PACA(IAREA+EX_CFAR, r10, CPU_FTR_CFAR)
+BEGIN_FTR_SECTION
+	std	r9,IAREA+EX_PPR(r13)
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
+BEGIN_FTR_SECTION
+	std	r10,IAREA+EX_CFAR(r13)
+END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	INTERRUPT_TO_KERNEL
 	mfctr	r10
 	std	r10,IAREA+EX_CTR(r13)
@@ -558,7 +526,10 @@ DEFINE_FIXED_SYMBOL(\name\()_common_virt)
 	.endif
 	beq	101f			/* if from kernel mode		*/
 	ACCOUNT_CPU_USER_ENTRY(r13, r9, r10)
-	SAVE_PPR(IAREA, r9)
+BEGIN_FTR_SECTION
+	ld	r9,IAREA+EX_PPR(r13)	/* Read PPR from paca		*/
+	std	r9,_PPR(r1)
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 101:
 	.else
 	.if IKUAP
@@ -598,10 +569,10 @@ DEFINE_FIXED_SYMBOL(\name\()_common_virt)
 	std	r10,_DSISR(r1)
 	.endif
 
-BEGIN_FTR_SECTION_NESTED(66)
+BEGIN_FTR_SECTION
 	ld	r10,IAREA+EX_CFAR(r13)
 	std	r10,ORIG_GPR3(r1)
-END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66)
+END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	ld	r10,IAREA+EX_CTR(r13)
 	std	r10,_CTR(r1)
 	std	r2,GPR2(r1)		/* save r2 in stackframe	*/
@@ -1683,10 +1654,10 @@ TRAMP_REAL_BEGIN(system_call_kvm)
 	  * HMT_MEDIUM. That allows the KVM code to save that value into the
 	  * guest state (it is the guest's PPR value).
 	  */
-BEGIN_FTR_SECTION_NESTED(948)
+BEGIN_FTR_SECTION
 	mfspr	r10,SPRN_PPR
 	std	r10,HSTATE_PPR(r13)
-END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	HMT_MEDIUM
 	mfctr	r10
 	SET_SCRATCH0(r10)
@@ -2241,7 +2212,10 @@ denorm_done:
 	mtspr	SPRN_HSRR0,r11
 	mtcrf	0x80,r9
 	ld	r9,PACA_EXGEN+EX_R9(r13)
-	RESTORE_PPR_PACA(PACA_EXGEN, r10)
+BEGIN_FTR_SECTION
+	ld	r10,PACA_EXGEN+EX_PPR(r13)
+	mtspr	SPRN_PPR,r10
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 BEGIN_FTR_SECTION
 	ld	r10,PACA_EXGEN+EX_CFAR(r13)
 	mtspr	SPRN_CFAR,r10
-- 
2.23.0

