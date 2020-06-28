Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D669E20C546
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 03:54:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vYZb0rYlzDr4r
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 11:54:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.76;
 helo=conuserg-09.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=ahJ3uto2; 
 dkim-atps=neutral
Received: from conuserg-09.nifty.com (conuserg-09.nifty.com [210.131.2.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49vYXv47NJzDqwm
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 11:52:46 +1000 (AEST)
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net
 [126.90.202.47]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id 05S1oixP004742;
 Sun, 28 Jun 2020 10:50:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 05S1oixP004742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1593309045;
 bh=hkY77VUGXSYac7YbrIkUecBgq7WORaGieZmySJIL5UA=;
 h=From:To:Cc:Subject:Date:From;
 b=ahJ3uto2fhcnzsnIdLNU74S4vUyrlAQ4RsoPaFq9zt9MQ9rNbQLVQSS7jxeu5Q8si
 hZ34tVZRnliSC5lwB2mp+XhuUvw+20+ogpJbv2SrSVGwLunHSwliobc980NNYxgtNV
 7KoTg5pXNDlDue+Qw95dB65tKTenO+yJoYpKMjA+pouECDFfbNgi/Gl3GphBAEx2jt
 JIId1nbEsdrcgnMp1nLu2y0LwNlkZ7F/kd88h+53l3Wy2U7beVZi9x+0lCqdPuAiyn
 xq4P1+iR/S7vXT/ZdlGa6TQaScQErK5xw4F96tYA3UgjBxvfSj1llEDfgf/+ZBEQh9
 WQo1lz/K7CrLw==
X-Nifty-SrcIP: [126.90.202.47]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: introduce ccflags-remove-y and asflags-remove-y
Date: Sun, 28 Jun 2020 10:50:41 +0900
Message-Id: <20200628015041.1000002-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Michal Marek <michal.lkml@markovi.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Sami Tolvanen <samitolvanen@google.com>,
 Rich Felker <dalias@libc.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CFLAGS_REMOVE_<file>.o works per object, that is, there is no
convenient way to filter out flags for every object in a directory.

Add ccflags-remove-y and asflags-remove-y to make it easily.

Use ccflags-remove-y to clean up some Makefiles.

Suggested-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arm/boot/compressed/Makefile | 6 +-----
 arch/powerpc/xmon/Makefile        | 3 +--
 arch/sh/boot/compressed/Makefile  | 5 +----
 kernel/trace/Makefile             | 4 ++--
 lib/Makefile                      | 5 +----
 scripts/Makefile.lib              | 4 ++--
 6 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index 00602a6fba04..3d5691b23951 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -103,13 +103,9 @@ clean-files += piggy_data lib1funcs.S ashldi3.S bswapsdi2.S hyp-stub.S
 
 KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
 
-ifeq ($(CONFIG_FUNCTION_TRACER),y)
-ORIG_CFLAGS := $(KBUILD_CFLAGS)
-KBUILD_CFLAGS = $(subst -pg, , $(ORIG_CFLAGS))
-endif
-
 ccflags-y := -fpic $(call cc-option,-mno-single-pic-base,) -fno-builtin \
 	     -I$(obj) $(DISABLE_ARM_SSP_PER_TASK_PLUGIN)
+ccflags-remove-$(CONFIG_FUNCTION_TRACER) += -pg
 asflags-y := -DZIMAGE
 
 # Supply kernel BSS size to the decompressor via a linker symbol.
diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
index 89c76ca35640..55cbcdd88ac0 100644
--- a/arch/powerpc/xmon/Makefile
+++ b/arch/powerpc/xmon/Makefile
@@ -7,8 +7,7 @@ UBSAN_SANITIZE := n
 KASAN_SANITIZE := n
 
 # Disable ftrace for the entire directory
-ORIG_CFLAGS := $(KBUILD_CFLAGS)
-KBUILD_CFLAGS = $(subst $(CC_FLAGS_FTRACE),,$(ORIG_CFLAGS))
+ccflags-remove-y += $(CC_FLAGS_FTRACE)
 
 ifdef CONFIG_CC_IS_CLANG
 # clang stores addresses on the stack causing the frame size to blow
diff --git a/arch/sh/boot/compressed/Makefile b/arch/sh/boot/compressed/Makefile
index ad0e2403e56f..589d2d8a573d 100644
--- a/arch/sh/boot/compressed/Makefile
+++ b/arch/sh/boot/compressed/Makefile
@@ -28,10 +28,7 @@ IMAGE_OFFSET	:= $(shell /bin/bash -c 'printf "0x%08x" \
 			$(CONFIG_BOOT_LINK_OFFSET)]')
 endif
 
-ifeq ($(CONFIG_MCOUNT),y)
-ORIG_CFLAGS := $(KBUILD_CFLAGS)
-KBUILD_CFLAGS = $(subst -pg, , $(ORIG_CFLAGS))
-endif
+ccflags-remove-$(CONFIG_MCOUNT) += -pg
 
 LDFLAGS_vmlinux := --oformat $(ld-bfd) -Ttext $(IMAGE_OFFSET) -e startup \
 		   -T $(obj)/../../kernel/vmlinux.lds
diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index 6575bb0a0434..7492844a8b1b 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -2,9 +2,9 @@
 
 # Do not instrument the tracer itself:
 
+ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
+
 ifdef CONFIG_FUNCTION_TRACER
-ORIG_CFLAGS := $(KBUILD_CFLAGS)
-KBUILD_CFLAGS = $(subst $(CC_FLAGS_FTRACE),,$(ORIG_CFLAGS))
 
 # Avoid recursion due to instrumentation.
 KCSAN_SANITIZE := n
diff --git a/lib/Makefile b/lib/Makefile
index b1c42c10073b..b2ed4beddd68 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -3,10 +3,7 @@
 # Makefile for some libs needed in the kernel.
 #
 
-ifdef CONFIG_FUNCTION_TRACER
-ORIG_CFLAGS := $(KBUILD_CFLAGS)
-KBUILD_CFLAGS = $(subst $(CC_FLAGS_FTRACE),,$(ORIG_CFLAGS))
-endif
+ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
 
 # These files are disabled because they produce lots of non-interesting and/or
 # flaky coverage that is not a function of syscall inputs. For example,
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 99ac59c59826..5da420f13f9b 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -113,10 +113,10 @@ modfile_flags  = -DKBUILD_MODFILE=$(call stringify,$(modfile))
 
 orig_c_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) \
                  $(ccflags-y) $(CFLAGS_$(target-stem).o)
-_c_flags       = $(filter-out $(CFLAGS_REMOVE_$(target-stem).o), $(orig_c_flags))
+_c_flags       = $(filter-out $(ccflags-remove-y) $(CFLAGS_REMOVE_$(target-stem).o), $(orig_c_flags))
 orig_a_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_AFLAGS) \
                  $(asflags-y) $(AFLAGS_$(target-stem).o)
-_a_flags       = $(filter-out $(AFLAGS_REMOVE_$(target-stem).o), $(orig_a_flags))
+_a_flags       = $(filter-out $(asflags-remove-y) $(AFLAGS_REMOVE_$(target-stem).o), $(orig_a_flags))
 _cpp_flags     = $(KBUILD_CPPFLAGS) $(cppflags-y) $(CPPFLAGS_$(target-stem).lds)
 
 #
-- 
2.25.1

