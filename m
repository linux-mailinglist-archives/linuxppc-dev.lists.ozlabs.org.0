Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F32F733455
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 17:09:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=LEG+bB3o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjMy32DsNz3cNT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 01:09:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=LEG+bB3o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjMvY05XNz3bn0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 01:07:05 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 30B1821DDD;
	Fri, 16 Jun 2023 15:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686928019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qs3x2K2fN4Rc+9wdA/hzCmlI9lCgzVLyvsrpfjT43/4=;
	b=LEG+bB3o0Khdv+53gaAhOEX6/7RB9Mv9sdwSpdZHkVetvIqSxuVfsxC9Fe0YD/ZSKqPSnX
	Z8leGrahQanAmW0jmQjRn/3fcGAnPw2sZ9T6Yf0iUzFhUwcbj8ijO/ZEwIViqJekTNQ0My
	G5uUa2qpb1IpKgV6I+8ci6IzZtLWGY8=
Received: from alley.suse.cz (unknown [10.100.208.146])
	by relay2.suse.de (Postfix) with ESMTP id AA8002C141;
	Fri, 16 Jun 2023 15:06:58 +0000 (UTC)
From: Petr Mladek <pmladek@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 2/6] watchdog/hardlockup: Make the config checks more straightforward
Date: Fri, 16 Jun 2023 17:06:14 +0200
Message-Id: <20230616150618.6073-3-pmladek@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230616150618.6073-1-pmladek@suse.com>
References: <20230616150618.6073-1-pmladek@suse.com>
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

The check for the sparc64 variant is more complicated because
HAVE_NMI_WATCHDOG is used to #ifdef code used by both arch-specific
and sparc64 specific variant. Therefore it is automatically
selected with HAVE_HARDLOCKUP_DETECTOR_ARCH.

This complexity is partly hidden in HAVE_HARDLOCKUP_DETECTOR_NON_ARCH.
It reduces the size of some checks but it makes them harder to follow.

Finally, the other temporary variable HARDLOCKUP_DETECTOR_NON_ARCH
is used to re-compute HARDLOCKUP_DETECTOR_PERF/BUDDY when the global
HARDLOCKUP_DETECTOR switch is enabled/disabled.

Make the logic more straightforward by the following changes:

  + Better explain the role of HAVE_HARDLOCKUP_DETECTOR_ARCH and
    HAVE_NMI_WATCHDOG in comments.

  + Add HAVE_HARDLOCKUP_DETECTOR_BUDDY so that there is separate
    HAVE_* for all four hardlockup detector variants.

    Use it in the other conditions instead of SMP. It makes it
    clear that it is about the buddy detector.

  + Open code HAVE_HARDLOCKUP_DETECTOR_NON_ARCH in HARDLOCKUP_DETECTOR
    and HARDLOCKUP_DETECTOR_PREFER_BUDDY. It helps to understand
    the conditions between the four hardlockup detector variants.

  + Define the exact conditions when HARDLOCKUP_DETECTOR_PERF/BUDDY
    can be enabled. It explains the dependency on the other
    hardlockup detector variants.

    Also it allows to remove HARDLOCKUP_DETECTOR_NON_ARCH by using "imply".
    It triggers re-evaluating HARDLOCKUP_DETECTOR_PERF/BUDDY when
    the global HARDLOCKUP_DETECTOR switch is changed.

  + Add dependency on HARDLOCKUP_DETECTOR so that the affected variables
    disappear when the hardlockup detectors are disabled.

    Another nice side effect is that HARDLOCKUP_DETECTOR_PREFER_BUDDY
    value is not preserved when the global switch is disabled.
    The user has to make the decision again when it gets re-enabled.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 arch/Kconfig      | 23 +++++++++++++-----
 lib/Kconfig.debug | 62 +++++++++++++++++++++++++++--------------------
 2 files changed, 53 insertions(+), 32 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 422f0ffa269e..77e5af5fda3f 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -404,17 +404,28 @@ config HAVE_NMI_WATCHDOG
 	depends on HAVE_NMI
 	bool
 	help
-	  The arch provides a low level NMI watchdog. It provides
-	  asm/nmi.h, and defines its own watchdog_hardlockup_probe() and
-	  arch_touch_nmi_watchdog().
+	  The arch provides its own hardlockup detector implementation instead
+	  of the generic ones.
+
+	  Sparc64 defines this variable without HAVE_HARDLOCKUP_DETECTOR_ARCH.
+	  It is the last arch-specific implementation which was developed before
+	  adding the common infrastructure for handling hardlockup detectors.
+	  It is always built. It does _not_ use the common command line
+	  parameters and sysctl interface, except for
+	  /proc/sys/kernel/nmi_watchdog.
 
 config HAVE_HARDLOCKUP_DETECTOR_ARCH
 	bool
 	select HAVE_NMI_WATCHDOG
 	help
-	  The arch chooses to provide its own hardlockup detector, which is
-	  a superset of the HAVE_NMI_WATCHDOG. It also conforms to config
-	  interfaces and parameters provided by hardlockup detector subsystem.
+	  The arch provides its own hardlockup detector implementation instead
+	  of the generic ones.
+
+	  It uses the same command line parameters, and sysctl interface,
+	  as the generic hardlockup detectors.
+
+	  HAVE_NMI_WATCHDOG is selected to build the code shared with
+	  the sparc64 specific implementation.
 
 config HAVE_PERF_REGS
 	bool
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 3e91fa33c7a0..a0b0c4decb89 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1035,16 +1035,33 @@ config BOOTPARAM_SOFTLOCKUP_PANIC
 
 	  Say N if unsure.
 
+config HAVE_HARDLOCKUP_DETECTOR_BUDDY
+	bool
+	depends on SMP
+	default y
+
 #
-# arch/ can define HAVE_HARDLOCKUP_DETECTOR_ARCH to provide their own hard
-# lockup detector rather than the perf based detector.
+# Global switch whether to build a hardlockup detector at all. It is available
+# only when the architecture supports at least one implementation. There are
+# two exceptions. The hardlockup detector is never enabled on:
+#
+#	s390: it reported many false positives there
+#
+#	sparc64: has a custom implementation which is not using the common
+#		hardlockup command line options and sysctl interface.
+#
+# Note that HAVE_NMI_WATCHDOG is used to distinguish the sparc64 specific
+# implementaion. It is automatically enabled also for other arch-specific
+# variants which set HAVE_HARDLOCKUP_DETECTOR_ARCH. It makes the check
+# of avaialable and supported variants quite tricky.
 #
 config HARDLOCKUP_DETECTOR
 	bool "Detect Hard Lockups"
 	depends on DEBUG_KERNEL && !S390
-	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH || HAVE_HARDLOCKUP_DETECTOR_ARCH
+	depends on ((HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY) && !HAVE_NMI_WATCHDOG) || HAVE_HARDLOCKUP_DETECTOR_ARCH
+	imply HARDLOCKUP_DETECTOR_PERF
+	imply HARDLOCKUP_DETECTOR_BUDDY
 	select LOCKUP_DETECTOR
-	select HARDLOCKUP_DETECTOR_NON_ARCH if HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
 
 	help
 	  Say Y here to enable the kernel to act as a watchdog to detect
@@ -1055,9 +1072,14 @@ config HARDLOCKUP_DETECTOR
 	  chance to run.  The current stack trace is displayed upon detection
 	  and the system will stay locked up.
 
+#
+# Note that arch-specific variants are always preferred.
+#
 config HARDLOCKUP_DETECTOR_PREFER_BUDDY
 	bool "Prefer the buddy CPU hardlockup detector"
-	depends on HAVE_HARDLOCKUP_DETECTOR_PERF && SMP
+	depends on HARDLOCKUP_DETECTOR
+	depends on HAVE_HARDLOCKUP_DETECTOR_PERF && HAVE_HARDLOCKUP_DETECTOR_BUDDY
+	depends on !HAVE_NMI_WATCHDOG
 	help
 	  Say Y here to prefer the buddy hardlockup detector over the perf one.
 
@@ -1071,39 +1093,27 @@ config HARDLOCKUP_DETECTOR_PREFER_BUDDY
 
 config HARDLOCKUP_DETECTOR_PERF
 	bool
-	depends on HAVE_HARDLOCKUP_DETECTOR_PERF
+	depends on HARDLOCKUP_DETECTOR
+	depends on HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_PREFER_BUDDY
+	depends on !HAVE_NMI_WATCHDOG
 	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
 
 config HARDLOCKUP_DETECTOR_BUDDY
 	bool
-	depends on SMP
+	depends on HARDLOCKUP_DETECTOR
+	depends on HAVE_HARDLOCKUP_DETECTOR_BUDDY
+	depends on !HAVE_HARDLOCKUP_DETECTOR_PERF || HARDLOCKUP_DETECTOR_PREFER_BUDDY
+	depends on !HAVE_NMI_WATCHDOG
 	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
 
+#
 # Both the "perf" and "buddy" hardlockup detectors count hrtimer
 # interrupts. This config enables functions managing this common code.
+#
 config HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
 	bool
 	select SOFTLOCKUP_DETECTOR
 
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
-# This will select the appropriate non-arch hardlockdup detector
-config HARDLOCKUP_DETECTOR_NON_ARCH
-	bool
-	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
-	select HARDLOCKUP_DETECTOR_BUDDY if !HAVE_HARDLOCKUP_DETECTOR_PERF || HARDLOCKUP_DETECTOR_PREFER_BUDDY
-	select HARDLOCKUP_DETECTOR_PERF if HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_PREFER_BUDDY
-
 #
 # Enables a timestamp based low pass filter to compensate for perf based
 # hard lockup detection which runs too fast due to turbo modes.
-- 
2.35.3

