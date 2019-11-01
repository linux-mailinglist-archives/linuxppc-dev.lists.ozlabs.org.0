Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AFBEBDC4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 07:21:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474Bt50T4CzF3jQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 17:21:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=socionext.com (client-ip=210.131.2.76;
 helo=conuserg-09.nifty.com; envelope-from=yamada.masahiro@socionext.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="2YWbwrr4"; 
 dkim-atps=neutral
Received: from conuserg-09.nifty.com (conuserg-09.nifty.com [210.131.2.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474BlZ02W3zF6Wf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 17:16:09 +1100 (AEDT)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id xA16ELBe016348;
 Fri, 1 Nov 2019 15:14:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com xA16ELBe016348
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1572588866;
 bh=sejarmf1kWjQCUK13JqJxgF3yj4ZhJEUnONZYHI22+8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2YWbwrr4bSJ3T0pDPCSvJ5c3vXmKpyu2qmDdF2AhITLbtdnlC3EK7LfI6A7qE+c9w
 xUZdRx9h3KLmoEADzIi4tldQFoey7z8u8rxlYyfluT8J74g2r5tGemPMupzMHcTa4w
 Aj6KS/lDfRz8QGtVa3SAiPy+LHyO8DU6dDRQjWAzaRLR+bvnMvkzunkG2G1k5CCRwS
 lRXu7mN4R2W5SLOVe+bN0LQATb+FbTvyVgD8dFMvksH1KzxPHW7oMU90TCMvS03yrH
 eoIJpASdGZ7XU6GQRG6PvT4tyKSmUH+F8ogjI8E8PrB2VXjjCaVZUy0oOfr5FztlmG
 Z4h3le7QzDceQ==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 2/3] ARM: decompressor: simplify libfdt builds
Date: Fri,  1 Nov 2019 15:14:10 +0900
Message-Id: <20191101061411.16988-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191101061411.16988-1-yamada.masahiro@socionext.com>
References: <20191101061411.16988-1-yamada.masahiro@socionext.com>
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
Cc: linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Copying source files during the build time may not end up with
as clean code as you expect.

lib/fdt*.c simply wrap scripts/dtc/libfdt/fdt*.c, and it works
nicely. Let's follow that approach for the arm decompressor, too.

Add four wrappers, arch/arm/boot/compressed/fdt*.c and remove the
Makefile messes.

Another nice thing is we no longer need to maintain the separate
libfdt_env.h since we can include <linux/libfdt_env.h>, and the
diff stat also looks nice.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/boot/compressed/.gitignore     |  9 -------
 arch/arm/boot/compressed/Makefile       | 33 +++++++------------------
 arch/arm/boot/compressed/atags_to_fdt.c |  1 +
 arch/arm/boot/compressed/fdt.c          |  2 ++
 arch/arm/boot/compressed/fdt_ro.c       |  2 ++
 arch/arm/boot/compressed/fdt_rw.c       |  2 ++
 arch/arm/boot/compressed/fdt_wip.c      |  2 ++
 arch/arm/boot/compressed/libfdt_env.h   | 22 -----------------
 8 files changed, 18 insertions(+), 55 deletions(-)
 create mode 100644 arch/arm/boot/compressed/fdt.c
 create mode 100644 arch/arm/boot/compressed/fdt_ro.c
 create mode 100644 arch/arm/boot/compressed/fdt_rw.c
 create mode 100644 arch/arm/boot/compressed/fdt_wip.c
 delete mode 100644 arch/arm/boot/compressed/libfdt_env.h

diff --git a/arch/arm/boot/compressed/.gitignore b/arch/arm/boot/compressed/.gitignore
index 86b2f5d28240..2fdb4885846b 100644
--- a/arch/arm/boot/compressed/.gitignore
+++ b/arch/arm/boot/compressed/.gitignore
@@ -6,12 +6,3 @@ hyp-stub.S
 piggy_data
 vmlinux
 vmlinux.lds
-
-# borrowed libfdt files
-fdt.c
-fdt.h
-fdt_ro.c
-fdt_rw.c
-fdt_wip.c
-libfdt.h
-libfdt_internal.h
diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index 9219389bbe61..a0d645c66980 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -76,29 +76,23 @@ compress-$(CONFIG_KERNEL_LZMA) = lzma
 compress-$(CONFIG_KERNEL_XZ)   = xzkern
 compress-$(CONFIG_KERNEL_LZ4)  = lz4
 
-# Borrowed libfdt files for the ATAG compatibility mode
-
-libfdt		:= fdt_rw.c fdt_ro.c fdt_wip.c fdt.c
-libfdt_hdrs	:= fdt.h libfdt.h libfdt_internal.h
-
-libfdt_objs	:= $(addsuffix .o, $(basename $(libfdt)))
-
-$(addprefix $(obj)/,$(libfdt) $(libfdt_hdrs)): $(obj)/%: $(srctree)/scripts/dtc/libfdt/%
-	$(call cmd,shipped)
+ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
+libfdt_objs = fdt_rw.o fdt_ro.o fdt_wip.o fdt.o atags_to_fdt.o
 
-$(addprefix $(obj)/,$(libfdt_objs) atags_to_fdt.o): \
-	$(addprefix $(obj)/,$(libfdt_hdrs))
+OBJS	+= $(libfdt_objs)
 
-ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
-OBJS	+= $(libfdt_objs) atags_to_fdt.o
+# -fstack-protector-strong triggers protection checks in this code,
+# but it is being used too early to link to meaningful stack_chk logic.
+nossp_flags := $(call cc-option, -fno-stack-protector)
+$(foreach o, $(libfdt_objs), \
+	$(eval CFLAGS_$(o) := -I $(srctree)/scripts/dtc/libfdt) $(nossp_flags))
 endif
 
 targets       := vmlinux vmlinux.lds piggy_data piggy.o \
 		 lib1funcs.o ashldi3.o bswapsdi2.o \
 		 head.o $(OBJS)
 
-clean-files += piggy_data lib1funcs.S ashldi3.S bswapsdi2.S \
-		$(libfdt) $(libfdt_hdrs) hyp-stub.S
+clean-files += piggy_data lib1funcs.S ashldi3.S bswapsdi2.S hyp-stub.S
 
 KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
 KBUILD_CFLAGS += $(DISABLE_ARM_SSP_PER_TASK_PLUGIN)
@@ -108,15 +102,6 @@ ORIG_CFLAGS := $(KBUILD_CFLAGS)
 KBUILD_CFLAGS = $(subst -pg, , $(ORIG_CFLAGS))
 endif
 
-# -fstack-protector-strong triggers protection checks in this code,
-# but it is being used too early to link to meaningful stack_chk logic.
-nossp_flags := $(call cc-option, -fno-stack-protector)
-CFLAGS_atags_to_fdt.o := $(nossp_flags)
-CFLAGS_fdt.o := $(nossp_flags)
-CFLAGS_fdt_ro.o := $(nossp_flags)
-CFLAGS_fdt_rw.o := $(nossp_flags)
-CFLAGS_fdt_wip.o := $(nossp_flags)
-
 ccflags-y := -fpic $(call cc-option,-mno-single-pic-base,) -fno-builtin -I$(obj)
 asflags-y := -DZIMAGE
 
diff --git a/arch/arm/boot/compressed/atags_to_fdt.c b/arch/arm/boot/compressed/atags_to_fdt.c
index 330cd3c2eae5..53a60ba066a1 100644
--- a/arch/arm/boot/compressed/atags_to_fdt.c
+++ b/arch/arm/boot/compressed/atags_to_fdt.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/libfdt_env.h>
 #include <asm/setup.h>
 #include <libfdt.h>
 
diff --git a/arch/arm/boot/compressed/fdt.c b/arch/arm/boot/compressed/fdt.c
new file mode 100644
index 000000000000..f8ea7a201ab1
--- /dev/null
+++ b/arch/arm/boot/compressed/fdt.c
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "../../../../lib/fdt.c"
diff --git a/arch/arm/boot/compressed/fdt_ro.c b/arch/arm/boot/compressed/fdt_ro.c
new file mode 100644
index 000000000000..93970a4ad5ae
--- /dev/null
+++ b/arch/arm/boot/compressed/fdt_ro.c
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "../../../../lib/fdt_ro.c"
diff --git a/arch/arm/boot/compressed/fdt_rw.c b/arch/arm/boot/compressed/fdt_rw.c
new file mode 100644
index 000000000000..f7c6b8b7e01c
--- /dev/null
+++ b/arch/arm/boot/compressed/fdt_rw.c
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "../../../../lib/fdt_rw.c"
diff --git a/arch/arm/boot/compressed/fdt_wip.c b/arch/arm/boot/compressed/fdt_wip.c
new file mode 100644
index 000000000000..048d2c7a088d
--- /dev/null
+++ b/arch/arm/boot/compressed/fdt_wip.c
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "../../../../lib/fdt_wip.c"
diff --git a/arch/arm/boot/compressed/libfdt_env.h b/arch/arm/boot/compressed/libfdt_env.h
deleted file mode 100644
index b36c0289a308..000000000000
--- a/arch/arm/boot/compressed/libfdt_env.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ARM_LIBFDT_ENV_H
-#define _ARM_LIBFDT_ENV_H
-
-#include <linux/types.h>
-#include <linux/string.h>
-#include <asm/byteorder.h>
-
-#define INT_MAX			((int)(~0U>>1))
-
-typedef __be16 fdt16_t;
-typedef __be32 fdt32_t;
-typedef __be64 fdt64_t;
-
-#define fdt16_to_cpu(x)		be16_to_cpu(x)
-#define cpu_to_fdt16(x)		cpu_to_be16(x)
-#define fdt32_to_cpu(x)		be32_to_cpu(x)
-#define cpu_to_fdt32(x)		cpu_to_be32(x)
-#define fdt64_to_cpu(x)		be64_to_cpu(x)
-#define cpu_to_fdt64(x)		cpu_to_be64(x)
-
-#endif
-- 
2.17.1

