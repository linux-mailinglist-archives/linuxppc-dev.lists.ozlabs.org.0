Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAD232CB98
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 05:49:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrdgR0vhSz3cb3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 15:49:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=LEwR5m5x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.78; helo=rcdn-iport-7.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=LEwR5m5x; dkim-atps=neutral
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrdfW3ZhTz3cFy
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 15:48:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=5087; q=dns/txt; s=iport;
 t=1614833299; x=1616042899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B7rBp+oAV8HchVJuk5DlnTjEjxhKnuSRrXyBU5WGoEc=;
 b=LEwR5m5xHN+jycGV3h/aNm6FZPfzCaJN5cGkxa9gdCw4TGrAXfHMews8
 8vGQLgrX9Z+KSpvYxsp9D9E5HfG2lkiWCGeuxYqpeAXaVrfALFT7UJMj0
 mAg8i9g50hNFKZrXKc3NydRpGK3G9IZM+g+nkv5+45fC6dfDSsF+CDeX6 A=;
X-IronPort-AV: E=Sophos;i="5.81,221,1610409600"; d="scan'208";a="855206698"
Received: from alln-core-8.cisco.com ([173.36.13.141])
 by rcdn-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 04 Mar 2021 04:48:11 +0000
Received: from zorba.cisco.com ([10.24.7.178])
 by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTP id 1244m4Wx015988;
 Thu, 4 Mar 2021 04:48:10 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Will Deacon <will@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 ob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH 3/5] CMDLINE: powerpc: convert to generic builtin command line
Date: Wed,  3 Mar 2021 20:48:00 -0800
Message-Id: <20210304044803.812204-3-danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.7.178, [10.24.7.178]
X-Outbound-Node: alln-core-8.cisco.com
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
Cc: Ruslan Ruslichenko <rruslich@cisco.com>,
 Ruslan Bilovol <rbilovol@cisco.com>, linux-kernel@vger.kernel.org,
 xe-linux-external@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This updates the powerpc code to use the CONFIG_GENERIC_CMDLINE
option.

Cc: xe-linux-external@cisco.com
Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 arch/powerpc/Kconfig            | 37 +--------------------------------
 arch/powerpc/kernel/prom.c      |  1 +
 arch/powerpc/kernel/prom_init.c | 31 +++++++++++++++------------
 3 files changed, 20 insertions(+), 49 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 107bb4319e0e..276b06d5c961 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -167,6 +167,7 @@ config PPC
 	select EDAC_SUPPORT
 	select GENERIC_ATOMIC64			if PPC32
 	select GENERIC_CLOCKEVENTS_BROADCAST	if SMP
+	select GENERIC_CMDLINE
 	select GENERIC_CMOS_UPDATE
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_CPU_VULNERABILITIES	if PPC_BARRIER_NOSPEC
@@ -906,42 +907,6 @@ config PPC_DENORMALISATION
 	  Add support for handling denormalisation of single precision
 	  values.  Useful for bare metal only.  If unsure say Y here.
 
-config CMDLINE
-	string "Initial kernel command string"
-	default ""
-	help
-	  On some platforms, there is currently no way for the boot loader to
-	  pass arguments to the kernel. For these platforms, you can supply
-	  some command-line options at build time by entering them here.  In
-	  most cases you will need to specify the root device here.
-
-choice
-	prompt "Kernel command line type" if CMDLINE != ""
-	default CMDLINE_FROM_BOOTLOADER
-
-config CMDLINE_FROM_BOOTLOADER
-	bool "Use bootloader kernel arguments if available"
-	help
-	  Uses the command-line options passed by the boot loader. If
-	  the boot loader doesn't provide any, the default kernel command
-	  string provided in CMDLINE will be used.
-
-config CMDLINE_EXTEND
-	bool "Extend bootloader kernel arguments"
-	help
-	  The command-line arguments provided by the boot loader will be
-	  appended to the default kernel command string.
-
-config CMDLINE_FORCE
-	bool "Always use the default kernel command string"
-	help
-	  Always use the default kernel command string, even if the boot
-	  loader passes other arguments to the kernel.
-	  This is useful if you cannot or don't want to change the
-	  command-line options your boot loader passes to the kernel.
-
-endchoice
-
 config EXTRA_TARGETS
 	string "Additional default image types"
 	help
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index ae3c41730367..96d0a01be1b4 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -27,6 +27,7 @@
 #include <linux/irq.h>
 #include <linux/memblock.h>
 #include <linux/of.h>
+#include <linux/cmdline.h>
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
 #include <linux/cpu.h>
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index e9d4eb6144e1..d752be688b62 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -27,6 +27,7 @@
 #include <linux/initrd.h>
 #include <linux/bitops.h>
 #include <linux/pgtable.h>
+#include <linux/cmdline.h>
 #include <asm/prom.h>
 #include <asm/rtas.h>
 #include <asm/page.h>
@@ -242,15 +243,6 @@ static int __init prom_strcmp(const char *cs, const char *ct)
 	return 0;
 }
 
-static char __init *prom_strcpy(char *dest, const char *src)
-{
-	char *tmp = dest;
-
-	while ((*dest++ = *src++) != '\0')
-		/* nothing */;
-	return tmp;
-}
-
 static int __init prom_strncmp(const char *cs, const char *ct, size_t count)
 {
 	unsigned char c1, c2;
@@ -276,6 +268,19 @@ static size_t __init prom_strlen(const char *s)
 	return sc - s;
 }
 
+static size_t __init prom_strlcpy(char *dest, const char *src, size_t size)
+{
+	size_t ret = prom_strlen(src);
+
+	if (size) {
+		size_t len = (ret >= size) ? size - 1 : ret;
+		memcpy(dest, src, len);
+		dest[len] = '\0';
+	}
+	return ret;
+}
+
+
 static int __init prom_memcmp(const void *cs, const void *ct, size_t count)
 {
 	const unsigned char *su1, *su2;
@@ -778,9 +783,9 @@ static void __init early_cmdline_parse(void)
 	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE) && (long)prom.chosen > 0)
 		l = prom_getprop(prom.chosen, "bootargs", p, COMMAND_LINE_SIZE-1);
 
-	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) || l <= 0 || p[0] == '\0')
-		prom_strlcat(prom_cmd_line, " " CONFIG_CMDLINE,
-			     sizeof(prom_cmd_line));
+	if (l <= 0 || p[0] == '\0') /* dbl check */
+		cmdline_add_builtin_custom(prom_cmd_line, NULL, sizeof(prom_cmd_line),
+					__prombss, &prom_strlcpy, &prom_strlcat);
 
 	prom_printf("command line: %s\n", prom_cmd_line);
 
@@ -2706,7 +2711,7 @@ static void __init flatten_device_tree(void)
 
 	/* Add "phandle" in there, we'll need it */
 	namep = make_room(&mem_start, &mem_end, 16, 1);
-	prom_strcpy(namep, "phandle");
+	prom_strlcpy(namep, "phandle", 8);
 	mem_start = (unsigned long)namep + prom_strlen(namep) + 1;
 
 	/* Build string array */
-- 
2.25.1

