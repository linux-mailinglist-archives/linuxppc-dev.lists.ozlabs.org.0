Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AF4A81FD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 14:18:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NjXB0mXnzDqvT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 22:18:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qvwlc7Vf"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nj34154BzDqWN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 21:56:32 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id h195so6545863pfe.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2019 04:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k9a1/NQoJ2MLj772TeragrcYgupJmLLGri8cZzXMO8M=;
 b=Qvwlc7VfU0OLYke8cLQq/rn3Z5C/8Tv4oauUtXX/K61pdhwkO9/QSBP2aUJQhEaD4O
 Go+HfbvM8gVFQyeb6l8e15TgtnPiAGXK3RLUxON1PNsO96jnZXLfsK6+qOpASFfb4kXT
 xJO4SwO/cFYBMHqsNBpvaBNUcL0e+0huKkiKViZPRPljyJf18ebu73JXFT3aokee7FRo
 nbCPNfQ8MRWgiinMBsiFWi6yEG0gM/WS8Pj449fvgKvgLaA9yr9Q4iWdo3iugVfE4qwA
 1IUAoYF11IRbU1j6jTq4bUpmH42GDutOyKn89lSr/RE7+XMwFjUciM2paCaed+XXhKkW
 DuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k9a1/NQoJ2MLj772TeragrcYgupJmLLGri8cZzXMO8M=;
 b=XTVzxykOj7NKW30u4UuP2hn6OD9mYK/OkByJjFPBnCfGzSG3tsf5fpekW0SMLUhPdp
 cQdhXr5gdZvg8CsoWvAXpyZ4ANrXcbjHRXHrvMCjZJ1Ci5XACGCQooIWzwyq+FqTFENs
 tqSJ4MVaTjoOOv8P1fYMRP1rR1U+XAWmGVGimqjNqmxO58Mg5zGwn28KobjMoNVy0Z83
 s2z1LLDuxJ2me5aMQP3rbZWx551SK671wYYk+pLROG+pRDdTCernNxImLGvOwmYVa0st
 ZstLciac085Malci5gMfV69hOhGbCRessFr6Daja+e/ESCJQBoY8+/bcIW7IfrikipW9
 Gn+A==
X-Gm-Message-State: APjAAAVHzdyNP1fkwkdGTujtAQ/lPbR6qK4LbQP6WCe67ro21JxP2mJu
 F3OyQsjgwZyPkUUqEEeXMs1AwkWl
X-Google-Smtp-Source: APXvYqz7fW5xKkd5mnndU/G6TxleoxcnTDxIzJ/2JhsLFbMGLLwmQ9IjegjO1bf8MwZnQ1EMygDtLQ==
X-Received: by 2002:a63:20d:: with SMTP id 13mr35451857pgc.253.1567598187984; 
 Wed, 04 Sep 2019 04:56:27 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id g18sm19554789pgm.9.2019.09.04.04.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 04:56:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 08/20] powerpc/64s/exception: Remove old INT_KVM_HANDLER
Date: Wed,  4 Sep 2019 21:55:23 +1000
Message-Id: <20190904115535.18559-9-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 55 +++++++++++++---------------
 1 file changed, 26 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index f318869607db..bef0c2eee7dc 100644
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
 
@@ -1640,6 +1631,12 @@ EXC_VIRT_NONE(0x4b00, 0x100)
  * without saving, though xer is not a good idea to use, as hardware may
  * interpret some bits so it may be costly to change them.
  */
+INT_DEFINE_BEGIN(system_call)
+	IVEC=0xc00
+	IKVM_REAL=1
+	IKVM_VIRT=1
+INT_DEFINE_END(system_call)
+
 .macro SYSTEM_CALL virt
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 	/*
@@ -1733,7 +1730,7 @@ TRAMP_KVM_BEGIN(system_call_kvm)
 	SET_SCRATCH0(r10)
 	std	r9,PACA_EXGEN+EX_R9(r13)
 	mfcr	r9
-	KVM_HANDLER 0xc00, EXC_STD, PACA_EXGEN, 0
+	GEN_KVM system_call
 #endif
 
 
-- 
2.22.0

