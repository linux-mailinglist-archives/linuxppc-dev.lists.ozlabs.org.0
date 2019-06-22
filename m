Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BC74F5F9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 15:45:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WGyQ6VlvzDqC9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 23:45:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AGModg2a"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WGKW1TNgzDqbC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 23:16:30 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id p184so4975799pfp.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 06:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M70IjZbW5BupEgDr1atx02ZSnYjlhrhM1O4NZNU/8To=;
 b=AGModg2aDc6DMRG0qBVcahhZow6GH5TEW8FxCPeD9yyiaiAsbBwF++Y4lM7HckRK4Z
 BzyFaFJU1JAHjH2cOApbUFB8VpLJG/g2EoN3uufLRNZb/jPK2oGW6QzBghDW88nU8MFk
 32c68vkkcIu7sQvfXTiN+FG6BdUavIpjkxiXRos0A/rFi9t7oLTvnjdhkyAWIL5rDlec
 kdnkchwjVt53kPsM5d80lECcR/hXiIdGhvKnWm3hmcUdS/BWyitJAIqC+NsK6MJG7A37
 iJ5VJD/IU/V+m/LofyUecnpMC5ksx5oohYYh0VvrWdMhe+DFFdhcl0+4OQNoD1PlwkEw
 ygAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M70IjZbW5BupEgDr1atx02ZSnYjlhrhM1O4NZNU/8To=;
 b=OLt4b9BWjNU24UQlKk3PYAgh7OP708au6Ipgz7EJkYsbEB7EbDpbF6Bl9g/jgGeOPb
 Mut24v1Kaj9WeFVKiNjIAgSodhbJd9SqkO3jPvJFYrPpMQammLV/sleU4gXj145HTzAA
 Tt+0IRZ0PwIF8okvez4QETmrQfjETu7x0bPqiPgzsoj2rQIa56YvccWp++9L934yhPBC
 UCRuc5fJfjkWwg+giSGb05etAyd30I4U9CVXrd86s5gs454Eh4sKBSVtQq67CMm0VIMd
 VbWkb+xnq1YnY+6rPwpH3fJPaJDC+5wlT0NU287NGZPPvKAwZNSt1CFaG7Q2xr2ekhcY
 RBAQ==
X-Gm-Message-State: APjAAAXa6OwndTSuFfYAPuxfyVgACNTsB3B0+mrCXQTwY1+bKQebwq4D
 7HyhXonVlKPS6CFn1iUi5SzjmV7xzI4=
X-Google-Smtp-Source: APXvYqxcBG8oLAWoXrl2Y+Dw5ZfnndCpwzi1adFrFT7Z6yRrEJ5vLaV+MZFiQMxsH2tkbRIMm7XEdg==
X-Received: by 2002:a17:90a:cd04:: with SMTP id
 d4mr13432447pju.128.1561209388337; 
 Sat, 22 Jun 2019 06:16:28 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.144.136.2])
 by smtp.gmail.com with ESMTPSA id n1sm5192471pgv.15.2019.06.22.06.16.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 06:16:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 09/25] powerpc/64s/exception: Make EXCEPTION_PROLOG_0 a gas
 macro for consistency with others
Date: Sat, 22 Jun 2019 23:15:19 +1000
Message-Id: <20190622131535.20996-10-npiggin@gmail.com>
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
index 26d1873085b6..a151bd73c045 100644
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

