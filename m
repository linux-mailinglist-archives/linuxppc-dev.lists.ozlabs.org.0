Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0615C34F05F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 20:00:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8y0d0LSmz3dZj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 05:00:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=TqGQ1sp+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.142.94; helo=alln-iport-7.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=TqGQ1sp+; dkim-atps=neutral
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8xx16M9Fz3c19
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 04:57:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=4151; q=dns/txt; s=iport;
 t=1617127046; x=1618336646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EjJugBDCAD3rUkTSbtxc1b6KQ4ZbfCBpeFGgVbm8wnQ=;
 b=TqGQ1sp+LcmrI12TPJ77sFH09pIIuj9xHD3uI2ZT5sZLzStaYMiI3Mqo
 WjSe69IPJqFl164Oa+97M9ot7J+4MlOz2ApyWm/6pEnZRfngwnX8logyx
 kHcVRpVROy/Gg2g6p0/SqMJGKBV3Y0F3VTVnW/e7IyyQayMa4JVssMGM5 Y=;
X-IPAS-Result: =?us-ascii?q?A0ABAACmZWNgmJldJa1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgXwFAQEBAQsBg3YBOTGMZYksii6QOIF8CwEBAQ80BAEBhFACg?=
 =?us-ascii?q?XoCJTQJDgIDAQEBAwIDAQEBAQEFAQEBAgEGBBQBAQEBAQEBAYZDhkUDAzIBO?=
 =?us-ascii?q?A4QUSE2BgESgnCCVgMvqzKCKYgbDWOBRBSBJQGIY3SDciYcgUlCgRIzgyeCH?=
 =?us-ascii?q?ogYBIJGAXUZAQolAYFUgRuQS4Jxik2bR1uDEYEjlhOFMiKkUpUHjnSUQIFUO?=
 =?us-ascii?q?IFbMxoIGxWDJFAZDY4rDQmNagFbIQMvOAIGCgEBAwmJHwEB?=
IronPort-HdrOrdr: A9a23:PcVGDqAnpbaMxZHlHejxsceALOonbusQ8zAX/mp6ICY4TuWzkc
 eykPMHkSLugDEKV3063fyGMq+MQXTTnKQFhbU5EL++UGDd1leAA5pl6eLZqQHIOyq7zeJF0L
 clTq4WMqySMXFfreLXpDa1CMwhxt7vytHMuc77w212RQ9nL4Fshj0ZNi+hHkd7RBZLCPMCff
 L22uN9qzWtYngRZMigb0N1PdTrncHBl57tfHc9aCIP1Q/mt16VwY+/OwSE2FMkXylXx7A5/S
 z+jxXh/am4qZiAu3jh/l6Wy5xXndf7o+EiOOW8zu4INz7rlgGkIKNmVrHqhkFNnMifrHA3jd
 LLvxAse/5W1kqUVGS0rRzxsjOQtgoT1w==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,291,1610409600"; d="scan'208";a="670280382"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
 by alln-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 30 Mar 2021 17:57:22 +0000
Received: from zorba.cisco.com ([10.24.8.123])
 by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTP id 12UHv6CK024502;
 Tue, 30 Mar 2021 17:57:20 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Will Deacon <will@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 ob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 7/8] CMDLINE: x86: convert to generic builtin command line
Date: Tue, 30 Mar 2021 10:57:02 -0700
Message-Id: <19776ce76932e1957faa21250f303481db39fb32.1617126961.git.danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
References: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.8.123, [10.24.8.123]
X-Outbound-Node: rcdn-core-2.cisco.com
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
Cc: linux-kernel@vger.kernel.org, Ruslan Ruslichenko <rruslich@cisco.com>,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>, xe-linux-external@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This updates the x86 code to use the CONFIG_GENERIC_CMDLINE
option.

Cc: xe-linux-external@cisco.com
Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 arch/x86/Kconfig        | 44 +----------------------------------------
 arch/x86/kernel/setup.c | 18 ++---------------
 2 files changed, 3 insertions(+), 59 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2792879d398e..73ea9589e50d 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -118,6 +118,7 @@ config X86
 	select EDAC_SUPPORT
 	select GENERIC_CLOCKEVENTS_BROADCAST	if X86_64 || (X86_32 && X86_LOCAL_APIC)
 	select GENERIC_CLOCKEVENTS_MIN_ADJUST
+	select GENERIC_CMDLINE
 	select GENERIC_CMOS_UPDATE
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_CPU_VULNERABILITIES
@@ -2358,49 +2359,6 @@ choice
 
 endchoice
 
-config CMDLINE_BOOL
-	bool "Built-in kernel command line"
-	help
-	  Allow for specifying boot arguments to the kernel at
-	  build time.  On some systems (e.g. embedded ones), it is
-	  necessary or convenient to provide some or all of the
-	  kernel boot arguments with the kernel itself (that is,
-	  to not rely on the boot loader to provide them.)
-
-	  To compile command line arguments into the kernel,
-	  set this option to 'Y', then fill in the
-	  boot arguments in CONFIG_CMDLINE.
-
-	  Systems with fully functional boot loaders (i.e. non-embedded)
-	  should leave this option set to 'N'.
-
-config CMDLINE
-	string "Built-in kernel command string"
-	depends on CMDLINE_BOOL
-	default ""
-	help
-	  Enter arguments here that should be compiled into the kernel
-	  image and used at boot time.  If the boot loader provides a
-	  command line at boot time, it is appended to this string to
-	  form the full kernel command line, when the system boots.
-
-	  However, you can use the CONFIG_CMDLINE_OVERRIDE option to
-	  change this behavior.
-
-	  In most cases, the command line (whether built-in or provided
-	  by the boot loader) should specify the device for the root
-	  file system.
-
-config CMDLINE_OVERRIDE
-	bool "Built-in command line overrides boot loader arguments"
-	depends on CMDLINE_BOOL && CMDLINE != ""
-	help
-	  Set this option to 'Y' to have the kernel ignore the boot loader
-	  command line, and use ONLY the built-in command line.
-
-	  This is used to work around broken boot loaders.  This should
-	  be set to 'N' under normal conditions.
-
 config MODIFY_LDT_SYSCALL
 	bool "Enable the LDT (local descriptor table)" if EXPERT
 	default y
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index d883176ef2ce..6444a5f1fabf 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -47,6 +47,7 @@
 #include <asm/unwind.h>
 #include <asm/vsyscall.h>
 #include <linux/vmalloc.h>
+#include <linux/cmdline.h>
 
 /*
  * max_low_pfn_mapped: highest directly mapped pfn < 4 GB
@@ -161,9 +162,6 @@ unsigned long saved_video_mode;
 #define RAMDISK_LOAD_FLAG		0x4000
 
 static char __initdata command_line[COMMAND_LINE_SIZE];
-#ifdef CONFIG_CMDLINE_BOOL
-static char __initdata builtin_cmdline[COMMAND_LINE_SIZE] = CONFIG_CMDLINE;
-#endif
 
 #if defined(CONFIG_EDD) || defined(CONFIG_EDD_MODULE)
 struct edd edd;
@@ -883,19 +881,7 @@ void __init setup_arch(char **cmdline_p)
 	bss_resource.start = __pa_symbol(__bss_start);
 	bss_resource.end = __pa_symbol(__bss_stop)-1;
 
-#ifdef CONFIG_CMDLINE_BOOL
-#ifdef CONFIG_CMDLINE_OVERRIDE
-	strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
-#else
-	if (builtin_cmdline[0]) {
-		/* append boot loader cmdline to builtin */
-		strlcat(builtin_cmdline, " ", COMMAND_LINE_SIZE);
-		strlcat(builtin_cmdline, boot_command_line, COMMAND_LINE_SIZE);
-		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
-	}
-#endif
-#endif
-
+	cmdline_add_builtin(boot_command_line, NULL, COMMAND_LINE_SIZE);
 	strlcpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
 	*cmdline_p = command_line;
 
-- 
2.25.1

