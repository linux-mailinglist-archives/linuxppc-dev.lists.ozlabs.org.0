Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A233E3CEE4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 16:37:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NXdZ6cFVzDqdG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 00:37:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sSX455sD"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXYg2kj3zDqTK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:33:43 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id q10so7547296pff.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=idRUfDTOPmJKt44j8Dd1KpqsUSCrx9gyOEFCK8ipJWY=;
 b=sSX455sDalsrv8tUVJx6HsDBgea8dMLQz/6Mn1MEzUCPwdHTdu/VyFg1ZQUXnwJY5Q
 2YrW68EYmKD54Rw3xfugc4gVArRkqwfwArwlcMP4rpkbIo9yFAMojK6jT97MmNSYFws1
 thDrzMbYvdRRFAH18gpGqR6HJOsU3hNckGo9QUR+Fg9nthjGY1caNsNNOzyDK86OCEGS
 vCgKrPjzvfyRpIi0OQLTfUnoiRbZ7fyM4qG35lQ7XzmfmsBSFEW2rwlazQwms5fk08bY
 6F4wCS8TZPNfX41O9cQHR7vYTpkKTjGAuBn3Wh90gMKrX2OsOTqsPwOA4NaQQ425sVtr
 Zb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=idRUfDTOPmJKt44j8Dd1KpqsUSCrx9gyOEFCK8ipJWY=;
 b=H5itQFDMoFeoxZ32l7AxOHCzPplaGPfEjPPJgXly5ovAx8bg/uUEXqxOvwiXuDvBm3
 l5tzpb7EKdsy5wUkRC490YqjpTYkC2AUB2QWc+iJzcaxn53HkqKXTNRC0rTi87rtwvBp
 lF2q7ku0AQy914AQfz2kVPBQoNv2VjzoAWECA8F8hcJZuUmToBbOslcoStZ5kgKWjVkR
 aZIFVDVuzaUg7m8/yylVqVQCtW2ObTbKxejSGFqL/e7ouO0xYGnLBLpEsWrwNWtW0OQv
 GOd4WfxyuCJCr/BrLuQP58cW+mJZPbwreYOEHOx3mCm6uPh390o5C8OUyhbjhye3OY9u
 9R7A==
X-Gm-Message-State: APjAAAXu5cNYWQmvRTGdGhlQlsl8FmW1/uhRE9VpjEDmr0jahmJEXLuq
 z9cwLCr5wjNEVTo+bMuZzt81WJaa
X-Google-Smtp-Source: APXvYqyvedmt2tUCXJQM8vteCxp8jGLPugubVsYzVY+abkHFNlajSW/zjlVV97v+zDTTxKEr5Fz3Ag==
X-Received: by 2002:a63:79c8:: with SMTP id u191mr1975939pgc.366.1560263620722; 
 Tue, 11 Jun 2019 07:33:40 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.33.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:33:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/28] powerpc/64s/exception: fix line wrap and semicolon
 inconsistencies in macros
Date: Wed, 12 Jun 2019 00:30:13 +1000
Message-Id: <20190611143040.7834-2-npiggin@gmail.com>
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

By convention, all lines should be separated by a semicolons. Last line
should have neither semicolon or line wrap.

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 36 ++++++-------
 arch/powerpc/include/asm/head-64.h       | 68 ++++++++++++------------
 2 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 841a0be6c1b2..d3987ce65857 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -185,11 +185,11 @@
  */
 #define LOAD_HANDLER(reg, label)					\
 	ld	reg,PACAKBASE(r13);	/* get high part of &label */	\
-	ori	reg,reg,FIXED_SYMBOL_ABS_ADDR(label);
+	ori	reg,reg,FIXED_SYMBOL_ABS_ADDR(label)
 
 #define __LOAD_HANDLER(reg, label)					\
 	ld	reg,PACAKBASE(r13);					\
-	ori	reg,reg,(ABS_ADDR(label))@l;
+	ori	reg,reg,(ABS_ADDR(label))@l
 
 /*
  * Branches from unrelocated code (e.g., interrupts) to labels outside
@@ -198,7 +198,7 @@
 #define __LOAD_FAR_HANDLER(reg, label)					\
 	ld	reg,PACAKBASE(r13);					\
 	ori	reg,reg,(ABS_ADDR(label))@l;				\
-	addis	reg,reg,(ABS_ADDR(label))@h;
+	addis	reg,reg,(ABS_ADDR(label))@h
 
 /* Exception register prefixes */
 #define EXC_HV	H
@@ -273,7 +273,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	OPT_SAVE_REG_TO_PACA(area+EX_CFAR, r10, CPU_FTR_CFAR);		\
 	INTERRUPT_TO_KERNEL;						\
 	SAVE_CTR(r10, area);						\
-	mfcr	r9;
+	mfcr	r9
 
 #define __EXCEPTION_PROLOG_1_POST(area)					\
 	std	r11,area+EX_R11(r13);					\
@@ -290,7 +290,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #define MASKABLE_EXCEPTION_PROLOG_1(area, extra, vec, bitmask)			\
 	__EXCEPTION_PROLOG_1_PRE(area);					\
 	extra(vec, bitmask);						\
-	__EXCEPTION_PROLOG_1_POST(area);
+	__EXCEPTION_PROLOG_1_POST(area)
 
 /*
  * This version of the EXCEPTION_PROLOG_1 is intended
@@ -299,7 +299,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #define _EXCEPTION_PROLOG_1(area, extra, vec)				\
 	__EXCEPTION_PROLOG_1_PRE(area);					\
 	extra(vec);							\
-	__EXCEPTION_PROLOG_1_POST(area);
+	__EXCEPTION_PROLOG_1_POST(area)
 
 #define EXCEPTION_PROLOG_1(area, extra, vec)				\
 	_EXCEPTION_PROLOG_1(area, extra, vec)
@@ -307,7 +307,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #define __EXCEPTION_PROLOG_2(label, h)					\
 	ld	r10,PACAKMSR(r13);	/* get MSR value for kernel */	\
 	mfspr	r11,SPRN_##h##SRR0;	/* save SRR0 */			\
-	LOAD_HANDLER(r12,label)						\
+	LOAD_HANDLER(r12,label);					\
 	mtspr	SPRN_##h##SRR0,r12;					\
 	mfspr	r12,SPRN_##h##SRR1;	/* and SRR1 */			\
 	mtspr	SPRN_##h##SRR1,r10;					\
@@ -321,7 +321,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	ld	r10,PACAKMSR(r13);	/* get MSR value for kernel */	\
 	xori	r10,r10,MSR_RI;		/* Clear MSR_RI */		\
 	mfspr	r11,SPRN_##h##SRR0;	/* save SRR0 */			\
-	LOAD_HANDLER(r12,label)						\
+	LOAD_HANDLER(r12,label);					\
 	mtspr	SPRN_##h##SRR0,r12;					\
 	mfspr	r12,SPRN_##h##SRR1;	/* and SRR1 */			\
 	mtspr	SPRN_##h##SRR1,r10;					\
@@ -335,7 +335,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	SET_SCRATCH0(r13);		/* save r13 */			\
 	EXCEPTION_PROLOG_0(area);					\
 	EXCEPTION_PROLOG_1(area, extra, vec);				\
-	EXCEPTION_PROLOG_2(label, h);
+	EXCEPTION_PROLOG_2(label, h)
 
 #define __KVMTEST(h, n)							\
 	lbz	r10,HSTATE_IN_GUEST(r13);				\
@@ -409,7 +409,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #define EXCEPTION_PROLOG_NORI(area, label, h, extra, vec)		\
 	EXCEPTION_PROLOG_0(area);					\
 	EXCEPTION_PROLOG_1(area, extra, vec);				\
-	EXCEPTION_PROLOG_2_NORI(label, h);
+	EXCEPTION_PROLOG_2_NORI(label, h)
 
 
 #define __KVM_HANDLER(area, h, n)					\
@@ -546,16 +546,16 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 
 /* Version of above for when we have to branch out-of-line */
 #define __OOL_EXCEPTION(vec, label, hdlr)			\
-	SET_SCRATCH0(r13)					\
-	EXCEPTION_PROLOG_0(PACA_EXGEN)				\
-	b hdlr;
+	SET_SCRATCH0(r13);					\
+	EXCEPTION_PROLOG_0(PACA_EXGEN);				\
+	b hdlr
 
 #define STD_EXCEPTION_OOL(vec, label)				\
 	EXCEPTION_PROLOG_1(PACA_EXGEN, KVMTEST_PR, vec);	\
 	EXCEPTION_PROLOG_2(label, EXC_STD)
 
 #define STD_EXCEPTION_HV(loc, vec, label)			\
-	EXCEPTION_PROLOG(PACA_EXGEN, label, EXC_HV, KVMTEST_HV, vec);
+	EXCEPTION_PROLOG(PACA_EXGEN, label, EXC_HV, KVMTEST_HV, vec)
 
 #define STD_EXCEPTION_HV_OOL(vec, label)			\
 	EXCEPTION_PROLOG_1(PACA_EXGEN, KVMTEST_HV, vec);	\
@@ -563,14 +563,14 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 
 #define STD_RELON_EXCEPTION(loc, vec, label)		\
 	/* No guest interrupts come through here */	\
-	EXCEPTION_RELON_PROLOG(PACA_EXGEN, label, EXC_STD, NOTEST, vec);
+	EXCEPTION_RELON_PROLOG(PACA_EXGEN, label, EXC_STD, NOTEST, vec)
 
 #define STD_RELON_EXCEPTION_OOL(vec, label)			\
 	EXCEPTION_PROLOG_1(PACA_EXGEN, NOTEST, vec);		\
 	EXCEPTION_PROLOG_2_RELON(label, EXC_STD)
 
 #define STD_RELON_EXCEPTION_HV(loc, vec, label)		\
-	EXCEPTION_RELON_PROLOG(PACA_EXGEN, label, EXC_HV, KVMTEST_HV, vec);
+	EXCEPTION_RELON_PROLOG(PACA_EXGEN, label, EXC_HV, KVMTEST_HV, vec)
 
 #define STD_RELON_EXCEPTION_HV_OOL(vec, label)			\
 	EXCEPTION_PROLOG_1(PACA_EXGEN, KVMTEST_HV, vec);	\
@@ -615,7 +615,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	SET_SCRATCH0(r13);    /* save r13 */				\
 	EXCEPTION_PROLOG_0(PACA_EXGEN);					\
 	MASKABLE_EXCEPTION_PROLOG_1(PACA_EXGEN, extra, vec, bitmask);	\
-	EXCEPTION_PROLOG_2(label, h);
+	EXCEPTION_PROLOG_2(label, h)
 
 #define MASKABLE_EXCEPTION(vec, label, bitmask)				\
 	__MASKABLE_EXCEPTION(vec, label, EXC_STD, SOFTEN_TEST_PR, bitmask)
@@ -642,7 +642,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 
 #define MASKABLE_RELON_EXCEPTION_OOL(vec, label, bitmask)		\
 	MASKABLE_EXCEPTION_PROLOG_1(PACA_EXGEN, SOFTEN_NOTEST_PR, vec, bitmask);\
-	EXCEPTION_PROLOG_2(label, EXC_STD);
+	EXCEPTION_PROLOG_2(label, EXC_STD)
 
 #define MASKABLE_RELON_EXCEPTION_HV(vec, label, bitmask)		\
 	__MASKABLE_RELON_EXCEPTION(vec, label, EXC_HV, SOFTEN_TEST_HV, bitmask)
diff --git a/arch/powerpc/include/asm/head-64.h b/arch/powerpc/include/asm/head-64.h
index a4f947888744..e34b3d06bf61 100644
--- a/arch/powerpc/include/asm/head-64.h
+++ b/arch/powerpc/include/asm/head-64.h
@@ -255,135 +255,135 @@ end_##sname:
 
 #define EXC_VIRT_NONE(start, size)				\
 	FIXED_SECTION_ENTRY_BEGIN_LOCATION(virt_vectors, exc_virt_##start##_##unused, start, size); \
-	FIXED_SECTION_ENTRY_END_LOCATION(virt_vectors, exc_virt_##start##_##unused, start, size);
+	FIXED_SECTION_ENTRY_END_LOCATION(virt_vectors, exc_virt_##start##_##unused, start, size)
 
 
 #define EXC_REAL(name, start, size)					\
 	EXC_REAL_BEGIN(name, start, size);				\
 	STD_EXCEPTION(start, name##_common);				\
-	EXC_REAL_END(name, start, size);
+	EXC_REAL_END(name, start, size)
 
 #define EXC_VIRT(name, start, size, realvec)				\
 	EXC_VIRT_BEGIN(name, start, size);				\
 	STD_RELON_EXCEPTION(start, realvec, name##_common);		\
-	EXC_VIRT_END(name, start, size);
+	EXC_VIRT_END(name, start, size)
 
 #define EXC_REAL_MASKABLE(name, start, size, bitmask)			\
 	EXC_REAL_BEGIN(name, start, size);				\
 	MASKABLE_EXCEPTION(start, name##_common, bitmask);		\
-	EXC_REAL_END(name, start, size);
+	EXC_REAL_END(name, start, size)
 
 #define EXC_VIRT_MASKABLE(name, start, size, realvec, bitmask)		\
 	EXC_VIRT_BEGIN(name, start, size);				\
 	MASKABLE_RELON_EXCEPTION(realvec, name##_common, bitmask);	\
-	EXC_VIRT_END(name, start, size);
+	EXC_VIRT_END(name, start, size)
 
 #define EXC_REAL_HV(name, start, size)					\
 	EXC_REAL_BEGIN(name, start, size);				\
 	STD_EXCEPTION_HV(start, start, name##_common);			\
-	EXC_REAL_END(name, start, size);
+	EXC_REAL_END(name, start, size)
 
 #define EXC_VIRT_HV(name, start, size, realvec)				\
 	EXC_VIRT_BEGIN(name, start, size);				\
 	STD_RELON_EXCEPTION_HV(start, realvec, name##_common);		\
-	EXC_VIRT_END(name, start, size);
+	EXC_VIRT_END(name, start, size)
 
 #define __EXC_REAL_OOL(name, start, size)				\
 	EXC_REAL_BEGIN(name, start, size);				\
 	__OOL_EXCEPTION(start, label, tramp_real_##name);		\
-	EXC_REAL_END(name, start, size);
+	EXC_REAL_END(name, start, size)
 
 #define __TRAMP_REAL_OOL(name, vec)					\
 	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	STD_EXCEPTION_OOL(vec, name##_common);
+	STD_EXCEPTION_OOL(vec, name##_common)
 
 #define EXC_REAL_OOL(name, start, size)					\
 	__EXC_REAL_OOL(name, start, size);				\
-	__TRAMP_REAL_OOL(name, start);
+	__TRAMP_REAL_OOL(name, start)
 
 #define __EXC_REAL_OOL_MASKABLE(name, start, size)			\
-	__EXC_REAL_OOL(name, start, size);
+	__EXC_REAL_OOL(name, start, size)
 
 #define __TRAMP_REAL_OOL_MASKABLE(name, vec, bitmask)			\
 	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	MASKABLE_EXCEPTION_OOL(vec, name##_common, bitmask);
+	MASKABLE_EXCEPTION_OOL(vec, name##_common, bitmask)
 
 #define EXC_REAL_OOL_MASKABLE(name, start, size, bitmask)		\
 	__EXC_REAL_OOL_MASKABLE(name, start, size);			\
-	__TRAMP_REAL_OOL_MASKABLE(name, start, bitmask);
+	__TRAMP_REAL_OOL_MASKABLE(name, start, bitmask)
 
 #define __EXC_REAL_OOL_HV_DIRECT(name, start, size, handler)		\
 	EXC_REAL_BEGIN(name, start, size);				\
 	__OOL_EXCEPTION(start, label, handler);				\
-	EXC_REAL_END(name, start, size);
+	EXC_REAL_END(name, start, size)
 
 #define __EXC_REAL_OOL_HV(name, start, size)				\
-	__EXC_REAL_OOL(name, start, size);
+	__EXC_REAL_OOL(name, start, size)
 
 #define __TRAMP_REAL_OOL_HV(name, vec)					\
 	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	STD_EXCEPTION_HV_OOL(vec, name##_common);			\
+	STD_EXCEPTION_HV_OOL(vec, name##_common)
 
 #define EXC_REAL_OOL_HV(name, start, size)				\
 	__EXC_REAL_OOL_HV(name, start, size);				\
-	__TRAMP_REAL_OOL_HV(name, start);
+	__TRAMP_REAL_OOL_HV(name, start)
 
 #define __EXC_REAL_OOL_MASKABLE_HV(name, start, size)			\
-	__EXC_REAL_OOL(name, start, size);
+	__EXC_REAL_OOL(name, start, size)
 
 #define __TRAMP_REAL_OOL_MASKABLE_HV(name, vec, bitmask)		\
 	TRAMP_REAL_BEGIN(tramp_real_##name);				\
-	MASKABLE_EXCEPTION_HV_OOL(vec, name##_common, bitmask);		\
+	MASKABLE_EXCEPTION_HV_OOL(vec, name##_common, bitmask)
 
 #define EXC_REAL_OOL_MASKABLE_HV(name, start, size, bitmask)		\
 	__EXC_REAL_OOL_MASKABLE_HV(name, start, size);			\
-	__TRAMP_REAL_OOL_MASKABLE_HV(name, start, bitmask);
+	__TRAMP_REAL_OOL_MASKABLE_HV(name, start, bitmask)
 
 #define __EXC_VIRT_OOL(name, start, size)				\
 	EXC_VIRT_BEGIN(name, start, size);				\
 	__OOL_EXCEPTION(start, label, tramp_virt_##name);		\
-	EXC_VIRT_END(name, start, size);
+	EXC_VIRT_END(name, start, size)
 
 #define __TRAMP_VIRT_OOL(name, realvec)					\
 	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	STD_RELON_EXCEPTION_OOL(realvec, name##_common);
+	STD_RELON_EXCEPTION_OOL(realvec, name##_common)
 
 #define EXC_VIRT_OOL(name, start, size, realvec)			\
 	__EXC_VIRT_OOL(name, start, size);				\
-	__TRAMP_VIRT_OOL(name, realvec);
+	__TRAMP_VIRT_OOL(name, realvec)
 
 #define __EXC_VIRT_OOL_MASKABLE(name, start, size)			\
-	__EXC_VIRT_OOL(name, start, size);
+	__EXC_VIRT_OOL(name, start, size)
 
 #define __TRAMP_VIRT_OOL_MASKABLE(name, realvec, bitmask)		\
 	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	MASKABLE_RELON_EXCEPTION_OOL(realvec, name##_common, bitmask);
+	MASKABLE_RELON_EXCEPTION_OOL(realvec, name##_common, bitmask)
 
 #define EXC_VIRT_OOL_MASKABLE(name, start, size, realvec, bitmask)	\
 	__EXC_VIRT_OOL_MASKABLE(name, start, size);			\
-	__TRAMP_VIRT_OOL_MASKABLE(name, realvec, bitmask);
+	__TRAMP_VIRT_OOL_MASKABLE(name, realvec, bitmask)
 
 #define __EXC_VIRT_OOL_HV(name, start, size)				\
-	__EXC_VIRT_OOL(name, start, size);
+	__EXC_VIRT_OOL(name, start, size)
 
 #define __TRAMP_VIRT_OOL_HV(name, realvec)				\
 	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	STD_RELON_EXCEPTION_HV_OOL(realvec, name##_common);		\
+	STD_RELON_EXCEPTION_HV_OOL(realvec, name##_common)
 
 #define EXC_VIRT_OOL_HV(name, start, size, realvec)			\
 	__EXC_VIRT_OOL_HV(name, start, size);				\
-	__TRAMP_VIRT_OOL_HV(name, realvec);
+	__TRAMP_VIRT_OOL_HV(name, realvec)
 
 #define __EXC_VIRT_OOL_MASKABLE_HV(name, start, size)			\
-	__EXC_VIRT_OOL(name, start, size);
+	__EXC_VIRT_OOL(name, start, size)
 
 #define __TRAMP_VIRT_OOL_MASKABLE_HV(name, realvec, bitmask)		\
 	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
-	MASKABLE_RELON_EXCEPTION_HV_OOL(realvec, name##_common, bitmask);\
+	MASKABLE_RELON_EXCEPTION_HV_OOL(realvec, name##_common, bitmask)
 
 #define EXC_VIRT_OOL_MASKABLE_HV(name, start, size, realvec, bitmask)	\
 	__EXC_VIRT_OOL_MASKABLE_HV(name, start, size);			\
-	__TRAMP_VIRT_OOL_MASKABLE_HV(name, realvec, bitmask);
+	__TRAMP_VIRT_OOL_MASKABLE_HV(name, realvec, bitmask)
 
 #define TRAMP_KVM(area, n)						\
 	TRAMP_KVM_BEGIN(do_kvm_##n);					\
@@ -406,11 +406,11 @@ end_##sname:
 
 #define EXC_COMMON(name, realvec, hdlr)					\
 	EXC_COMMON_BEGIN(name);						\
-	STD_EXCEPTION_COMMON(realvec, name, hdlr);			\
+	STD_EXCEPTION_COMMON(realvec, name, hdlr)
 
 #define EXC_COMMON_ASYNC(name, realvec, hdlr)				\
 	EXC_COMMON_BEGIN(name);						\
-	STD_EXCEPTION_COMMON_ASYNC(realvec, name, hdlr);		\
+	STD_EXCEPTION_COMMON_ASYNC(realvec, name, hdlr)
 
 #endif /* __ASSEMBLY__ */
 
-- 
2.20.1

