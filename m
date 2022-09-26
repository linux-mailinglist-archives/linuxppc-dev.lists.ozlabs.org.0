Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D25425E9910
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 08:00:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbXDN5g60z3fBQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:00:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lseCb+JV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lseCb+JV;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbX7s38xpz3c1Q
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 15:56:41 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id rt12so5287473pjb.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 22:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=zhCL+sq8ldJZ8+xpHPumeVopAsycKiI4g3DVUhg8zvI=;
        b=lseCb+JVFFihECF4BLrQsyI2JX3BqoH+DmV3ollGf6Mgxn+VnDOjTHxw+cq8G6NrXa
         arNyM89LbNx86FhTyJGoXJ2ZHofRKa9PxUn26Dl55Rp7hK3Wrp3Qt8HuONnm3KNcmp/C
         pp476K1wnECTHk3Xh2P5tag4KuPE17vXznm98XQhh2OkRuDwD470iCSfiE89Q4F3q2UC
         /mUlZkjRA186fSU/dg51L3GRAGJmxYGZ8pGGZuBxqh1b8y/heIWfQ40R8H0L2OoWX2dX
         y6e42V1aNSv1rytM0fIZ4iWTUSFEL69cJQOMDsLvehJxM3fG27RXWVgOUall28UnE5gz
         Aa7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zhCL+sq8ldJZ8+xpHPumeVopAsycKiI4g3DVUhg8zvI=;
        b=6+heTj6EWEC8WRyHY7xBS8/9LdN2CiFuKS3j7NanoMlWqHCivlcaLII91cUe8wUorN
         jakPY+ntiab8nYAiGJzQnpYPCED4sk2SB4y6lcmq2EchG6KkKHS1s6UIuLcu1bb9lox9
         I2JNBjAaC2QDcE/bjFH9nFH3eGAMERHpvZxXD0W8eRToBKjxgAfiudmnefZs74TFoR9u
         C6Bl4lJ/7XheIlB8VM+75RheNIFdZZM9BSJq15SgB2GM2A3s9PBBd+qysDwb0G4zqSbT
         fn501oVlbjy2StZ0k+N0rkJBvJzdjoFTtNWpEk1rKAbpJ+7LrMq87cATpJZx3vhXyDOf
         WTiA==
X-Gm-Message-State: ACrzQf0AwywBdfTa3FFrp1MF5qJc8c6QCL6ONShWUqA1QrLFPpvrSJrd
	5WSIhxkbVX4E2PKyLWgynK7r9bQb37DRsA==
X-Google-Smtp-Source: AMsMyM5NrrcXhMGk4z96muAM290yM+ekBMMb4d4jom2K7xlgtjXpuhIu8w6krzbjRQa8Ur3uhTtTAQ==
X-Received: by 2002:a17:902:ce85:b0:178:292b:a87a with SMTP id f5-20020a170902ce8500b00178292ba87amr20312718plg.167.1664171798947;
        Sun, 25 Sep 2022 22:56:38 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (203-219-181-119.static.tpgi.com.au. [203.219.181.119])
        by smtp.gmail.com with ESMTPSA id pv7-20020a17090b3c8700b00203a4f70b90sm5628075pjb.45.2022.09.25.22.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 22:56:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 5/5] powerpc/64s/interrupt: halt early boot interrupts if paca is not set up
Date: Mon, 26 Sep 2022 15:56:20 +1000
Message-Id: <20220926055620.2676869-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220926055620.2676869-1-npiggin@gmail.com>
References: <20220926055620.2676869-1-npiggin@gmail.com>
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
 arch/powerpc/kernel/exceptions-64s.S | 15 +++++++++++++--
 arch/powerpc/kernel/head_64.S        |  3 +++
 arch/powerpc/kernel/setup_64.c       |  1 +
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 9b853fdd59de..2f3b8d8a7ef6 100644
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
@@ -752,8 +752,19 @@ BEGIN_FTR_SECTION
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
+	mtsprg	0, r11
+	mfcr	r11
+	cmpdi	r13, 0
+	beq	.
+	mtcr	r11
+	mfsprg	r11, 0
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
index 83e564564f63..4cb057e6b3aa 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -364,6 +364,7 @@ void __init early_setup(unsigned long dt_ptr)
 	 */
 	initialise_paca(&boot_paca, 0);
 	fixup_boot_paca(&boot_paca);
+	WARN_ON(local_paca != 0);
 	setup_paca(&boot_paca); /* install the paca into registers */
 
 	/* -------- printk is now safe to use ------- */
-- 
2.37.2

