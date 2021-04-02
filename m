Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E795C352BAF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 17:20:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBkJH6P4Tz3dCw
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 02:20:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBkFx4zTpz3btG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Apr 2021 02:18:13 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkFn3JGVz9v2m6;
 Fri,  2 Apr 2021 17:18:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id VqEXDMYbbW_D; Fri,  2 Apr 2021 17:18:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkFn2H9Mz9v2ls;
 Fri,  2 Apr 2021 17:18:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 327708BB7B;
 Fri,  2 Apr 2021 17:18:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RgJz95waFuwr; Fri,  2 Apr 2021 17:18:07 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BB1658BB79;
 Fri,  2 Apr 2021 17:18:06 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 8EFAC67989; Fri,  2 Apr 2021 15:18:06 +0000 (UTC)
Message-Id: <9cf63d0419bb51d91c5b1c83ce250dff1e7107cc.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 05/20] cmdline: Gives architectures opportunity to use
 generically defined boot cmdline manipulation
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Date: Fri,  2 Apr 2021 15:18:06 +0000 (UTC)
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
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 microblaze <monstr@monstr.eu>, linux-xtensa@linux-xtensa.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, nios2 <ley.foon.tan@intel.com>,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Most architectures have similar boot command line manipulation
options. This patchs adds the definition in init/Kconfig, gated by
CONFIG_HAVE_CMDLINE that the architectures can select to use them.

CONFIG_CMDLINE_EXTEND is understood differently by architectures.
For some of them it appends built-in CMDLINE to bootloader provided
line. For others it appends the bootloader provided CMDLINE to the
built-in one.
To avoid confusion, this commit brings to different options:
- CONFIG_CMDLINE_APPEND to append the built-in CMDLINE to the
bootloader line.
- CONFIG_CMDLINE_PREPEND to prepend the built-in CMDLINE in front of
the bootloader line.

For compatibility with existing architecture which uses CONFIG_OF, as
OF has already been converted to generic cmdline, we keep
CONFIG_CMDLINE_EXTEND as a synonym to CONFIG_CMDLINE_APPEND until
arm, powerpc, riscv and sh architectures have been converted.

A few differences are identified and will have to be taken
into account when converting the architecture to generic cmdline:
- riscv has CMDLINE_FALLBACK instead of CMDLINE_FROM_BOOTLOADER
- Some architectures are using CONFIG_CMDLINE_OVERRIDE or
CONFIG_CMDLINE_OVERWRITE instead of CONFIG_CMDLINE_FORCE.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3:
- Comments from Will.
- Remove CONFIG_CMDLINE_BOOL. Using CONFIG_CMDLINE != "" instead, like arm and powerpc.
- Changed EXTEND to APPEND. Keep EXTEND for backward compatibility.

v4:
- Added CMDLINE_PREPEND as a dependency for INITRAMFS_FORCE
- Removed the EXTEND || APPEND in cmdline.h, keep EXTEND as it
   will always exit and switch to APPEND in last patch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 init/Kconfig | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 usr/Kconfig  |  2 +-
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 5f5c776ef192..af0d84662cc2 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -117,6 +117,58 @@ config INIT_ENV_ARG_LIMIT
 	  Maximum of each of the number of arguments and environment
 	  variables passed to init from the kernel command line.
 
+config GENERIC_CMDLINE
+	bool
+
+config CMDLINE
+	string "Default kernel command string" if GENERIC_CMDLINE
+	default ""
+	help
+	  Defines a default kernel command string.
+	  If this string is not empty, additional choices are proposed
+	  below to determine how it will be used by the kernel.
+
+choice
+	prompt "Kernel command line type" if CMDLINE != ""
+	default CMDLINE_PREPEND if ARCH_WANT_CMDLINE_PREPEND_BY_DEFAULT
+	default CMDLINE_FROM_BOOTLOADER
+	depends on GENERIC_CMDLINE
+	help
+	  Determine how the default kernel arguments are combined with any
+	  arguments passed by the bootloader if any.
+
+config CMDLINE_FROM_BOOTLOADER
+	bool "Use bootloader kernel arguments if available"
+	help
+	  Uses the command-line options passed by the boot loader. If
+	  the boot loader doesn't provide any, the default kernel command
+	  string provided in CMDLINE will be used.
+
+config CMDLINE_APPEND
+	bool "Append to the bootloader kernel arguments"
+	help
+	  The default kernel command string will be appended to the
+	  command-line arguments provided by the bootloader.
+
+config CMDLINE_PREPEND
+	bool "Prepend to the bootloader kernel arguments"
+	help
+	  The default kernel command string will be prepended to the
+	  command-line arguments provided by the bootloader.
+
+config CMDLINE_FORCE
+	bool "Always use the default kernel command string"
+	help
+	  Always use the default kernel command string, ignoring any
+	  arguments provided by the bootloader.
+endchoice
+
+config CMDLINE_EXTEND
+	bool
+	default CMDLINE_APPEND
+	help
+	  To be removed once all architectures are converted to generic CMDLINE
+
 config COMPILE_TEST
 	bool "Compile also drivers which will not load"
 	depends on HAS_IOMEM
diff --git a/usr/Kconfig b/usr/Kconfig
index 8bbcf699fe3b..b397e6b114d1 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -24,7 +24,7 @@ config INITRAMFS_SOURCE
 
 config INITRAMFS_FORCE
 	bool "Ignore the initramfs passed by the bootloader"
-	depends on CMDLINE_EXTEND || CMDLINE_FORCE
+	depends on CMDLINE_PREPEND || CMDLINE_APPEND || CMDLINE_FORCE
 	help
 	  This option causes the kernel to ignore the initramfs image
 	  (or initrd image) passed to it by the bootloader. This is
-- 
2.25.0

