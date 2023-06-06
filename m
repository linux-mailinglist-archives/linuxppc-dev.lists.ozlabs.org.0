Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 238F572445B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 15:27:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbB916bhMz3fbm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 23:27:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fFB3ltwh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fFB3ltwh;
	dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbB6S6zNBz3dsb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 23:25:04 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-543a6cc5f15so2341141a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 06:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686057902; x=1688649902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPiTwbD/urG3YDVam4lKmMQHRx/vZY2THnt7HZL6g5A=;
        b=fFB3ltwhdNHwvn4Q3d4svAnWTcRsX5y4OuY2eXknbOCR71+Iwb5iznIHqUlrsJMnld
         kV+53+mOHC8uiUhzEgfq94L5vbEmBoKyKuiVqloFCW190g62/gyUHofwJi/QarCsS7CA
         0ls2uKhDaMNb6ikI1D6RNlWXGmEGlS0zOaG1dHB3kN7lsEC7HhNrcHca6613AzmHKBIh
         A7UIfHwtXXltWuQNBt29Iw3uElFH/zX8ywg0QAGsE+wqgPjf+ArhxrFMOHWTVh3YopAB
         fL0IGEAhMy6SDn43cKtLBYfHFneDT2OIYvOGjxduqw6sXjklr7JHQcWK58oGWQIExGq0
         7BpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686057902; x=1688649902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gPiTwbD/urG3YDVam4lKmMQHRx/vZY2THnt7HZL6g5A=;
        b=L8uf9IcVfXfarCOLC6L4RG3KZDO6ckxvivTBw9bY4rzqFnJefGi+wEHd3jSXsCeCoe
         hiFjbm/twi4mXFsfDDColyoeXBln5mOY1MZSmYfYUfHoDVD7+eQ+if9hI4zZ6uT3FWX8
         nEiKtz+kOS81vs1WPyX0Q0857Iq5u0oC4v/Pe9t8FctO7ppVbFIrqq1VgPyodiAcJr+8
         euKjCnbCYvFjqZbaFIemNNyrpZYdF2SCJ/cRXZAWAETYi069dCbPT0NY7/Otu2HQwLat
         xjK2eulcrcvh9vtvGG46HeY/l2WJO41Iq4FKVOSnURk4tyOtWzoiW5qrJMO505DaQERs
         PKNg==
X-Gm-Message-State: AC+VfDy4cTgw/Iy3yh+pZU22nk1iQ+KfuJyJeU8kQYqbAkup+f75XsdP
	OLo5tOrUxymxMGOrVsK5k/MM2Of5lvU=
X-Google-Smtp-Source: ACHHUZ6TTuvFl3lqmVrQZ3POwc/Astpa0f26PxAdJH6h6RDXeKmaWGUPtuxmfwLNTereca42QQ34gQ==
X-Received: by 2002:a17:903:228c:b0:1af:e295:ad56 with SMTP id b12-20020a170903228c00b001afe295ad56mr2639951plh.49.1686057902243;
        Tue, 06 Jun 2023 06:25:02 -0700 (PDT)
Received: from wheely.local0.net (58-6-230-127.tpgi.com.au. [58.6.230.127])
        by smtp.gmail.com with ESMTPSA id jd18-20020a170903261200b001ac2c3e54adsm8522132plb.118.2023.06.06.06.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:25:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/6] powerpc/64: Rearrange 64-bit _switch to prepare for 32/64 merge
Date: Tue,  6 Jun 2023 23:24:43 +1000
Message-Id: <20230606132447.315714-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606132447.315714-1-npiggin@gmail.com>
References: <20230606132447.315714-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

More some 64-bit specifics out from the function epilogue and rearrange
this to be a bit neater, use 32-bit mem ops for CR save/restore, and
change some register numbers.

This is preparation to consolidate 32-bit and 64-bit switch code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_64.S | 38 ++++++++++++++++------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 2e02834c5824..7430bd020a2a 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -190,12 +190,13 @@ _GLOBAL(_switch)
 	mflr	r0
 	std	r0,16(r1)
 	stdu	r1,-SWITCH_FRAME_SIZE(r1)
+	std	r1,KSP(r3)	/* Set old stack pointer */
 	/* r3-r13 are caller saved -- Cort */
 	SAVE_NVGPRS(r1)
 	std	r0,_NIP(r1)	/* Return to switch caller */
-	mfcr	r23
-	std	r23,_CCR(r1)
-	std	r1,KSP(r3)	/* Set old stack pointer */
+	mfcr	r0
+	stw	r0,_CCR(r1)
+	ld	r8,KSP(r4)	/* Load new stack pointer */
 
 	kuap_check_amr r9, r10
 
@@ -232,14 +233,20 @@ _GLOBAL(_switch)
 	DCBT_BOOK3S_STOP_ALL_STREAM_IDS(r6)
 #endif
 
-	addi	r6,r4,-THREAD	/* Convert THREAD to 'current' */
-	std	r6,PACACURRENT(r13)	/* Set new 'current' */
+	addi	r3,r3,-THREAD	/* old thread -> task_struct for return value */
+	addi	r6,r4,-THREAD	/* new thread -> task_struct */
+	std	r6,PACACURRENT(r13)	/* Set new task_struct to 'current' */
 #if defined(CONFIG_STACKPROTECTOR)
 	ld	r6, TASK_CANARY(r6)
 	std	r6, PACA_CANARY(r13)
 #endif
-
-	ld	r8,KSP(r4)	/* new stack pointer */
+	/* Set the new PACAKSAVE */
+	clrrdi	r7, r8, THREAD_SHIFT	/* base of new stack */
+	/* Note: this uses SWITCH_FRAME_SIZE rather than INT_FRAME_SIZE
+	   because we don't need to leave the 288-byte ABI gap at the
+	   top of the kernel stack. */
+	addi	r7,r7,THREAD_SIZE-SWITCH_FRAME_SIZE
+	std	r7,PACAKSAVE(r13)
 
 #ifdef CONFIG_PPC_64S_HASH_MMU
 BEGIN_MMU_FTR_SECTION
@@ -247,12 +254,6 @@ BEGIN_MMU_FTR_SECTION
 END_MMU_FTR_SECTION_IFCLR(MMU_FTR_TYPE_RADIX)
 #endif
 
-	clrrdi	r7, r8, THREAD_SHIFT	/* base of new stack */
-	/* Note: this uses SWITCH_FRAME_SIZE rather than INT_FRAME_SIZE
-	   because we don't need to leave the 288-byte ABI gap at the
-	   top of the kernel stack. */
-	addi	r7,r7,THREAD_SIZE-SWITCH_FRAME_SIZE
-
 	/*
 	 * PMU interrupts in radix may come in here. They will use r1, not
 	 * PACAKSAVE, so this stack switch will not cause a problem. They
@@ -262,18 +263,15 @@ END_MMU_FTR_SECTION_IFCLR(MMU_FTR_TYPE_RADIX)
 	 * active on the new CPU, will order those stores.
 	 */
 	mr	r1,r8		/* start using new stack pointer */
-	std	r7,PACAKSAVE(r13)
 
-	ld	r6,_CCR(r1)
-	mtcrf	0xFF,r6
+	lwz	r0,_CCR(r1)
+	mtcrf	0xFF,r0
 
 	/* r3-r13 are destroyed -- Cort */
 	REST_NVGPRS(r1)
 
-	/* convert old thread to its task_struct for return value */
-	addi	r3,r3,-THREAD
-	ld	r7,_NIP(r1)	/* Return to _switch caller in new task */
-	mtlr	r7
+	ld	r0,_NIP(r1)	/* Return to _switch caller in new task */
+	mtlr	r0
 	addi	r1,r1,SWITCH_FRAME_SIZE
 	blr
 
-- 
2.40.1

