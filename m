Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 467743618A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 06:12:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM2qB195Xz3d3N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 14:12:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=irFQFaXK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.72; helo=rcdn-iport-1.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=irFQFaXK; dkim-atps=neutral
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM2m36c2yz3bq3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 14:09:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=4126; q=dns/txt; s=iport;
 t=1618546180; x=1619755780;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PeTW14FxWGoMvyvzYReuQevTCGzCc/Dodslmcogr2V0=;
 b=irFQFaXKS51pYkEdw8IyhmRyZwMOk9h2ceh2EK7oD6SuDZSkTjgMQBLZ
 vQ1YD8mYURwV57oMEq+8XY/9KkUEsGRA3eQAZVJO0woGbaWcgg36lTrq8
 xfsNn9cfQ0rGiArVmFeQRv3Bu/StQtLqq3QNHKxoOcNdIl7HsHDgJqf0s Y=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AYqph260lbigOnMHLnaSIxgqjBe9yeYIsi2?=
 =?us-ascii?q?QD101hICF9WMbwrayTtd4c0gL5jytUZWopnsqONLLFbXTX85N05od5B8bHYC?=
 =?us-ascii?q?DKsHalRbsN0aLM2DvlcheVysd80uNaf7F6GJnMCzFB/KXHyS2ZN/pl/9Wd6q?=
 =?us-ascii?q?Cvgo7lvhJQZCVncbtp4Qs8KgvzKCxLbTJLD5Y4C5aQj/Avz1GdUE8aYcihCn?=
 =?us-ascii?q?4OU/KrnayoqLvdfRUECxQ7gTPgsRqU7tfBfiSw71M3Ty5IhYwv63HClBb0op?=
 =?us-ascii?q?++quihxgXHvlWjiKh+qZ/EwttHCNfksKgoAwSprBq0b4J8XLDHmzY5rIiUmS?=
 =?us-ascii?q?8XueiJhQs8NMJu7H6UREWJmF/G3gnt1ytG0Q6F9WOl?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BMAACIDXlg/4sNJK1aHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQGBfgcBAQsBAYIpgU0BOTGMZ4lOijKQPIF8CwEBAQ80BAEBhFA?=
 =?us-ascii?q?CgXMCJTQJDgIDAQEMAQEFAQEBAgEGBHEThV1DFgGFawYyATgOEFEhNgYBEoJ?=
 =?us-ascii?q?xglYDL6wHgiuBAYdDDWOBRBSBJQGIa3SDdSccgUlChHOCHogbBIJGAXUZAQo?=
 =?us-ascii?q?lAYFUgRuQWYJyimGbUluDFoEmliaFKw8jpHyVGI8HlFuBVDqBWTMaCBsVgyR?=
 =?us-ascii?q?QGQ6OKxaNawFbIQMvOAIGCgEBAwmJToNAAQE?=
X-IronPort-AV: E=Sophos;i="5.82,226,1613433600"; d="scan'208";a="876181661"
Received: from alln-core-6.cisco.com ([173.36.13.139])
 by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 16 Apr 2021 04:09:38 +0000
Received: from zorba.cisco.com ([10.24.7.67])
 by alln-core-6.cisco.com (8.15.2/8.15.2) with ESMTP id 13G49OHl016753;
 Fri, 16 Apr 2021 04:09:37 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Will Deacon <will@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Rob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 6/8] CMDLINE: x86: convert to generic builtin command line
Date: Thu, 15 Apr 2021 21:09:17 -0700
Message-Id: <20210416040924.2882771-7-danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416040924.2882771-1-danielwa@cisco.com>
References: <20210416040924.2882771-1-danielwa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.7.67, [10.24.7.67]
X-Outbound-Node: alln-core-6.cisco.com
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
index 5ecd69a48393..cd2aa33c44d7 100644
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
+	cmdline_add_builtin(boot_command_line);
 	strlcpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
 	*cmdline_p = command_line;
 
-- 
2.25.1

