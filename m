Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7FA593A2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 07:48:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zm5n4fWHzDqHR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 15:48:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ueQ53nR/"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zlmn1HwnzDqmh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 15:33:45 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id j2so2374882pfe.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 22:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k3+tGmu0D0FtqZxIbKN0mRPdLtfpBf0qnAF2IjQa0kg=;
 b=ueQ53nR/ULfMdVV1IXnc5ASaxIWQHYY3YKbEI6NykpHR+zX2fMM8Ks4T8bYxkX9E1H
 UgwvmnDDGwuMAXi3E/pSlIm4uZXH7CIx69eFgTxbUrGaIi/O6S0TRaF1RN5qdlGYGzIV
 VlWiZ9BvsQLioR8OL6v1u3iXnJkOGV59v+z95gOCPiqt08L+Q26uquTE44hy24RsAa+/
 WFWZoqi4m2Ph1Q94EHvKZZnE7fej5LeQ6iYU/ymyHg0VgvNa8fxjufPa2LQe3D7v+TQG
 7EfTPQctCcezc9t3l2+wgjm9v7uysunhBcFF///zj52voFSNwjdWqohvXfHr9Z6IU3pQ
 Aaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k3+tGmu0D0FtqZxIbKN0mRPdLtfpBf0qnAF2IjQa0kg=;
 b=BE0HFH3VrLgmtxY0imnXzjyBY2EVrVTqGyVVb5C1HLQk+AMUrXAHAZEboK8/v+zQvA
 ynu4+olLIpn/8FFq+kNMr6XM9AwoPBvfag8P/1tjoZilThLsVMFQO0+vzLmXli4w3HWb
 Q60U6KE/F977QJFQIEdzxO1AmClj3vnRkFPrPANfoxiakjHSY0+YfrfPaW9FdSQVBmnZ
 M8nS7Q7jyWPlHHXauiFOpkO5ACJ9qqte7DShxRzcIjqge2A12//DxhiqGcmexKBmMdES
 5UFUF2C1azXr82lI6k4DTMzfcvSkKXnBpyMOo5PH82PI4kemz9dSuZALVWWqm0+FzISv
 R3Tw==
X-Gm-Message-State: APjAAAWmgMk362LviAYdbaJ1exmv2ufqgIta1Uei51PBZ2tWb7t0U5vE
 1hfx6gxCsnFSSvPFriBhwb7lWjcK
X-Google-Smtp-Source: APXvYqyfk3vjWj9Eg9JMV/O2+C1lO1EKjrg12Rm9t/TCcO0/gI9rtYT0joPdF1L2zzjrPc5Rt/ay8Q==
X-Received: by 2002:a65:48c3:: with SMTP id o3mr4408182pgs.70.1561700022425;
 Thu, 27 Jun 2019 22:33:42 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 125sm1272614pfg.23.2019.06.27.22.33.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 22:33:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 09/13] powerpc/64s/exception: add dar and dsisr options to
 exception macro
Date: Fri, 28 Jun 2019 15:33:28 +1000
Message-Id: <20190628053332.22366-10-npiggin@gmail.com>
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

Some exception entry requires DAR and/or DSISR to be saved into the
paca exception save area. Add options to the standard exception
macros for these.

Generated code changes slightly due to code structure.

-     554:      a6 02 72 7d     mfdsisr r11
-     558:      a8 00 4d f9     std     r10,168(r13)
-     55c:      b0 00 6d 91     stw     r11,176(r13)
+     554:      a8 00 4d f9     std     r10,168(r13)
+     558:      a6 02 52 7d     mfdsisr r10
+     55c:      b0 00 4d 91     stw     r10,176(r13)

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 101 ++++++++++++---------------
 1 file changed, 45 insertions(+), 56 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 2b3a7d928df6..4427b6820f51 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -136,7 +136,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	OPT_GET_SPR(r10, SPRN_CFAR, CPU_FTR_CFAR)
 .endm
 
-.macro EXCEPTION_PROLOG_1 hsrr, area, kvm, vec, bitmask
+.macro EXCEPTION_PROLOG_1 hsrr, area, kvm, vec, dar, dsisr, bitmask
 	OPT_SAVE_REG_TO_PACA(\area\()+EX_PPR, r9, CPU_FTR_HAS_PPR)
 	OPT_SAVE_REG_TO_PACA(\area\()+EX_CFAR, r10, CPU_FTR_CFAR)
 	INTERRUPT_TO_KERNEL
@@ -172,8 +172,22 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 
 	std	r11,\area\()+EX_R11(r13)
 	std	r12,\area\()+EX_R12(r13)
+
+	/*
+	 * DAR/DSISR, SCRATCH0 must be read before setting MSR[RI],
+	 * because a d-side MCE will clobber those registers so is
+	 * not recoverable if they are live.
+	 */
 	GET_SCRATCH0(r10)
 	std	r10,\area\()+EX_R13(r13)
+	.if \dar
+	mfspr	r10,SPRN_DAR
+	std	r10,\area\()+EX_DAR(r13)
+	.endif
+	.if \dsisr
+	mfspr	r10,SPRN_DSISR
+	stw	r10,\area\()+EX_DSISR(r13)
+	.endif
 .endm
 
 .macro EXCEPTION_PROLOG_2_REAL label, hsrr, set_ri
@@ -535,7 +549,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 	EXC_REAL_BEGIN(name, start, size);				\
 	SET_SCRATCH0(r13);		/* save r13 */			\
 	EXCEPTION_PROLOG_0 area ;					\
-	EXCEPTION_PROLOG_1 EXC_STD, area, 1, start, 0 ;			\
+	EXCEPTION_PROLOG_1 EXC_STD, area, 1, start, 0, 0, 0 ;		\
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1 ;		\
 	EXC_REAL_END(name, start, size)
 
@@ -546,7 +560,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 	EXC_VIRT_BEGIN(name, start, size);				\
 	SET_SCRATCH0(r13);    /* save r13 */				\
 	EXCEPTION_PROLOG_0 area ;					\
-	EXCEPTION_PROLOG_1 EXC_STD, area, 0, realvec, 0;		\
+	EXCEPTION_PROLOG_1 EXC_STD, area, 0, realvec, 0, 0, 0;		\
 	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD ;		\
 	EXC_VIRT_END(name, start, size)
 
@@ -557,7 +571,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 	EXC_REAL_BEGIN(name, start, size);				\
 	SET_SCRATCH0(r13);    /* save r13 */				\
 	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, start, bitmask ;	\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, start, 0, 0, bitmask ; \
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1 ;		\
 	EXC_REAL_END(name, start, size)
 
@@ -565,7 +579,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 	EXC_VIRT_BEGIN(name, start, size);				\
 	SET_SCRATCH0(r13);    /* save r13 */				\
 	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, realvec, bitmask ;	\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, realvec, 0, 0, bitmask ; \
 	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD ;		\
 	EXC_VIRT_END(name, start, size)
 
@@ -573,7 +587,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 	EXC_REAL_BEGIN(name, start, size);				\
 	SET_SCRATCH0(r13);		/* save r13 */			\
 	EXCEPTION_PROLOG_0 PACA_EXGEN;					\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, start, 0 ;		\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, start, 0, 0, 0 ;	\
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_HV, 1 ;		\
 	EXC_REAL_END(name, start, size)
 
@@ -581,7 +595,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 	EXC_VIRT_BEGIN(name, start, size);				\
 	SET_SCRATCH0(r13);		/* save r13 */			\
 	EXCEPTION_PROLOG_0 PACA_EXGEN;					\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0 ;		\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0, 0, 0 ;	\
 	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_HV ;			\
 	EXC_VIRT_END(name, start, size)
 
@@ -594,7 +608,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __TRAMP_REAL_OOL(name, vec)					\
 	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, 0 ;	\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, 0, 0, 0 ;	\
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1
 
 #define EXC_REAL_OOL(name, start, size)					\
@@ -606,7 +620,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __TRAMP_REAL_OOL_MASKABLE(name, vec, bitmask)			\
 	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, bitmask ;	\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, 0, 0, bitmask ;	\
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1
 
 #define EXC_REAL_OOL_MASKABLE(name, start, size, bitmask)		\
@@ -625,7 +639,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __TRAMP_REAL_OOL_HV(name, vec)					\
 	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, 0 ;	\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, 0, 0, 0 ;	\
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_HV, 1
 
 #define EXC_REAL_OOL_HV(name, start, size)				\
@@ -637,7 +651,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __TRAMP_REAL_OOL_MASKABLE_HV(name, vec, bitmask)		\
 	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, bitmask ;	\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, 0, 0, bitmask ;	\
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_HV, 1
 
 #define EXC_REAL_OOL_MASKABLE_HV(name, start, size, bitmask)		\
@@ -653,7 +667,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __TRAMP_VIRT_OOL(name, realvec)					\
 	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, vec, 0 ;		\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, vec, 0, 0, 0 ;	\
 	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD
 
 #define EXC_VIRT_OOL(name, start, size, realvec)			\
@@ -665,7 +679,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __TRAMP_VIRT_OOL_MASKABLE(name, realvec, bitmask)		\
 	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, realvec, bitmask ;	\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, realvec, 0, 0, bitmask ; \
 	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1
 
 #define EXC_VIRT_OOL_MASKABLE(name, start, size, realvec, bitmask)	\
@@ -677,7 +691,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __TRAMP_VIRT_OOL_HV(name, realvec)				\
 	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0 ;		\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0, 0, 0 ;	\
 	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_HV
 
 #define EXC_VIRT_OOL_HV(name, start, size, realvec)			\
@@ -689,7 +703,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 #define __TRAMP_VIRT_OOL_MASKABLE_HV(name, realvec, bitmask)		\
 	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, bitmask ;	\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0, 0, bitmask ; \
 	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_HV
 
 #define EXC_VIRT_OOL_MASKABLE_HV(name, start, size, realvec, bitmask)	\
@@ -944,7 +958,7 @@ TRAMP_REAL_BEGIN(system_reset_fwnmi)
 	SET_SCRATCH0(r13)		/* save r13 */
 	/* See comment at system_reset exception, don't turn on RI */
 	EXCEPTION_PROLOG_0 PACA_EXNMI
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXNMI, 0, 0x100, 0
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXNMI, 0, 0x100, 0, 0, 0
 	EXCEPTION_PROLOG_2_REAL system_reset_common, EXC_STD, 0
 
 #endif /* CONFIG_PPC_PSERIES */
@@ -965,7 +979,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 EXC_REAL_END(machine_check, 0x200, 0x100)
 EXC_VIRT_NONE(0x4200, 0x100)
 TRAMP_REAL_BEGIN(machine_check_common_early)
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 0, 0x200, 0
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 0, 0x200, 0, 0, 0
 	/*
 	 * Register contents:
 	 * R13		= PACA
@@ -1050,7 +1064,7 @@ BEGIN_FTR_SECTION
 	b	machine_check_common_early
 END_FTR_SECTION_IFCLR(CPU_FTR_HVMODE)
 machine_check_pSeries_0:
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 0
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 0, 0, 0
 	/*
 	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
 	 * nested machine check corrupts it. machine_check_common enables
@@ -1267,26 +1281,13 @@ EXC_REAL_BEGIN(data_access, 0x300, 0x80)
 EXC_REAL_END(data_access, 0x300, 0x80)
 
 TRAMP_REAL_BEGIN(tramp_real_data_access)
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x300, 0
-	/*
-	 * DAR/DSISR must be read before setting MSR[RI], because
-	 * a d-side MCE will clobber those registers so is not
-	 * recoverable if they are live.
-	 */
-	mfspr	r10,SPRN_DAR
-	mfspr	r11,SPRN_DSISR
-	std	r10,PACA_EXGEN+EX_DAR(r13)
-	stw	r11,PACA_EXGEN+EX_DSISR(r13)
-EXCEPTION_PROLOG_2_REAL data_access_common, EXC_STD, 1
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x300, 1, 1, 0
+	EXCEPTION_PROLOG_2_REAL data_access_common, EXC_STD, 1
 
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x300, 0
-	mfspr	r10,SPRN_DAR
-	mfspr	r11,SPRN_DSISR
-	std	r10,PACA_EXGEN+EX_DAR(r13)
-	stw	r11,PACA_EXGEN+EX_DSISR(r13)
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x300, 1, 1, 0
 EXCEPTION_PROLOG_2_VIRT data_access_common, EXC_STD
 EXC_VIRT_END(data_access, 0x4300, 0x80)
 
@@ -1321,17 +1322,13 @@ EXC_REAL_BEGIN(data_access_slb, 0x380, 0x80)
 EXC_REAL_END(data_access_slb, 0x380, 0x80)
 
 TRAMP_REAL_BEGIN(tramp_real_data_access_slb)
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 1, 0x380, 0
-	mfspr	r10,SPRN_DAR
-	std	r10,PACA_EXSLB+EX_DAR(r13)
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 1, 0x380, 1, 0, 0
 	EXCEPTION_PROLOG_2_REAL data_access_slb_common, EXC_STD, 1
 
 EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
 	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXSLB
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 0, 0x380, 0
-	mfspr	r10,SPRN_DAR
-	std	r10,PACA_EXSLB+EX_DAR(r13)
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXSLB, 0, 0x380, 1, 0, 0
 	EXCEPTION_PROLOG_2_VIRT data_access_slb_common, EXC_STD
 EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
 
@@ -1416,10 +1413,10 @@ EXC_REAL_BEGIN(hardware_interrupt, 0x500, 0x100)
 	SET_SCRATCH0(r13)	/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 BEGIN_FTR_SECTION
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, 0, 0, IRQS_DISABLED
 	EXCEPTION_PROLOG_2_REAL hardware_interrupt_common, EXC_HV, 1
 FTR_SECTION_ELSE
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x500, 0, 0, IRQS_DISABLED
 	EXCEPTION_PROLOG_2_REAL hardware_interrupt_common, EXC_STD, 1
 ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 EXC_REAL_END(hardware_interrupt, 0x500, 0x100)
@@ -1428,10 +1425,10 @@ EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
 	SET_SCRATCH0(r13)	/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 BEGIN_FTR_SECTION
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, 0, 0, IRQS_DISABLED
 	EXCEPTION_PROLOG_2_VIRT hardware_interrupt_common, EXC_HV
 FTR_SECTION_ELSE
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x500, 0, 0, IRQS_DISABLED
 	EXCEPTION_PROLOG_2_VIRT hardware_interrupt_common, EXC_STD
 ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
@@ -1444,22 +1441,14 @@ EXC_COMMON_ASYNC(hardware_interrupt_common, 0x500, do_IRQ)
 EXC_REAL_BEGIN(alignment, 0x600, 0x100)
 	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x600, 0
-	mfspr	r10,SPRN_DAR
-	mfspr	r11,SPRN_DSISR
-	std	r10,PACA_EXGEN+EX_DAR(r13)
-	stw	r11,PACA_EXGEN+EX_DSISR(r13)
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x600, 1, 1, 0
 	EXCEPTION_PROLOG_2_REAL alignment_common, EXC_STD, 1
 EXC_REAL_END(alignment, 0x600, 0x100)
 
 EXC_VIRT_BEGIN(alignment, 0x4600, 0x100)
 	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0 PACA_EXGEN
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x600, 0
-	mfspr	r10,SPRN_DAR
-	mfspr	r11,SPRN_DSISR
-	std	r10,PACA_EXGEN+EX_DAR(r13)
-	stw	r11,PACA_EXGEN+EX_DSISR(r13)
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, 0x600, 1, 1, 0
 	EXCEPTION_PROLOG_2_VIRT alignment_common, EXC_STD
 EXC_VIRT_END(alignment, 0x4600, 0x100)
 
@@ -1757,7 +1746,7 @@ __TRAMP_REAL_OOL_MASKABLE_HV(hmi_exception, 0xe60, IRQS_DISABLED)
 EXC_VIRT_NONE(0x4e60, 0x20)
 TRAMP_KVM_HV(PACA_EXGEN, 0xe60)
 TRAMP_REAL_BEGIN(hmi_exception_early)
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0xe60, 0
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0xe60, 0, 0, 0
 	mr	r10,r1			/* Save r1 */
 	ld	r1,PACAEMERGSP(r13)	/* Use emergency stack for realmode */
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
@@ -1942,7 +1931,7 @@ EXC_VIRT_NONE(0x5400, 0x100)
 EXC_REAL_BEGIN(denorm_exception_hv, 0x1500, 0x100)
 	mtspr	SPRN_SPRG_HSCRATCH0,r13
 	EXCEPTION_PROLOG_0 PACA_EXGEN
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 0, 0x1500, 0
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 0, 0x1500, 0, 0, 0
 
 #ifdef CONFIG_PPC_DENORMALISATION
 	mfspr	r10,SPRN_HSRR1
-- 
2.20.1

