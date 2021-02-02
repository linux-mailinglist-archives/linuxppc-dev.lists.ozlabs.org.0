Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A09E730B5C2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 04:19:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV95K6K8GzDqVk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 14:19:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QtHkEhU7; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV8ll47JdzDqjT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 14:03:47 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id r38so13920122pgk.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Feb 2021 19:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4BVMs1eI4ftVoSL+zUWabpiVvkWT9oHnIuTQaI+hCtQ=;
 b=QtHkEhU7O7wVhrxoiCNhEOoC8Gwhh4xDnIiufAU/Jb72B4OfoxFnHi0jVdzokikKmW
 aGvnjPy49j3eQLgwCyqWXQieQ9MI7pLYEa98DEREzEWJInqtkCQY1SlMgg1nMnaiXEnU
 k4XinTG1Qp296sxkNFGKEt56ynamIz286baVgf/ZhsoX9+DtO0RjyqHRgogSPNHJGSwl
 THfnKEptdIOJexcRTkFodEnmKp3eUhpjbAkCb68r8EcryzmVP2CV+yZcahM036kpnEkL
 beZs1ss4qkUG/zFte5304WRjftJIfu+8srOhuYI/iAUL3YMKOWJzKxEG+HMr9ZnrWCNg
 X2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4BVMs1eI4ftVoSL+zUWabpiVvkWT9oHnIuTQaI+hCtQ=;
 b=hbirl888hKzbqrj4gANoicyKpL3r6G04wbaQa62P7o65w6oDupd4ZPEdeVNjkJ1OOb
 R3HJfCwo1nIIY9PqpfRzGx0r1n3eO7/bwRB4xtPWWy762VC1JmbYJ/nxBueTXSx4sdcP
 2oFzoRY/l7YprwRoRUQgJ807jhcUzgI43vV6rEzSqoB/Ln3ydsDasx5AiGPmMRiilXJz
 eajEnHHNDmI7C/pptFgHCAdvydel272C/0rt6hZ7bpn9mAviiPqm1DQPMPDVgiaV9TB7
 lVLY7uC1Edo4OtsTGTQL4e1rFxz6e1ytaVEH56h0uGJt105r4uWsVak6zNaV5CYJqIfV
 KJxA==
X-Gm-Message-State: AOAM5316q6wLsv1aRRxV3UQSf2xKSHWaXYNaGtmZRs4VzaKLgp1Nc7OD
 288slzWq9Rp7qfJEF43NUoysNejpsb4=
X-Google-Smtp-Source: ABdhPJx/DlMu/4wAMZY8C9aMWnzLHQaYGm9MJb5STjougpD298+ZD0uUU71SCjKWiJer61zGLPMS0Q==
X-Received: by 2002:a05:6a00:a8f:b029:1bd:bb89:5911 with SMTP id
 b15-20020a056a000a8fb02901bdbb895911mr19069196pfl.42.1612235025069; 
 Mon, 01 Feb 2021 19:03:45 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id a24sm20877337pff.18.2021.02.01.19.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 19:03:44 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 8/9] KVM: PPC: Book3S HV: Minimise hcall handler calling
 convention differences
Date: Tue,  2 Feb 2021 13:03:12 +1000
Message-Id: <20210202030313.3509446-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210202030313.3509446-1-npiggin@gmail.com>
References: <20210202030313.3509446-1-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 16 +++++++++++++++-
 arch/powerpc/kvm/book3s_64_entry.S   | 22 +++-------------------
 2 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index bed4499488b3..0844558f1d7c 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1923,8 +1923,22 @@ EXC_VIRT_END(system_call, 0x4c00, 0x100)
 
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 TRAMP_REAL_BEGIN(kvm_hcall)
+	std	r9,PACA_EXGEN+EX_R9(r13)
+	std	r11,PACA_EXGEN+EX_R11(r13)
+	std	r12,PACA_EXGEN+EX_R12(r13)
+	mfcr	r9
 	mfctr	r10
-	SET_SCRATCH0(r10) /* Save r13 in SCRATCH0 */
+	std	r10,PACA_EXGEN+EX_R13(r13)
+	li	r10,0
+	std	r10,PACA_EXGEN+EX_CFAR(r13)
+	std	r10,PACA_EXGEN+EX_CTR(r13)
+BEGIN_FTR_SECTION
+	mfspr	r10,SPRN_PPR
+	std	r10,PACA_EXGEN+EX_PPR(r13)
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
+
+	HMT_MEDIUM
+
 #ifdef CONFIG_RELOCATABLE
 	/*
 	 * Requires __LOAD_FAR_HANDLER beause kvmppc_hcall lives
diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index 0d9e1e55c24d..0e39267aef63 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -9,24 +9,9 @@
 .global	kvmppc_hcall
 .balign IFETCH_ALIGN_BYTES
 kvmppc_hcall:
-	/*
-	 * This is a hcall, so register convention is as
-	 * Documentation/powerpc/papr_hcalls.rst, with these additions:
-	 * R13		= PACA
-	 * guest R13 saved in SPRN_SCRATCH0
-	 * R10		= free
-	 */
-BEGIN_FTR_SECTION
-	mfspr	r10,SPRN_PPR
-	std	r10,HSTATE_PPR(r13)
-END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
-	HMT_MEDIUM
-	mfcr	r10
-	std	r12,HSTATE_SCRATCH0(r13)
-	sldi	r12,r10,32
-	ori	r12,r12,0xc00
-	ld	r10,PACA_EXGEN+EX_R10(r13)
-	b	do_kvm_interrupt
+	ld	r10,PACA_EXGEN+EX_R13(r13)
+	SET_SCRATCH0(r10)
+	li	r10,0xc00
 
 .global	kvmppc_interrupt
 .balign IFETCH_ALIGN_BYTES
@@ -57,7 +42,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	ld	r10,EX_R10(r11)
 	ld	r11,EX_R11(r11)
 
-do_kvm_interrupt:
 	/*
 	 * Hcalls and other interrupts come here after normalising register
 	 * contents and save locations:
-- 
2.23.0

