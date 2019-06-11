Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A013D033
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:05:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NYGS3nJjzDqRt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 01:05:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zvf1N95D"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXZ82NMVzDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:34:08 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id r7so1677767pfl.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GxWAgDajEFSGA2taTwUldIVsIx2G/d/GgEmEjtUBSjk=;
 b=Zvf1N95DCQ7+EFWrPdBG4UOFEL0PnCZETSKco1wFBf1y89BUWxi0w7SoiJGL8zEZ5G
 W3IvOuzL3UEoXMIP0tO9pereLv28KZyqpE2lZt535upOkkqwbdaBVoWVcNGAwPOe+Jhq
 ZsdfO8rz86AhnWmab/npBfHd9VAeDU1XI0FPgFSThFngAXk+6szFVcVpC2lP2rMiS5pk
 WnbanQyLWo+9hrX5GztKTtvYC+IQzAWpJk0dv9xmogr+ZEE5l29GX2Za0Dggd7EQ21Ln
 3zpHknC9spp+tap110vp3mNt1XYMz1XD5iALj80WbtE7D5q/YqetVSsQBiBP5tFaH2Z6
 lEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GxWAgDajEFSGA2taTwUldIVsIx2G/d/GgEmEjtUBSjk=;
 b=k1IIBce/NSkr7iAQWA56p5GlnYuKiCK6bpJK35zro4OiYa5czbAze77Yp4cGpkcp3I
 mI0pvIUn+SuyKkjeP/jaH033Yxc6zuOhV3cX3gGDbvCXdhZo6HYZkZVj5SHKy1sCde11
 ejnlFr3dTy4pqdngc8H5Uhuo/uM19LsjG/2ZGz7wpTPXEzGOzJvZLizDFYR0TpyVGUWH
 4PEpfgC3hv+1Rk/StIe7LqUfXGlEWwhfmNycwNwFyPx1pGtrlJqOaAnhes4dciWIy+34
 e2Dn0q5aSbIXEpezMj/rWVe6XHAzTDGjpmyPfeRFzwgGZb9DBLD1Wk21DIqho8pSLFoI
 u/Lg==
X-Gm-Message-State: APjAAAUGKFS+wOOTcF6GvFQOQzHhSx2ZH0nkf45nyybYMc7d8E9S2AJM
 bC2//4FcngcErZsiD7iuEJo6u6Nz
X-Google-Smtp-Source: APXvYqxtTkjA64PsL3NCkMMQUESjtSdrSgENagRTui8g1rz+a8AhoguitHMHDvEifVonopcIJawzvw==
X-Received: by 2002:a63:6cc5:: with SMTP id
 h188mr20705408pgc.105.1560263644330; 
 Tue, 11 Jun 2019 07:34:04 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.34.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:34:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/28] powerpc/64s/exception: Make EXCEPTION_PROLOG_0 a gas
 macro for consistency with others
Date: Wed, 12 Jun 2019 00:30:22 +1000
Message-Id: <20190611143040.7834-11-npiggin@gmail.com>
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

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 25 ++++++++++++------------
 arch/powerpc/kernel/exceptions-64s.S     | 24 +++++++++++------------
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 1d8fc085e845..f19c2391cc36 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -233,7 +233,7 @@
  */
 #define EXCEPTION_RELON_PROLOG(area, label, hsrr, kvm, vec)		\
 	SET_SCRATCH0(r13);		/* save r13 */			\
-	EXCEPTION_PROLOG_0(area);					\
+	EXCEPTION_PROLOG_0 area ;					\
 	EXCEPTION_PROLOG_1 hsrr, area, kvm, vec, 0 ;			\
 	EXCEPTION_PROLOG_2_VIRT label, hsrr
 
@@ -297,13 +297,14 @@ BEGIN_FTR_SECTION_NESTED(943)						\
 	std	ra,offset(r13);						\
 END_FTR_SECTION_NESTED(ftr,ftr,943)
 
-#define EXCEPTION_PROLOG_0(area)					\
-	GET_PACA(r13);							\
-	std	r9,area+EX_R9(r13);	/* save r9 */			\
-	OPT_GET_SPR(r9, SPRN_PPR, CPU_FTR_HAS_PPR);			\
-	HMT_MEDIUM;							\
-	std	r10,area+EX_R10(r13);	/* save r10 - r12 */		\
+.macro EXCEPTION_PROLOG_0 area
+	GET_PACA(r13)
+	std	r9,\area\()+EX_R9(r13)		/* save r9 */
+	OPT_GET_SPR(r9, SPRN_PPR, CPU_FTR_HAS_PPR)
+	HMT_MEDIUM
+	std	r10,\area\()+EX_R10(r13)	/* save r10 - r12 */
 	OPT_GET_SPR(r10, SPRN_CFAR, CPU_FTR_CFAR)
+.endm
 
 .macro EXCEPTION_PROLOG_1 hsrr, area, kvm, vec, bitmask
 	OPT_SAVE_REG_TO_PACA(\area\()+EX_PPR, r9, CPU_FTR_HAS_PPR)
@@ -347,7 +348,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 
 #define EXCEPTION_PROLOG(area, label, hsrr, kvm, vec)			\
 	SET_SCRATCH0(r13);		/* save r13 */			\
-	EXCEPTION_PROLOG_0(area);					\
+	EXCEPTION_PROLOG_0 area	;					\
 	EXCEPTION_PROLOG_1 hsrr, area, kvm, vec, 0 ;			\
 	EXCEPTION_PROLOG_2_REAL label, hsrr, 1
 
@@ -416,7 +417,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 
 /* Do not enable RI */
 #define EXCEPTION_PROLOG_NORI(area, label, hsrr, kvm, vec)		\
-	EXCEPTION_PROLOG_0(area);					\
+	EXCEPTION_PROLOG_0 area ;					\
 	EXCEPTION_PROLOG_1 hsrr, area, kvm, vec, 0 ;			\
 	EXCEPTION_PROLOG_2_REAL label, hsrr, 0
 
@@ -565,7 +566,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 /* Version of above for when we have to branch out-of-line */
 #define __OOL_EXCEPTION(vec, label, hdlr)			\
 	SET_SCRATCH0(r13);					\
-	EXCEPTION_PROLOG_0(PACA_EXGEN);				\
+	EXCEPTION_PROLOG_0 PACA_EXGEN ;				\
 	b hdlr
 
 #define STD_EXCEPTION_OOL(vec, label)				\
@@ -596,7 +597,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 
 #define __MASKABLE_EXCEPTION(vec, label, hsrr, kvm, bitmask)		\
 	SET_SCRATCH0(r13);    /* save r13 */				\
-	EXCEPTION_PROLOG_0(PACA_EXGEN);					\
+	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
 	EXCEPTION_PROLOG_1 hsrr, PACA_EXGEN, kvm, vec, bitmask ;	\
 	EXCEPTION_PROLOG_2_REAL label, hsrr, 1
 
@@ -616,7 +617,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 
 #define __MASKABLE_RELON_EXCEPTION(vec, label, hsrr, kvm, bitmask)	\
 	SET_SCRATCH0(r13);    /* save r13 */				\
-	EXCEPTION_PROLOG_0(PACA_EXGEN);					\
+	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
 	EXCEPTION_PROLOG_1 hsrr, PACA_EXGEN, kvm, vec, bitmask ;	\
 	EXCEPTION_PROLOG_2_VIRT label, hsrr
 
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 8680cd7da550..88f892167a64 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -109,7 +109,7 @@ EXC_VIRT_NONE(0x4000, 0x100)
 
 EXC_REAL_BEGIN(system_reset, 0x100, 0x100)
 	SET_SCRATCH0(r13)
-	EXCEPTION_PROLOG_0(PACA_EXNMI)
+	EXCEPTION_PROLOG_0 PACA_EXNMI
 
 	/* This is EXCEPTION_PROLOG_1 with the idle feature section added */
 	OPT_SAVE_REG_TO_PACA(PACA_EXNMI+EX_PPR, r9, CPU_FTR_HAS_PPR)
@@ -266,7 +266,7 @@ EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
 	 * vector
 	 */
 	SET_SCRATCH0(r13)		/* save r13 */
-	EXCEPTION_PROLOG_0(PACA_EXMC)
+	EXCEPTION_PROLOG_0 PACA_EXMC
 BEGIN_FTR_SECTION
 	b	machine_check_common_early
 FTR_SECTION_ELSE
@@ -355,7 +355,7 @@ TRAMP_REAL_BEGIN(machine_check_pSeries)
 	.globl machine_check_fwnmi
 machine_check_fwnmi:
 	SET_SCRATCH0(r13)		/* save r13 */
-	EXCEPTION_PROLOG_0(PACA_EXMC)
+	EXCEPTION_PROLOG_0 PACA_EXMC
 BEGIN_FTR_SECTION
 	b	machine_check_common_early
 END_FTR_SECTION_IFCLR(CPU_FTR_HVMODE)
@@ -568,7 +568,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 	/* Deliver the machine check to host kernel in V mode. */
 	MACHINE_CHECK_HANDLER_WINDUP
 	SET_SCRATCH0(r13)		/* save r13 */
-	EXCEPTION_PROLOG_0(PACA_EXMC)
+	EXCEPTION_PROLOG_0 PACA_EXMC
 	b	machine_check_pSeries_0
 
 EXC_COMMON_BEGIN(unrecover_mce)
@@ -593,7 +593,7 @@ EXC_COMMON_BEGIN(mce_return)
 
 EXC_REAL_BEGIN(data_access, 0x300, 0x80)
 SET_SCRATCH0(r13)		/* save r13 */
-EXCEPTION_PROLOG_0(PACA_EXGEN)
+EXCEPTION_PROLOG_0 PACA_EXGEN
 	b	tramp_real_data_access
 EXC_REAL_END(data_access, 0x300, 0x80)
 
@@ -612,7 +612,7 @@ EXCEPTION_PROLOG_2_REAL data_access_common, EXC_STD, 1
 
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 SET_SCRATCH0(r13)		/* save r13 */
-EXCEPTION_PROLOG_0(PACA_EXGEN)
+EXCEPTION_PROLOG_0 PACA_EXGEN
 EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x300, 0
 	mfspr	r10,SPRN_DAR
 	mfspr	r11,SPRN_DSISR
@@ -647,7 +647,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 EXC_REAL_BEGIN(data_access_slb, 0x380, 0x80)
 SET_SCRATCH0(r13)		/* save r13 */
-EXCEPTION_PROLOG_0(PACA_EXSLB)
+EXCEPTION_PROLOG_0 PACA_EXSLB
 	b	tramp_real_data_access_slb
 EXC_REAL_END(data_access_slb, 0x380, 0x80)
 
@@ -659,7 +659,7 @@ EXCEPTION_PROLOG_2_REAL data_access_slb_common, EXC_STD, 1
 
 EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
 SET_SCRATCH0(r13)		/* save r13 */
-EXCEPTION_PROLOG_0(PACA_EXSLB)
+EXCEPTION_PROLOG_0 PACA_EXSLB
 EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 0, 0x380, 0
 	mfspr	r10,SPRN_DAR
 	std	r10,PACA_EXSLB+EX_DAR(r13)
@@ -778,7 +778,7 @@ EXC_COMMON_ASYNC(hardware_interrupt_common, 0x500, do_IRQ)
 
 EXC_REAL_BEGIN(alignment, 0x600, 0x100)
 SET_SCRATCH0(r13)		/* save r13 */
-EXCEPTION_PROLOG_0(PACA_EXGEN)
+EXCEPTION_PROLOG_0 PACA_EXGEN
 EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x600, 0
 	mfspr	r10,SPRN_DAR
 	mfspr	r11,SPRN_DSISR
@@ -789,7 +789,7 @@ EXC_REAL_END(alignment, 0x600, 0x100)
 
 EXC_VIRT_BEGIN(alignment, 0x4600, 0x100)
 SET_SCRATCH0(r13)		/* save r13 */
-EXCEPTION_PROLOG_0(PACA_EXGEN)
+EXCEPTION_PROLOG_0 PACA_EXGEN
 EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x600, 0
 	mfspr	r10,SPRN_DAR
 	mfspr	r11,SPRN_DSISR
@@ -1167,7 +1167,7 @@ TRAMP_REAL_BEGIN(hmi_exception_early)
 	.globl hmi_exception_after_realmode
 hmi_exception_after_realmode:
 	SET_SCRATCH0(r13)
-	EXCEPTION_PROLOG_0(PACA_EXGEN)
+	EXCEPTION_PROLOG_0 PACA_EXGEN
 	b	tramp_real_hmi_exception
 
 EXC_COMMON_BEGIN(hmi_exception_common)
@@ -1320,7 +1320,7 @@ EXC_VIRT_NONE(0x5400, 0x100)
 
 EXC_REAL_BEGIN(denorm_exception_hv, 0x1500, 0x100)
 	mtspr	SPRN_SPRG_HSCRATCH0,r13
-	EXCEPTION_PROLOG_0(PACA_EXGEN)
+	EXCEPTION_PROLOG_0 PACA_EXGEN
 	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 0, 0x1500, 0
 
 #ifdef CONFIG_PPC_DENORMALISATION
-- 
2.20.1

