Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 694C8B9CC6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 08:53:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46b1WJ6JM2zDqcY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 16:53:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.78; helo=conuserg-11.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="M2KoWggI"; 
 dkim-atps=neutral
Received: from conuserg-11.nifty.com (conuserg-11.nifty.com [210.131.2.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46b1Sp60wwzDqBW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 16:51:06 +1000 (AEST)
Received: from grover.flets-west.jp (softbank126021098169.bbtec.net
 [126.21.98.169]) (authenticated)
 by conuserg-11.nifty.com with ESMTP id x8L6ntFu016571;
 Sat, 21 Sep 2019 15:49:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x8L6ntFu016571
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1569048596;
 bh=tas5o108IC96vrbiA6E2q4q/CHS7VyOE8X05kkRhjv4=;
 h=From:To:Cc:Subject:Date:From;
 b=M2KoWggIDxhTWdR3manNk4BIAW/gVcpoBEur+qmkgpTXa/tjxMVRqeozpFHJyp6Te
 J8DzbqMjb01sXCBY82J8SBNr1LD7x0TR3454MT8I1v6mYnxeTcaTz5dU2vcmeJHbY4
 qwz2TjETGlDjVXj+RilqsT7SEkCvznnDgJQY96qx98HDCWHNrNs55K9tlNncuzRQC2
 Ee+IXj0fCOlSQBN5NyiQ532f32Y9V6U+r66GtU9NL8TQlzhWZxofyfWIyOCSpiYmcf
 THXaC7U9m+af4Zs/d+BNpm2cIc8v8dE9FTCg+InBUVvpeyChZcwBetWZnZSISwaALC
 1HvO9uNtSVXhQ==
X-Nifty-SrcIP: [126.21.98.169]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: remove ar-option and KBUILD_ARFLAGS
Date: Sat, 21 Sep 2019 15:49:54 +0900
Message-Id: <20190921064954.11196-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, clang-built-linux@googlegroups.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 40df759e2b9e ("kbuild: Fix build with binutils <= 2.19")
introduced ar-option and KBUILD_ARFLAGS to cope with old binutils.

According to Documentation/process/changes.rst, the current minimal
supported version of binutils is 2.21 so you can assume the 'D' option
is always supported. Not only GNU ar but also llvm-ar supports it.

With the 'D' option hard-coded, there is no more user of ar-option
or KBUILD_ARFLAGS.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/kbuild/makefiles.rst | 5 -----
 Makefile                           | 4 ----
 arch/powerpc/boot/Makefile         | 2 +-
 scripts/Kbuild.include             | 5 -----
 scripts/Makefile.build             | 2 +-
 scripts/Makefile.lib               | 2 +-
 6 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 6ba9d5365ff3..b89c88168d6a 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -954,11 +954,6 @@ When kbuild executes, the following steps are followed (roughly):
 
 	From commandline LDFLAGS_MODULE shall be used (see kbuild.txt).
 
-    KBUILD_ARFLAGS   Options for $(AR) when creating archives
-
-	$(KBUILD_ARFLAGS) set by the top level Makefile to "D" (deterministic
-	mode) if this option is supported by $(AR).
-
     KBUILD_LDS
 
 	The linker script with full path. Assigned by the top-level Makefile.
diff --git a/Makefile b/Makefile
index 656a8c95789d..88b180b2cb64 100644
--- a/Makefile
+++ b/Makefile
@@ -498,7 +498,6 @@ export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE CFLAGS_UBSAN
 export KBUILD_AFLAGS AFLAGS_KERNEL AFLAGS_MODULE
 export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_LDFLAGS_MODULE
 export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL
-export KBUILD_ARFLAGS
 
 # Files to ignore in find ... statements
 
@@ -914,9 +913,6 @@ ifdef CONFIG_RETPOLINE
 KBUILD_CFLAGS += $(call cc-option,-fcf-protection=none)
 endif
 
-# use the deterministic mode of AR if available
-KBUILD_ARFLAGS := $(call ar-option,D)
-
 include scripts/Makefile.kasan
 include scripts/Makefile.extrawarn
 include scripts/Makefile.ubsan
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 6841bd52738b..dfbd7f22eef5 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -50,7 +50,7 @@ endif
 
 BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTCFLAGS) -nostdinc
 
-BOOTARFLAGS	:= -cr$(KBUILD_ARFLAGS)
+BOOTARFLAGS	:= -crD
 
 ifdef CONFIG_CC_IS_CLANG
 BOOTCFLAGS += $(CLANG_FLAGS)
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index e31fd6a8b2a3..956668239ef5 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -143,11 +143,6 @@ cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || e
 # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
 ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
 
-# ar-option
-# Usage: KBUILD_ARFLAGS := $(call ar-option,D)
-# Important: no spaces around options
-ar-option = $(call try-run, $(AR) rc$(1) "$$TMP",$(1),$(2))
-
 # ld-version
 # Note this is mainly for HJ Lu's 3 number binutil versions
 ld-version = $(shell $(LD) --version | $(srctree)/scripts/ld-version.sh)
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 611bda95ac5e..f199341f04eb 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -395,7 +395,7 @@ $(sort $(subdir-obj-y)): $(subdir-ym) ;
 ifdef builtin-target
 
 quiet_cmd_ar_builtin = AR      $@
-      cmd_ar_builtin = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS) $@ $(real-prereqs)
+      cmd_ar_builtin = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
 
 $(builtin-target): $(real-obj-y) FORCE
 	$(call if_changed,ar_builtin)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 23e524027740..15895fd4ef9f 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -238,7 +238,7 @@ quiet_cmd_ld = LD      $@
 # ---------------------------------------------------------------------------
 
 quiet_cmd_ar = AR      $@
-      cmd_ar = rm -f $@; $(AR) rcsTP$(KBUILD_ARFLAGS) $@ $(real-prereqs)
+      cmd_ar = rm -f $@; $(AR) cDPrsT $@ $(real-prereqs)
 
 # Objcopy
 # ---------------------------------------------------------------------------
-- 
2.17.1

