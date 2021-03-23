Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B299C3454B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:10:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Cw25QnCz3dxl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:10:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Kf++xqHo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Kf++xqHo; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Cn22vCsz30CT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:04:06 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id v2so10039265pgk.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x+zNdTNiHoG9h0tPBaB8kTjqRlqBrIRaZsrvtex2a8Y=;
 b=Kf++xqHo0jiSQ3fBKSUKtOpU/3QhP2HKv3yOrBIATh7kE8mUns2oz9CWqc3DB08zX1
 c58mn0FD8L583ROjo/mrKYPKyTOp775S4BIy0LOxKYinuTny+XfYbbLEbz8qHTxRZQTU
 kg+Z++hrjbNSzQz5K+Pp98ecxyx43jCmfjrAOk4Hae91roPRCgcZJXaQ1nQLBWe9Zvyu
 UJLdlzlIL6TyCE20omCn4KpNGTFouvtXrh3gqBHWxC5YgVR86gLXtb7Akw48/m81WSf3
 E4LXwHh+VujB9S+DGTimeFfr+mBTb/hdvKWfyBKcrtSwYzGVadakO/sEdzQa7SFMpBg4
 /i7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+zNdTNiHoG9h0tPBaB8kTjqRlqBrIRaZsrvtex2a8Y=;
 b=DAYWMH4kqd1WAHObb/aUSs50azAAXjXPt9NxBxtnF9Ze1sB4dp5NCjn7BJZI5M0TWi
 TobcXSAxVsBn2gWMwESQK9HfRAG8dXhGBu2TBGNeAK6mlYAzTFUKKWCbwU1FDtHBrQYP
 cV8ZCSFbHCjEONLXsKotpaTNkKv1KNMd1lPrZflFzRXQYwSfMhDsN+YM+/PrpMybXXYl
 eo1Vt0q7nh5PYIznY5bxBtlR4zmLtp4aCKZO47szGsScywTcUZWg6BFs+7P79rHrFH+W
 +GNVGJ60w72Ja9uGI/ioqtZr+yH2eTLiV/1SSnGbBdNSBuZOiMVf5673va5HdK2HcpHZ
 K45w==
X-Gm-Message-State: AOAM530fssXdLwirl50b3LBFI3EZnlGuobMS99ABSJ7Se2SUBCioalYu
 FVQDRDjpz6mLDlFFcqSSfHYShHm2R6U=
X-Google-Smtp-Source: ABdhPJwQUvfPpBraXCM/3QjMsW8Q12v0mDgXOZX9iue0iOKRnksn5E/8K3kD7HYhG5MSiARz0M7MqA==
X-Received: by 2002:aa7:9478:0:b029:1fd:1fc1:bdfe with SMTP id
 t24-20020aa794780000b02901fd1fc1bdfemr2323624pfq.57.1616461444640; 
 Mon, 22 Mar 2021 18:04:04 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:04:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 15/46] KVM: PPC: Book3S 64: Move hcall early register setup
 to KVM
Date: Tue, 23 Mar 2021 11:02:34 +1000
Message-Id: <20210323010305.1045293-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210323010305.1045293-1-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

System calls / hcalls have a different calling convention than
other interrupts, so there is code in the KVMTEST to massage these
into the same form as other interrupt handlers.

Move this work into the KVM hcall handler. This means teaching KVM
a little more about the low level interrupt handler setup, PACA save
areas, etc., although that's not obviously worse than the current
approach of coming up with an entirely different interrupt register
/ save convention.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 13 ++++++++
 arch/powerpc/kernel/exceptions-64s.S     | 42 +-----------------------
 arch/powerpc/kvm/book3s_64_entry.S       | 23 +++++++++++++
 3 files changed, 37 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index c1a8aac01cf9..bb6f78fcf981 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -35,6 +35,19 @@
 /* PACA save area size in u64 units (exgen, exmc, etc) */
 #define EX_SIZE		10
 
+/* PACA save area offsets */
+#define EX_R9		0
+#define EX_R10		8
+#define EX_R11		16
+#define EX_R12		24
+#define EX_R13		32
+#define EX_DAR		40
+#define EX_DSISR	48
+#define EX_CCR		52
+#define EX_CFAR		56
+#define EX_PPR		64
+#define EX_CTR		72
+
 /*
  * maximum recursive depth of MCE exceptions
  */
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 98bf73df0f57..a23feaa445b5 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -21,22 +21,6 @@
 #include <asm/feature-fixups.h>
 #include <asm/kup.h>
 
-/* PACA save area offsets (exgen, exmc, etc) */
-#define EX_R9		0
-#define EX_R10		8
-#define EX_R11		16
-#define EX_R12		24
-#define EX_R13		32
-#define EX_DAR		40
-#define EX_DSISR	48
-#define EX_CCR		52
-#define EX_CFAR		56
-#define EX_PPR		64
-#define EX_CTR		72
-.if EX_SIZE != 10
-	.error "EX_SIZE is wrong"
-.endif
-
 /*
  * Following are fixed section helper macros.
  *
@@ -1964,29 +1948,8 @@ EXC_VIRT_END(system_call, 0x4c00, 0x100)
 
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 TRAMP_REAL_BEGIN(system_call_kvm)
-	/*
-	 * This is a hcall, so register convention is as above, with these
-	 * differences:
-	 * r13 = PACA
-	 * ctr = orig r13
-	 * orig r10 saved in PACA
-	 */
-	 /*
-	  * Save the PPR (on systems that support it) before changing to
-	  * HMT_MEDIUM. That allows the KVM code to save that value into the
-	  * guest state (it is the guest's PPR value).
-	  */
-BEGIN_FTR_SECTION
-	mfspr	r10,SPRN_PPR
-	std	r10,HSTATE_PPR(r13)
-END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
-	HMT_MEDIUM
 	mfctr	r10
-	SET_SCRATCH0(r10)
-	mfcr	r10
-	std	r12,HSTATE_SCRATCH0(r13)
-	sldi	r12,r10,32
-	ori	r12,r12,0xc00
+	SET_SCRATCH0(r10) /* Save r13 in SCRATCH0 */
 #ifdef CONFIG_RELOCATABLE
 	/*
 	 * Requires __LOAD_FAR_HANDLER beause kvmppc_hcall lives
@@ -1994,15 +1957,12 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	 */
 	__LOAD_FAR_HANDLER(r10, kvmppc_hcall)
 	mtctr   r10
-	ld	r10,PACA_EXGEN+EX_R10(r13)
 	bctr
 #else
-	ld	r10,PACA_EXGEN+EX_R10(r13)
 	b       kvmppc_hcall
 #endif
 #endif
 
-
 /**
  * Interrupt 0xd00 - Trace Interrupt.
  * This is a synchronous interrupt in response to instruction step or
diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index 8cf5e24a81eb..dea8c5bb207b 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -14,6 +14,29 @@
 .global	kvmppc_hcall
 .balign IFETCH_ALIGN_BYTES
 kvmppc_hcall:
+	/*
+	 * This is a hcall, so register convention is as
+	 * Documentation/powerpc/papr_hcalls.rst, with these additions:
+	 * R13		= PACA
+	 * guest R13 saved in SPRN_SCRATCH0
+	 * R10		= free
+	 * guest r10 saved in PACA_EXGEN
+	 */
+	 /*
+	  * Save the PPR (on systems that support it) before changing to
+	  * HMT_MEDIUM. That allows the KVM code to save that value into the
+	  * guest state (it is the guest's PPR value).
+	  */
+BEGIN_FTR_SECTION
+	mfspr	r10,SPRN_PPR
+	std	r10,HSTATE_PPR(r13)
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
+	HMT_MEDIUM
+	mfcr	r10
+	std	r12,HSTATE_SCRATCH0(r13)
+	sldi	r12,r10,32
+	ori	r12,r12,0xc00
+	ld	r10,PACA_EXGEN+EX_R10(r13)
 
 .global	kvmppc_interrupt
 .balign IFETCH_ALIGN_BYTES
-- 
2.23.0

