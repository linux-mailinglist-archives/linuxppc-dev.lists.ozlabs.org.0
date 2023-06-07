Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC76C7264B0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 17:31:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbrsR53C5z3fgL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 01:31:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=kzML994Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=kzML994Z;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qbrlh4sGWz3f0s
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 01:26:08 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 69C1621A0A;
	Wed,  7 Jun 2023 15:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686151565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A3CgSzwsEXLc90cJanqFihmE6LXoKCUHuh/h90XQnTE=;
	b=kzML994ZgBG3ossOC8+9yjHO8RHOyz8hbZzpcg9ma+UdcHUczrr/x1OIQ42iAngt9IVRJ1
	kxpe7IwJ6HQ8T0pxLF4X36w0nvN7fkliq0gu+Fs3gxp7s7VvfXSPLdZylbnotNBQqm2O5b
	ejAwedrW9fGl0BJw30aItF91kMzis20=
Received: from alley.suse.cz (unknown [10.100.201.202])
	by relay2.suse.de (Postfix) with ESMTP id D68332C141;
	Wed,  7 Jun 2023 15:26:04 +0000 (UTC)
From: Petr Mladek <pmladek@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 6/7] watchdog/sparc64: Define HARDLOCKUP_DETECTOR_SPARC64
Date: Wed,  7 Jun 2023 17:24:31 +0200
Message-Id: <20230607152432.5435-7-pmladek@suse.com>
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

The HAVE_ prefix means that the code could be enabled. Add another
variable for HAVE_HARDLOCKUP_DETECTOR_SPARC64 without this prefix.
It will be set when it should be built. It will make it compatible
with the other hardlockup detectors.

Before, it is far from obvious that the SPARC64 variant is actually used:

$> make ARCH=sparc64 defconfig
$> grep HARDLOCKUP_DETECTOR .config
CONFIG_HAVE_HARDLOCKUP_DETECTOR_BUDDY=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_SPARC64=y

After, it is more clear:

$> make ARCH=sparc64 defconfig
$> grep HARDLOCKUP_DETECTOR .config
CONFIG_HAVE_HARDLOCKUP_DETECTOR_BUDDY=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_SPARC64=y
CONFIG_HARDLOCKUP_DETECTOR_SPARC64=y

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 arch/sparc/Kconfig.debug | 10 +++++++++-
 include/linux/nmi.h      |  4 ++--
 kernel/watchdog.c        |  2 +-
 lib/Kconfig.debug        |  2 +-
 4 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/sparc/Kconfig.debug b/arch/sparc/Kconfig.debug
index b6695303b8d4..0bb95b0aacf4 100644
--- a/arch/sparc/Kconfig.debug
+++ b/arch/sparc/Kconfig.debug
@@ -16,8 +16,9 @@ config FRAME_POINTER
 	default y
 
 config HAVE_HARDLOCKUP_DETECTOR_SPARC64
-	depends on HAVE_NMI
 	bool
+	depends on HAVE_NMI
+	select HARDLOCKUP_DETECTOR_SPARC64
 	help
 	  Sparc64 provides its own hardlockup detector implementation instead
 	  of the generic perf one.
@@ -26,3 +27,10 @@ config HAVE_HARDLOCKUP_DETECTOR_SPARC64
 	  used by generic hardlockup detectors. Instead it is enabled/disabled
 	  by the top-level watchdog interface that is common for both softlockup
 	  and hardlockup detectors.
+
+config HARDLOCKUP_DETECTOR_SPARC64
+	bool
+	depends on HAVE_HARDLOCKUP_DETECTOR_SPARC64
+
+	help
+	  The custom hardlockup detector is always built when possible.
diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 7ee6c35d1f05..515d6724f469 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -9,7 +9,7 @@
 #include <asm/irq.h>
 
 /* Arch specific watchdogs might need to share extra watchdog-related APIs. */
-#if defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_SPARC64)
+#if defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HARDLOCKUP_DETECTOR_SPARC64)
 #include <asm/nmi.h>
 #endif
 
@@ -92,7 +92,7 @@ static inline void hardlockup_detector_disable(void) {}
 #endif
 
 /* Sparc64 has special implemetantion that is always enabled. */
-#if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_SPARC64)
+#if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HARDLOCKUP_DETECTOR_SPARC64)
 void arch_touch_nmi_watchdog(void);
 #else
 static inline void arch_touch_nmi_watchdog(void) { }
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index babd2f3c8b72..a2154e753cb4 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -29,7 +29,7 @@
 
 static DEFINE_MUTEX(watchdog_mutex);
 
-#if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_SPARC64)
+#if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HARDLOCKUP_DETECTOR_SPARC64)
 # define WATCHDOG_HARDLOCKUP_DEFAULT	1
 #else
 # define WATCHDOG_HARDLOCKUP_DEFAULT	0
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2d8d8ce7c2d7..116904e65d9f 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1052,7 +1052,7 @@ config HAVE_HARDLOCKUP_DETECTOR_BUDDY
 #
 config HARDLOCKUP_DETECTOR
 	bool "Detect Hard Lockups"
-	depends on DEBUG_KERNEL && !S390 && !HAVE_HARDLOCKUP_DETECTOR_SPARC64
+	depends on DEBUG_KERNEL && !S390 && !HARDLOCKUP_DETECTOR_SPARC64
 	depends on HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY || HAVE_HARDLOCKUP_DETECTOR_ARCH
 	imply HARDLOCKUP_DETECTOR_PERF
 	imply HARDLOCKUP_DETECTOR_BUDDY
-- 
2.35.3

