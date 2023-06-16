Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AB973346F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 17:12:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=gA8XKiBo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjN273RcLz3cRH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 01:12:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=gA8XKiBo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjMwK3gzCz3bvy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 01:07:45 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id B23301F383;
	Fri, 16 Jun 2023 15:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686928062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Llps/KVBYDohZOBxMqoo/1G2j7ZgRyb9eCpYBadeTUM=;
	b=gA8XKiBonlvkxwJm9FYMmRXjtVIiREzjCBQlJy7pzY36x7rIOIaTmfACGzyEIViw5qF9v1
	wm18PHDcTUMZ2EOv3PptHOTCfN90mSugt9sy8P7Ptd4tHYa0PkwKgD+YK3HMaJ7dqsiDGC
	DrIWfrx3znaNgD/XEnyz6x2MnqelqVI=
Received: from alley.suse.cz (unknown [10.100.208.146])
	by relay2.suse.de (Postfix) with ESMTP id 28D102C141;
	Fri, 16 Jun 2023 15:07:42 +0000 (UTC)
From: Petr Mladek <pmladek@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 6/6] watchdog/hardlockup: Define HARDLOCKUP_DETECTOR_ARCH
Date: Fri, 16 Jun 2023 17:06:18 +0200
Message-Id: <20230616150618.6073-7-pmladek@suse.com>
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

The HAVE_ prefix means that the code could be enabled. Add another
variable for HAVE_HARDLOCKUP_DETECTOR_ARCH without this prefix.
It will be set when it should be built. It will make it compatible
with the other hardlockup detectors.

The change allows to clean up dependencies of PPC_WATCHDOG
and HAVE_HARDLOCKUP_DETECTOR_PERF definitions for powerpc.

As a result HAVE_HARDLOCKUP_DETECTOR_PERF has the same dependencies
on arm, x86, powerpc architectures.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 arch/powerpc/Kconfig | 5 ++---
 include/linux/nmi.h  | 2 +-
 lib/Kconfig.debug    | 9 +++++++++
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 539d1f03ff42..987e730740d7 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -90,8 +90,7 @@ config NMI_IPI
 
 config PPC_WATCHDOG
 	bool
-	depends on HARDLOCKUP_DETECTOR
-	depends on HAVE_HARDLOCKUP_DETECTOR_ARCH
+	depends on HARDLOCKUP_DETECTOR_ARCH
 	default y
 	help
 	  This is a placeholder when the powerpc hardlockup detector
@@ -240,7 +239,7 @@ config PPC
 	select HAVE_GCC_PLUGINS			if GCC_VERSION >= 50200   # plugin support on gcc <= 5.1 is buggy on PPC
 	select HAVE_GENERIC_VDSO
 	select HAVE_HARDLOCKUP_DETECTOR_ARCH	if PPC_BOOK3S_64 && SMP
-	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_NMI && !HAVE_HARDLOCKUP_DETECTOR_ARCH
+	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
 	select HAVE_HW_BREAKPOINT		if PERF_EVENTS && (PPC_BOOK3S || PPC_8xx)
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_TIME_ACCOUNTING
diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 515d6724f469..ec808ebd36ba 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -9,7 +9,7 @@
 #include <asm/irq.h>
 
 /* Arch specific watchdogs might need to share extra watchdog-related APIs. */
-#if defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HARDLOCKUP_DETECTOR_SPARC64)
+#if defined(CONFIG_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HARDLOCKUP_DETECTOR_SPARC64)
 #include <asm/nmi.h>
 #endif
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index f285e9cf967a..2c4bb72e72ad 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1056,6 +1056,7 @@ config HARDLOCKUP_DETECTOR
 	depends on HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY || HAVE_HARDLOCKUP_DETECTOR_ARCH
 	imply HARDLOCKUP_DETECTOR_PERF
 	imply HARDLOCKUP_DETECTOR_BUDDY
+	imply HARDLOCKUP_DETECTOR_ARCH
 	select LOCKUP_DETECTOR
 
 	help
@@ -1101,6 +1102,14 @@ config HARDLOCKUP_DETECTOR_BUDDY
 	depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
 	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
 
+config HARDLOCKUP_DETECTOR_ARCH
+	bool
+	depends on HARDLOCKUP_DETECTOR
+	depends on HAVE_HARDLOCKUP_DETECTOR_ARCH
+	help
+	  The arch-specific implementation of the hardlockup detector will
+	  be used.
+
 #
 # Both the "perf" and "buddy" hardlockup detectors count hrtimer
 # interrupts. This config enables functions managing this common code.
-- 
2.35.3

