Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A91A1593C1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 07:53:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZmCG6rngzDqwH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 15:53:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dml2XmVi"; 
 dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zlmt6Vw0zDqml
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 15:33:50 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id 9so1805624ple.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 22:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LeeFWI1C9iSE00IzA2aiY662mP03mFlHxDlLGBgYCW4=;
 b=dml2XmViL+F4aiZgL2IgjtE3ECpGuWauQtT0Ibo1syrKqiR30F1P+Se6ImQb4u9djx
 YzW5ukQvdlYM+GIESTQEIt4TGjt+lQ6uXr0HUkDwwedWh3nDZJjKlaLliV9fyJKkK3wy
 g+Ehy9dcK5gtcIcYyy5D4l2TI1og8hgipKpGd8BuMLiDfW80Y+9sNtfQHFR8QZcA4EF/
 J49NLTTYFxAL99PIW+VTpqNCCBAGIsxf+qYPMfMd2fL3i6WimrkeVR7WIXdQzqpU/AMe
 T7SxkKfw6tYxJt72Mw/mo08daA2I4RTSn3h9Gf5JfwMNPR9ZZ2Y+MSNo6mQn/irpPXeG
 qkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LeeFWI1C9iSE00IzA2aiY662mP03mFlHxDlLGBgYCW4=;
 b=TkmIsSuLulDgakUPtICbmawJSz0GTh+Ec6a/uKhCSJVnIMJSZp0qafB6qqJnvBXHe2
 glJEt0rnAr7rP5BwZV/OHwNBAdlf/j9Qp0s3OkKaz/CXfsD1TjIdrm5zxsbEKV+lU5Le
 zjrHyPtzXaIO7KuclgwAMbVVrdg31qL8s0sQMvZ5C/J3NoIt8d/dqB1yBmIhJE5rurtW
 kDrVLDvuQFKI3PALnib4tsHZLonvZT5CTt2M7sAz7FEFsysrSmSjQqb2udVQHm0lskl8
 szXS4POp8x0vyQe4zU4qK5MJiGYrsHQhUcYKYIZDv6rbiwOd5oooReewemycuMUnnotz
 H5sg==
X-Gm-Message-State: APjAAAXH6bhEe70HfF+qhvqmcpQETvjgafTpnyvhDARXNOu+5xcjAr4y
 9oX9e5ZYL2DPi5BW5oYgeRUAWMau
X-Google-Smtp-Source: APXvYqwMKut3+YNa5XDdfq1v894gm50k5Srrb+MBzxu5C2PoB4D2EcNMlQnODLJYxD90A9r0b4L55g==
X-Received: by 2002:a17:902:8548:: with SMTP id
 d8mr867711plo.100.1561700028217; 
 Thu, 27 Jun 2019 22:33:48 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 125sm1272614pfg.23.2019.06.27.22.33.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 22:33:47 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 12/13] powerpc/64s/exception: move SET_SCRATCH0 into
 EXCEPTION_PROLOG_0
Date: Fri, 28 Jun 2019 15:33:31 +1000
Message-Id: <20190628053332.22366-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628053332.22366-1-npiggin@gmail.com>
References: <20190628053332.22366-1-npiggin@gmail.com>
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
 arch/powerpc/kernel/exceptions-64s.S | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index bbe29cd80440..0857c696480c 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -128,6 +128,7 @@ BEGIN_FTR_SECTION_NESTED(943)						\
 END_FTR_SECTION_NESTED(ftr,ftr,943)
 
 .macro EXCEPTION_PROLOG_0 area
+	SET_SCRATCH0(r13)			/* save r13 */
 	GET_PACA(r13)
 	std	r9,\area\()+EX_R9(r13)		/* save r9 */
 	OPT_GET_SPR(r9, SPRN_PPR, CPU_FTR_HAS_PPR)
@@ -547,7 +548,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __EXC_REAL(name, start, size, area)				\
 	EXC_REAL_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);		/* save r13 */			\
 	EXCEPTION_PROLOG_0 area ;					\
 	EXCEPTION_PROLOG_1 EXC_STD, area, 1, start, 0, 0, 0 ;		\
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1 ;		\
@@ -558,7 +558,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __EXC_VIRT(name, start, size, realvec, area)			\
 	EXC_VIRT_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);    /* save r13 */				\
 	EXCEPTION_PROLOG_0 area ;					\
 	EXCEPTION_PROLOG_1 EXC_STD, area, 0, realvec, 0, 0, 0;		\
 	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD ;		\
@@ -569,7 +568,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define EXC_REAL_MASKABLE(name, start, size, bitmask)			\
 	EXC_REAL_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);    /* save r13 */				\
 	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, start, 0, 0, bitmask ; \
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1 ;		\
@@ -577,7 +575,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define EXC_VIRT_MASKABLE(name, start, size, realvec, bitmask)		\
 	EXC_VIRT_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);    /* save r13 */				\
 	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, realvec, 0, 0, bitmask ; \
 	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD ;		\
@@ -585,7 +582,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define EXC_REAL_HV(name, start, size)					\
 	EXC_REAL_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);		/* save r13 */			\
 	EXCEPTION_PROLOG_0 PACA_EXGEN;					\
 	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, start, 0, 0, 0 ;	\
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_HV, 1 ;		\
@@ -593,7 +589,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define EXC_VIRT_HV(name, start, size, realvec)				\
 	EXC_VIRT_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);		/* save r13 */			\
 	EXCEPTION_PROLOG_0 PACA_EXGEN;					\
 	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0, 0, 0 ;	\
 	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_HV ;			\
@@ -601,7 +596,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __EXC_REAL_OOL(name, start, size)				\
 	EXC_REAL_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);						\
 	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
 	b	tramp_real_##name ;					\
 	EXC_REAL_END(name, start, size)
@@ -629,7 +623,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __EXC_REAL_OOL_HV_DIRECT(name, start, size, handler)		\
 	EXC_REAL_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);						\
 	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
 	b	handler;						\
 	EXC_REAL_END(name, start, size)
@@ -660,7 +653,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __EXC_VIRT_OOL(name, start, size)				\
 	EXC_VIRT_BEGIN(name, start, size);				\
-	SET_SCRATCH0(r13);						\
 	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
 	b	tramp_virt_##name;					\
 	EXC_VIRT_END(name, start, size)
@@ -837,7 +829,6 @@ EXC_VIRT_NONE(0x4000, 0x100)
 
 
 EXC_REAL_BEGIN(system_reset, 0x100, 0x100)
-	SET_SCRATCH0(r13)
 	EXCEPTION_PROLOG_0 PACA_EXNMI
 
 	/* This is EXCEPTION_PROLOG_1 with the idle feature section added */
@@ -955,7 +946,6 @@ EXC_COMMON_BEGIN(system_reset_common)
  * Vectors for the FWNMI option.  Share common code.
  */
 TRAMP_REAL_BEGIN(system_reset_fwnmi)
-	SET_SCRATCH0(r13)		/* save r13 */
 	/* See comment at system_reset exception, don't turn on RI */
 	EXCEPTION_PROLOG_0 PACA_EXNMI
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXNMI, 0, 0x100, 0, 0, 0
@@ -969,7 +959,6 @@ EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
 	 * some code path might still want to branch into the original
 	 * vector
 	 */
-	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXMC
 BEGIN_FTR_SECTION
 	b	machine_check_common_early
@@ -1058,7 +1047,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 TRAMP_REAL_BEGIN(machine_check_pSeries)
 	.globl machine_check_fwnmi
 machine_check_fwnmi:
-	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXMC
 BEGIN_FTR_SECTION
 	b	machine_check_common_early
@@ -1246,7 +1234,6 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 9:
 	/* Deliver the machine check to host kernel in V mode. */
 	MACHINE_CHECK_HANDLER_WINDUP
-	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXMC
 	b	machine_check_pSeries_0
 
@@ -1271,7 +1258,6 @@ EXC_COMMON_BEGIN(mce_return)
 	b	.
 
 EXC_REAL_BEGIN(data_access, 0x300, 0x80)
-	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 	b	tramp_real_data_access
 EXC_REAL_END(data_access, 0x300, 0x80)
@@ -1281,7 +1267,6 @@ TRAMP_REAL_BEGIN(tramp_real_data_access)
 	EXCEPTION_PROLOG_2_REAL data_access_common, EXC_STD, 1
 
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
-	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x300, 1, 1, 0
 EXCEPTION_PROLOG_2_VIRT data_access_common, EXC_STD
@@ -1312,7 +1297,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 
 EXC_REAL_BEGIN(data_access_slb, 0x380, 0x80)
-	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXSLB
 	b	tramp_real_data_access_slb
 EXC_REAL_END(data_access_slb, 0x380, 0x80)
@@ -1322,7 +1306,6 @@ TRAMP_REAL_BEGIN(tramp_real_data_access_slb)
 	EXCEPTION_PROLOG_2_REAL data_access_slb_common, EXC_STD, 1
 
 EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
-	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXSLB
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 0, 0x380, 1, 0, 0
 	EXCEPTION_PROLOG_2_VIRT data_access_slb_common, EXC_STD
@@ -1406,7 +1389,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 
 EXC_REAL_BEGIN(hardware_interrupt, 0x500, 0x100)
-	SET_SCRATCH0(r13)	/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 BEGIN_FTR_SECTION
 	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, 0, 0, IRQS_DISABLED
@@ -1418,7 +1400,6 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 EXC_REAL_END(hardware_interrupt, 0x500, 0x100)
 
 EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
-	SET_SCRATCH0(r13)	/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 BEGIN_FTR_SECTION
 	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, 0, 0, IRQS_DISABLED
@@ -1435,14 +1416,12 @@ EXC_COMMON_ASYNC(hardware_interrupt_common, 0x500, do_IRQ)
 
 
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
@@ -1766,7 +1745,6 @@ TRAMP_REAL_BEGIN(hmi_exception_early)
 	 * firmware.
 	 */
 	EXCEPTION_RESTORE_REGS EXC_HV
-	SET_SCRATCH0(r13)
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 	b	tramp_real_hmi_exception
 
@@ -1925,7 +1903,6 @@ EXC_REAL_NONE(0x1400, 0x100)
 EXC_VIRT_NONE(0x5400, 0x100)
 
 EXC_REAL_BEGIN(denorm_exception_hv, 0x1500, 0x100)
-	SET_SCRATCH0(r13)
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 0, 0x1500, 0, 0, 0
 
-- 
2.20.1

