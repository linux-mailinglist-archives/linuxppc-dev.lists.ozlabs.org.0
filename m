Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0673454B7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:11:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Cxb5qY2z3cJC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:11:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SqjRpG/L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SqjRpG/L; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4CnD3nsPz3bqk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:04:16 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id c17so5626969pfn.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JAFMIe0yYAzJxMahTUIpwR/Z3qkqPJ3NyE7gYKKG1lM=;
 b=SqjRpG/LV5qxZO0/uQ9B0O/oX8S/biUOnkAYQJo8Hklmi2HiMSJZ9sk1N3JwUly4Iq
 nS8sPVbJdZIOPtBaHjbinklJ9rx5dBHKGmIM7rJyg8IMUiFizB+mOSOe81T1J7H2eTAw
 3+8faNQok0aaacPNtpvpynDEDe0fbQZHU+RfFlRuilmKGPkPQNukZLmfbEWotZTrY9+z
 dsQ7f6kV0JAUYNquaymDbf7gAc2ZMrdIucAURvdEclsygDlooC0xFU1L7ZepMNixNJNy
 kf9eg99w3INSdyB3hIuvkvJkCN9hh8ki5H0TK6+f3qOVE3OnXPZ0HRc+EGMkGPrrMLDb
 vzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JAFMIe0yYAzJxMahTUIpwR/Z3qkqPJ3NyE7gYKKG1lM=;
 b=ueDBBA6Joc+/IpHfhZx8cUKKCXDTJVJIL6CF8qCpngYgSPi2gn0jndBJZiTXpynxjF
 61+KK1TQol7VwsY5yWoEHHmJfsrYkwiJcG/PbkvYtW4e9mph/HKOLHV1l03tHGLQWAby
 csQtoAezpvvTylVymj9JHc8WjImiuYNAxwrsvgY+dEV2/nB9xbkniA7OPMpRWZbZkWNj
 Qe+Lmv2R71s1Huprfl2lDtbN/gyn1p1G0z7wZclApR+FzunPIfuauxwt0oGAskj56k21
 V0+wd15J6R+CwezEjQETeH7Fys7dW7VDRwngv6lqkPcYR8fcqCeUvcpS/GPdOMrH4UHO
 oYrw==
X-Gm-Message-State: AOAM5302ad6x7U56tSMxP1oJ26Vj8mvKH5DfqZUFp/tn/yyRfDS70G9S
 lMMQpwQvcLoPXY+C8Ac+pXf6zFNaY6A=
X-Google-Smtp-Source: ABdhPJxQtY3Qu8F6RhkcuFbetWI7b6b/giOuOx5PBgVAxD0hA4IXugK6JAgKWZGM1yxMWasEmirY0w==
X-Received: by 2002:a17:903:4112:b029:e5:f79d:3eb1 with SMTP id
 r18-20020a1709034112b02900e5f79d3eb1mr2303702pld.48.1616461454131; 
 Mon, 22 Mar 2021 18:04:14 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:04:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 18/46] KVM: PPC: Book3S 64: Minimise hcall handler calling
 convention differences
Date: Tue, 23 Mar 2021 11:02:37 +1000
Message-Id: <20210323010305.1045293-19-npiggin@gmail.com>
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
 arch/powerpc/kernel/exceptions-64s.S | 21 +++++++++++++++-
 arch/powerpc/kvm/book3s_64_entry.S   | 37 +++++++++-------------------
 2 files changed, 32 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 115cf79f3e82..4615057681c3 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1892,8 +1892,27 @@ EXC_VIRT_END(system_call, 0x4c00, 0x100)
 
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
index b6149df21de3..de81ab69555b 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -11,33 +11,21 @@
  * These are branched to from interrupt handlers in exception-64s.S which set
  * IKVM_REAL or IKVM_VIRT, if HSTATE_IN_GUEST was found to be non-zero.
  */
+
+/*
+ * This is a hcall, so guest register call convention is as
+ * Documentation/powerpc/papr_hcalls.rst.
+ *
+ * The state of registers is as below, except CFAR is not saved, R13 is not
+ * in SCRATCH0, and R10 does not contain the trap.
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
 
 /*
  * KVM interrupt entry occurs after GEN_INT_ENTRY runs, and follows that
@@ -84,7 +72,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	ld	r10,EX_R10(r11)
 	ld	r11,EX_R11(r11)
 
-do_kvm_interrupt:
 	/*
 	 * Hcalls and other interrupts come here after normalising register
 	 * contents and save locations:
-- 
2.23.0

