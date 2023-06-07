Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1497264AB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 17:30:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbrrV4Mzmz3f0t
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 01:30:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=RPVtsD20;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=RPVtsD20;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbrlT583tz3dy7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 01:25:57 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id BB34221A0E;
	Wed,  7 Jun 2023 15:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686151554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=67NrrjqknF8ncefZ0/QwRO7Z+UALOwaMyCh2wgbmdCE=;
	b=RPVtsD20oF7xKx9lHHkuVEYOaHH0NVotS8ERgMRbGiYv9sNENCvHxcl86EgPfu4tpZlaES
	+bFIrLcaRZhUB+SRGKrqLJyXd/vLcuFZa8QN85IWEttGngspIYlqL5HmN4sh3PRvAUaZ2t
	vbu4DP4Wz2gOPmFgeP4Pm/pLgoanLy0=
Received: from alley.suse.cz (unknown [10.100.201.202])
	by relay2.suse.de (Postfix) with ESMTP id 337092C141;
	Wed,  7 Jun 2023 15:25:54 +0000 (UTC)
From: Petr Mladek <pmladek@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 5/7] watchdog/sparc64: Rename HAVE_NMI_WATCHDOG to HAVE_HARDLOCKUP_WATCHDOG_SPARC64
Date: Wed,  7 Jun 2023 17:24:30 +0200
Message-Id: <20230607152432.5435-6-pmladek@suse.com>
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

The configuration variable HAVE_NMI_WATCHDOG has a generic name but
it is selected only for SPARC64.

It should _not_ be used in general because it is not integrated with
the other hardlockup detectors. Namely, it does not support the hardlockup
specific command line parameters and systcl interface. Instead, it is
enabled/disabled together with the softlockup detector by the global
"watchdog" sysctl.

Rename it to HAVE_HARDLOCKUP_WATCHDOG_SPARC64 to make the special
behavior more clear.

Also the variable is set only on sparc64. Move the definition
from arch/Kconfig to arch/sparc/Kconfig.debug.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 arch/Kconfig             | 12 ------------
 arch/sparc/Kconfig       |  2 +-
 arch/sparc/Kconfig.debug | 12 ++++++++++++
 include/linux/nmi.h      |  4 ++--
 kernel/watchdog.c        |  2 +-
 lib/Kconfig.debug        |  5 +----
 6 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 57f15babe188..6517e5477459 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -400,18 +400,6 @@ config HAVE_HARDLOCKUP_DETECTOR_PERF
 	  The arch chooses to use the generic perf-NMI-based hardlockup
 	  detector. Must define HAVE_PERF_EVENTS_NMI.
 
-config HAVE_NMI_WATCHDOG
-	depends on HAVE_NMI
-	bool
-	help
-	  Sparc64 provides its own hardlockup detector implementation instead
-	  of the generic perf one.
-
-	  It does _not_ use the command line parameters and sysctl interface
-	  used by generic hardlockup detectors. Instead it is enabled/disabled
-	  by the top-level watchdog interface that is common for both softlockup
-	  and hardlockup detectors.
-
 config HAVE_HARDLOCKUP_DETECTOR_ARCH
 	bool
 	help
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 8535e19062f6..7297f69635cb 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -33,7 +33,7 @@ config SPARC
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select GENERIC_PCI_IOMAP
 	select HAS_IOPORT
-	select HAVE_NMI_WATCHDOG if SPARC64
+	select HAVE_HARDLOCKUP_DETECTOR_SPARC64 if SPARC64
 	select HAVE_CBPF_JIT if SPARC32
 	select HAVE_EBPF_JIT if SPARC64
 	select HAVE_DEBUG_BUGVERBOSE
diff --git a/arch/sparc/Kconfig.debug b/arch/sparc/Kconfig.debug
index 6b2bec1888b3..b6695303b8d4 100644
--- a/arch/sparc/Kconfig.debug
+++ b/arch/sparc/Kconfig.debug
@@ -14,3 +14,15 @@ config FRAME_POINTER
 	bool
 	depends on MCOUNT
 	default y
+
+config HAVE_HARDLOCKUP_DETECTOR_SPARC64
+	depends on HAVE_NMI
+	bool
+	help
+	  Sparc64 provides its own hardlockup detector implementation instead
+	  of the generic perf one.
+
+	  It does _not_ use the command line parameters and sysctl interface
+	  used by generic hardlockup detectors. Instead it is enabled/disabled
+	  by the top-level watchdog interface that is common for both softlockup
+	  and hardlockup detectors.
diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 800196c78f65..7ee6c35d1f05 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -9,7 +9,7 @@
 #include <asm/irq.h>
 
 /* Arch specific watchdogs might need to share extra watchdog-related APIs. */
-#if defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HAVE_NMI_WATCHDOG)
+#if defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_SPARC64)
 #include <asm/nmi.h>
 #endif
 
@@ -92,7 +92,7 @@ static inline void hardlockup_detector_disable(void) {}
 #endif
 
 /* Sparc64 has special implemetantion that is always enabled. */
-#if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HAVE_NMI_WATCHDOG)
+#if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_SPARC64)
 void arch_touch_nmi_watchdog(void);
 #else
 static inline void arch_touch_nmi_watchdog(void) { }
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 437c198933cf..babd2f3c8b72 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -29,7 +29,7 @@
 
 static DEFINE_MUTEX(watchdog_mutex);
 
-#if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HAVE_NMI_WATCHDOG)
+#if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_SPARC64)
 # define WATCHDOG_HARDLOCKUP_DEFAULT	1
 #else
 # define WATCHDOG_HARDLOCKUP_DEFAULT	0
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 4b4aa0f941f9..2d8d8ce7c2d7 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1050,12 +1050,9 @@ config HAVE_HARDLOCKUP_DETECTOR_BUDDY
 #	sparc64: has a custom implementation which is not using the common
 #		hardlockup command line options and sysctl interface.
 #
-# Note that HAVE_NMI_WATCHDOG is set when the sparc64 specific implementation
-# is used.
-#
 config HARDLOCKUP_DETECTOR
 	bool "Detect Hard Lockups"
-	depends on DEBUG_KERNEL && !S390 && !HAVE_NMI_WATCHDOG
+	depends on DEBUG_KERNEL && !S390 && !HAVE_HARDLOCKUP_DETECTOR_SPARC64
 	depends on HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY || HAVE_HARDLOCKUP_DETECTOR_ARCH
 	imply HARDLOCKUP_DETECTOR_PERF
 	imply HARDLOCKUP_DETECTOR_BUDDY
-- 
2.35.3

