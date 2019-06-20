Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E53E4C6CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 07:33:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tr7l265CzDqx4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 15:33:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KXoA1/9S"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TqlB0hGNzDqwL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:15:17 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id i2so894625plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Ea9DM/myIqSJnv/dl7fUqGWdV5nwLvUAgk8lAmmjKc=;
 b=KXoA1/9S4nJW2l5lzUJV9+1ZKz18EnOdhAcgAEu0mm6KWmjy8IuNWwkj2xFXVH58qx
 HCXkAFMQHfxRpPtYEkJwh4T0TyWyqlp9is9rVVBQ1p7x73bQt9H5Vzp+JTKzPDAwdE5t
 6Mc9KriDFZZKyOij86cl0wTAdL5HO9sB0LJnP9FNxz5cVDxFGcXFSXoBheqz4WL5wjCZ
 IgZKJvg+/S3qawiNEFzL9Luts5pL38eCVEY9GafumjnRXk+WDTCgKtmLu4Cc7wT1eMSI
 ZegFLMF/eXMk4a2xzaxcN0KRnEexph5roTOgvngatFvqmXjU8c3M/3JLfdqZVGCZZZcx
 L0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Ea9DM/myIqSJnv/dl7fUqGWdV5nwLvUAgk8lAmmjKc=;
 b=ti42ghJ/QKniHhu0/UiExQkZlE7ThpPyhoImy2BaGFnYkAp8z5hKhFQ2l17SGgNEFD
 J1zksrloZ/tzVYQ484w/i8BAfn11bXHpOoeu7Qad7K4DW0p8kKQqiGx4o9kZFy+SCIU3
 /7WBuPsrg9TiQ0qjFxNaVWdN5Dl7ujLIfEROKMC2LkMqxXI2A1y+eYM5No8+wtiCPmMM
 zfuMfYFrClkVXDhbltXzm2sFgWftcMnOZ/kYKwYxd8a+CGgZdPzKU3l0tp7SNUuM4bYJ
 OalCqBISUU5cGAqq+jxU4p6fPPDYnet5skxKXXMNSsYcL93vMN3as8QOJuBK6fZFHZR0
 A7YA==
X-Gm-Message-State: APjAAAVB6pOMJFMxn62oiE28VVDDymYfbr3q3bDIN9RUGZrfQxECP1K7
 E6+X/JAuK146vGyUKPsISaa++Bsr
X-Google-Smtp-Source: APXvYqzBNTC6LE3E/d3HsT4C3VviLgSkeLsgoL8fKkKUtJobqagn4t51l6d/5WqUfXx1IxQ+vJFFSQ==
X-Received: by 2002:a17:902:8546:: with SMTP id
 d6mr112606474plo.207.1561007715202; 
 Wed, 19 Jun 2019 22:15:15 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.15.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:15:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 08/52] powerpc/64s/exception: merge KVM handler and skip
 variants
Date: Thu, 20 Jun 2019 15:14:15 +1000
Message-Id: <20190620051459.29573-9-npiggin@gmail.com>
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

Conditionally expand the skip case if it is specified.

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 28 +++++++++---------------
 arch/powerpc/include/asm/head-64.h       |  8 +++----
 arch/powerpc/kernel/exceptions-64s.S     |  2 +-
 3 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 74ddcb37156c..737c37d1df4b 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -431,26 +431,17 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	.endif
 .endm
 
-.macro KVM_HANDLER area, hsrr, n
+.macro KVM_HANDLER area, hsrr, n, skip
+	.if \skip
+	cmpwi	r10,KVM_GUEST_MODE_SKIP
+	beq	89f
+	.else
 	BEGIN_FTR_SECTION_NESTED(947)
 	ld	r10,\area+EX_CFAR(r13)
 	std	r10,HSTATE_CFAR(r13)
 	END_FTR_SECTION_NESTED(CPU_FTR_CFAR,CPU_FTR_CFAR,947)
-	BEGIN_FTR_SECTION_NESTED(948)
-	ld	r10,\area+EX_PPR(r13)
-	std	r10,HSTATE_PPR(r13)
-	END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
-	ld	r10,\area+EX_R10(r13)
-	std	r12,HSTATE_SCRATCH0(r13)
-	sldi	r12,r9,32
-	ori	r12,r12,(\n)
-	/* This reloads r9 before branching to kvmppc_interrupt */
-	__BRANCH_TO_KVM_EXIT(\area, kvmppc_interrupt)
-.endm
+	.endif
 
-.macro KVM_HANDLER_SKIP area, hsrr, n
-	cmpwi	r10,KVM_GUEST_MODE_SKIP
-	beq	89f
 	BEGIN_FTR_SECTION_NESTED(948)
 	ld	r10,\area+EX_PPR(r13)
 	std	r10,HSTATE_PPR(r13)
@@ -461,6 +452,8 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	ori	r12,r12,(\n)
 	/* This reloads r9 before branching to kvmppc_interrupt */
 	__BRANCH_TO_KVM_EXIT(\area, kvmppc_interrupt)
+
+	.if \skip
 89:	mtocrf	0x80,r9
 	ld	r9,\area+EX_R9(r13)
 	ld	r10,\area+EX_R10(r13)
@@ -469,14 +462,13 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	.else
 	b	kvmppc_skip_interrupt
 	.endif
+	.endif
 .endm
 
 #else
 .macro KVMTEST hsrr, n
 .endm
-.macro KVM_HANDLER area, hsrr, n
-.endm
-.macro KVM_HANDLER_SKIP area, hsrr, n
+.macro KVM_HANDLER area, hsrr, n, skip
 .endm
 #endif
 
diff --git a/arch/powerpc/include/asm/head-64.h b/arch/powerpc/include/asm/head-64.h
index 4767d6c7b8fa..518d9758b41e 100644
--- a/arch/powerpc/include/asm/head-64.h
+++ b/arch/powerpc/include/asm/head-64.h
@@ -387,22 +387,22 @@ end_##sname:
 
 #define TRAMP_KVM(area, n)						\
 	TRAMP_KVM_BEGIN(do_kvm_##n);					\
-	KVM_HANDLER area, EXC_STD, n
+	KVM_HANDLER area, EXC_STD, n, 0
 
 #define TRAMP_KVM_SKIP(area, n)						\
 	TRAMP_KVM_BEGIN(do_kvm_##n);					\
-	KVM_HANDLER_SKIP area, EXC_STD, n
+	KVM_HANDLER area, EXC_STD, n, 1
 
 /*
  * HV variant exceptions get the 0x2 bit added to their trap number.
  */
 #define TRAMP_KVM_HV(area, n)						\
 	TRAMP_KVM_BEGIN(do_kvm_H##n);					\
-	KVM_HANDLER area, EXC_HV, n + 0x2
+	KVM_HANDLER area, EXC_HV, n + 0x2, 0
 
 #define TRAMP_KVM_HV_SKIP(area, n)					\
 	TRAMP_KVM_BEGIN(do_kvm_H##n);					\
-	KVM_HANDLER_SKIP area, EXC_HV, n + 0x2
+	KVM_HANDLER area, EXC_HV, n + 0x2, 1
 
 #define EXC_COMMON(name, realvec, hdlr)					\
 	EXC_COMMON_BEGIN(name);						\
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 01f7bfe0653c..484d0710ca08 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1063,7 +1063,7 @@ TRAMP_KVM_BEGIN(do_kvm_0xc00)
 	SET_SCRATCH0(r10)
 	std	r9,PACA_EXGEN+EX_R9(r13)
 	mfcr	r9
-	KVM_HANDLER PACA_EXGEN, EXC_STD, 0xc00
+	KVM_HANDLER PACA_EXGEN, EXC_STD, 0xc00, 0
 #endif
 
 
-- 
2.20.1

