Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B93F3393F95
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:11:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrzSy5sgpz3ckh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:11:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=WZKn3cKN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WZKn3cKN; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzPJ0DwZz3bsH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:08:19 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d78so2749878pfd.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c4rb6UpQNet/XLnuaDGUA+A1NAiDLTGDulXgKSIiuFk=;
 b=WZKn3cKN9MqzwXQMiVYB5hAK8ZyyQ3iJohKTA9ypRCj6URPr8yyZ9yFlSxxrOHAtme
 0sU/QYkoiWMoc0RqXqbLZgyCSGPH53tLxRTqzxm7u1S4zF4lhs5m/vWXyWj7dt9lGso0
 UTS6Y/Im/oZVQzHTULl7KWZP+dlmrJTdrcuJa80zYnctPlItOe2myNqhZppiiTg8TIM1
 a+8QuomCXB+KCC8p2HWz90A/ovnY51ZT9OADyd9Lx2Hcab5pi91U29ozKhxqPK077eph
 U+cb6uGgL2SOoQ1+Urmetn7hMGeN19L1iKYcsiivXLlWirCTuWGy5BZZg+MAU9ywm9Ly
 0OWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c4rb6UpQNet/XLnuaDGUA+A1NAiDLTGDulXgKSIiuFk=;
 b=jYavZkqhgtYIi1Kenie66498ujqtBmUpnMkLsw4eHGjoRCo1jE2Z8Y8nHpM5h4wrIN
 7eZuCePLqfiDxyria/PMfSjeS34FDQnetjMBl2XDQRkL9Ef9NeiM2r6ZfRnekK1Dmn+o
 F4/q7qfqA9qM/DWq0YH8R2raxvp+VZuqVlpnaj76n1gE0FMf/9rHhxgdJraRmMyqdvsE
 oAvHn6xQkqRFHUAB0JB/rbsYgi+Srtuv5OlgW3ZIGFKDG+ZIemM4B14XOc6huczpUyXQ
 O2Y3/QHLxrGn/X3c/pmIQkam0/QqUQF5avkNzf6+3Ex2jiHtmEaJ4rnagfHEhRrBLBdk
 ck0A==
X-Gm-Message-State: AOAM530jdHiNfGrOnfeJ3upixLfzQ5Ww5HA/tTPZRlT4Pe4rUrpfFB74
 WQGt5/3eB4I6dLrQ5h9hs6M=
X-Google-Smtp-Source: ABdhPJyURGsf1RMNT6oGeHh+oTVpMtiMaV1QLTJx9CvidU5TSCZAolT/E8rNzStLCzY7gKPiJVmDoA==
X-Received: by 2002:a65:564c:: with SMTP id m12mr8167235pgs.298.1622192897543; 
 Fri, 28 May 2021 02:08:17 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:08:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 07/32] KVM: PPC: Book3S 64: Minimise hcall handler calling
 convention differences
Date: Fri, 28 May 2021 19:07:27 +1000
Message-Id: <20210528090752.3542186-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210528090752.3542186-1-npiggin@gmail.com>
References: <20210528090752.3542186-1-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This sets up the same calling convention from interrupt entry to
KVM interrupt handler for system calls as exists for other interrupt
types.

This is a better API, it uses a save area rather than SPR, and it has
more registers free to use. Using a single common API helps maintain
it, and it becomes easier to use in C in a later patch.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 21 +++++++++-
 arch/powerpc/kvm/book3s_64_entry.S   | 61 ++++++++++++----------------
 2 files changed, 45 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index bf377bfeeb1a..f7fc6e078d4e 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1869,8 +1869,27 @@ EXC_VIRT_END(system_call, 0x4c00, 0x100)
 
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
+	 /*
+	  * Save the PPR (on systems that support it) before changing to
+	  * HMT_MEDIUM. That allows the KVM code to save that value into the
+	  * guest state (it is the guest's PPR value).
+	  */
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
index 66170ea85bc2..a01046202eef 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -11,40 +11,30 @@
  * These are branched to from interrupt handlers in exception-64s.S which set
  * IKVM_REAL or IKVM_VIRT, if HSTATE_IN_GUEST was found to be non-zero.
  */
+
+/*
+ * This is a hcall, so register convention is as
+ * Documentation/powerpc/papr_hcalls.rst.
+ *
+ * This may also be a syscall from PR-KVM userspace that is to be
+ * reflected to the PR guest kernel, so registers may be set up for
+ * a system call rather than hcall. We don't currently clobber
+ * anything here, but the 0xc00 handler has already clobbered CTR
+ * and CR0, so PR-KVM can not support a guest kernel that preserves
+ * those registers across its system calls.
+ *
+ * The state of registers is as kvmppc_interrupt, except CFAR is not
+ * saved, R13 is not in SCRATCH0, and R10 does not contain the trap.
+ */
 .global	kvmppc_hcall
 .balign IFETCH_ALIGN_BYTES
 kvmppc_hcall:
-	/*
-	 * This is a hcall, so register convention is as
-	 * Documentation/powerpc/papr_hcalls.rst, with these additions:
-	 * R13		= PACA
-	 * guest R13 saved in SPRN_SCRATCH0
-	 * R10		= free
-	 * guest r10 saved in PACA_EXGEN
-	 *
-	 * This may also be a syscall from PR-KVM userspace that is to be
-	 * reflected to the PR guest kernel, so registers may be set up for
-	 * a system call rather than hcall. We don't currently clobber
-	 * anything here, but the 0xc00 handler has already clobbered CTR
-	 * and CR0, so PR-KVM can not support a guest kernel that preserves
-	 * those registers across its system calls.
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
-	mfcr	r10
-	std	r12,HSTATE_SCRATCH0(r13)
-	sldi	r12,r10,32
-	ori	r12,r12,0xc00
-	ld	r10,PACA_EXGEN+EX_R10(r13)
-	b	do_kvm_interrupt
+	ld	r10,PACA_EXGEN+EX_R13(r13)
+	SET_SCRATCH0(r10)
+	li	r10,0xc00
+	/* Now we look like kvmppc_interrupt */
+	li	r11,PACA_EXGEN
+	b	.Lgot_save_area
 
 /*
  * KVM interrupt entry occurs after GEN_INT_ENTRY runs, and follows that
@@ -67,12 +57,12 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 kvmppc_interrupt:
 	li	r11,PACA_EXGEN
 	cmpdi	r10,0x200
-	bgt+	1f
+	bgt+	.Lgot_save_area
 	li	r11,PACA_EXMC
-	beq	1f
+	beq	.Lgot_save_area
 	li	r11,PACA_EXNMI
-1:	add	r11,r11,r13
-
+.Lgot_save_area:
+	add	r11,r11,r13
 BEGIN_FTR_SECTION
 	ld	r12,EX_CFAR(r11)
 	std	r12,HSTATE_CFAR(r13)
@@ -91,7 +81,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	ld	r10,EX_R10(r11)
 	ld	r11,EX_R11(r11)
 
-do_kvm_interrupt:
 	/*
 	 * Hcalls and other interrupts come here after normalising register
 	 * contents and save locations:
-- 
2.23.0

