Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3335F64A80
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 18:10:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kPKp2651zDqlK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 02:10:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bXavKvnO"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kNHg6dfkzDqMp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 01:23:27 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id m30so1261881pff.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 08:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h3RpgZg7l5Mw/UErfRA7q9dEnYsBtxC9E2h1H4UC6Os=;
 b=bXavKvnOq3kZ8sccUhlDtx++tqW6Kty9/8ZS9816p3N8lKm6JzokxP2dpsuNy02PrU
 GRyybIPTTvqaiFKQna78x6+27yc9A3o1krw3NY5gpiVspdgT1wRHEpZiaFcGIBONbFZ7
 PrFxOXw/NcAhyKgsRg7ZaCjofCNjgMTiBbtO0592YQFRjqKyvJ5CJlGwubmPZ3RvOFXD
 x5oq8l9vk1CPU1hi1qLL4Z2JRe1LW0iXRgt1BDBupCuPz43I4tz7ZPsnsVlqGivQTgvf
 vbx1gdxQezPX5kpdP5uXjYeYZkFNXcvQkDhuxHclTzVm60Ue46gsdw7pErW2ZMTNHeVo
 KUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h3RpgZg7l5Mw/UErfRA7q9dEnYsBtxC9E2h1H4UC6Os=;
 b=J3ZXtShM8R1v6DjVPXdtfcsS9eo9XFv4IPJEgPvCD52PBaT5hbhD73CdQEROS6XvXG
 KJgBjoixURArT//H9hyxj8XeP3FAolGP1ZyGewx20YKQct0ipIYmsA63sRtpHyy4SCgM
 iLsUKQ9/METHTDXkqGKIguCWVUwMDLqX75tW2UwaueBO9kReDfA7wq76/JsH94eVTBi0
 kbrZeeAw0o7ftSuSrQ5wVHWvvLx+qO0pKZnHVCKauYjYOvgxQq3K89E33er/e74BHwlb
 hn2j3ZbOKsnTZOM2Hep3iwaMa6MWBrn0um8uab+ojZ6aa97URYCZIneDcMV5TG1UhTLt
 FP8w==
X-Gm-Message-State: APjAAAVweGSGJGSmDl07ovMLrgY4AgMOS4oukxKgQrUw8bmst+C2Z7fZ
 sieNZJF4IScJIg5u2II2uwLhBABSpxo=
X-Google-Smtp-Source: APXvYqwvP5CeFCMnWmSyRYSnerDOoG8z7l0j1cO1Msz6lUdFrLq1+afZVQyOZLkYDSsUC0oXJONG1w==
X-Received: by 2002:a63:ab08:: with SMTP id p8mr38873767pgf.340.1562772205804; 
 Wed, 10 Jul 2019 08:23:25 -0700 (PDT)
Received: from bobo.local0.net (14-203-207-157.tpgi.com.au. [14.203.207.157])
 by smtp.gmail.com with ESMTPSA id
 s22sm2699212pfh.107.2019.07.10.08.23.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 08:23:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 16/16] powerpc/64s/exception: machine check improve labels
 and comments
Date: Thu, 11 Jul 2019 01:19:50 +1000
Message-Id: <20190710151950.31906-17-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710151950.31906-1-npiggin@gmail.com>
References: <20190710151950.31906-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Short forward and backward branches can be given number labels,
but larger significant divergences in code path a more readable
if they're given descriptive names.

Also adjusts a comment to account for guest delivery.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index d196558d4243..a69f4599e304 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1052,7 +1052,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	 */
 	lbz	r11,HSTATE_IN_GUEST(r13)
 	cmpwi	r11,0			/* Check if coming from guest */
-	bne	9f			/* continue if we are. */
+	bne	mce_deliver		/* continue if we are. */
 #endif
 
 	/*
@@ -1060,7 +1060,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	 * exception handler which will deliver the MC event to this kernel.
 	 */
 	andi.	r11,r12,MSR_PR		/* See if coming from user. */
-	bne	9f			/* continue in V mode if we are. */
+	bne	mce_deliver		/* continue in V mode if we are. */
 
 	/*
 	 * At this point we are coming from kernel context.
@@ -1088,8 +1088,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	MACHINE_CHECK_HANDLER_WINDUP
 	RFI_TO_KERNEL
 
-9:
-	/* Deliver the machine check to host kernel in V mode. */
+mce_deliver:
+	/*
+	 * This is a host user or guest MCE. Restore all registers, then
+	 * run the "late" handler. For host user, this will run the
+	 * machine_check_exception handler in virtual mode like a normal
+	 * interrupt handler. For guest, this will trigger the KVM test
+	 * and branch to the KVM interrupt similarly to other interrupts.
+	 */
 BEGIN_FTR_SECTION
 	ld	r10,ORIG_GPR3(r1)
 	mtspr	SPRN_CFAR,r10
-- 
2.20.1

