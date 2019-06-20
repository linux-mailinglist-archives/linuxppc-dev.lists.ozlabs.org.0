Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B56D4C794
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:40:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TsdH3NsdzDr58
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:40:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fq6oDixm"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TqmX5Q6lzDqvp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:28 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id s21so907349pga.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZodRVMQ9QTyLf7UyhCfUIu2Uyx6ASp3PDbP6yJ6pdA=;
 b=Fq6oDixmyaV5oubxycarBRimH2e/PwRzlWxv5LuDCEYpYoAua3/asCxp7MG+8aWrrU
 z+VLDUMS0uyHNiIkVuz6s9ImMKam8itQNXH24HchutwVLLW/CmZ4fvF1SI99Wl19R7/1
 6m8MstDCN/XP2mbISFA/pEkJ54mvkaXBXhikponPLeQud3VE1sckNsd9fDCaFdhC4QD4
 ZXP37Ae+NSDozi4arFXcO2+wjETUx2zOJ+i3X16Agic6REYXl1qgK2ddXKe++8/lMvx0
 hYbbZnvgZvK6DLoWNMKhIFl+WG+biGGoVXwT/OpP97aoLtsGlAun7hXtXdevvVNKL0L9
 OaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZodRVMQ9QTyLf7UyhCfUIu2Uyx6ASp3PDbP6yJ6pdA=;
 b=PpdX3GBokve5VTZVxwCvPMT0CoHr7FewcC5kKbrsnPa7WG+i5UdTdudDi8fCUY4PmJ
 C96PaqsQ/vVLEDRL78MXXJ9WkiEWeyWPLqG0wlg22A710amov1OAWBRvuq/KOhAyHuVu
 0L9LJ5ejVU7bDncrRRBjLvA7cbIyDT2vckdtWbvaK//I+WtIjqsTYcyJpOqwi5bCSpOT
 FW6LqTa/e0LQL3SqZ7wbCyR2En9SRWCCFYPgpZNAqpIucBfPbxFs5uMorf89lVatRFiT
 mBorc920+fELfalbLvTt375tdfUugoaWK2K2ZlFxMNqu9Dxyc5rDx/LnJYEW6pLo1mdm
 uDpA==
X-Gm-Message-State: APjAAAWTU0KQsc/wi0iPbg+geHkL/wxSHoqtzjlEaTu3ExxZm/rtNFfP
 h6WFXiZ4+a2bJp3Eiq1UUk7h3mpO
X-Google-Smtp-Source: APXvYqw1uMAC4gRQ/DtI3OlGjOfSN6gLFUB76JB4ancDYgkPsFnRe/dTe2UViI61oM+aew44JpeXtg==
X-Received: by 2002:aa7:92cb:: with SMTP id k11mr4109656pfa.126.1561007785537; 
 Wed, 19 Jun 2019 22:16:25 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 40/52] powerpc/64s/exception: move SET_SCRATCH0 into
 EXCEPTION_PROLOG_0
Date: Thu, 20 Jun 2019 15:14:47 +1000
Message-Id: <20190620051459.29573-41-npiggin@gmail.com>
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
 arch/powerpc/kernel/exceptions-64s.S | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 99de397a1cd9..286bd5670d60 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -128,6 +128,7 @@ BEGIN_FTR_SECTION_NESTED(943)						\
 END_FTR_SECTION_NESTED(ftr,ftr,943)
 
 .macro EXCEPTION_PROLOG_0 area
+	SET_SCRATCH0(r13)			/* save r13 */
 	GET_PACA(r13)
 	std	r9,\area\()+EX_R9(r13)		/* save r9 */
 	OPT_GET_SPR(r9, SPRN_PPR, CPU_FTR_HAS_PPR)
@@ -540,7 +541,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __EXC_REAL(name, start, size, area)				\
 	EXC_REAL_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);		/* save r13 */			\
 	EXCEPTION_PROLOG_0 area ;					\
 	EXCEPTION_PROLOG_1 EXC_STD, area, 1, start, 0, 0, 0 ;		\
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1 ;		\
@@ -551,7 +551,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __EXC_VIRT(name, start, size, realvec, area)			\
 	EXC_VIRT_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);    /* save r13 */				\
 	EXCEPTION_PROLOG_0 area ;					\
 	EXCEPTION_PROLOG_1 EXC_STD, area, 0, realvec, 0, 0, 0;		\
 	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD ;		\
@@ -562,7 +561,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define EXC_REAL_MASKABLE(name, start, size, bitmask)			\
 	EXC_REAL_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);    /* save r13 */				\
 	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, start, 0, 0, bitmask ; \
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1 ;		\
@@ -570,7 +568,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define EXC_VIRT_MASKABLE(name, start, size, realvec, bitmask)		\
 	EXC_VIRT_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);    /* save r13 */				\
 	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, realvec, 0, 0, bitmask ; \
 	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD ;		\
@@ -578,7 +575,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define EXC_REAL_HV(name, start, size)					\
 	EXC_REAL_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);		/* save r13 */			\
 	EXCEPTION_PROLOG_0 PACA_EXGEN;					\
 	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, start, 0, 0, 0 ;	\
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_HV, 1 ;		\
@@ -586,7 +582,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define EXC_VIRT_HV(name, start, size, realvec)				\
 	EXC_VIRT_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);		/* save r13 */			\
 	EXCEPTION_PROLOG_0 PACA_EXGEN;					\
 	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0, 0, 0 ;	\
 	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_HV ;			\
@@ -594,7 +589,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __EXC_REAL_OOL(name, start, size)				\
 	EXC_REAL_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);						\
 	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
 	b	tramp_real_##name ;					\
 	EXC_REAL_END(name, start, size)
@@ -622,7 +616,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __EXC_REAL_OOL_HV_DIRECT(name, start, size, handler)		\
 	EXC_REAL_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);						\
 	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
 	b	handler;						\
 	EXC_REAL_END(name, start, size)
@@ -653,7 +646,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __EXC_VIRT_OOL(name, start, size)				\
 	EXC_VIRT_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);						\
 	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
 	b	tramp_virt_##name;					\
 	EXC_VIRT_END(name, start, size)
@@ -864,7 +856,6 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 #endif
 
-	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXNMI
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXNMI, 1, 0x100, 0, 0, 0
 	EXCEPTION_PROLOG_2_REAL system_reset_common, EXC_STD, 0
@@ -890,7 +881,6 @@ TRAMP_REAL_BEGIN(system_reset_idle_wake)
  * Vectors for the FWNMI option.  Share common code.
  */
 TRAMP_REAL_BEGIN(system_reset_fwnmi)
-	SET_SCRATCH0(r13)		/* save r13 */
 	/* See comment at system_reset exception, don't turn on RI */
 	EXCEPTION_PROLOG_0 PACA_EXNMI
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXNMI, 0, 0x100, 0, 0, 0
@@ -961,7 +951,6 @@ EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
 	 * some code path might still want to branch into the original
 	 * vector
 	 */
-	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXMC
 BEGIN_FTR_SECTION
 	b	machine_check_common_early
@@ -1050,7 +1039,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 TRAMP_REAL_BEGIN(machine_check_pSeries)
 	.globl machine_check_fwnmi
 machine_check_fwnmi:
-	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXMC
 BEGIN_FTR_SECTION
 	b	machine_check_common_early
@@ -1238,7 +1226,6 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 9:
 	/* Deliver the machine check to host kernel in V mode. */
 	MACHINE_CHECK_HANDLER_WINDUP
-	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXMC
 	b	machine_check_pSeries_0
 
@@ -1263,7 +1250,6 @@ EXC_COMMON_BEGIN(mce_return)
 	b	.
 
 EXC_REAL_BEGIN(data_access, 0x300, 0x80)
-	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 	b	tramp_real_data_access
 EXC_REAL_END(data_access, 0x300, 0x80)
@@ -1273,7 +1259,6 @@ TRAMP_REAL_BEGIN(tramp_real_data_access)
 	EXCEPTION_PROLOG_2_REAL data_access_common, EXC_STD, 1
 
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
-	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x300, 1, 1, 0
 EXCEPTION_PROLOG_2_VIRT data_access_common, EXC_STD
@@ -1304,7 +1289,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 
 EXC_REAL_BEGIN(data_access_slb, 0x380, 0x80)
-	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXSLB
 	b	tramp_real_data_access_slb
 EXC_REAL_END(data_access_slb, 0x380, 0x80)
@@ -1314,7 +1298,6 @@ TRAMP_REAL_BEGIN(tramp_real_data_access_slb)
 	EXCEPTION_PROLOG_2_REAL data_access_slb_common, EXC_STD, 1
 
 EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
-	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXSLB
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 0, 0x380, 1, 0, 0
 	EXCEPTION_PROLOG_2_VIRT data_access_slb_common, EXC_STD
@@ -1398,7 +1381,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 
 EXC_REAL_BEGIN(hardware_interrupt, 0x500, 0x100)
-	SET_SCRATCH0(r13)	/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 BEGIN_FTR_SECTION
 	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, 0, 0, IRQS_DISABLED
@@ -1410,7 +1392,6 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 EXC_REAL_END(hardware_interrupt, 0x500, 0x100)
 
 EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
-	SET_SCRATCH0(r13)	/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 BEGIN_FTR_SECTION
 	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, 0, 0, IRQS_DISABLED
@@ -1427,14 +1408,12 @@ EXC_COMMON_ASYNC(hardware_interrupt_common, 0x500, do_IRQ)
 
 
 EXC_REAL_BEGIN(alignment, 0x600, 0x100)
-	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x600, 1, 1, 0
 	EXCEPTION_PROLOG_2_REAL alignment_common, EXC_STD, 1
 EXC_REAL_END(alignment, 0x600, 0x100)
 
 EXC_VIRT_BEGIN(alignment, 0x4600, 0x100)
-	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x600, 1, 1, 0
 	EXCEPTION_PROLOG_2_VIRT alignment_common, EXC_STD
@@ -1761,7 +1740,6 @@ TRAMP_REAL_BEGIN(hmi_exception_early)
 	 * firmware.
 	 */
 	EXCEPTION_RESTORE_REGS EXC_HV
-	SET_SCRATCH0(r13)
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 	b	tramp_real_hmi_exception
 
@@ -1920,7 +1898,6 @@ EXC_REAL_NONE(0x1400, 0x100)
 EXC_VIRT_NONE(0x5400, 0x100)
 
 EXC_REAL_BEGIN(denorm_exception_hv, 0x1500, 0x100)
-	SET_SCRATCH0(r13)
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 0, 0x1500, 0, 0, 0
 
-- 
2.20.1

