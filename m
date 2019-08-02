Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ABD7F743
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 14:53:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460RsP48GDzDr4R
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 22:52:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="F+T6zS+h"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PNh5SH8zDqbX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:01:24 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id f5so27078450pgu.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=++e9gw8dj2nDvrHcus/4vENMk/TD70CFrPs/D83oIB8=;
 b=F+T6zS+hakao9Z3x/UOSg2WM5dJL0I8uLIevjaOqtlb+chfSRO2L9onzcnLW2VGvkp
 AgOhBVj2Bg0sJFH8VKNwRXWp1im8ZkOCc5E8Fj4xALsNwIaYbdzw0o8nljE/5+mIShAU
 RrihUF/bpwD4ew0mxDjmtJRf+noZ/giCGzJ6seRg7Tq0K/gR49/D0E1kMRhCom+6pWtR
 10N0T9+jIr8cAQrDfYRzyUBiUne6b3iCp/G7HT3pqciyS3vO1LheN7fonmhgEGru0YdV
 yiV2SeAUwI+cQ5GbnJay3KZ97Af2frHQD76sMv+t8cWJ08N1fZVTQaiulUdg4EMUoF08
 LoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=++e9gw8dj2nDvrHcus/4vENMk/TD70CFrPs/D83oIB8=;
 b=MaqU8MRAXLFkxNdHC+Ey1sET9Dbag8XetwDQ234v6iyG5YfYMgVivr8nxzFc+2JmqL
 KUn0A/wIaLvhrJQRbGCgfETqHheURmj17jqzPM/C0TuO9CEh1wP/6DwI4Ybd/+1sBwQZ
 UVX31LdsOqYj72RIFGAYqRHmRQgOiz3fEzTF5PFE7YfjPLWqwFH6CZa9sFe6g11/BWJu
 wxJrCgRl+ZJEc7rFvjkiZy2UpgvESp+rER2j1iOPmnEAo8FM2MlrKpP1UsAZBuC37S5s
 gSGAV0lU/miTlSC3G2oE5kOcCFGtZM3DdNwsfsORwbbzZwZYtCa+KJKB2If6Og4WD2Wb
 jtCw==
X-Gm-Message-State: APjAAAVzU/yauoMMx3VeJyARJjTMIUu0+DN7qQggNrA7lHhBLklska/B
 EmKqZfURwOIxnCmL3h+BpOiyv7+ghO8=
X-Google-Smtp-Source: APXvYqz6zdmf96FuGIrl5Lh9roq8FBB2UeGt/SbRIA8EWUWDxzQra/KzbWdE32hO+9Kr8K2KomrXdw==
X-Received: by 2002:a63:6f41:: with SMTP id k62mr77898461pgc.32.1564743682804; 
 Fri, 02 Aug 2019 04:01:22 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.01.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:01:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 44/44] powerpc/64s/exception: Remove old INT_KVM_HANDLER
Date: Fri,  2 Aug 2019 20:57:09 +1000
Message-Id: <20190802105709.27696-45-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 57 ++++++++++++++--------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 5b43cd201cdd..f2883e7d9abb 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -266,15 +266,6 @@ do_define_int n
 	.endif
 .endm
 
-.macro INT_KVM_HANDLER name, vec, hsrr, area, skip
-	TRAMP_KVM_BEGIN(\name\()_kvm)
-	KVM_HANDLER \vec, \hsrr, \area, \skip
-.endm
-
-.macro GEN_KVM name
-	KVM_HANDLER IVEC, IHSRR, IAREA, IKVM_SKIP
-.endm
-
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 /*
@@ -293,35 +284,35 @@ do_define_int n
 	bne	\name\()_kvm
 .endm
 
-.macro KVM_HANDLER vec, hsrr, area, skip
-	.if \skip
+.macro GEN_KVM name
+	.if IKVM_SKIP
 	cmpwi	r10,KVM_GUEST_MODE_SKIP
 	beq	89f
 	.else
 BEGIN_FTR_SECTION_NESTED(947)
-	ld	r10,\area+EX_CFAR(r13)
+	ld	r10,IAREA+EX_CFAR(r13)
 	std	r10,HSTATE_CFAR(r13)
 END_FTR_SECTION_NESTED(CPU_FTR_CFAR,CPU_FTR_CFAR,947)
 	.endif
 
 BEGIN_FTR_SECTION_NESTED(948)
-	ld	r10,\area+EX_PPR(r13)
+	ld	r10,IAREA+EX_PPR(r13)
 	std	r10,HSTATE_PPR(r13)
 END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
-	ld	r10,\area+EX_R10(r13)
+	ld	r10,IAREA+EX_R10(r13)
 	std	r12,HSTATE_SCRATCH0(r13)
 	sldi	r12,r9,32
 	/* HSRR variants have the 0x2 bit added to their trap number */
-	.if \hsrr == EXC_HV_OR_STD
+	.if IHSRR == EXC_HV_OR_STD
 	BEGIN_FTR_SECTION
-	ori	r12,r12,(\vec + 0x2)
+	ori	r12,r12,(IVEC + 0x2)
 	FTR_SECTION_ELSE
-	ori	r12,r12,(\vec)
+	ori	r12,r12,(IVEC)
 	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
-	.elseif \hsrr
-	ori	r12,r12,(\vec + 0x2)
+	.elseif IHSRR
+	ori	r12,r12,(IVEC+ 0x2)
 	.else
-	ori	r12,r12,(\vec)
+	ori	r12,r12,(IVEC)
 	.endif
 
 #ifdef CONFIG_RELOCATABLE
@@ -334,25 +325,25 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	std	r9,HSTATE_SCRATCH1(r13)
 	__LOAD_FAR_HANDLER(r9, kvmppc_interrupt)
 	mtctr	r9
-	ld	r9,\area+EX_R9(r13)
+	ld	r9,IAREA+EX_R9(r13)
 	bctr
 #else
-	ld	r9,\area+EX_R9(r13)
+	ld	r9,IAREA+EX_R9(r13)
 	b	kvmppc_interrupt
 #endif
 
 
-	.if \skip
+	.if IKVM_SKIP
 89:	mtocrf	0x80,r9
-	ld	r9,\area+EX_R9(r13)
-	ld	r10,\area+EX_R10(r13)
-	.if \hsrr == EXC_HV_OR_STD
+	ld	r9,IAREA+EX_R9(r13)
+	ld	r10,IAREA+EX_R10(r13)
+	.if IHSRR == EXC_HV_OR_STD
 	BEGIN_FTR_SECTION
 	b	kvmppc_skip_Hinterrupt
 	FTR_SECTION_ELSE
 	b	kvmppc_skip_interrupt
 	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
-	.elseif \hsrr
+	.elseif IHSRR
 	b	kvmppc_skip_Hinterrupt
 	.else
 	b	kvmppc_skip_interrupt
@@ -363,7 +354,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 #else
 .macro KVMTEST name, hsrr, n
 .endm
-.macro KVM_HANDLER name, vec, hsrr, area, skip
+.macro GEN_KVM name
 .endm
 #endif
 
@@ -1667,6 +1658,14 @@ EXC_VIRT_NONE(0x4b00, 0x100)
  * without saving, though xer is not a good idea to use, as hardware may
  * interpret some bits so it may be costly to change them.
  */
+INT_DEFINE_BEGIN(system_call)
+	IVEC=0xc00
+	IHSRR=EXC_STD
+	IAREA=PACA_EXGEN /* not actually used */
+	IKVM_REAL=1
+	IKVM_VIRT=1
+INT_DEFINE_END(system_call)
+
 .macro SYSTEM_CALL virt
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 	/*
@@ -1760,7 +1759,7 @@ TRAMP_KVM_BEGIN(system_call_kvm)
 	SET_SCRATCH0(r10)
 	std	r9,PACA_EXGEN+EX_R9(r13)
 	mfcr	r9
-	KVM_HANDLER 0xc00, EXC_STD, PACA_EXGEN, 0
+	GEN_KVM system_call
 #endif
 
 
-- 
2.22.0

