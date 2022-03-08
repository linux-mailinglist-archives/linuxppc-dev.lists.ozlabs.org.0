Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B294D19C2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 14:56:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCcLj4g00z3btT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 00:56:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Yt7bWTBo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Yt7bWTBo; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCcDl2WFkz3bWM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 00:51:19 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id 6so11982916pgg.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Mar 2022 05:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9vdhwE5ReYGk+xo+hgvdjuNdqvXaPmgr1QGaAI03t+A=;
 b=Yt7bWTBoqs9ygmZlPBQ4XDhLFQCZez2QErCsZ07Eh86C7zRJzQ9d2ImKvYFlupBjC9
 sOjq6O+HOVjzMnoiX08SVg6r6twRGaGXwS8pncEOsC3mQC6PgHI6wxHDZxWMwNjojzZ0
 JN2HKyS4p9NJF5WPy3xHkEbR/IiFK2UVMwba7OZskZiDvQPO/lkKJ0RV4/r0yClHdHNw
 eLve35R/RhbZJeNrbyrLDGsSlCwNDqXRmFgBD/Rt77XxTPSF0znSrl4VrceahCmbumLq
 Sg++xelUFQwgoDsG8SSy7LCZQth/m4IDrER8hxyeNbebhbQTnveq/vrTcluH7EPtEm1k
 tW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9vdhwE5ReYGk+xo+hgvdjuNdqvXaPmgr1QGaAI03t+A=;
 b=NcsenyfqX4heMKSZCSo/x6Uy1mGd8wnr2q9/8GpzzzopxK3Nlv9unvAPjmFAyBKZmI
 PEeLQKTFXaX12RPdKr324p/wCB+seBYqMRUA5ap6DU5a0Jpn0PFZ3c8WFfpSMG8T+ZpQ
 xyLCPmM9QJVbonQjev9R0TEhJ1vigAbSVA3c0m7CSBk6RFs94jhVcFfJkl6/N/byMud1
 PKoifes92kR5F1xq6lL+WRFwN0tF1lPScptMhaU1TyOOPLllsVMPqr9x7nCgyC+iWZJR
 +u+bFJf1xTLRQoL2BBT7erzpv6t2Qh2TczXjdapBY1fU2fdN54DErm0MKPLBHFTjSa6f
 ijog==
X-Gm-Message-State: AOAM531CJF+CN2u0kfA3y4Dnu2wfQ62MQgClSsooyjCVQ7y2Zo7fUJi1
 THi2wQfMUC1rro0qs3voWTCjo4Vwq9E=
X-Google-Smtp-Source: ABdhPJweU6+Df+hJnfmmjibKEBEBQVFHA4f9rC64Ww6wSeyOAZrNH9I6VeeUl0m9pcCF4Hc02+MlWA==
X-Received: by 2002:a05:6a00:190f:b0:4f3:a81d:c4c3 with SMTP id
 y15-20020a056a00190f00b004f3a81dc4c3mr18345786pfi.45.1646747478178; 
 Tue, 08 Mar 2022 05:51:18 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a056a00150e00b004f741b5c071sm541737pfu.86.2022.03.08.05.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 05:51:17 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 08/14] powerpc/rtas: call enter_rtas in real-mode on 64-bit
Date: Tue,  8 Mar 2022 23:50:41 +1000
Message-Id: <20220308135047.478297-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220308135047.478297-1-npiggin@gmail.com>
References: <20220308135047.478297-1-npiggin@gmail.com>
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This moves MSR save/restore and some real-mode juggling out of asm and
into C code, simplifying things.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/rtas.c       | 15 ++++++++++++---
 arch/powerpc/kernel/rtas_entry.S | 32 +++++---------------------------
 2 files changed, 17 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 6b5892d6a56b..87ede1877816 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -47,13 +47,22 @@
 /* This is here deliberately so it's only used in this file */
 void enter_rtas(unsigned long);
 
-static inline void do_enter_rtas(unsigned long args)
+static noinline void do_enter_rtas(unsigned long args)
 {
 	BUG_ON(!irqs_disabled());
 
-	hard_irq_disable(); /* Ensure MSR[EE] is disabled on PPC64 */
+	if (IS_ENABLED(CONFIG_PPC64)) {
+		unsigned long msr;
 
-	enter_rtas(args);
+		hard_irq_disable();
+
+		msr = mfmsr();
+		mtmsr(msr & ~(MSR_IR|MSR_DR));
+		enter_rtas(args);
+		mtmsr(msr);
+	} else {
+		enter_rtas(args);
+	}
 
 	srr_regs_clobbered(); /* rtas uses SRRs, invalidate */
 }
diff --git a/arch/powerpc/kernel/rtas_entry.S b/arch/powerpc/kernel/rtas_entry.S
index 5f65ea4436c6..292551684bbd 100644
--- a/arch/powerpc/kernel/rtas_entry.S
+++ b/arch/powerpc/kernel/rtas_entry.S
@@ -84,14 +84,11 @@ _GLOBAL(enter_rtas)
 	li	r0,0
 	mtcr	r0
 
-	mfmsr	r6
-
-	/* Unfortunately, the stack pointer and the MSR are also clobbered,
-	 * so they are saved in the PACA which allows us to restore
-	 * our original state after RTAS returns.
+	/*
+	 * The stack pointer is clobbered, so it is saved in the PACA which
+	 * allows us to restore our original state after RTAS returns.
 	 */
 	std	r1,PACAR1(r13)
-	std	r6,PACASAVEDMSR(r13)
 
 	/* Setup our real return addr */
 	LOAD_REG_ADDR(r4,rtas_return_loc)
@@ -100,7 +97,6 @@ _GLOBAL(enter_rtas)
 
 	LOAD_REG_IMMEDIATE(r6, MSR_ME)
 
-__enter_rtas:
 	LOAD_REG_ADDR(r4, rtas)
 	ld	r5,RTASENTRY(r4)	/* get the rtas->entry value */
 	ld	r4,RTASBASE(r4)		/* get the rtas->base value */
@@ -112,6 +108,7 @@ __enter_rtas:
 	mtspr	SPRN_SRR1,r6
 	RFI_TO_KERNEL
 	b	.	/* prevent speculative execution */
+_ASM_NOKPROBE_SYMBOL(enter_rtas)
 
 rtas_return_loc:
 	FIXUP_ENDIAN
@@ -127,29 +124,10 @@ rtas_return_loc:
 	sync
 	mtmsrd	r6
 
-	/* relocation is off at this point */
 	GET_PACA(r13)
 
-	bcl	20,31,$+4
-0:	mflr	r3
-	ld	r3,(1f-0b)(r3)		/* get &rtas_restore_regs */
-
 	ld	r1,PACAR1(r13)		/* Restore our SP */
-	ld	r4,PACASAVEDMSR(r13)	/* Restore our MSR */
 
-	mtspr	SPRN_SRR0,r3
-	mtspr	SPRN_SRR1,r4
-	RFI_TO_KERNEL
-	b	.	/* prevent speculative execution */
-_ASM_NOKPROBE_SYMBOL(enter_rtas)
-_ASM_NOKPROBE_SYMBOL(__enter_rtas)
-_ASM_NOKPROBE_SYMBOL(rtas_return_loc)
-
-	.align	3
-1:	.8byte	rtas_restore_regs
-
-rtas_restore_regs:
-	/* relocation is on at this point */
 	REST_GPR(2, r1)			/* Restore the TOC */
 	REST_NVGPRS(r1)			/* Restore the non-volatiles */
 
@@ -169,5 +147,5 @@ rtas_restore_regs:
 
 	mtlr	r0
 	blr				/* return to caller */
-
+_ASM_NOKPROBE_SYMBOL(rtas_return_loc)
 #endif /* CONFIG_PPC32 */
-- 
2.23.0

