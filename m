Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5147334A2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 17:22:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=UR8LVjAM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjNF43sT5z3c3j
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 01:22:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=UR8LVjAM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 876 seconds by postgrey-1.37 at boromir; Sat, 17 Jun 2023 01:21:27 AEST
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjND75CSnz3bqQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 01:21:26 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id DB79E1F7AB;
	Fri, 16 Jun 2023 15:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686928882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iCxAnuiAG4ygU56OJZD6HlNc1oJ5LBT0CL0FndkD77E=;
	b=UR8LVjAMNY1NnmzQ7flafLkPmJeHFs+70HIwy87aZdn0U40lAAatxdBvkxVAjndAxXQ0DH
	Wzlo3GPFS5RFgX2Y3tmRK3p6tQDq9jTidMdgF5dJCPTQQbzyxHV7VGEZrbJl/Lr+88z+pn
	x8/UlDajd9OLFWIbP6eBJ/UNLlP8dQo=
Received: from suse.cz (unknown [10.100.208.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 911482C141;
	Fri, 16 Jun 2023 15:21:22 +0000 (UTC)
Date: Fri, 16 Jun 2023 17:21:22 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 0/6] watchdog/hardlockup: Cleanup configuration of
 hardlockup detectors
Message-ID: <ZIx98kCuA0P_pE4h@alley>
References: <20230616150618.6073-1-pmladek@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616150618.6073-1-pmladek@suse.com>
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 2023-06-16 17:06:12, Petr Mladek wrote:
> Hi,
> 
> this patchset is supposed to replace the last patch in the patchset cleaning
> up after introducing the buddy detector, see
> https://lore.kernel.org/r/20230526184139.10.I821fe7609e57608913fe05abd8f35b343e7a9aae@changeid
> 
> Changes against v1:
> 
>   + Better explained the C-like ordering in the 1st patch.
> 
>   + Squashed patches for splitting and renaming HAVE_NMI_WATCHDOG,
>     updated commit message with the history and more facts.
> 
>   + Updated comments about the sparc64 variant. It is not handled together
>     with the softlockup detector. In fact, it is always build. And it even
>     used to be always enabled until the commit 7a5c8b57cec93196b ("sparc:
>     implement watchdog_nmi_enable and watchdog_nmi_disable") added in
>     v4.10-rc1.
> 
>     I realized this when updating the comment for the 4th patch. My original
>     statement in v1 patchset was based on code reading. I looked at it from
>     a bad side.
> 
>   + Removed superfluous "default n"
>   + Fixed typos.

I sometimes find the diff between the two versions useful. Especially, when the
patches are not trivial and the last version made only cosmetic
changes.

This is what I got by comparing "git format-patch" generated patchsets:

diff -purN watchdog-buddy-hardlockup-detector-config-cleanup-v1-iter1-reference/0000-cover-letter.patch watchdog-buddy-hardlockup-detector-config-cleanup-v2-iter1/0000-cover-letter.patch
--- watchdog-buddy-hardlockup-detector-config-cleanup-v1-iter1-reference/0000-cover-letter.patch	2023-06-16 16:42:07.769941775 +0200
+++ watchdog-buddy-hardlockup-detector-config-cleanup-v2-iter1/0000-cover-letter.patch	2023-06-16 16:39:42.179877676 +0200
@@ -1,9 +1,33 @@
-From 0456ed568d98ba5bba8148e4f60d769e3c5a6c7a Mon Sep 17 00:00:00 2001
+From bcf4dfab5a64ee691eb5154b1361ed59610c9387 Mon Sep 17 00:00:00 2001
 From: Petr Mladek <pmladek@suse.com>
-Date: Fri, 16 Jun 2023 16:42:07 +0200
-Subject: [PATCH 0/6] *** SUBJECT HERE ***
+Date: Fri, 16 Jun 2023 16:28:13 +0200
+Subject: [PATCH v2 0/6] watchdog/hardlockup: Cleanup configuration of hardlockup detectors
 
-*** BLURB HERE ***
+Hi,
+
+this patchset is supposed to replace the last patch in the patchset cleaning
+up after introducing the buddy detector, see
+https://lore.kernel.org/r/20230526184139.10.I821fe7609e57608913fe05abd8f35b343e7a9aae@changeid
+
+Changes against v1:
+
+  + Better explained the C-like ordering in the 1st patch.
+
+  + Squashed patches for splitting and renaming HAVE_NMI_WATCHDOG,
+    updated commit message with the history and more facts.
+
+  + Updated comments about the sparc64 variant. It is not handled together
+    with the softlockup detector. In fact, it is always build. And it even
+    used to be always enabled until the commit 7a5c8b57cec93196b ("sparc:
+    implement watchdog_nmi_enable and watchdog_nmi_disable") added in
+    v4.10-rc1.
+
+    I realized this when updating the comment for the 4th patch. My original
+    statement in v1 patchset was based on code reading. I looked at it from
+    a bad side.
+
+  + Removed superfluous "default n"
+  + Fixed typos.
 
 Petr Mladek (6):
   watchdog/hardlockup: Sort hardlockup detector related config values a
@@ -19,12 +43,12 @@ Petr Mladek (6):
  arch/powerpc/Kconfig           |   5 +-
  arch/powerpc/include/asm/nmi.h |   2 -
  arch/sparc/Kconfig             |   2 +-
- arch/sparc/Kconfig.debug       |  20 ++++++
+ arch/sparc/Kconfig.debug       |  14 ++++
  arch/sparc/include/asm/nmi.h   |   1 -
  include/linux/nmi.h            |  14 ++--
  kernel/watchdog.c              |   2 +-
- lib/Kconfig.debug              | 115 +++++++++++++++++++--------------
- 9 files changed, 104 insertions(+), 74 deletions(-)
+ lib/Kconfig.debug              | 114 ++++++++++++++++++---------------
+ 9 files changed, 97 insertions(+), 74 deletions(-)
 
 -- 
 2.35.3
diff -purN watchdog-buddy-hardlockup-detector-config-cleanup-v1-iter1-reference/0001-watchdog-hardlockup-Sort-hardlockup-detector-related.patch watchdog-buddy-hardlockup-detector-config-cleanup-v2-iter1/0001-watchdog-hardlockup-Sort-hardlockup-detector-related.patch
--- watchdog-buddy-hardlockup-detector-config-cleanup-v1-iter1-reference/0001-watchdog-hardlockup-Sort-hardlockup-detector-related.patch	2023-06-16 16:42:07.741941379 +0200
+++ watchdog-buddy-hardlockup-detector-config-cleanup-v2-iter1/0001-watchdog-hardlockup-Sort-hardlockup-detector-related.patch	2023-06-16 16:28:53.594682369 +0200
@@ -1,7 +1,7 @@
-From 9d643e4254b224d22dd1411c51386ab686c052a7 Mon Sep 17 00:00:00 2001
+From bd7019bff3a28fb0bc163308101118adccf699d3 Mon Sep 17 00:00:00 2001
 From: Petr Mladek <pmladek@suse.com>
 Date: Thu, 1 Jun 2023 15:35:09 +0200
-Subject: [PATCH 1/6] watchdog/hardlockup: Sort hardlockup detector related
+Subject: [PATCH v2 1/6] watchdog/hardlockup: Sort hardlockup detector related
  config values a logical way
 
 There are four possible variants of hardlockup detectors:
@@ -40,6 +40,14 @@ The logical order is:
       are temporary variables that are going to be removed in
       a followup patch.
 
+This is a preparation step for further cleanup. It will change the logic
+without shuffling the definitions.
+
+This change temporary breaks the C-like ordering where the variables are
+declared or defined before they are used. It is not really needed for
+Kconfig. Also the following patches will rework the logic so that
+the ordering will be C-like in the end.
+
 The patch just shuffles the definitions. It should not change the existing
 behavior.
 
diff -purN watchdog-buddy-hardlockup-detector-config-cleanup-v1-iter1-reference/0002-watchdog-hardlockup-Make-the-config-checks-more-stra.patch watchdog-buddy-hardlockup-detector-config-cleanup-v2-iter1/0002-watchdog-hardlockup-Make-the-config-checks-more-stra.patch
--- watchdog-buddy-hardlockup-detector-config-cleanup-v1-iter1-reference/0002-watchdog-hardlockup-Make-the-config-checks-more-stra.patch	2023-06-16 16:42:07.745941436 +0200
+++ watchdog-buddy-hardlockup-detector-config-cleanup-v2-iter1/0002-watchdog-hardlockup-Make-the-config-checks-more-stra.patch	2023-06-16 16:28:53.594682369 +0200
@@ -1,7 +1,7 @@
-From b36400b9adf92a911dc2b9ee8f471cf3066a9f74 Mon Sep 17 00:00:00 2001
+From 91fabffa4aafae0611130d4de0471e847cee67dc Mon Sep 17 00:00:00 2001
 From: Petr Mladek <pmladek@suse.com>
 Date: Thu, 1 Jun 2023 17:10:11 +0200
-Subject: [PATCH 2/6] watchdog/hardlockup: Make the config checks more
+Subject: [PATCH v2 2/6] watchdog/hardlockup: Make the config checks more
  straightforward
 
 There are four possible variants of hardlockup detectors:
@@ -55,19 +55,19 @@ Make the logic more straightforward by t
 
     Another nice side effect is that HARDLOCKUP_DETECTOR_PREFER_BUDDY
     value is not preserved when the global switch is disabled.
-    The user has to make the decision when it is enabled again.
+    The user has to make the decision again when it gets re-enabled.
 
 Signed-off-by: Petr Mladek <pmladek@suse.com>
 ---
- arch/Kconfig      | 22 ++++++++++++-----
- lib/Kconfig.debug | 63 ++++++++++++++++++++++++++++-------------------
+ arch/Kconfig      | 23 +++++++++++++-----
+ lib/Kconfig.debug | 62 +++++++++++++++++++++++++++--------------------
  2 files changed, 53 insertions(+), 32 deletions(-)
 
 diff --git a/arch/Kconfig b/arch/Kconfig
-index 422f0ffa269e..13c6e596cf9e 100644
+index 422f0ffa269e..77e5af5fda3f 100644
 --- a/arch/Kconfig
 +++ b/arch/Kconfig
-@@ -404,17 +404,27 @@ config HAVE_NMI_WATCHDOG
+@@ -404,17 +404,28 @@ config HAVE_NMI_WATCHDOG
  	depends on HAVE_NMI
  	bool
  	help
@@ -75,13 +75,14 @@ index 422f0ffa269e..13c6e596cf9e 100644
 -	  asm/nmi.h, and defines its own watchdog_hardlockup_probe() and
 -	  arch_touch_nmi_watchdog().
 +	  The arch provides its own hardlockup detector implementation instead
-+	  of the generic perf one.
++	  of the generic ones.
 +
 +	  Sparc64 defines this variable without HAVE_HARDLOCKUP_DETECTOR_ARCH.
-+	  It does _not_ use the command line parameters and sysctl interface
-+	  used by generic hardlockup detectors. Instead it is enabled/disabled
-+	  by the top-level watchdog interface that is common for both softlockup
-+	  and hardlockup detectors.
++	  It is the last arch-specific implementation which was developed before
++	  adding the common infrastructure for handling hardlockup detectors.
++	  It is always built. It does _not_ use the common command line
++	  parameters and sysctl interface, except for
++	  /proc/sys/kernel/nmi_watchdog.
  
  config HAVE_HARDLOCKUP_DETECTOR_ARCH
  	bool
@@ -102,7 +103,7 @@ index 422f0ffa269e..13c6e596cf9e 100644
  config HAVE_PERF_REGS
  	bool
 diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
-index 3e91fa33c7a0..d201f5d3876b 100644
+index 3e91fa33c7a0..a0b0c4decb89 100644
 --- a/lib/Kconfig.debug
 +++ b/lib/Kconfig.debug
 @@ -1035,16 +1035,33 @@ config BOOTPARAM_SOFTLOCKUP_PANIC
@@ -119,7 +120,7 @@ index 3e91fa33c7a0..d201f5d3876b 100644
 -# lockup detector rather than the perf based detector.
 +# Global switch whether to build a hardlockup detector at all. It is available
 +# only when the architecture supports at least one implementation. There are
-+# two exceptions. The hardlockup detector is newer enabled on:
++# two exceptions. The hardlockup detector is never enabled on:
 +#
 +#	s390: it reported many false positives there
 +#
@@ -143,7 +144,7 @@ index 3e91fa33c7a0..d201f5d3876b 100644
  
  	help
  	  Say Y here to enable the kernel to act as a watchdog to detect
-@@ -1055,9 +1072,15 @@ config HARDLOCKUP_DETECTOR
+@@ -1055,9 +1072,14 @@ config HARDLOCKUP_DETECTOR
  	  chance to run.  The current stack trace is displayed upon detection
  	  and the system will stay locked up.
  
@@ -156,11 +157,10 @@ index 3e91fa33c7a0..d201f5d3876b 100644
 +	depends on HARDLOCKUP_DETECTOR
 +	depends on HAVE_HARDLOCKUP_DETECTOR_PERF && HAVE_HARDLOCKUP_DETECTOR_BUDDY
 +	depends on !HAVE_NMI_WATCHDOG
-+	default n
  	help
  	  Say Y here to prefer the buddy hardlockup detector over the perf one.
  
-@@ -1071,39 +1094,27 @@ config HARDLOCKUP_DETECTOR_PREFER_BUDDY
+@@ -1071,39 +1093,27 @@ config HARDLOCKUP_DETECTOR_PREFER_BUDDY
  
  config HARDLOCKUP_DETECTOR_PERF
  	bool
diff -purN watchdog-buddy-hardlockup-detector-config-cleanup-v1-iter1-reference/0003-watchdog-hardlockup-Declare-arch_touch_nmi_watchdog-.patch watchdog-buddy-hardlockup-detector-config-cleanup-v2-iter1/0003-watchdog-hardlockup-Declare-arch_touch_nmi_watchdog-.patch
--- watchdog-buddy-hardlockup-detector-config-cleanup-v1-iter1-reference/0003-watchdog-hardlockup-Declare-arch_touch_nmi_watchdog-.patch	2023-06-16 16:42:07.749941492 +0200
+++ watchdog-buddy-hardlockup-detector-config-cleanup-v2-iter1/0003-watchdog-hardlockup-Declare-arch_touch_nmi_watchdog-.patch	2023-06-16 16:28:53.594682369 +0200
@@ -1,16 +1,17 @@
-From b132b032466f5c07bc31bb1c22ed6db32871d725 Mon Sep 17 00:00:00 2001
+From f4b7044dd7847ae8d12535c464ea4bd0568b5456 Mon Sep 17 00:00:00 2001
 From: Petr Mladek <pmladek@suse.com>
 Date: Fri, 2 Jun 2023 16:38:43 +0200
-Subject: [PATCH 3/6] watchdog/hardlockup: Declare arch_touch_nmi_watchdog()
+Subject: [PATCH v2 3/6] watchdog/hardlockup: Declare arch_touch_nmi_watchdog()
  only in linux/nmi.h
 
 arch_touch_nmi_watchdog() needs a different implementation for various
 hardlockup detector implementations. And it does nothing when
-any hardlockup detector is not build at all.
+any hardlockup detector is not built at all.
 
-arch_touch_nmi_watchdog() has to be declared in linux/nmi.h. It is done
-directly in this header file for the perf and buddy detectors. And it
-is done in the included asm/linux.h for arch specific detectors.
+arch_touch_nmi_watchdog() is declared via linux/nmi.h. And it must be
+defined as an empty function when there is no hardlockup detector.
+It is done directly in this header file for the perf and buddy detectors.
+And it is done in the included asm/linux.h for arch specific detectors.
 
 The reason probably is that the arch specific variants build the code
 using another conditions. For example, powerpc64/sparc64 builds the code
@@ -19,13 +20,14 @@ when CONFIG_PPC_WATCHDOG is enabled.
 Another reason might be that these architectures define more functions
 in asm/nmi.h anyway.
 
-However the generic code actually knows the information. The config
-variables HAVE_NMI_WATCHDOG and HAVE_HARDLOCKUP_DETECTOR_ARCH are used
-to decide whether to build the buddy detector.
-
-In particular, CONFIG_HARDLOCKUP_DETECTOR is set only when a generic
-or arch-specific hardlockup detector is built. The only exception
-is sparc64 which ignores the global HARDLOCKUP_DETECTOR switch.
+However the generic code actually knows when the function will be
+implemented. It happens when some full featured or the sparc64-specific
+hardlockup detector is built.
+
+In particular, CONFIG_HARDLOCKUP_DETECTOR can be enabled only when
+a generic or arch-specific full featured hardlockup detector is available.
+The only exception is sparc64 which can be built even when the global
+HARDLOCKUP_DETECTOR switch is disabled.
 
 The information about sparc64 is a bit complicated. The hardlockup
 detector is built there when CONFIG_HAVE_NMI_WATCHDOG is set and
@@ -48,6 +50,7 @@ The motivation is:
 The change should not change the existing behavior.
 
 Signed-off-by: Petr Mladek <pmladek@suse.com>
+Reviewed-by: Douglas Anderson <dianders@chromium.org>
 ---
  arch/powerpc/include/asm/nmi.h |  2 --
  arch/sparc/include/asm/nmi.h   |  1 -
diff -purN watchdog-buddy-hardlockup-detector-config-cleanup-v1-iter1-reference/0004-watchdog-hardlockup-Make-HAVE_NMI_WATCHDOG-sparc64-s.patch watchdog-buddy-hardlockup-detector-config-cleanup-v2-iter1/0004-watchdog-hardlockup-Make-HAVE_NMI_WATCHDOG-sparc64-s.patch
--- watchdog-buddy-hardlockup-detector-config-cleanup-v1-iter1-reference/0004-watchdog-hardlockup-Make-HAVE_NMI_WATCHDOG-sparc64-s.patch	2023-06-16 16:42:07.757941606 +0200
+++ watchdog-buddy-hardlockup-detector-config-cleanup-v2-iter1/0004-watchdog-hardlockup-Make-HAVE_NMI_WATCHDOG-sparc64-s.patch	2023-06-16 16:28:53.598682426 +0200
@@ -1,58 +1,95 @@
-From b898a6715dd01a5e3a6a404d70e12dcb2d9d7d0d Mon Sep 17 00:00:00 2001
+From 89632da8754cb2a70a48b357c2d5f099b121b88a Mon Sep 17 00:00:00 2001
 From: Petr Mladek <pmladek@suse.com>
-Date: Tue, 6 Jun 2023 17:19:08 +0200
-Subject: [PATCH 4/6] watchdog/hardlockup:  Make HAVE_NMI_WATCHDOG
+Date: Fri, 16 Jun 2023 15:43:34 +0200
+Subject: [PATCH v2 4/6] watchdog/hardlockup:  Make HAVE_NMI_WATCHDOG
  sparc64-specific
 
-watchdog/hardlockup: Enable HAVE_NMI_WATCHDOG only on sparc64
+There are several hardlockup detector implementations and several Kconfig
+values which allow selection and build of the preferred one.
 
-HAVE_NMI_WATCHDOG is always enabled when SPARC64 is enabled. The sparc64
-implementation is special. It does not support the generic hardlockup
-related Kconfig values, command line parameters, and sysctl interface.
-Instead it is enabled/disabled by the top-level watchdog interface
-that is common for both softlockup and hardlockup detectors.
-
-As a result, sparc64 needs special treating in Kconfig and source
-files. The checks are a bit complicated because HAVE_NMI_WATCHDOG is
-automatically set when HAVE_HARDLOCKUP_DETECTOR_ARCH is set.
-But HAVE_HARDLOCKUP_DETECTOR_ARCH is set when the arch specific
-implementation uses the generic hardlockup detector related
-Kconfig variables, command line parameters, and sysctl interface.
-
-The motivation probably was to avoid changes in the code when
-the powerpc64-specific watchdog introduced HAVE_HARDLOCKUP_DETECTOR_ARCH.
-It probably allowed to re-use some existing checks for HAVE_NMI_WATCHDOG.
-
-But it actually made things pretty complicated. For example,
-the following check was needed in HARDLOCKUP_DETECTOR config variable:
-
-   depends on ((HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY) && !HAVE_NMI_WATCHDOG) || HAVE_HARDLOCKUP_DETECTOR_ARCH
-
-The inverted logic makes things easier:
-
-  + HAVE_NMI_WATCHDOG is used only on sparc64. It is clear when
-    the sparc64 specific watchdog is used.
-
-  + HAVE_HARDLOCKUP_DETECTOR_ARCH is basically compatible with
-    the generic watchdogs. As a result, the common code
-    is marked by ifdef CONFIG_HARDLOCKUP_DETECTOR.
-
-As a result:
-
-  + Some conditions are easier.
-
-  + Some conditions use HAVE_HARDLOCKUP_DETECTOR_ARCH instead of
-    HAVE_NMI_WATCHDOG.
+CONFIG_HARDLOCKUP_DETECTOR was introduced by the commit 23637d477c1f53acb
+("lockup_detector: Introduce CONFIG_HARDLOCKUP_DETECTOR") in v2.6.36.
+It was a preparation step for introducing the new generic perf hardlockup
+detector.
+
+The existing arch-specific variants did not support the to-be-created
+generic build configurations, sysctl interface, etc. This distinction
+was made explicit by the commit 4a7863cc2eb5f98 ("x86, nmi_watchdog:
+Remove ARCH_HAS_NMI_WATCHDOG and rely on CONFIG_HARDLOCKUP_DETECTOR")
+in v2.6.38.
+
+CONFIG_HAVE_NMI_WATCHDOG was introduced by the commit d314d74c695f967e105
+("nmi watchdog: do not use cpp symbol in Kconfig") in v3.4-rc1. It replaced
+the above mentioned ARCH_HAS_NMI_WATCHDOG. At that time, it was still used
+by three architectures, namely blackfin, mn10300, and sparc.
+
+The support for blackfin and mn10300 architectures has been completely
+dropped some time ago. And sparc is the only architecture with the historic
+NMI watchdog at the moment.
+
+And the old sparc implementation is really special. It is always built on
+sparc64. It used to be always enabled until the commit 7a5c8b57cec93196b
+("sparc: implement watchdog_nmi_enable and watchdog_nmi_disable") added
+in v4.10-rc1.
+
+There are only few locations where the sparc64 NMI watchdog interacts
+with the generic hardlockup detectors code:
+
+  + implements arch_touch_nmi_watchdog() which is called from the generic
+    touch_nmi_watchdog()
+
+  + implements watchdog_hardlockup_enable()/disable() to support
+    /proc/sys/kernel/nmi_watchdog
+
+  + is always preferred over other generic watchdogs, see
+    CONFIG_HARDLOCKUP_DETECTOR
+
+  + includes asm/nmi.h into linux/nmi.h because some sparc-specific
+    functions are needed in sparc-specific code which includes
+    only linux/nmi.h.
+
+The situation became more complicated after the commit 05a4a95279311c3
+("kernel/watchdog: split up config options") and commit 2104180a53698df5
+("powerpc/64s: implement arch-specific hardlockup watchdog") in v4.13-rc1.
+They introduced HAVE_HARDLOCKUP_DETECTOR_ARCH. It was used for powerpc
+specific hardlockup detector. It was compatible with the perf one
+regarding the general boot, sysctl, and programming interfaces.
+
+HAVE_HARDLOCKUP_DETECTOR_ARCH was defined as a superset of
+HAVE_NMI_WATCHDOG. It made some sense because all arch-specific
+detectors had some common requirements, namely:
+
+  + implemented arch_touch_nmi_watchdog()
+  + included asm/nmi.h into linux/nmi.h
+  + defined the default value for /proc/sys/kernel/nmi_watchdog
+
+But it actually has made things pretty complicated when the generic
+buddy hardlockup detector was added. Before the generic perf detector
+was newer supported together with an arch-specific one. But the buddy
+detector could work on any SMP system. It means that an architecture
+could support both the arch-specific and buddy detector.
+
+As a result, there are few tricky dependencies. For example,
+CONFIG_HARDLOCKUP_DETECTOR depends on:
+
+  ((HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY) && !HAVE_NMI_WATCHDOG) || HAVE_HARDLOCKUP_DETECTOR_ARCH
+
+The problem is that the very special sparc implementation is defined as:
+
+  HAVE_NMI_WATCHDOG && !HAVE_HARDLOCKUP_DETECTOR_ARCH
+
+Another problem is that the meaning of HAVE_NMI_WATCHDOG is far from clear
+without reading understanding the history.
+
+Make the logic less tricky and more self-explanatory by making
+HAVE_NMI_WATCHDOG specific for the sparc64 implementation. And rename it to
+HAVE_HARDLOCKUP_DETECTOR_SPARC64.
 
 Note that HARDLOCKUP_DETECTOR_PREFER_BUDDY, HARDLOCKUP_DETECTOR_PERF,
-and HARDLOCKUP_DETECTOR_BUDDY might depend only on
+and HARDLOCKUP_DETECTOR_BUDDY may conflict only with
 HAVE_HARDLOCKUP_DETECTOR_ARCH. They depend on HARDLOCKUP_DETECTOR
 and it is not longer enabled when HAVE_NMI_WATCHDOG is set.
 
-Note that asm/nmi.h still has to be included for all arch-specific
-watchdogs. It declares more functions that are used in another
-arch specific code which includes only linux/nmi.h.
-
 Signed-off-by: Petr Mladek <pmladek@suse.com>
 
 watchdog/sparc64: Rename HAVE_NMI_WATCHDOG to HAVE_HARDLOCKUP_WATCHDOG_SPARC64
@@ -74,19 +111,19 @@ from arch/Kconfig to arch/sparc/Kconfig.
 
 Signed-off-by: Petr Mladek <pmladek@suse.com>
 ---
- arch/Kconfig             | 17 -----------------
+ arch/Kconfig             | 18 ------------------
  arch/sparc/Kconfig       |  2 +-
- arch/sparc/Kconfig.debug | 12 ++++++++++++
+ arch/sparc/Kconfig.debug |  9 +++++++++
  include/linux/nmi.h      |  5 ++---
  kernel/watchdog.c        |  2 +-
  lib/Kconfig.debug        | 15 +++++----------
- 6 files changed, 21 insertions(+), 32 deletions(-)
+ 6 files changed, 18 insertions(+), 33 deletions(-)
 
 diff --git a/arch/Kconfig b/arch/Kconfig
-index 13c6e596cf9e..6517e5477459 100644
+index 77e5af5fda3f..6517e5477459 100644
 --- a/arch/Kconfig
 +++ b/arch/Kconfig
-@@ -400,22 +400,8 @@ config HAVE_HARDLOCKUP_DETECTOR_PERF
+@@ -400,23 +400,8 @@ config HAVE_HARDLOCKUP_DETECTOR_PERF
  	  The arch chooses to use the generic perf-NMI-based hardlockup
  	  detector. Must define HAVE_PERF_EVENTS_NMI.
  
@@ -95,13 +132,14 @@ index 13c6e596cf9e..6517e5477459 100644
 -	bool
 -	help
 -	  The arch provides its own hardlockup detector implementation instead
--	  of the generic perf one.
+-	  of the generic ones.
 -
 -	  Sparc64 defines this variable without HAVE_HARDLOCKUP_DETECTOR_ARCH.
--	  It does _not_ use the command line parameters and sysctl interface
--	  used by generic hardlockup detectors. Instead it is enabled/disabled
--	  by the top-level watchdog interface that is common for both softlockup
--	  and hardlockup detectors.
+-	  It is the last arch-specific implementation which was developed before
+-	  adding the common infrastructure for handling hardlockup detectors.
+-	  It is always built. It does _not_ use the common command line
+-	  parameters and sysctl interface, except for
+-	  /proc/sys/kernel/nmi_watchdog.
 -
  config HAVE_HARDLOCKUP_DETECTOR_ARCH
  	bool
@@ -109,7 +147,7 @@ index 13c6e596cf9e..6517e5477459 100644
  	help
  	  The arch provides its own hardlockup detector implementation instead
  	  of the generic ones.
-@@ -423,9 +409,6 @@ config HAVE_HARDLOCKUP_DETECTOR_ARCH
+@@ -424,9 +409,6 @@ config HAVE_HARDLOCKUP_DETECTOR_ARCH
  	  It uses the same command line parameters, and sysctl interface,
  	  as the generic hardlockup detectors.
  
@@ -133,10 +171,10 @@ index 8535e19062f6..7297f69635cb 100644
  	select HAVE_EBPF_JIT if SPARC64
  	select HAVE_DEBUG_BUGVERBOSE
 diff --git a/arch/sparc/Kconfig.debug b/arch/sparc/Kconfig.debug
-index 6b2bec1888b3..b6695303b8d4 100644
+index 6b2bec1888b3..4903b6847e43 100644
 --- a/arch/sparc/Kconfig.debug
 +++ b/arch/sparc/Kconfig.debug
-@@ -14,3 +14,15 @@ config FRAME_POINTER
+@@ -14,3 +14,12 @@ config FRAME_POINTER
  	bool
  	depends on MCOUNT
  	default y
@@ -145,13 +183,10 @@ index 6b2bec1888b3..b6695303b8d4 100644
 +	depends on HAVE_NMI
 +	bool
 +	help
-+	  Sparc64 provides its own hardlockup detector implementation instead
-+	  of the generic perf one.
-+
-+	  It does _not_ use the command line parameters and sysctl interface
-+	  used by generic hardlockup detectors. Instead it is enabled/disabled
-+	  by the top-level watchdog interface that is common for both softlockup
-+	  and hardlockup detectors.
++	  Sparc64 hardlockup detector is the last one developed before adding
++	  the common infrastructure for handling hardlockup detectors. It is
++	  always built. It does _not_ use the common command line parameters
++	  and sysctl interface, except for /proc/sys/kernel/nmi_watchdog.
 diff --git a/include/linux/nmi.h b/include/linux/nmi.h
 index b9e816bde14a..7ee6c35d1f05 100644
 --- a/include/linux/nmi.h
@@ -189,7 +224,7 @@ index 437c198933cf..babd2f3c8b72 100644
  #else
  # define WATCHDOG_HARDLOCKUP_DEFAULT	0
 diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
-index d201f5d3876b..2d8d8ce7c2d7 100644
+index a0b0c4decb89..e94664339e28 100644
 --- a/lib/Kconfig.debug
 +++ b/lib/Kconfig.debug
 @@ -1050,15 +1050,10 @@ config HAVE_HARDLOCKUP_DETECTOR_BUDDY
@@ -216,10 +251,10 @@ index d201f5d3876b..2d8d8ce7c2d7 100644
  	depends on HAVE_HARDLOCKUP_DETECTOR_PERF && HAVE_HARDLOCKUP_DETECTOR_BUDDY
 -	depends on !HAVE_NMI_WATCHDOG
 +	depends on !HAVE_HARLOCKUP_DETECTOR_ARCH
- 	default n
  	help
  	  Say Y here to prefer the buddy hardlockup detector over the perf one.
-@@ -1096,7 +1091,7 @@ config HARDLOCKUP_DETECTOR_PERF
+ 
+@@ -1095,7 +1090,7 @@ config HARDLOCKUP_DETECTOR_PERF
  	bool
  	depends on HARDLOCKUP_DETECTOR
  	depends on HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_PREFER_BUDDY
@@ -228,7 +263,7 @@ index d201f5d3876b..2d8d8ce7c2d7 100644
  	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
  
  config HARDLOCKUP_DETECTOR_BUDDY
-@@ -1104,7 +1099,7 @@ config HARDLOCKUP_DETECTOR_BUDDY
+@@ -1103,7 +1098,7 @@ config HARDLOCKUP_DETECTOR_BUDDY
  	depends on HARDLOCKUP_DETECTOR
  	depends on HAVE_HARDLOCKUP_DETECTOR_BUDDY
  	depends on !HAVE_HARDLOCKUP_DETECTOR_PERF || HARDLOCKUP_DETECTOR_PREFER_BUDDY
diff -purN watchdog-buddy-hardlockup-detector-config-cleanup-v1-iter1-reference/0005-watchdog-sparc64-Define-HARDLOCKUP_DETECTOR_SPARC64.patch watchdog-buddy-hardlockup-detector-config-cleanup-v2-iter1/0005-watchdog-sparc64-Define-HARDLOCKUP_DETECTOR_SPARC64.patch
--- watchdog-buddy-hardlockup-detector-config-cleanup-v1-iter1-reference/0005-watchdog-sparc64-Define-HARDLOCKUP_DETECTOR_SPARC64.patch	2023-06-16 16:42:07.761941662 +0200
+++ watchdog-buddy-hardlockup-detector-config-cleanup-v2-iter1/0005-watchdog-sparc64-Define-HARDLOCKUP_DETECTOR_SPARC64.patch	2023-06-16 16:28:53.598682426 +0200
@@ -1,7 +1,7 @@
-From 39b335cbe5fff566d41a35b1211f92a5d1a56575 Mon Sep 17 00:00:00 2001
+From 1426aca29d60fcaa06c8ca125f236beca28f997a Mon Sep 17 00:00:00 2001
 From: Petr Mladek <pmladek@suse.com>
-Date: Wed, 7 Jun 2023 14:59:58 +0200
-Subject: [PATCH 5/6] watchdog/sparc64: Define HARDLOCKUP_DETECTOR_SPARC64
+Date: Fri, 16 Jun 2023 15:45:49 +0200
+Subject: [PATCH v2 5/6] watchdog/sparc64: Define HARDLOCKUP_DETECTOR_SPARC64
 
 The HAVE_ prefix means that the code could be enabled. Add another
 variable for HAVE_HARDLOCKUP_DETECTOR_SPARC64 without this prefix.
@@ -24,18 +24,19 @@ CONFIG_HAVE_HARDLOCKUP_DETECTOR_SPARC64=
 CONFIG_HARDLOCKUP_DETECTOR_SPARC64=y
 
 Signed-off-by: Petr Mladek <pmladek@suse.com>
+Reviewed-by: Douglas Anderson <dianders@chromium.org>
 ---
- arch/sparc/Kconfig.debug | 10 +++++++++-
- include/linux/nmi.h      |  4 ++--
- kernel/watchdog.c        |  2 +-
- lib/Kconfig.debug        |  2 +-
- 4 files changed, 13 insertions(+), 5 deletions(-)
+ arch/sparc/Kconfig.debug | 7 ++++++-
+ include/linux/nmi.h      | 4 ++--
+ kernel/watchdog.c        | 2 +-
+ lib/Kconfig.debug        | 2 +-
+ 4 files changed, 10 insertions(+), 5 deletions(-)
 
 diff --git a/arch/sparc/Kconfig.debug b/arch/sparc/Kconfig.debug
-index b6695303b8d4..0bb95b0aacf4 100644
+index 4903b6847e43..37e003665de6 100644
 --- a/arch/sparc/Kconfig.debug
 +++ b/arch/sparc/Kconfig.debug
-@@ -16,8 +16,9 @@ config FRAME_POINTER
+@@ -16,10 +16,15 @@ config FRAME_POINTER
  	default y
  
  config HAVE_HARDLOCKUP_DETECTOR_SPARC64
@@ -44,19 +45,14 @@ index b6695303b8d4..0bb95b0aacf4 100644
 +	depends on HAVE_NMI
 +	select HARDLOCKUP_DETECTOR_SPARC64
  	help
- 	  Sparc64 provides its own hardlockup detector implementation instead
- 	  of the generic perf one.
-@@ -26,3 +27,10 @@ config HAVE_HARDLOCKUP_DETECTOR_SPARC64
- 	  used by generic hardlockup detectors. Instead it is enabled/disabled
- 	  by the top-level watchdog interface that is common for both softlockup
- 	  and hardlockup detectors.
+ 	  Sparc64 hardlockup detector is the last one developed before adding
+ 	  the common infrastructure for handling hardlockup detectors. It is
+ 	  always built. It does _not_ use the common command line parameters
+ 	  and sysctl interface, except for /proc/sys/kernel/nmi_watchdog.
 +
 +config HARDLOCKUP_DETECTOR_SPARC64
 +	bool
 +	depends on HAVE_HARDLOCKUP_DETECTOR_SPARC64
-+
-+	help
-+	  The custom hardlockup detector is always built when possible.
 diff --git a/include/linux/nmi.h b/include/linux/nmi.h
 index 7ee6c35d1f05..515d6724f469 100644
 --- a/include/linux/nmi.h
@@ -93,7 +89,7 @@ index babd2f3c8b72..a2154e753cb4 100644
  #else
  # define WATCHDOG_HARDLOCKUP_DEFAULT	0
 diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
-index 2d8d8ce7c2d7..116904e65d9f 100644
+index e94664339e28..f285e9cf967a 100644
 --- a/lib/Kconfig.debug
 +++ b/lib/Kconfig.debug
 @@ -1052,7 +1052,7 @@ config HAVE_HARDLOCKUP_DETECTOR_BUDDY
diff -purN watchdog-buddy-hardlockup-detector-config-cleanup-v1-iter1-reference/0006-watchdog-hardlockup-Define-HARDLOCKUP_DETECTOR_ARCH.patch watchdog-buddy-hardlockup-detector-config-cleanup-v2-iter1/0006-watchdog-hardlockup-Define-HARDLOCKUP_DETECTOR_ARCH.patch
--- watchdog-buddy-hardlockup-detector-config-cleanup-v1-iter1-reference/0006-watchdog-hardlockup-Define-HARDLOCKUP_DETECTOR_ARCH.patch	2023-06-16 16:42:07.769941775 +0200
+++ watchdog-buddy-hardlockup-detector-config-cleanup-v2-iter1/0006-watchdog-hardlockup-Define-HARDLOCKUP_DETECTOR_ARCH.patch	2023-06-16 16:28:53.598682426 +0200
@@ -1,7 +1,7 @@
-From 0456ed568d98ba5bba8148e4f60d769e3c5a6c7a Mon Sep 17 00:00:00 2001
+From bcf4dfab5a64ee691eb5154b1361ed59610c9387 Mon Sep 17 00:00:00 2001
 From: Petr Mladek <pmladek@suse.com>
 Date: Tue, 6 Jun 2023 09:32:05 +0200
-Subject: [PATCH 6/6] watchdog/hardlockup: Define HARDLOCKUP_DETECTOR_ARCH
+Subject: [PATCH v2 6/6] watchdog/hardlockup: Define HARDLOCKUP_DETECTOR_ARCH
 
 The HAVE_ prefix means that the code could be enabled. Add another
 variable for HAVE_HARDLOCKUP_DETECTOR_ARCH without this prefix.
@@ -15,6 +15,7 @@ As a result HAVE_HARDLOCKUP_DETECTOR_PER
 on arm, x86, powerpc architectures.
 
 Signed-off-by: Petr Mladek <pmladek@suse.com>
+Reviewed-by: Douglas Anderson <dianders@chromium.org>
 ---
  arch/powerpc/Kconfig | 5 ++---
  include/linux/nmi.h  | 2 +-
@@ -58,7 +59,7 @@ index 515d6724f469..ec808ebd36ba 100644
  #endif
  
 diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
-index 116904e65d9f..97853ca54dc7 100644
+index f285e9cf967a..2c4bb72e72ad 100644
 --- a/lib/Kconfig.debug
 +++ b/lib/Kconfig.debug
 @@ -1056,6 +1056,7 @@ config HARDLOCKUP_DETECTOR
@@ -69,7 +70,7 @@ index 116904e65d9f..97853ca54dc7 100644
  	select LOCKUP_DETECTOR
  
  	help
-@@ -1102,6 +1103,14 @@ config HARDLOCKUP_DETECTOR_BUDDY
+@@ -1101,6 +1102,14 @@ config HARDLOCKUP_DETECTOR_BUDDY
  	depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
  	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
  
@@ -78,8 +79,8 @@ index 116904e65d9f..97853ca54dc7 100644
 +	depends on HARDLOCKUP_DETECTOR
 +	depends on HAVE_HARDLOCKUP_DETECTOR_ARCH
 +	help
-+	  The arch-specific implementation of the hardlockup detector is
-+	  available.
++	  The arch-specific implementation of the hardlockup detector will
++	  be used.
 +
  #
  # Both the "perf" and "buddy" hardlockup detectors count hrtimer
