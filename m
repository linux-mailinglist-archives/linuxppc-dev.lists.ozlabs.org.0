Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6697131B1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 03:43:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QSl182FQ6z3fGF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 11:43:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jVuYAdq3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jVuYAdq3;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QSl0F6sNXz3f80
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 11:42:21 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-64d41763796so1181003b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 18:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685151740; x=1687743740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaDACvZxwdpKtf7kTBQLIF7ZNxT8GRJ6++BKiL/JB9M=;
        b=jVuYAdq3YuUoT9q0ptR3Y7gogUCPfBKK+uzhCs3nYmVmC0ZcHgwMRd0F7jOf1hYEoN
         iVHyunZrSLGRZ/SUtKN1NZqFCsyZzudfiz0JVDxVcWLyOc754sGNrSqCni0+0DMifrdR
         CX1zK1B4IcAFWXPw6yd7iZFlWLLQa05o6HrVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685151740; x=1687743740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KaDACvZxwdpKtf7kTBQLIF7ZNxT8GRJ6++BKiL/JB9M=;
        b=a2TbBXR7X2HwyQDI6eMH7hnWi9MbFGn2/hvGSNwAf+fDwJA4HS/TV88N5ymTp1CNRm
         mMvFQ3ALmBtEj9IPQUpNjDE7mIY9MyZ87j6tUwmB/qyYEWsQkgrp9lukoWDOEJSGOZR4
         PuqCHC+XEFdUVOh0DHkOGlLGLD3AAAKJEu9VpHvOs2R9lLP4gYNHbfFOAxW8rmmnGU6X
         OXUhRdNZdKBu2zbhNIPVLCmapGO0Io01eDtuQuPKnWOBj0oMnbSD4dZO51rheYlN+W1x
         VUCzxgaQ4Xdme0iXVLUYoSwQCpbhjLX63HTLM28jkAbGvOUZ6Q+RPxvmW80kmN9fdkel
         4FHw==
X-Gm-Message-State: AC+VfDwB0REJf3oPKm38iRTQBNcd5LJz3vLLA6CVrDXK+6HTjiTSJufh
	TlhrH8BGmoqfceHM+ppl33PVfw==
X-Google-Smtp-Source: ACHHUZ7idAUslgayGvplEniRBtJYBCvMASeKUJDKY3K4A2M46AA1VPt7NOcvpx5WEYfIrIw0exEmRA==
X-Received: by 2002:a05:6a00:2409:b0:63b:8778:99e4 with SMTP id z9-20020a056a00240900b0063b877899e4mr5910255pfh.2.1685151739708;
        Fri, 26 May 2023 18:42:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:4015:7255:c79a:26d7])
        by smtp.gmail.com with ESMTPSA id x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 18:42:19 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 02/10] watchdog/hardlockup: HAVE_NMI_WATCHDOG must implement watchdog_hardlockup_probe()
Date: Fri, 26 May 2023 18:41:32 -0700
Message-ID: <20230526184139.2.Ic6ebbf307ca0efe91f08ce2c1eb4a037ba6b0700@changeid>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
In-Reply-To: <20230527014153.2793931-1-dianders@chromium.org>
References: <20230527014153.2793931-1-dianders@chromium.org>
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, linux-perf-users@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Right now there is one arch (sparc64) that selects HAVE_NMI_WATCHDOG
without selecting HAVE_HARDLOCKUP_DETECTOR_ARCH. Because of that one
architecture, we have some special case code in the watchdog core to
handle the fact that watchdog_hardlockup_probe() isn't implemented.

Let's implement watchdog_hardlockup_probe() for sparc64 and get rid of
the special case.

As a side effect of doing this, code inspection tells us that we could
fix a minor bug where the system won't properly realize that NMI
watchdogs are disabled. Specifically, on powerpc if
CONFIG_PPC_WATCHDOG is turned off the arch might still select
CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH which selects
CONFIG_HAVE_NMI_WATCHDOG. Since CONFIG_PPC_WATCHDOG was off then
nothing will override the "weak" watchdog_hardlockup_probe() and we'll
fallback to looking at CONFIG_HAVE_NMI_WATCHDOG.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Though this does fix a minor bug, I didn't mark this as "Fixes"
because it's super minor. One could also argue that this wasn't a bug
at all but simply was never an implemented feature. The code that
added some amount of dynamicness here was commit a994a3147e4c
("watchdog/hardlockup/perf: Implement init time detection of perf")
which, as per the title, was only intending to make "perf"
dynamic. The old NMI watchdog presumably has never been handled
dynamically.

 arch/Kconfig            |  3 ++-
 arch/sparc/kernel/nmi.c |  5 +++++
 kernel/watchdog.c       | 13 -------------
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 64d771855ecd..b4f6387b12fe 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -428,7 +428,8 @@ config HAVE_NMI_WATCHDOG
 	bool
 	help
 	  The arch provides a low level NMI watchdog. It provides
-	  asm/nmi.h, and defines its own arch_touch_nmi_watchdog().
+	  asm/nmi.h, and defines its own watchdog_hardlockup_probe() and
+	  arch_touch_nmi_watchdog().
 
 config HAVE_HARDLOCKUP_DETECTOR_ARCH
 	bool
diff --git a/arch/sparc/kernel/nmi.c b/arch/sparc/kernel/nmi.c
index 9d9e29b75c43..17cdfdbf1f3b 100644
--- a/arch/sparc/kernel/nmi.c
+++ b/arch/sparc/kernel/nmi.c
@@ -65,6 +65,11 @@ void arch_touch_nmi_watchdog(void)
 }
 EXPORT_SYMBOL(arch_touch_nmi_watchdog);
 
+int __init watchdog_hardlockup_probe(void)
+{
+	return 0;
+}
+
 static void die_nmi(const char *str, struct pt_regs *regs, int do_panic)
 {
 	int this_cpu = smp_processor_id();
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 4b9e31edb47f..62230f5b8878 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -217,19 +217,6 @@ void __weak watchdog_hardlockup_disable(unsigned int cpu) { }
  */
 int __weak __init watchdog_hardlockup_probe(void)
 {
-	/*
-	 * If CONFIG_HAVE_NMI_WATCHDOG is defined then an architecture
-	 * is assumed to have the hard watchdog available and we return 0.
-	 */
-	if (IS_ENABLED(CONFIG_HAVE_NMI_WATCHDOG))
-		return 0;
-
-	/*
-	 * Hardlockup detectors other than those using CONFIG_HAVE_NMI_WATCHDOG
-	 * are required to implement a non-weak version of this probe function
-	 * to tell whether they are available. If they don't override then
-	 * we'll return -ENODEV.
-	 */
 	return -ENODEV;
 }
 
-- 
2.41.0.rc0.172.g3f132b7071-goog

