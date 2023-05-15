Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C89CA702307
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 06:48:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKRhR4jptz3dxR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 14:48:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=G27e5E83;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=G27e5E83;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKRdg5T6Lz3cDG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 14:45:59 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1ab0c697c84so93327775ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 May 2023 21:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684125958; x=1686717958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4AkpXJPNaVOTxyN3Z8D+6EQAbXNih6wxI25rjfHMSBc=;
        b=G27e5E83a+rRk9Eon8i8FB/VNuU5TFPRKoIyVyKVpiwoDGHZjnAQlL9vHbEelQNuvJ
         YLXJkHwX/+5sDs/S2oMxZCdsFwUAGsJZR9Ht15+9Atd2xS7PXUj7qfE5bpwWYs0KTbog
         RmkgBdkICRczQkEllwNNLPM+QQX7Q+YxonV13YBhqFWOTaucwy68wMu+5xkWH2FxMfxE
         2ANhRDm6A4nj8agRoUoSyNjNhzJP53M5daiOUeGZ36CUI69NfAl3IEMcwbCt1msfOWBI
         Xc0LrCoYNtOTWP3vRBrpbyis139tdaP9v/k+/krElN2Cj5vHRuV9DEey7UKRSBiPbVo5
         mM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684125958; x=1686717958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AkpXJPNaVOTxyN3Z8D+6EQAbXNih6wxI25rjfHMSBc=;
        b=QZSNUXNK0Jdelgb/Pqkui/O1uf9DqcTtvchonz2jjfOdf8hDdjdmyl8dBBUgj1iyJX
         G1xcEitXkrDV1kh+H8PdVSWOwIAtVAjpikyU8+ASevowd/zm4t27tuLti1cbP4aXHg8O
         Cj5myfPFvCL1iVhdvHByiUZZvHTW3tQmSuIG0nCtsBQGjDcGXmUK22iipHtwZGqpiPZX
         GzcBIE1qQDtcLEt0wQvVhs93felACOthMYtU3IEK0ouZwd59wjTJKJDbPVB0qwBomfd1
         /Gl8aQSVIQt9W/Sf9PUUdXhH8KOGrH/n34+W/Ahn8ejECJ+H1gzxuNFdVPjkI1kENg9X
         yj5A==
X-Gm-Message-State: AC+VfDz8T0Xp2LMvH7xXNLux2X3oiybmz3+Z2KJdP+rs1n9z3GgLRYxD
	HBka3vHVwxlTR+fD5gRb3a9yw9831SmmEw==
X-Google-Smtp-Source: ACHHUZ4Ee3CRFP9vYE8lxXdwKyJQTfonhLkYhhyySB0CQSwDV1O5rgpGxxxcTMs9JNnjCzhosylQMQ==
X-Received: by 2002:a17:902:e882:b0:1aa:e30e:29d3 with SMTP id w2-20020a170902e88200b001aae30e29d3mr42676156plg.29.1684125957697;
        Sun, 14 May 2023 21:45:57 -0700 (PDT)
Received: from wheely.local0.net ([1.146.102.8])
        by smtp.gmail.com with ESMTPSA id u17-20020a170903125100b001a64851087bsm2514018plh.272.2023.05.14.21.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 21:45:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/6] powerpc/64: Rearrange 64-bit _switch to prepare for 32/64 merge
Date: Mon, 15 May 2023 14:45:39 +1000
Message-Id: <20230515044543.78903-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515044543.78903-1-npiggin@gmail.com>
References: <20230515044543.78903-1-npiggin@gmail.com>
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

