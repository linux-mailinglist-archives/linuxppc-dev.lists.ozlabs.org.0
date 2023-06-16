Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E15073345C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 17:10:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=WcE6bts4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjMz41LTWz2xvF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 01:10:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=WcE6bts4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjMvl5WR0z3bvY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 01:07:15 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 17D711F74C;
	Fri, 16 Jun 2023 15:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686928030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P8rPtQgN6vSoW8VvCYmw0+AJGTAHRLGVOe7N7gs1tSc=;
	b=WcE6bts402dB0qd+B0JwNUcM215ujMBrjbLGulyEpRpZahfabZxrV3e+htSPXqkev4clah
	IQznN1Kr0G6ZtraGh62ZmO5lpnl9+7T53PQyqvPHtCV7UFV4ejpAPMUYB14+unZNlTuUhD
	kM07aBFUhfA+5gWs2cUsAYby7QRAbUE=
Received: from alley.suse.cz (unknown [10.100.208.146])
	by relay2.suse.de (Postfix) with ESMTP id 715CE2C141;
	Fri, 16 Jun 2023 15:07:09 +0000 (UTC)
From: Petr Mladek <pmladek@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 3/6] watchdog/hardlockup: Declare arch_touch_nmi_watchdog() only in linux/nmi.h
Date: Fri, 16 Jun 2023 17:06:15 +0200
Message-Id: <20230616150618.6073-4-pmladek@suse.com>
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

arch_touch_nmi_watchdog() needs a different implementation for various
hardlockup detector implementations. And it does nothing when
any hardlockup detector is not built at all.

arch_touch_nmi_watchdog() is declared via linux/nmi.h. And it must be
defined as an empty function when there is no hardlockup detector.
It is done directly in this header file for the perf and buddy detectors.
And it is done in the included asm/linux.h for arch specific detectors.

The reason probably is that the arch specific variants build the code
using another conditions. For example, powerpc64/sparc64 builds the code
when CONFIG_PPC_WATCHDOG is enabled.

Another reason might be that these architectures define more functions
in asm/nmi.h anyway.

However the generic code actually knows when the function will be
implemented. It happens when some full featured or the sparc64-specific
hardlockup detector is built.

In particular, CONFIG_HARDLOCKUP_DETECTOR can be enabled only when
a generic or arch-specific full featured hardlockup detector is available.
The only exception is sparc64 which can be built even when the global
HARDLOCKUP_DETECTOR switch is disabled.

The information about sparc64 is a bit complicated. The hardlockup
detector is built there when CONFIG_HAVE_NMI_WATCHDOG is set and
CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH is not set.

People might wonder whether this change really makes things easier.
The motivation is:

  + The current logic in linux/nmi.h is far from obvious.
    For example, arch_touch_nmi_watchdog() is defined as {} when
    neither CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER nor
    CONFIG_HAVE_NMI_WATCHDOG is defined.

  + The change synchronizes the checks in lib/Kconfig.debug and
    in the generic code.

  + It is a step that will help cleaning HAVE_NMI_WATCHDOG related
    checks.

The change should not change the existing behavior.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 arch/powerpc/include/asm/nmi.h |  2 --
 arch/sparc/include/asm/nmi.h   |  1 -
 include/linux/nmi.h            | 13 ++++++++++---
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/nmi.h b/arch/powerpc/include/asm/nmi.h
index 43bfd4de868f..ce25318c3902 100644
--- a/arch/powerpc/include/asm/nmi.h
+++ b/arch/powerpc/include/asm/nmi.h
@@ -3,11 +3,9 @@
 #define _ASM_NMI_H
 
 #ifdef CONFIG_PPC_WATCHDOG
-extern void arch_touch_nmi_watchdog(void);
 long soft_nmi_interrupt(struct pt_regs *regs);
 void watchdog_hardlockup_set_timeout_pct(u64 pct);
 #else
-static inline void arch_touch_nmi_watchdog(void) {}
 static inline void watchdog_hardlockup_set_timeout_pct(u64 pct) {}
 #endif
 
diff --git a/arch/sparc/include/asm/nmi.h b/arch/sparc/include/asm/nmi.h
index 90ee7863d9fe..920dc23f443f 100644
--- a/arch/sparc/include/asm/nmi.h
+++ b/arch/sparc/include/asm/nmi.h
@@ -8,7 +8,6 @@ void nmi_adjust_hz(unsigned int new_hz);
 
 extern atomic_t nmi_active;
 
-void arch_touch_nmi_watchdog(void);
 void start_nmi_watchdog(void *unused);
 void stop_nmi_watchdog(void *unused);
 
diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index b5d0b7ab52fb..b9e816bde14a 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -7,6 +7,8 @@
 
 #include <linux/sched.h>
 #include <asm/irq.h>
+
+/* Arch specific watchdogs might need to share extra watchdog-related APIs. */
 #if defined(CONFIG_HAVE_NMI_WATCHDOG)
 #include <asm/nmi.h>
 #endif
@@ -89,12 +91,17 @@ extern unsigned int hardlockup_panic;
 static inline void hardlockup_detector_disable(void) {}
 #endif
 
-#if defined(CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER)
+/* Sparc64 has special implemetantion that is always enabled. */
+#if defined(CONFIG_HARDLOCKUP_DETECTOR) || \
+    (defined(CONFIG_HAVE_NMI_WATCHDOG) && !defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH))
 void arch_touch_nmi_watchdog(void);
+#else
+static inline void arch_touch_nmi_watchdog(void) { }
+#endif
+
+#if defined(CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER)
 void watchdog_hardlockup_touch_cpu(unsigned int cpu);
 void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs);
-#elif !defined(CONFIG_HAVE_NMI_WATCHDOG)
-static inline void arch_touch_nmi_watchdog(void) { }
 #endif
 
 #if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
-- 
2.35.3

