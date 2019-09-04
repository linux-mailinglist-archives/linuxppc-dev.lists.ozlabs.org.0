Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D04FA825C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 14:31:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NjqP03YKzDqDq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 22:31:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lq/saor1"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nj3K2fr1zDqZ1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 21:56:45 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id x15so11126660pgg.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2019 04:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m+l1Grq/GpvGxObknNYWf2NTx7F5mqEfNnvBdY2uUio=;
 b=Lq/saor12mMDesmKv+EcMw+iwLzQELEiSz15imMC4eY0WW5TWkKvNXIc3WXA305f1I
 xGHV1IIcYvMNpY/ljYc6XwMo0avCPneF600Xttz360i2CoazAX90h1o1L8+snlt4iK56
 nxuhgvvY3eXjOQZ3yxG5BoQ36UTiJNZWSxUYiClX8miUdD10EWsxzIMZIzK5Mywe1WKS
 HEyUnw4rE6Wb8Q35lhCfS8yv6fre931Y1BgUQTp/LIcNUmcKoLl55W/qgUXdqWIurZL/
 oVZb9Mx/WfnHE/rY1Z8hm9UnN89INWxd5x9Do7AR/emXaGYZeZu1iwPBEc8VKA+CwBew
 QEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m+l1Grq/GpvGxObknNYWf2NTx7F5mqEfNnvBdY2uUio=;
 b=uG+8crDCD5etp9b6Vewkt5+VhfRdSm0n+P8KKe6zrpsHLyaM4G/pQ63H43HJzcXk2D
 SiQloKij4ClM6wYPr1/XpZe2pDn26HEsyg/zh1Mv149YvhVLugHLgzJ2ijoRWG865ryC
 +NNl2Y1w9BQumDkcNG4iYFbc7zF+nb5kgPhMGS0V2MFb45k5HtBBhoR1DFcX3xAsVUje
 3J0aL58GcEcAiPhovJQQXoBgSd8zvT3rvyjL0RcT+2yKEe17MnzntBx+ucC2MTAU0nZj
 tqnBX5gfZ4WpambDGNOejEwKvFf/BQF/WY0RIimBHAoVdwsR7G3ucOdy8jZZcOvlfcnQ
 p92Q==
X-Gm-Message-State: APjAAAU7+oFPPD/BuX9/rVG6wmtjhr3bOK+FxzNqDCDzaHLkfKLLSX+C
 GC1MBykWjzZd0aQuK06/lyZ6TLmc
X-Google-Smtp-Source: APXvYqwJ0QkZiIMOsqvRgpicQAafX36ZFEqVRzF0jC+s4pZ/CcXjZpIvXtVyMbxD6v30BILyjg60hw==
X-Received: by 2002:a17:90a:bb91:: with SMTP id
 v17mr4364231pjr.84.1567598202715; 
 Wed, 04 Sep 2019 04:56:42 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id g18sm19554789pgm.9.2019.09.04.04.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 04:56:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 14/20] powerpc/64s/exception: remove the SPR saving patch
 code macros
Date: Wed,  4 Sep 2019 21:55:29 +1000
Message-Id: <20190904115535.18559-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190904115535.18559-1-npiggin@gmail.com>
References: <20190904115535.18559-1-npiggin@gmail.com>
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

These are used infrequently enough they don't provide much help, so
inline them.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 82 ++++++++++------------------
 1 file changed, 28 insertions(+), 54 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index c46e4911cff6..2705fd84accd 100644
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
@@ -550,7 +518,10 @@ DEFINE_FIXED_SYMBOL(\name\()_common_virt)
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
@@ -590,10 +561,10 @@ DEFINE_FIXED_SYMBOL(\name\()_common_virt)
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
@@ -1688,10 +1659,10 @@ TRAMP_REAL_BEGIN(system_call_kvm)
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
@@ -2246,7 +2217,10 @@ denorm_done:
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
2.22.0

