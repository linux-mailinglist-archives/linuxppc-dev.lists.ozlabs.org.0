Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EB1726481
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 17:26:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbrmY36RVz3dvs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 01:26:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=WvUnL4M2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=WvUnL4M2;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qbrkg6SYcz3dtG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 01:25:15 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 1272D21A14;
	Wed,  7 Jun 2023 15:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686151512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z73Hgt9VQI6/zRBZSc9gAAdc0TQ1/JxriitS4YskKt4=;
	b=WvUnL4M2ZajH9kIJjqnSxPG4Jw6lPlouZDretV2OfImMo7vuS+U/fZxB2dAEYvMPeTGFAo
	Hu1l9MdEam4iY7zNNegb38tLQ/tRx7Wknuzn3k6fBasUvDQkxgIzTGYe/YpW5KKokFnTM1
	9pgt9zHd0hkQqrHWUzdcHKSW6KI2g0w=
Received: from alley.suse.cz (unknown [10.100.201.202])
	by relay2.suse.de (Postfix) with ESMTP id 8E3402C141;
	Wed,  7 Jun 2023 15:25:11 +0000 (UTC)
From: Petr Mladek <pmladek@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/7] watchdog/hardlockup: Sort hardlockup detector related config values a logical way
Date: Wed,  7 Jun 2023 17:24:26 +0200
Message-Id: <20230607152432.5435-2-pmladek@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230607152432.5435-1-pmladek@suse.com>
References: <20230607152432.5435-1-pmladek@suse.com>
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
Cc: Petr Mladek <pmladek@suse.com>, kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are four possible variants of hardlockup detectors:

  + buddy: available when SMP is set.

  + perf: available when HAVE_HARDLOCKUP_DETECTOR_PERF is set.

  + arch-specific: available when HAVE_HARDLOCKUP_DETECTOR_ARCH is set.

  + sparc64 special variant: available when HAVE_NMI_WATCHDOG is set
	and HAVE_HARDLOCKUP_DETECTOR_ARCH is not set.

Only one hardlockup detector can be compiled in. The selection is done
using quite complex dependencies between several CONFIG variables.
The following patches will try to make it more straightforward.

As a first step, reorder the definitions of the various CONFIG variables.
The logical order is:

   1. HAVE_* variables define available variants. They are typically
      defined in the arch/ config files.

   2. HARDLOCKUP_DETECTOR y/n variable defines whether the hardlockup
      detector is enabled at all.

   3. HARDLOCKUP_DETECTOR_PREFER_BUDDY y/n variable defines whether
      the buddy detector should be preferred over the perf one.
      Note that the arch specific variants are always preferred when
      available.

   4. HARDLOCKUP_DETECTOR_PERF/BUDDY variables define whether the given
      detector is enabled in the end.

   5. HAVE_HARDLOCKUP_DETECTOR_NON_ARCH and HARDLOCKUP_DETECTOR_NON_ARCH
      are temporary variables that are going to be removed in
      a followup patch.

The patch just shuffles the definitions. It should not change the existing
behavior.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 lib/Kconfig.debug | 112 +++++++++++++++++++++++-----------------------
 1 file changed, 56 insertions(+), 56 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ed7b01c4bd41..3e91fa33c7a0 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1035,62 +1035,6 @@ config BOOTPARAM_SOFTLOCKUP_PANIC
 
 	  Say N if unsure.
 
-# Both the "perf" and "buddy" hardlockup detectors count hrtimer
-# interrupts. This config enables functions managing this common code.
-config HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
-	bool
-	select SOFTLOCKUP_DETECTOR
-
-config HARDLOCKUP_DETECTOR_PERF
-	bool
-	depends on HAVE_HARDLOCKUP_DETECTOR_PERF
-	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
-
-config HARDLOCKUP_DETECTOR_BUDDY
-	bool
-	depends on SMP
-	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
-
-# For hardlockup detectors you can have one directly provided by the arch
-# or use a "non-arch" one. If you're using a "non-arch" one that is
-# further divided the perf hardlockup detector (which, confusingly, needs
-# arch-provided perf support) and the buddy hardlockup detector (which just
-# needs SMP). In either case, using the "non-arch" code conflicts with
-# the NMI watchdog code (which is sometimes used directly and sometimes used
-# by the arch-provided hardlockup detector).
-config HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
-	bool
-	depends on (HAVE_HARDLOCKUP_DETECTOR_PERF || SMP) && !HAVE_NMI_WATCHDOG
-	default y
-
-config HARDLOCKUP_DETECTOR_PREFER_BUDDY
-	bool "Prefer the buddy CPU hardlockup detector"
-	depends on HAVE_HARDLOCKUP_DETECTOR_PERF && SMP
-	help
-	  Say Y here to prefer the buddy hardlockup detector over the perf one.
-
-	  With the buddy detector, each CPU uses its softlockup hrtimer
-	  to check that the next CPU is processing hrtimer interrupts by
-	  verifying that a counter is increasing.
-
-	  This hardlockup detector is useful on systems that don't have
-	  an arch-specific hardlockup detector or if resources needed
-	  for the hardlockup detector are better used for other things.
-
-# This will select the appropriate non-arch hardlockdup detector
-config HARDLOCKUP_DETECTOR_NON_ARCH
-	bool
-	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
-	select HARDLOCKUP_DETECTOR_BUDDY if !HAVE_HARDLOCKUP_DETECTOR_PERF || HARDLOCKUP_DETECTOR_PREFER_BUDDY
-	select HARDLOCKUP_DETECTOR_PERF if HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_PREFER_BUDDY
-
-#
-# Enables a timestamp based low pass filter to compensate for perf based
-# hard lockup detection which runs too fast due to turbo modes.
-#
-config HARDLOCKUP_CHECK_TIMESTAMP
-	bool
-
 #
 # arch/ can define HAVE_HARDLOCKUP_DETECTOR_ARCH to provide their own hard
 # lockup detector rather than the perf based detector.
@@ -1111,6 +1055,62 @@ config HARDLOCKUP_DETECTOR
 	  chance to run.  The current stack trace is displayed upon detection
 	  and the system will stay locked up.
 
+config HARDLOCKUP_DETECTOR_PREFER_BUDDY
+	bool "Prefer the buddy CPU hardlockup detector"
+	depends on HAVE_HARDLOCKUP_DETECTOR_PERF && SMP
+	help
+	  Say Y here to prefer the buddy hardlockup detector over the perf one.
+
+	  With the buddy detector, each CPU uses its softlockup hrtimer
+	  to check that the next CPU is processing hrtimer interrupts by
+	  verifying that a counter is increasing.
+
+	  This hardlockup detector is useful on systems that don't have
+	  an arch-specific hardlockup detector or if resources needed
+	  for the hardlockup detector are better used for other things.
+
+config HARDLOCKUP_DETECTOR_PERF
+	bool
+	depends on HAVE_HARDLOCKUP_DETECTOR_PERF
+	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
+
+config HARDLOCKUP_DETECTOR_BUDDY
+	bool
+	depends on SMP
+	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
+
+# Both the "perf" and "buddy" hardlockup detectors count hrtimer
+# interrupts. This config enables functions managing this common code.
+config HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
+	bool
+	select SOFTLOCKUP_DETECTOR
+
+# For hardlockup detectors you can have one directly provided by the arch
+# or use a "non-arch" one. If you're using a "non-arch" one that is
+# further divided the perf hardlockup detector (which, confusingly, needs
+# arch-provided perf support) and the buddy hardlockup detector (which just
+# needs SMP). In either case, using the "non-arch" code conflicts with
+# the NMI watchdog code (which is sometimes used directly and sometimes used
+# by the arch-provided hardlockup detector).
+config HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
+	bool
+	depends on (HAVE_HARDLOCKUP_DETECTOR_PERF || SMP) && !HAVE_NMI_WATCHDOG
+	default y
+
+# This will select the appropriate non-arch hardlockdup detector
+config HARDLOCKUP_DETECTOR_NON_ARCH
+	bool
+	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
+	select HARDLOCKUP_DETECTOR_BUDDY if !HAVE_HARDLOCKUP_DETECTOR_PERF || HARDLOCKUP_DETECTOR_PREFER_BUDDY
+	select HARDLOCKUP_DETECTOR_PERF if HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_PREFER_BUDDY
+
+#
+# Enables a timestamp based low pass filter to compensate for perf based
+# hard lockup detection which runs too fast due to turbo modes.
+#
+config HARDLOCKUP_CHECK_TIMESTAMP
+	bool
+
 config BOOTPARAM_HARDLOCKUP_PANIC
 	bool "Panic (Reboot) On Hard Lockups"
 	depends on HARDLOCKUP_DETECTOR
-- 
2.35.3

