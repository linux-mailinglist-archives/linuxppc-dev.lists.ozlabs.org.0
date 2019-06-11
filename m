Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D8A3D009
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 16:59:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NY6s1tffzDqdq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 00:59:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nepg1oML"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXYz1l86zDqbv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:33:59 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id p1so5218261plo.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ya0v+vVMxwvxx8bOwTfUZ3c57b5Tx81IVu+uIz5T2Vw=;
 b=nepg1oMLhp/T0DAu5fS58n55keQ99BkI7WuG0HegZh1KWlBZ2A9QcdruBMEkwn9I58
 WGpiq6LVY6DpFMdLf0ZREdWXkCmwtQwe1NAtoFubtMHoBT/wjZN0MMOuo4nLEzfQCWsU
 nwzECWYeHwD7NtGBJbIM75quGFH+2Jeqp8A2ZrSDCc1UjLoqqsjaAiu7yoS6HuXe+L4+
 fuFix8XLBh/pJo7yOf13eazPFJ6PIoIzuumInjW7NrnmzBmZSLj/k1DWC7AXWwZI/zH/
 4itnx/6iK36MFxhjpPOx5xFvTfCjA54pAZJCCW4rJEWJGdoMIeiVvq/fx1VgjXf3kYnv
 GOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ya0v+vVMxwvxx8bOwTfUZ3c57b5Tx81IVu+uIz5T2Vw=;
 b=Yj+8oFwL0x5wY11NB2r2y5CrdO729XASZP8zS6T1nbRTqlr9GPTZkVeOBnOdNeWiYC
 EGNELYe/DrMTs9e08xuq9xHi1YePAl3oxeotBgxmhYac3Rt5QPlSV0lo8ZVT64RGZPgF
 UJGc2DTxw3YxB0tIVi5bjKRBqE93hfHpIkUntt2vw2hWb67mSvAIerwTgqAjcyDf2Hjf
 vbpcvXaHsZfNPmYdbu8bAO753+8SuQEjaaR1+iyL+dtsE5xmqBT7BuBUC0GUPrKa46tr
 XPOOVaeUtOEv0vVdf/ekM8RCd3VxHqA5+XwR35pwvTb0QpjkMgwRr70CjGv1NcoLNtJJ
 zk6A==
X-Gm-Message-State: APjAAAV1kDjeWmRMH+jl364Ze7v5gjVknzqD9Wlt1EGqpiz6/oxr4f9N
 uKPhueqqf2CadkuWA85S/dSh/cJM
X-Google-Smtp-Source: APXvYqwr1jG07Mm56ymSbTE54IhMYPKfxrNV//Ek9DGbysSa5wJi9YGpXchafqyy7Yx8jpavBev2RQ==
X-Received: by 2002:a17:902:5984:: with SMTP id
 p4mr7409676pli.280.1560263636548; 
 Tue, 11 Jun 2019 07:33:56 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.33.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:33:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/28] powerpc/64s/exception: consolidate maskable and
 non-maskable prologs
Date: Wed, 12 Jun 2019 00:30:19 +1000
Message-Id: <20190611143040.7834-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611143040.7834-1-npiggin@gmail.com>
References: <20190611143040.7834-1-npiggin@gmail.com>
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

Conditionally expand the soft-masking test if a mask is passed in.

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 113 +++++++++--------------
 arch/powerpc/kernel/exceptions-64s.S     |  20 ++--
 2 files changed, 55 insertions(+), 78 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index e1b449e2c9ea..74ddcb37156c 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -234,7 +234,7 @@
 #define EXCEPTION_RELON_PROLOG(area, label, hsrr, kvm, vec)		\
 	SET_SCRATCH0(r13);		/* save r13 */			\
 	EXCEPTION_PROLOG_0(area);					\
-	EXCEPTION_PROLOG_1 hsrr, area, kvm, vec ;			\
+	EXCEPTION_PROLOG_1 hsrr, area, kvm, vec, 0 ;			\
 	EXCEPTION_PROLOG_2_VIRT label, hsrr
 
 /* Exception register prefixes */
@@ -305,73 +305,50 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	std	r10,area+EX_R10(r13);	/* save r10 - r12 */		\
 	OPT_GET_SPR(r10, SPRN_CFAR, CPU_FTR_CFAR)
 
-#define __EXCEPTION_PROLOG_1_PRE(area)					\
-	OPT_SAVE_REG_TO_PACA(area+EX_PPR, r9, CPU_FTR_HAS_PPR);		\
-	OPT_SAVE_REG_TO_PACA(area+EX_CFAR, r10, CPU_FTR_CFAR);		\
-	INTERRUPT_TO_KERNEL;						\
-	SAVE_CTR(r10, area);						\
+.macro EXCEPTION_PROLOG_1 hsrr, area, kvm, vec, bitmask
+	OPT_SAVE_REG_TO_PACA(\area\()+EX_PPR, r9, CPU_FTR_HAS_PPR)
+	OPT_SAVE_REG_TO_PACA(\area\()+EX_CFAR, r10, CPU_FTR_CFAR)
+	INTERRUPT_TO_KERNEL
+	SAVE_CTR(r10, \area\())
 	mfcr	r9
-
-#define __EXCEPTION_PROLOG_1_POST(area)					\
-	std	r11,area+EX_R11(r13);					\
-	std	r12,area+EX_R12(r13);					\
-	GET_SCRATCH0(r10);						\
-	std	r10,area+EX_R13(r13)
-
-/*
- * This version of the EXCEPTION_PROLOG_1 will carry
- * addition parameter called "bitmask" to support
- * checking of the interrupt maskable level.
- * Intended to be used in MASKABLE_EXCPETION_* macros.
- */
-.macro MASKABLE_EXCEPTION_PROLOG_1 hsrr, area, kvm, vec, bitmask
-	__EXCEPTION_PROLOG_1_PRE(\area\())
 	.if \kvm
 		KVMTEST \hsrr \vec
 	.endif
-
-	lbz	r10,PACAIRQSOFTMASK(r13)
-	andi.	r10,r10,\bitmask
-	/* This associates vector numbers with bits in paca->irq_happened */
-	.if \vec == 0x500 || \vec == 0xea0
-	li	r10,PACA_IRQ_EE
-	.elseif \vec == 0x900 || \vec == 0xea0
-	li	r10,PACA_IRQ_DEC
-	.elseif \vec == 0xa00 || \vec == 0xe80
-	li	r10,PACA_IRQ_DBELL
-	.elseif \vec == 0xe60
-	li	r10,PACA_IRQ_HMI
-	.elseif \vec == 0xf00
-	li	r10,PACA_IRQ_PMI
-	.else
-	.abort "Bad maskable vector"
+	.if \bitmask
+		lbz	r10,PACAIRQSOFTMASK(r13)
+		andi.	r10,r10,\bitmask
+		/* Associate vector numbers with bits in paca->irq_happened */
+		.if \vec == 0x500 || \vec == 0xea0
+		li	r10,PACA_IRQ_EE
+		.elseif \vec == 0x900 || \vec == 0xea0
+		li	r10,PACA_IRQ_DEC
+		.elseif \vec == 0xa00 || \vec == 0xe80
+		li	r10,PACA_IRQ_DBELL
+		.elseif \vec == 0xe60
+		li	r10,PACA_IRQ_HMI
+		.elseif \vec == 0xf00
+		li	r10,PACA_IRQ_PMI
+		.else
+		.abort "Bad maskable vector"
+		.endif
+
+		.if \hsrr
+		bne	masked_Hinterrupt
+		.else
+		bne	masked_interrupt
+		.endif
 	.endif
 
-	.if \hsrr
-	bne	masked_Hinterrupt
-	.else
-	bne	masked_interrupt
-	.endif
-
-	__EXCEPTION_PROLOG_1_POST(\area\())
-.endm
-
-/*
- * This version of the EXCEPTION_PROLOG_1 is intended
- * to be used in STD_EXCEPTION* macros
- */
-.macro EXCEPTION_PROLOG_1 hsrr, area, kvm, vec
-	__EXCEPTION_PROLOG_1_PRE(\area\())
-	.if \kvm
-		KVMTEST \hsrr \vec
-	.endif
-	__EXCEPTION_PROLOG_1_POST(\area\())
+	std	r11,\area\()+EX_R11(r13)
+	std	r12,\area\()+EX_R12(r13)
+	GET_SCRATCH0(r10)
+	std	r10,\area\()+EX_R13(r13)
 .endm
 
 #define EXCEPTION_PROLOG(area, label, hsrr, kvm, vec)			\
 	SET_SCRATCH0(r13);		/* save r13 */			\
 	EXCEPTION_PROLOG_0(area);					\
-	EXCEPTION_PROLOG_1 hsrr, area, kvm, vec ;			\
+	EXCEPTION_PROLOG_1 hsrr, area, kvm, vec, 0 ;			\
 	EXCEPTION_PROLOG_2_REAL label, hsrr, 1
 
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
@@ -440,7 +417,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 /* Do not enable RI */
 #define EXCEPTION_PROLOG_NORI(area, label, hsrr, kvm, vec)		\
 	EXCEPTION_PROLOG_0(area);					\
-	EXCEPTION_PROLOG_1 hsrr, area, kvm, vec ;			\
+	EXCEPTION_PROLOG_1 hsrr, area, kvm, vec, 0 ;			\
 	EXCEPTION_PROLOG_2_REAL label, hsrr, 0
 
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
@@ -595,14 +572,14 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	b hdlr
 
 #define STD_EXCEPTION_OOL(vec, label)				\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec ;	\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, 0 ;	\
 	EXCEPTION_PROLOG_2_REAL label, EXC_STD, 1
 
 #define STD_EXCEPTION_HV(loc, vec, label)			\
 	EXCEPTION_PROLOG(PACA_EXGEN, label, EXC_HV, 1, vec)
 
 #define STD_EXCEPTION_HV_OOL(vec, label)			\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec ;		\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, 0 ;	\
 	EXCEPTION_PROLOG_2_REAL label, EXC_HV, 1
 
 #define STD_RELON_EXCEPTION(loc, vec, label)		\
@@ -610,54 +587,54 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	EXCEPTION_RELON_PROLOG(PACA_EXGEN, label, EXC_STD, 0, vec)
 
 #define STD_RELON_EXCEPTION_OOL(vec, label)			\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, vec ;	\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, vec, 0 ;	\
 	EXCEPTION_PROLOG_2_VIRT label, EXC_STD
 
 #define STD_RELON_EXCEPTION_HV(loc, vec, label)			\
 	EXCEPTION_RELON_PROLOG(PACA_EXGEN, label, EXC_HV, 1, vec)
 
 #define STD_RELON_EXCEPTION_HV_OOL(vec, label)			\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec;		\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, 0 ;	\
 	EXCEPTION_PROLOG_2_VIRT label, EXC_HV
 
 #define __MASKABLE_EXCEPTION(vec, label, hsrr, kvm, bitmask)		\
 	SET_SCRATCH0(r13);    /* save r13 */				\
 	EXCEPTION_PROLOG_0(PACA_EXGEN);					\
-	MASKABLE_EXCEPTION_PROLOG_1 hsrr, PACA_EXGEN, kvm, vec, bitmask ; \
+	EXCEPTION_PROLOG_1 hsrr, PACA_EXGEN, kvm, vec, bitmask ;	\
 	EXCEPTION_PROLOG_2_REAL label, hsrr, 1
 
 #define MASKABLE_EXCEPTION(vec, label, bitmask)				\
 	__MASKABLE_EXCEPTION(vec, label, EXC_STD, 1, bitmask)
 
 #define MASKABLE_EXCEPTION_OOL(vec, label, bitmask)			\
-	MASKABLE_EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, bitmask ; \
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, bitmask ;	\
 	EXCEPTION_PROLOG_2_REAL label, EXC_STD, 1
 
 #define MASKABLE_EXCEPTION_HV(vec, label, bitmask)			\
 	__MASKABLE_EXCEPTION(vec, label, EXC_HV, 1, bitmask)
 
 #define MASKABLE_EXCEPTION_HV_OOL(vec, label, bitmask)			\
-	MASKABLE_EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, bitmask ; \
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, bitmask ;	\
 	EXCEPTION_PROLOG_2_REAL label, EXC_HV, 1
 
 #define __MASKABLE_RELON_EXCEPTION(vec, label, hsrr, kvm, bitmask)	\
 	SET_SCRATCH0(r13);    /* save r13 */				\
 	EXCEPTION_PROLOG_0(PACA_EXGEN);					\
-	MASKABLE_EXCEPTION_PROLOG_1 hsrr, PACA_EXGEN, kvm, vec, bitmask ; \
+	EXCEPTION_PROLOG_1 hsrr, PACA_EXGEN, kvm, vec, bitmask ;	\
 	EXCEPTION_PROLOG_2_VIRT label, hsrr
 
 #define MASKABLE_RELON_EXCEPTION(vec, label, bitmask)			\
 	__MASKABLE_RELON_EXCEPTION(vec, label, EXC_STD, 0, bitmask)
 
 #define MASKABLE_RELON_EXCEPTION_OOL(vec, label, bitmask)		\
-	MASKABLE_EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, vec, bitmask ; \
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, vec, bitmask ;	\
 	EXCEPTION_PROLOG_2_REAL label, EXC_STD, 1
 
 #define MASKABLE_RELON_EXCEPTION_HV(vec, label, bitmask)		\
 	__MASKABLE_RELON_EXCEPTION(vec, label, EXC_HV, 1, bitmask)
 
 #define MASKABLE_RELON_EXCEPTION_HV_OOL(vec, label, bitmask)		\
-	MASKABLE_EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, bitmask ; \
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, bitmask ;	\
 	EXCEPTION_PROLOG_2_VIRT label, EXC_HV
 
 /*
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 8d7378831b91..91350b3dedde 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -275,7 +275,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 EXC_REAL_END(machine_check, 0x200, 0x100)
 EXC_VIRT_NONE(0x4200, 0x100)
 TRAMP_REAL_BEGIN(machine_check_common_early)
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXMC, 0, 0x200
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXMC, 0, 0x200, 0
 	/*
 	 * Register contents:
 	 * R13		= PACA
@@ -360,7 +360,7 @@ BEGIN_FTR_SECTION
 	b	machine_check_common_early
 END_FTR_SECTION_IFCLR(CPU_FTR_HVMODE)
 machine_check_pSeries_0:
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 0
 	/*
 	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
 	 * nested machine check corrupts it. machine_check_common enables
@@ -598,7 +598,7 @@ EXCEPTION_PROLOG_0(PACA_EXGEN)
 EXC_REAL_END(data_access, 0x300, 0x80)
 
 TRAMP_REAL_BEGIN(tramp_real_data_access)
-EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x300
+EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x300, 0
 	/*
 	 * DAR/DSISR must be read before setting MSR[RI], because
 	 * a d-side MCE will clobber those registers so is not
@@ -613,7 +613,7 @@ EXCEPTION_PROLOG_2_REAL data_access_common, EXC_STD, 1
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 SET_SCRATCH0(r13)		/* save r13 */
 EXCEPTION_PROLOG_0(PACA_EXGEN)
-EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x300
+EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x300, 0
 	mfspr	r10,SPRN_DAR
 	mfspr	r11,SPRN_DSISR
 	std	r10,PACA_EXGEN+EX_DAR(r13)
@@ -652,7 +652,7 @@ EXCEPTION_PROLOG_0(PACA_EXSLB)
 EXC_REAL_END(data_access_slb, 0x380, 0x80)
 
 TRAMP_REAL_BEGIN(tramp_real_data_access_slb)
-EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 1, 0x380
+EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 1, 0x380, 0
 	mfspr	r10,SPRN_DAR
 	std	r10,PACA_EXSLB+EX_DAR(r13)
 EXCEPTION_PROLOG_2_REAL data_access_slb_common, EXC_STD, 1
@@ -660,7 +660,7 @@ EXCEPTION_PROLOG_2_REAL data_access_slb_common, EXC_STD, 1
 EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
 SET_SCRATCH0(r13)		/* save r13 */
 EXCEPTION_PROLOG_0(PACA_EXSLB)
-EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 0, 0x380
+EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 0, 0x380, 0
 	mfspr	r10,SPRN_DAR
 	std	r10,PACA_EXSLB+EX_DAR(r13)
 EXCEPTION_PROLOG_2_VIRT data_access_slb_common, EXC_STD
@@ -779,7 +779,7 @@ EXC_COMMON_ASYNC(hardware_interrupt_common, 0x500, do_IRQ)
 EXC_REAL_BEGIN(alignment, 0x600, 0x100)
 SET_SCRATCH0(r13)		/* save r13 */
 EXCEPTION_PROLOG_0(PACA_EXGEN)
-EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x600
+EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x600, 0
 	mfspr	r10,SPRN_DAR
 	mfspr	r11,SPRN_DSISR
 	std	r10,PACA_EXGEN+EX_DAR(r13)
@@ -790,7 +790,7 @@ EXC_REAL_END(alignment, 0x600, 0x100)
 EXC_VIRT_BEGIN(alignment, 0x4600, 0x100)
 SET_SCRATCH0(r13)		/* save r13 */
 EXCEPTION_PROLOG_0(PACA_EXGEN)
-EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x600
+EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x600, 0
 	mfspr	r10,SPRN_DAR
 	mfspr	r11,SPRN_DSISR
 	std	r10,PACA_EXGEN+EX_DAR(r13)
@@ -1119,7 +1119,7 @@ __TRAMP_REAL_OOL_MASKABLE_HV(hmi_exception, 0xe60, IRQS_DISABLED)
 EXC_VIRT_NONE(0x4e60, 0x20)
 TRAMP_KVM_HV(PACA_EXGEN, 0xe60)
 TRAMP_REAL_BEGIN(hmi_exception_early)
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0xe60
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0xe60, 0
 	mr	r10,r1			/* Save r1 */
 	ld	r1,PACAEMERGSP(r13)	/* Use emergency stack for realmode */
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
@@ -1321,7 +1321,7 @@ EXC_VIRT_NONE(0x5400, 0x100)
 EXC_REAL_BEGIN(denorm_exception_hv, 0x1500, 0x100)
 	mtspr	SPRN_SPRG_HSCRATCH0,r13
 	EXCEPTION_PROLOG_0(PACA_EXGEN)
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 0, 0x1500
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 0, 0x1500, 0
 
 #ifdef CONFIG_PPC_DENORMALISATION
 	mfspr	r10,SPRN_HSRR1
-- 
2.20.1

