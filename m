Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AC15B9A90
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 14:15:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSx3t5PsWz3dqD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 22:15:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=etvoAtz3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=etvoAtz3;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSwzV336Yz3c23
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 22:11:34 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id b75so12611700pfb.7
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 05:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=tlKVVjRawq/qcmFqMWvK3Y1GAD9Ga6bp/aZ4Jamk95o=;
        b=etvoAtz3wzij9/nabO1rOOzAApcgrN0j4JhkUUUrHKhXJVzR5dFUMfk2x/bpU/ciH1
         ufCqfrn8nWVOUSes+CRdKYT13CQ8FqWu3HdoDSauDTGETnsfyqzBBVyKJHdgNU4rlyhA
         4esQREEFEobrQjH9NtNMQzM5Rjxpi9EUl6BGPGken+On8mufvETy1HuRinD7b0wPtq3z
         c9gwbaS0cJQpau2nn61DA6qbkqJhw34TgRHat/jLE0tg49vJ50eKGB+5Z8CVm40ipqRn
         xHMq04I0qbhwrnS7suYKF1yk4s5aehAU4xiPwrJS8L8Sks/YiLF3dNz1/O7iHg6v47ox
         ARkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tlKVVjRawq/qcmFqMWvK3Y1GAD9Ga6bp/aZ4Jamk95o=;
        b=fbk+5y2giJk4apMryFVA8YVs7/lTonAf0trpDcJT1nptrfF9bKWjqndzoouPuS1WVI
         63ALhFfivd72XB13V/xTSzvSM08GKNPrwexT/TBkaymCetv26zh3nq/q+3JFCTV9UrfP
         Z0xPdBeckOC6948pQy3hB6NudrCD8n8bOdvlUJiao4cgbCeAW067hUHNUO75E2z8pCDn
         yHbM81X1iOaGKWOFGua+KYdRrDdVSj9VJ7JpQ9wlNq+W2MMhwcx82DHBj12KWNXSzBjs
         OYLAYcZaC4kQCWhiK5de3n/8E9pXbcYp2ndCS1GjOL1s93hEc1hrHgDgg8D9WMZO3IVH
         vsiQ==
X-Gm-Message-State: ACgBeo27LpRweUiWE6eBXvAOpEw1p6Lo1KA0kMpY45JUgCJ2lcwRVYAA
	l5dYuzz4NFfFw36r0lIgR3mcXymVMxM=
X-Google-Smtp-Source: AA6agR7JH+6xS1+KCFWcUR7F4ZMRSz4fEH0PXEUdUXBBRwwHo9o+cfnVXwoZaloThfcB6pX61gKtMA==
X-Received: by 2002:a65:5a4d:0:b0:438:8ba7:e597 with SMTP id z13-20020a655a4d000000b004388ba7e597mr25660423pgs.625.1663243891848;
        Thu, 15 Sep 2022 05:11:31 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902650600b00172a567d910sm12569420plk.289.2022.09.15.05.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 05:11:31 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/6] powerpc/64s/interrupt: halt early boot interrupts if paca is not set up
Date: Thu, 15 Sep 2022 22:10:58 +1000
Message-Id: <20220915121058.2288916-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220915121058.2288916-1-npiggin@gmail.com>
References: <20220915121058.2288916-1-npiggin@gmail.com>
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

Ensure r13 is zero from very early in boot until it gets set to the
boot paca pointer. This allows early program and mce handlers to halt
if there is no valid paca, rather than potentially run off into the
weeds. This preserves register and memory contents for low level
debugging tools.

Nothing could be printed to console at this point in any case because
even udbg is only set up after the boot paca is set, so this shouldn't
be missed.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 11 +++++++++--
 arch/powerpc/kernel/head_64.S        |  3 +++
 arch/powerpc/kernel/setup_64.c       |  1 +
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 29d701a20c41..5078b2578dbe 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -724,8 +724,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
  * userspace starts.
  */
 .macro EARLY_BOOT_FIXUP
-#ifdef CONFIG_CPU_LITTLE_ENDIAN
 BEGIN_FTR_SECTION
+#ifdef CONFIG_CPU_LITTLE_ENDIAN
 	tdi   0,0,0x48    // Trap never, or in reverse endian: b . + 8
 	b     2f          // Skip trampoline if endian is correct
 	.long 0xa643707d  // mtsprg  0, r11      Backup r11
@@ -753,8 +753,15 @@ BEGIN_FTR_SECTION
 	mtsrr0 r11        // Restore SRR0
 	mfsprg r11, 0     // Restore r11
 2:
-END_FTR_SECTION(0, 1)     // nop out after boot
 #endif
+	/*
+	 * program check could hit at any time, and pseries can not block
+	 * MSR[ME] in early boot. So check if there is anything useful in r13
+	 * yet, and spin forever if not.
+	 */
+	cmpdi	r13,0
+	beq	.
+END_FTR_SECTION(0, 1)     // nop out after boot
 .endm
 
 /*
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index cf2c08902c05..6aeba8a9814e 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -494,6 +494,9 @@ __start_initialization_multiplatform:
 	/* Make sure we are running in 64 bits mode */
 	bl	enable_64b_mode
 
+	/* Zero r13 (paca) so early program check / mce don't use it */
+	li	r13,0
+
 	/* Get TOC pointer (current runtime address) */
 	bl	relative_toc
 
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 214d10caf458..d290ea9f0865 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -362,6 +362,7 @@ void __init early_setup(unsigned long dt_ptr)
 	 */
 	initialise_paca(&boot_paca, 0);
 	fixup_boot_paca(&boot_paca);
+	WARN_ON(local_paca != 0);
 	setup_paca(&boot_paca); /* install the paca into registers */
 
 	/* -------- printk is now safe to use ------- */
-- 
2.37.2

