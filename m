Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EA83D07E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:11:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NYPd0trCzDqf8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 01:11:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FWR9hTEE"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXZJ2cNlzDqTn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:34:16 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id go2so5193520plb.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=487YhZVee8DqH6KPq1PU5yupFfvFsX/ioloLW7HI+EE=;
 b=FWR9hTEERQz8abQatN8Pp/q5kP+JbbGsl5AWU8UE5S3GDdbljs+3ZEoup0QcISSoWI
 GbETBr0JrUpyEPdqMcTL+DfQpPQoUbICkz9PvVJn5z+k5vOXAbglq5Iid3M58YxJspiW
 b1GkI1cqK8GEXWB26QG344MToG1C8UzwnTPIqylS5lL5olpEM9B8w0tUpe+dx6O9SIG2
 GVhtpG3cZQYQXRtblJ1uu0aYjftgYFtD4Rb1dmiAov6zWYuS7iMtkEIFvlaxWybKFEZU
 I101oXzxiC/KKbLp2+yLvdUBt/7L09JzpH4/rt3FG3LM+xibICnYSOEoqWrgRIMRP0+a
 kDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=487YhZVee8DqH6KPq1PU5yupFfvFsX/ioloLW7HI+EE=;
 b=f911dvRA5G1s6nKWvPXo8FaMei91xtz4p4XFS3vJn4e/Apya05LU/Iwop2pG9o7wx+
 oYlNeczUTXvRBeb7dzG6E2xG96z0P4i1Udq8yYKGsiG8QWwX9UvtgqcfPd9pfCBCPEZG
 qhe8nERTTJCFFhOLTCPQoSIAxhQiFoXdFjyhXQbaOe0Z6wK0o9ezuCaG3dXyB8DGM5De
 dXJ00Ri59J+dlkChTJErLkrku9dg/EYnWFJO23bzuKCGM7UymZj85K0MQufqLYvdQyCk
 ibyakHTf3Rr34rxqTgtq8Z0BaxzLEsz3p3v3cEAD0G55eYYNXP1Zjyyq6kJsroYLQwxe
 PJIQ==
X-Gm-Message-State: APjAAAW9uDgE6kGPaaPX/mxiY6pIYCjl8xse7wQqPcyDKyhUqng9+ES3
 VBqOJBvkneR02yUvGPhV+mcCx5ST
X-Google-Smtp-Source: APXvYqylvwYty6M7e7pD3otpHXcxgoaQi3WpSZdO9f9jpm0Ul2LEC5fI9oTdQQEdIHixcK4sYnfeGA==
X-Received: by 2002:a17:902:542:: with SMTP id
 60mr54390345plf.68.1560263651704; 
 Tue, 11 Jun 2019 07:34:11 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.34.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:34:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 13/28] powerpc/64s/exception: unwind exception-64s.h macros
Date: Wed, 12 Jun 2019 00:30:25 +1000
Message-Id: <20190611143040.7834-14-npiggin@gmail.com>
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

Many of these macros just specify 1-4 lines which are only called a
few times each at most, and often just once. Remove this indirection.

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 101 -----------------------
 arch/powerpc/include/asm/head-64.h       |  76 ++++++++++++-----
 arch/powerpc/kernel/exceptions-64s.S     |  44 +++++-----
 3 files changed, 82 insertions(+), 139 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 24fc0104c9d3..0bb0310b794f 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -226,17 +226,6 @@
 #endif
 .endm
 
-/*
- * As EXCEPTION_PROLOG(), except we've already got relocation on so no need to
- * rfid. Save CTR in case we're CONFIG_RELOCATABLE, in which case
- * EXCEPTION_PROLOG_2_VIRT will be using CTR.
- */
-#define EXCEPTION_RELON_PROLOG(area, label, hsrr, kvm, vec)		\
-	SET_SCRATCH0(r13);		/* save r13 */			\
-	EXCEPTION_PROLOG_0 area ;					\
-	EXCEPTION_PROLOG_1 hsrr, area, kvm, vec, 0 ;			\
-	EXCEPTION_PROLOG_2_VIRT label, hsrr
-
 /* Exception register prefixes */
 #define EXC_HV		1
 #define EXC_STD		0
@@ -346,12 +335,6 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	std	r10,\area\()+EX_R13(r13)
 .endm
 
-#define EXCEPTION_PROLOG(area, label, hsrr, kvm, vec)			\
-	SET_SCRATCH0(r13);		/* save r13 */			\
-	EXCEPTION_PROLOG_0 area	;					\
-	EXCEPTION_PROLOG_1 hsrr, area, kvm, vec, 0 ;			\
-	EXCEPTION_PROLOG_2_REAL label, hsrr, 1
-
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 /*
  * If hv is possible, interrupts come into to the hv version
@@ -415,12 +398,6 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 
 #endif
 
-/* Do not enable RI */
-#define EXCEPTION_PROLOG_NORI(area, label, hsrr, kvm, vec)		\
-	EXCEPTION_PROLOG_0 area ;					\
-	EXCEPTION_PROLOG_1 hsrr, area, kvm, vec, 0 ;			\
-	EXCEPTION_PROLOG_2_REAL label, hsrr, 0
-
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 .macro KVMTEST hsrr, n
 	lbz	r10,HSTATE_IN_GUEST(r13)
@@ -557,84 +534,6 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	std	r10,RESULT(r1);		/* clear regs->result		*/ \
 	std	r11,STACK_FRAME_OVERHEAD-16(r1); /* mark the frame	*/
 
-/*
- * Exception vectors.
- */
-#define STD_EXCEPTION(vec, label)				\
-	EXCEPTION_PROLOG(PACA_EXGEN, label, EXC_STD, 1, vec);
-
-/* Version of above for when we have to branch out-of-line */
-#define __OOL_EXCEPTION(vec, label, hdlr)			\
-	SET_SCRATCH0(r13);					\
-	EXCEPTION_PROLOG_0 PACA_EXGEN ;				\
-	b hdlr
-
-#define STD_EXCEPTION_OOL(vec, label)				\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, 0 ;	\
-	EXCEPTION_PROLOG_2_REAL label, EXC_STD, 1
-
-#define STD_EXCEPTION_HV(loc, vec, label)			\
-	EXCEPTION_PROLOG(PACA_EXGEN, label, EXC_HV, 1, vec)
-
-#define STD_EXCEPTION_HV_OOL(vec, label)			\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, 0 ;	\
-	EXCEPTION_PROLOG_2_REAL label, EXC_HV, 1
-
-#define STD_RELON_EXCEPTION(loc, vec, label)		\
-	/* No guest interrupts come through here */	\
-	EXCEPTION_RELON_PROLOG(PACA_EXGEN, label, EXC_STD, 0, vec)
-
-#define STD_RELON_EXCEPTION_OOL(vec, label)			\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, vec, 0 ;	\
-	EXCEPTION_PROLOG_2_VIRT label, EXC_STD
-
-#define STD_RELON_EXCEPTION_HV(loc, vec, label)			\
-	EXCEPTION_RELON_PROLOG(PACA_EXGEN, label, EXC_HV, 1, vec)
-
-#define STD_RELON_EXCEPTION_HV_OOL(vec, label)			\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, 0 ;	\
-	EXCEPTION_PROLOG_2_VIRT label, EXC_HV
-
-#define __MASKABLE_EXCEPTION(vec, label, hsrr, kvm, bitmask)		\
-	SET_SCRATCH0(r13);    /* save r13 */				\
-	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
-	EXCEPTION_PROLOG_1 hsrr, PACA_EXGEN, kvm, vec, bitmask ;	\
-	EXCEPTION_PROLOG_2_REAL label, hsrr, 1
-
-#define MASKABLE_EXCEPTION(vec, label, bitmask)				\
-	__MASKABLE_EXCEPTION(vec, label, EXC_STD, 1, bitmask)
-
-#define MASKABLE_EXCEPTION_OOL(vec, label, bitmask)			\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, bitmask ;	\
-	EXCEPTION_PROLOG_2_REAL label, EXC_STD, 1
-
-#define MASKABLE_EXCEPTION_HV(vec, label, bitmask)			\
-	__MASKABLE_EXCEPTION(vec, label, EXC_HV, 1, bitmask)
-
-#define MASKABLE_EXCEPTION_HV_OOL(vec, label, bitmask)			\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, bitmask ;	\
-	EXCEPTION_PROLOG_2_REAL label, EXC_HV, 1
-
-#define __MASKABLE_RELON_EXCEPTION(vec, label, hsrr, kvm, bitmask)	\
-	SET_SCRATCH0(r13);    /* save r13 */				\
-	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
-	EXCEPTION_PROLOG_1 hsrr, PACA_EXGEN, kvm, vec, bitmask ;	\
-	EXCEPTION_PROLOG_2_VIRT label, hsrr
-
-#define MASKABLE_RELON_EXCEPTION(vec, label, bitmask)			\
-	__MASKABLE_RELON_EXCEPTION(vec, label, EXC_STD, 0, bitmask)
-
-#define MASKABLE_RELON_EXCEPTION_OOL(vec, label, bitmask)		\
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, vec, bitmask ;	\
-	EXCEPTION_PROLOG_2_REAL label, EXC_STD, 1
-
-#define MASKABLE_RELON_EXCEPTION_HV(vec, label, bitmask)		\
-	__MASKABLE_RELON_EXCEPTION(vec, label, EXC_HV, 1, bitmask)
-
-#define MASKABLE_RELON_EXCEPTION_HV_OOL(vec, label, bitmask)		\
-	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, bitmask ;	\
-	EXCEPTION_PROLOG_2_VIRT label, EXC_HV
-
 #define RUNLATCH_ON				\
 BEGIN_FTR_SECTION				\
 	ld	r3, PACA_THREAD_INFO(r13);	\
diff --git a/arch/powerpc/include/asm/head-64.h b/arch/powerpc/include/asm/head-64.h
index acd94fcf9f40..54db05afb80f 100644
--- a/arch/powerpc/include/asm/head-64.h
+++ b/arch/powerpc/include/asm/head-64.h
@@ -258,44 +258,71 @@ end_##sname:
 	FIXED_SECTION_ENTRY_END_LOCATION(virt_vectors, exc_virt_##start##_##unused, start, size)
 
 
-#define EXC_REAL(name, start, size)					\
+#define __EXC_REAL(name, start, size, area)				\
 	EXC_REAL_BEGIN(name, start, size);				\
-	STD_EXCEPTION(start, name##_common);				\
+	SET_SCRATCH0(r13);		/* save r13 */			\
+	EXCEPTION_PROLOG_0 area ;					\
+	EXCEPTION_PROLOG_1 EXC_STD, area, 1, start, 0 ;			\
+	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1 ;		\
 	EXC_REAL_END(name, start, size)
 
-#define EXC_VIRT(name, start, size, realvec)				\
+#define EXC_REAL(name, start, size)					\
+	__EXC_REAL(name, start, size, PACA_EXGEN)
+
+#define __EXC_VIRT(name, start, size, realvec, area)			\
 	EXC_VIRT_BEGIN(name, start, size);				\
-	STD_RELON_EXCEPTION(start, realvec, name##_common);		\
+	SET_SCRATCH0(r13);    /* save r13 */				\
+	EXCEPTION_PROLOG_0 area ;					\
+	EXCEPTION_PROLOG_1 EXC_STD, area, 0, realvec, 0;		\
+	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD ;		\
 	EXC_VIRT_END(name, start, size)
 
+#define EXC_VIRT(name, start, size, realvec)				\
+	__EXC_VIRT(name, start, size, realvec, PACA_EXGEN)
+
 #define EXC_REAL_MASKABLE(name, start, size, bitmask)			\
 	EXC_REAL_BEGIN(name, start, size);				\
-	MASKABLE_EXCEPTION(start, name##_common, bitmask);		\
+	SET_SCRATCH0(r13);    /* save r13 */				\
+	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, start, bitmask ;	\
+	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1 ;		\
 	EXC_REAL_END(name, start, size)
 
 #define EXC_VIRT_MASKABLE(name, start, size, realvec, bitmask)		\
 	EXC_VIRT_BEGIN(name, start, size);				\
-	MASKABLE_RELON_EXCEPTION(realvec, name##_common, bitmask);	\
+	SET_SCRATCH0(r13);    /* save r13 */				\
+	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, realvec, bitmask ;	\
+	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD ;		\
 	EXC_VIRT_END(name, start, size)
 
 #define EXC_REAL_HV(name, start, size)					\
 	EXC_REAL_BEGIN(name, start, size);				\
-	STD_EXCEPTION_HV(start, start, name##_common);			\
+	SET_SCRATCH0(r13);		/* save r13 */			\
+	EXCEPTION_PROLOG_0 PACA_EXGEN;					\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, start, 0 ;		\
+	EXCEPTION_PROLOG_2_REAL name##_common, EXC_HV, 1 ;		\
 	EXC_REAL_END(name, start, size)
 
 #define EXC_VIRT_HV(name, start, size, realvec)				\
 	EXC_VIRT_BEGIN(name, start, size);				\
-	STD_RELON_EXCEPTION_HV(start, realvec, name##_common);		\
+	SET_SCRATCH0(r13);		/* save r13 */			\
+	EXCEPTION_PROLOG_0 PACA_EXGEN;					\
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0 ;		\
+	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_HV ;			\
 	EXC_VIRT_END(name, start, size)
 
 #define __EXC_REAL_OOL(name, start, size)				\
 	EXC_REAL_BEGIN(name, start, size);				\
-	__OOL_EXCEPTION(start, label, tramp_real_##name);		\
+	SET_SCRATCH0(r13);						\
+	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
+	b	tramp_real_##name ;					\
 	EXC_REAL_END(name, start, size)
 
 #define __TRAMP_REAL_OOL(name, vec)					\
 	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	STD_EXCEPTION_OOL(vec, name##_common)
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, 0 ;	\
+	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1
 
 #define EXC_REAL_OOL(name, start, size)					\
 	__EXC_REAL_OOL(name, start, size);				\
@@ -306,7 +333,8 @@ end_##sname:
 
 #define __TRAMP_REAL_OOL_MASKABLE(name, vec, bitmask)			\
 	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	MASKABLE_EXCEPTION_OOL(vec, name##_common, bitmask)
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, vec, bitmask ;	\
+	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1
 
 #define EXC_REAL_OOL_MASKABLE(name, start, size, bitmask)		\
 	__EXC_REAL_OOL_MASKABLE(name, start, size);			\
@@ -314,7 +342,9 @@ end_##sname:
 
 #define __EXC_REAL_OOL_HV_DIRECT(name, start, size, handler)		\
 	EXC_REAL_BEGIN(name, start, size);				\
-	__OOL_EXCEPTION(start, label, handler);				\
+	SET_SCRATCH0(r13);						\
+	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
+	b	handler;						\
 	EXC_REAL_END(name, start, size)
 
 #define __EXC_REAL_OOL_HV(name, start, size)				\
@@ -322,7 +352,8 @@ end_##sname:
 
 #define __TRAMP_REAL_OOL_HV(name, vec)					\
 	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	STD_EXCEPTION_HV_OOL(vec, name##_common)
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, 0 ;	\
+	EXCEPTION_PROLOG_2_REAL name##_common, EXC_HV, 1
 
 #define EXC_REAL_OOL_HV(name, start, size)				\
 	__EXC_REAL_OOL_HV(name, start, size);				\
@@ -333,7 +364,8 @@ end_##sname:
 
 #define __TRAMP_REAL_OOL_MASKABLE_HV(name, vec, bitmask)		\
 	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	MASKABLE_EXCEPTION_HV_OOL(vec, name##_common, bitmask)
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, vec, bitmask ;	\
+	EXCEPTION_PROLOG_2_REAL name##_common, EXC_HV, 1
 
 #define EXC_REAL_OOL_MASKABLE_HV(name, start, size, bitmask)		\
 	__EXC_REAL_OOL_MASKABLE_HV(name, start, size);			\
@@ -341,12 +373,15 @@ end_##sname:
 
 #define __EXC_VIRT_OOL(name, start, size)				\
 	EXC_VIRT_BEGIN(name, start, size);				\
-	__OOL_EXCEPTION(start, label, tramp_virt_##name);		\
+	SET_SCRATCH0(r13);						\
+	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
+	b	tramp_virt_##name;					\
 	EXC_VIRT_END(name, start, size)
 
 #define __TRAMP_VIRT_OOL(name, realvec)					\
 	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	STD_RELON_EXCEPTION_OOL(realvec, name##_common)
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, vec, 0 ;		\
+	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD
 
 #define EXC_VIRT_OOL(name, start, size, realvec)			\
 	__EXC_VIRT_OOL(name, start, size);				\
@@ -357,7 +392,8 @@ end_##sname:
 
 #define __TRAMP_VIRT_OOL_MASKABLE(name, realvec, bitmask)		\
 	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	MASKABLE_RELON_EXCEPTION_OOL(realvec, name##_common, bitmask)
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, realvec, bitmask ;	\
+	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1
 
 #define EXC_VIRT_OOL_MASKABLE(name, start, size, realvec, bitmask)	\
 	__EXC_VIRT_OOL_MASKABLE(name, start, size);			\
@@ -368,7 +404,8 @@ end_##sname:
 
 #define __TRAMP_VIRT_OOL_HV(name, realvec)				\
 	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	STD_RELON_EXCEPTION_HV_OOL(realvec, name##_common)
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, 0 ;		\
+	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_HV
 
 #define EXC_VIRT_OOL_HV(name, start, size, realvec)			\
 	__EXC_VIRT_OOL_HV(name, start, size);				\
@@ -379,7 +416,8 @@ end_##sname:
 
 #define __TRAMP_VIRT_OOL_MASKABLE_HV(name, realvec, bitmask)		\
 	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	MASKABLE_RELON_EXCEPTION_HV_OOL(realvec, name##_common, bitmask)
+	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, realvec, bitmask ;	\
+	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_HV
 
 #define EXC_VIRT_OOL_MASKABLE_HV(name, start, size, realvec, bitmask)	\
 	__EXC_VIRT_OOL_MASKABLE_HV(name, start, size);			\
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 935019529f16..b8dba3fffeeb 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -254,9 +254,11 @@ EXC_COMMON_BEGIN(system_reset_common)
  */
 TRAMP_REAL_BEGIN(system_reset_fwnmi)
 	SET_SCRATCH0(r13)		/* save r13 */
-	/* See comment at system_reset exception */
-	EXCEPTION_PROLOG_NORI(PACA_EXNMI, system_reset_common, EXC_STD,
-			      0, 0x100)
+	/* See comment at system_reset exception, don't turn on RI */
+	EXCEPTION_PROLOG_0 PACA_EXNMI
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXNMI, 0, 0x100, 0
+	EXCEPTION_PROLOG_2_REAL system_reset_common, EXC_STD, 0
+
 #endif /* CONFIG_PPC_PSERIES */
 
 
@@ -714,14 +716,8 @@ MMU_FTR_SECTION_ELSE
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 
-EXC_REAL_BEGIN(instruction_access_slb, 0x480, 0x80)
-EXCEPTION_PROLOG(PACA_EXSLB, instruction_access_slb_common, EXC_STD, 1, 0x480);
-EXC_REAL_END(instruction_access_slb, 0x480, 0x80)
-
-EXC_VIRT_BEGIN(instruction_access_slb, 0x4480, 0x80)
-EXCEPTION_RELON_PROLOG(PACA_EXSLB, instruction_access_slb_common, EXC_STD, 0, 0x480);
-EXC_VIRT_END(instruction_access_slb, 0x4480, 0x80)
-
+__EXC_REAL(instruction_access_slb, 0x480, 0x80, PACA_EXSLB)
+__EXC_VIRT(instruction_access_slb, 0x4480, 0x80, 0x480, PACA_EXSLB)
 TRAMP_KVM(PACA_EXSLB, 0x480)
 
 EXC_COMMON_BEGIN(instruction_access_slb_common)
@@ -750,24 +746,34 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 
 EXC_REAL_BEGIN(hardware_interrupt, 0x500, 0x100)
-	.globl hardware_interrupt_hv;
+	.globl hardware_interrupt_hv
 hardware_interrupt_hv:
 	BEGIN_FTR_SECTION
-		MASKABLE_EXCEPTION_HV(0x500, hardware_interrupt_common, IRQS_DISABLED)
+		SET_SCRATCH0(r13)	/* save r13 */
+		EXCEPTION_PROLOG_0 PACA_EXGEN
+		EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
+		EXCEPTION_PROLOG_2_REAL hardware_interrupt_common, EXC_HV, 1
 	FTR_SECTION_ELSE
-		MASKABLE_EXCEPTION(0x500, hardware_interrupt_common, IRQS_DISABLED)
+		SET_SCRATCH0(r13)	/* save r13 */
+		EXCEPTION_PROLOG_0 PACA_EXGEN
+		EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
+		EXCEPTION_PROLOG_2_REAL hardware_interrupt_common, EXC_STD, 1
 	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 EXC_REAL_END(hardware_interrupt, 0x500, 0x100)
 
 EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
-	.globl hardware_interrupt_relon_hv;
+	.globl hardware_interrupt_relon_hv
 hardware_interrupt_relon_hv:
 	BEGIN_FTR_SECTION
-		MASKABLE_RELON_EXCEPTION_HV(0x500, hardware_interrupt_common,
-					    IRQS_DISABLED)
+		SET_SCRATCH0(r13)	/* save r13 */
+		EXCEPTION_PROLOG_0 PACA_EXGEN
+		EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
+		EXCEPTION_PROLOG_2_VIRT hardware_interrupt_common, EXC_HV
 	FTR_SECTION_ELSE
-		__MASKABLE_RELON_EXCEPTION(0x500, hardware_interrupt_common,
-					   EXC_STD, 1, IRQS_DISABLED)
+		SET_SCRATCH0(r13)	/* save r13 */
+		EXCEPTION_PROLOG_0 PACA_EXGEN
+		EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
+		EXCEPTION_PROLOG_2_VIRT hardware_interrupt_common, EXC_STD
 	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
 
-- 
2.20.1

