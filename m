Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D96B2D8E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 03:32:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WBgn0gKpzF5xR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 11:32:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uir3BmFX"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WBbM13VczF5pm
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 11:28:30 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id i18so17243765pgl.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 18:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rxmjz0iKLpD4SvQHr6gqGFu7B4HWvIXc0QCj5vXAUUQ=;
 b=Uir3BmFX5sMDJEYNYALGnFpnSsF9q7j/jsg2BmzJY72MB4FAI39iHy2V7ZkzlsEF+n
 s3XNSjLgMth/VdVQAPE1u6MIRGkEKQ7rcT5hsJvUkuEE39wz8TFXs4e+21mlBkWVT8XW
 yBPbOOFgUsVfpZc5RhYUIVWrnRmYplhcZ1ktwuqIPdDQnrUlO5Uy2+BN1QwBxtRy05w2
 3uzeTMRc4/jL6ZVREh4R4B8bFfEtMc/F1YYFo/TAIb6r3PlFkmbX98eISWTdMkCKT0oI
 0Js6yc539gU7VKId1/ceDUqWBb1fLtXgyqrSqP7ojx64ct8gkhF4PDqAFnumapVIkFlD
 LGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rxmjz0iKLpD4SvQHr6gqGFu7B4HWvIXc0QCj5vXAUUQ=;
 b=JeY3S/9nyOUni+tfkqxB53XP3+syT7WZjVB6NYmkFIIL/T3FCoNZRMHhIV1NvNpXvc
 KS498EUquQnYi6tC5Fyzvj0NdMRHdXPhrqPNgfZS6jLbf2/G+r/NLwNRanlEIRfZP38g
 B5+hquD0NjSMs3yoY4Zu7rJJNIwu5clomfQlP5fYq6b4IaaUYbepXGOrub+XEmhkQKlh
 jQhyXb7igFationRNNgyQdQQ+HQFjps+6iBZ58uWw5p1ZIC/N3fOF91aode32J3X+IrA
 5BOAj8a9efUl9ounkR+SaKmbqOetzGxvcjloAg2ZcYja0VZ7X5Ooe/gPXw/iYL2dN6e3
 seTA==
X-Gm-Message-State: APjAAAXmrP+B7W5UCZ74Np1EcPYuXyh0E09bAEZZ3xN3ZpqHf/0kXzXc
 Z7SYtgVL5Bw319WfrBaN4LS8bv51
X-Google-Smtp-Source: APXvYqxE0ZdlcD96BCTQqnJ3dex9rgGmkBNFDuNfxo4dQoiAksb7Iiycw9q/xhuS1B0GEz+cBWoo9A==
X-Received: by 2002:a63:1:: with SMTP id 1mr18684498pga.162.1568510908956;
 Sat, 14 Sep 2019 18:28:28 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id bt1sm6267043pjb.17.2019.09.14.18.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 18:28:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 01/27] powerpc/64s/exception: Introduce INT_DEFINE
 parameter block for code generation
Date: Sun, 15 Sep 2019 11:27:47 +1000
Message-Id: <20190915012813.29317-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190915012813.29317-1-npiggin@gmail.com>
References: <20190915012813.29317-1-npiggin@gmail.com>
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The code generation macro arguments are difficult to read, and
defaults can't easily be used.

This introduces a block where parameters can be set for interrupt
handler code generation by the subsequent macros, and adds the first
generation macro for interrupt entry.

One interrupt handler is converted to the new macros to demonstrate
the change, the rest will be coverted all at once.

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 77 ++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index d0018dd17e0a..e6ad6e6cf65e 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -193,6 +193,61 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	mtctr	reg;							\
 	bctr
 
+/*
+ * Interrupt code generation macros
+ */
+#define IVEC		.L_IVEC_\name\()
+#define IHSRR		.L_IHSRR_\name\()
+#define IAREA		.L_IAREA_\name\()
+#define IDAR		.L_IDAR_\name\()
+#define IDSISR		.L_IDSISR_\name\()
+#define ISET_RI		.L_ISET_RI_\name\()
+#define IEARLY		.L_IEARLY_\name\()
+#define IMASK		.L_IMASK_\name\()
+#define IKVM_REAL	.L_IKVM_REAL_\name\()
+#define IKVM_VIRT	.L_IKVM_VIRT_\name\()
+
+#define INT_DEFINE_BEGIN(n)						\
+.macro int_define_ ## n name
+
+#define INT_DEFINE_END(n)						\
+.endm ;									\
+int_define_ ## n n ;							\
+do_define_int n
+
+.macro do_define_int name
+	.ifndef IVEC
+		.error "IVEC not defined"
+	.endif
+	.ifndef IHSRR
+		IHSRR=EXC_STD
+	.endif
+	.ifndef IAREA
+		IAREA=PACA_EXGEN
+	.endif
+	.ifndef IDAR
+		IDAR=0
+	.endif
+	.ifndef IDSISR
+		IDSISR=0
+	.endif
+	.ifndef ISET_RI
+		ISET_RI=1
+	.endif
+	.ifndef IEARLY
+		IEARLY=0
+	.endif
+	.ifndef IMASK
+		IMASK=0
+	.endif
+	.ifndef IKVM_REAL
+		IKVM_REAL=0
+	.endif
+	.ifndef IKVM_VIRT
+		IKVM_VIRT=0
+	.endif
+.endm
+
 .macro INT_KVM_HANDLER name, vec, hsrr, area, skip
 	TRAMP_KVM_BEGIN(\name\()_kvm)
 	KVM_HANDLER \vec, \hsrr, \area, \skip
@@ -474,7 +529,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	 */
 	GET_SCRATCH0(r10)
 	std	r10,\area\()+EX_R13(r13)
-	.if \dar
+	.if \dar == 1
 	.if \hsrr
 	mfspr	r10,SPRN_HDAR
 	.else
@@ -482,7 +537,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	.endif
 	std	r10,\area\()+EX_DAR(r13)
 	.endif
-	.if \dsisr
+	.if \dsisr == 1
 	.if \hsrr
 	mfspr	r10,SPRN_HDSISR
 	.else
@@ -506,6 +561,14 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	.endif
 .endm
 
+.macro GEN_INT_ENTRY name, virt, ool=0
+	.if ! \virt
+		INT_HANDLER \name, IVEC, \ool, IEARLY, \virt, IHSRR, IAREA, ISET_RI, IDAR, IDSISR, IMASK, IKVM_REAL
+	.else
+		INT_HANDLER \name, IVEC, \ool, IEARLY, \virt, IHSRR, IAREA, ISET_RI, IDAR, IDSISR, IMASK, IKVM_VIRT
+	.endif
+.endm
+
 /*
  * On entry r13 points to the paca, r9-r13 are saved in the paca,
  * r9 contains the saved CR, r11 and r12 contain the saved SRR0 and
@@ -1143,12 +1206,18 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	bl	unrecoverable_exception
 	b	.
 
+INT_DEFINE_BEGIN(data_access)
+	IVEC=0x300
+	IDAR=1
+	IDSISR=1
+	IKVM_REAL=1
+INT_DEFINE_END(data_access)
 
 EXC_REAL_BEGIN(data_access, 0x300, 0x80)
-	INT_HANDLER data_access, 0x300, ool=1, dar=1, dsisr=1, kvm=1
+	GEN_INT_ENTRY data_access, virt=0, ool=1
 EXC_REAL_END(data_access, 0x300, 0x80)
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
-	INT_HANDLER data_access, 0x300, virt=1, dar=1, dsisr=1
+	GEN_INT_ENTRY data_access, virt=1
 EXC_VIRT_END(data_access, 0x4300, 0x80)
 INT_KVM_HANDLER data_access, 0x300, EXC_STD, PACA_EXGEN, 1
 EXC_COMMON_BEGIN(data_access_common)
-- 
2.23.0

