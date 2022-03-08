Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADD84D19A7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 14:53:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCcH77164z3c3b
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 00:53:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j03UrdTW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=j03UrdTW; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCcDV6V2Xz30G0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 00:51:06 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id s18so3881876plp.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Mar 2022 05:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e6Kbe3fqOXlx/Tl46MXH05eyV5FjfuguxAH6pFTBvc8=;
 b=j03UrdTWVFDWD1RtYxRJjdFCWFPJKhijCVYE9heSxjWMzRLzZJ7oD9h5KngGBCkiON
 5YjY1Db3sgGi0NkjQIgIjz/0/Y9VhL+kspz2wZ/Il9kusu91b/GlXGDfaRewBt/kZTOt
 nqxalta7kK1nxC6WSSR7Mvda/idnqa2JtcqnZEriXhdCh3sJljjAAzvjj/8h93DRK/Tk
 BJGDrC6Fw1OEN7i/C+u4ZPUGa3Poqi3n52Dqx/FZ3MjJlKyekZwrc4IQ1sZqtoX9a+Pl
 PNK5/GZpTzTdz50Ema2gqPM5GU1numia91o0TpMyy2sRLOf9eQX7jrJOvWJr+j3Y0+i8
 RCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e6Kbe3fqOXlx/Tl46MXH05eyV5FjfuguxAH6pFTBvc8=;
 b=bqB5eNCCzE7fVm0c6w5AmI6lSYH70uZK0ti7obVZR/Zay87/pE8rovXex5DN7n3fHg
 rlw1MqgkYm3CJvW6xX11oDlQxbSOW+DErsK1bSFY92bNOPnsMftARIP77QJXzPBES4+a
 ppOa81dFKJzQxtl9kITyfixF54U7gPWLxi8t4oGwxQQq0INj3UeLg7d6jGJMUC06OPxS
 zPelSkRUCHqUg0rx4f4c1X/UWP9icjTxhFKRM2yNwuek592N53lfS1V6u95THlJtOeiR
 CoavHOpYC1ABC/tpq6MPiFyzofJ8TDA0zaLfsSHeGHnXoD15NA7tQVwT/WMYZ5Xmn3V7
 TuNg==
X-Gm-Message-State: AOAM533nIW3+bt5LVGGQLpjhA3OoMIWfXQ2iiZTExjJqEwAy8hZwSiUw
 Cf91BpWNdkqNcw2EezaMRIDsIOPU4zc=
X-Google-Smtp-Source: ABdhPJyf2cgM7OqF6fP1L75Kf8RycVpC1xNVLGBwYH9dUThD+iKovyJl6koAhf7O99DDiQU0/4hoQQ==
X-Received: by 2002:a17:902:bb02:b0:151:56a8:f80b with SMTP id
 im2-20020a170902bb0200b0015156a8f80bmr17862880plb.30.1646747465646; 
 Tue, 08 Mar 2022 05:51:05 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a056a00150e00b004f741b5c071sm541737pfu.86.2022.03.08.05.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 05:51:05 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/14] powerpc/rtas: Fix whitespace in rtas_entry.S
Date: Tue,  8 Mar 2022 23:50:36 +1000
Message-Id: <20220308135047.478297-4-npiggin@gmail.com>
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

The code was moved verbatim including whitespace cruft. Fix that.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/rtas_entry.S | 34 ++++++++++++++++----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/kernel/rtas_entry.S b/arch/powerpc/kernel/rtas_entry.S
index afe3b789bc36..6fa10eb49a9c 100644
--- a/arch/powerpc/kernel/rtas_entry.S
+++ b/arch/powerpc/kernel/rtas_entry.S
@@ -60,12 +60,12 @@ _ASM_NOKPROBE_SYMBOL(enter_rtas)
 _GLOBAL(enter_rtas)
 	mflr	r0
 	std	r0,16(r1)
-        stdu	r1,-SWITCH_FRAME_SIZE(r1) /* Save SP and create stack space. */
+	stdu	r1,-SWITCH_FRAME_SIZE(r1) /* Save SP and create stack space. */
 
 	/* Because RTAS is running in 32b mode, it clobbers the high order half
 	 * of all registers that it saves.  We therefore save those registers
 	 * RTAS might touch to the stack.  (r0, r3-r13 are caller saved)
-   	 */
+	 */
 	SAVE_GPR(2, r1)			/* Save the TOC */
 	SAVE_GPR(13, r1)		/* Save paca */
 	SAVE_NVGPRS(r1)			/* Save the non-volatiles */
@@ -105,21 +105,21 @@ _GLOBAL(enter_rtas)
 	/* Unfortunately, the stack pointer and the MSR are also clobbered,
 	 * so they are saved in the PACA which allows us to restore
 	 * our original state after RTAS returns.
-         */
+	 */
 	std	r1,PACAR1(r13)
-        std	r6,PACASAVEDMSR(r13)
+	std	r6,PACASAVEDMSR(r13)
 
-	/* Setup our real return addr */	
+	/* Setup our real return addr */
 	LOAD_REG_ADDR(r4,rtas_return_loc)
 	clrldi	r4,r4,2			/* convert to realmode address */
-       	mtlr	r4
+	mtlr	r4
 
 	li	r0,0
 	ori	r0,r0,MSR_EE|MSR_SE|MSR_BE|MSR_RI
 	andc	r0,r6,r0
-	
-        li      r9,1
-        rldicr  r9,r9,MSR_SF_LG,(63-MSR_SF_LG)
+
+	li	r9,1
+	rldicr	r9,r9,MSR_SF_LG,(63-MSR_SF_LG)
 	ori	r9,r9,MSR_IR|MSR_DR|MSR_FE0|MSR_FE1|MSR_FP|MSR_RI|MSR_LE
 	andc	r6,r0,r9
 
@@ -130,7 +130,7 @@ __enter_rtas:
 	LOAD_REG_ADDR(r4, rtas)
 	ld	r5,RTASENTRY(r4)	/* get the rtas->entry value */
 	ld	r4,RTASBASE(r4)		/* get the rtas->base value */
-	
+
 	mtspr	SPRN_SRR0,r5
 	mtspr	SPRN_SRR1,r6
 	RFI_TO_KERNEL
@@ -142,13 +142,13 @@ rtas_return_loc:
 	/*
 	 * Clear RI and set SF before anything.
 	 */
-	mfmsr   r6
+	mfmsr	r6
 	li	r0,MSR_RI
 	andc	r6,r6,r0
 	sldi	r0,r0,(MSR_SF_LG - MSR_RI_LG)
 	or	r6,r6,r0
 	sync
-	mtmsrd  r6
+	mtmsrd	r6
 
 	/* relocation is off at this point */
 	GET_PACA(r4)
@@ -158,8 +158,8 @@ rtas_return_loc:
 0:	mflr	r3
 	ld	r3,(1f-0b)(r3)		/* get &rtas_restore_regs */
 
-        ld	r1,PACAR1(r4)           /* Restore our SP */
-        ld	r4,PACASAVEDMSR(r4)     /* Restore our MSR */
+	ld	r1,PACAR1(r4)		/* Restore our SP */
+	ld	r4,PACASAVEDMSR(r4)	/* Restore our MSR */
 
 	mtspr	SPRN_SRR0,r3
 	mtspr	SPRN_SRR1,r4
@@ -191,10 +191,10 @@ rtas_restore_regs:
 	ld	r8,_DSISR(r1)
 	mtdsisr	r8
 
-        addi	r1,r1,SWITCH_FRAME_SIZE	/* Unstack our frame */
+	addi	r1,r1,SWITCH_FRAME_SIZE	/* Unstack our frame */
 	ld	r0,16(r1)		/* get return address */
 
-	mtlr    r0
-        blr				/* return to caller */
+	mtlr	r0
+	blr				/* return to caller */
 
 #endif /* CONFIG_PPC32 */
-- 
2.23.0

