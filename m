Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 323997E76C7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 02:46:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=lFUuMo+I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRM9L0Zg9z3dC0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 12:45:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=lFUuMo+I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cisco.com (client-ip=173.37.86.75; helo=rcdn-iport-4.cisco.com; envelope-from=danielwa@cisco.com; receiver=lists.ozlabs.org)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRM1z5dGtz3c2k
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Nov 2023 12:39:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4126; q=dns/txt; s=iport;
  t=1699580376; x=1700789976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XQfpZaDuXlcOMYdjdqSlNlugSI0rTVR45ET5BA9fTo8=;
  b=lFUuMo+Ia+0rAqSWEuY4ezvKOAbVLn1jcm9CcQ80MSkBQ5HfKt84BUtL
   06QzxGLlnyeh/hxN/Uml3iJ4s0rp3JPN48S4cSfH1TlGqA2DjTJSYGw5/
   yZ4ttss2guSY1wlC1jz7iWdFLwztBugcO+radYdYrUuviqQ+lVu9FCltz
   g=;
X-CSE-ConnectionGUID: opm4U75yQ5qWqlXpJd47ng==
X-CSE-MsgGUID: keBfZVW7R96+J9PTUrvyaw==
X-IPAS-Result: =?us-ascii?q?A0ANAADbh01lmJtdJa1aHAEBAQEBAQcBARIBAQQEAQGBe?=
 =?us-ascii?q?wcBAQsBhAdASIxviUKLX5IigSUDVg8BAQEPRAQBAYUGAocmAiY0CQ4BAgQBA?=
 =?us-ascii?q?QEBAwIDAQEBAQEBAQIBAQUBAQECAQcEFAEBAQEBAQEBHhkFEA4nhXWGTQMDM?=
 =?us-ascii?q?gE4DhBRITYGARKCfoIrAzEDrVeCLIEBsjENaoFoGIEwAYdthFaBHoQ1JxuBS?=
 =?us-ascii?q?USCUIItgh+IZwSJJQcygiKDUo1Lf0daFh0DBwNWKRArBwQtIgYJFC0jBlEEF?=
 =?us-ascii?q?xEkCRMSPgSBY4FRCn8/Dw4Rgj8iAj02GUiCWxVABEZ2ECoEFBeBEm4bFR43E?=
 =?us-ascii?q?RIXDQMIdB0CESM8AwUDBDMKEg0LIQUUQgNCBkkLAwIaBQMDBIE2BQ0eAhAtJ?=
 =?us-ascii?q?wMDE00CEBQDOwMDBgMLMQMwVUQMUQNvHxocCTwPDB8CGx4NJygCNUMDEQUSA?=
 =?us-ascii?q?hYDJBkERQMJAwcFSUADCxgNSBEsNQYOGwY/cwehVAF1GQEKJQGBVYEdkkcHg?=
 =?us-ascii?q?xWONp9Yb4QXgV+ZN4VzGjOqA5g/IJE6lneBYzqBWzMaCBsVgyJSGQ+OLA0Jk?=
 =?us-ascii?q?xIBXSMyOwIHCwEBAwmLSgEB?=
IronPort-Data: A9a23:oFFen6P54cIn6nXvrR0FkMFynXyQoLVcMsEvi/4bfWQNrUpx3zEOm
 zYXXjuHb6uOZDP2Kowjaoq28RhXup/Xm99nSXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCdaphyFjmF/kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/W1jlV
 e/a+ZWFYwb8gmYsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQrl58R7PSq
 07rldlVz0uBl/sfIorNfoXTLiXmdoXv0T2m0RK6bUQNbi9q/UTe2o5jXBYVhNw+Zz+hx7idw
 /0V3XC8pJtA0qDkwIwgvxdk/y5WOrVDpIKYfGmG7NWs1kn2a1ngn6poAxRjVWEY0r4f7WBm7
 /cULnUGaQqOwr7wy7OgQe4qjcMmRCXpFNpA4Tc7kneIVrB/HM2rr6bivbe02B88j8ZPEPLBb
 uISaCFka1LLZBgn1lI/Uclizbfy2SinG9FegFGYj6QF3VeM9l0vk5q8COboYMKbTNoAyy50o
 UqfrzimXXn2Lue3zTuD72LpheLVmy7/cJwdGaf+9fNwhlCXgGsJB3U+T0agpfC/zES/X9VBL
 Eg89S8nrKx0/0uuJvH9RxSQsm+YuQRaUN1Ve8U24R+AjKrd5R2UAEAATzhceJonstM7QXoh0
 Vrht9nxLTVrsbCTGTSR+9+8qDK0Ni89N2IOZSYYCwAC5rHLvI43njrLT9B+DLSyiNzlXz39q
 xiOrS4jl60LhosH2ruT+VHcnynqoYrNRwQuoALNUQqN6gJ/eZ7gYo2w8nDF4vtaaoWUVF+Mu
 D4Dgcf2xPBeU7mOmTaLTeFLG6umj96ePTTax1dpE5Q77DOr02WudocW6zZ7TG91NcMNYnnsf
 UPJpAVS7bdcOXKrael8ZIfZI903zKPXDd7/X/DRZ/JXf5l6dQmMuippYCa41mP1lWAokKciK
 dKVdtuqAX8GCKNhij2sSI813bYtxy067WzSQIj2yxm50LGeImWcT/ILKlKIZeEi56TCqwyT7
 s03H9GNwRV3U+DkZCTTt4kJIjgiJnghBIvqrNRXe6iHLxBhCUkqEPDLxq45PYF494xKl+PM1
 nKwQElVzBz4n3KvFOmRQmpoZLWqVpFloDdneyctJl2vnXMkZO5D8ZvzabMwZbx7ybM+3McpV
 sYcf/WYIPgTFTLIrmF1gYbGkKRucxGihASrNiWjYSQic5MIe+Av0oK6FucI3HRTZhdbpffSs
 JX7iVyGGctrqxBKSZeJOKj2njtdqFBEwLoqN3YkNOW/b6kFzWSHAzb6gvlyKMYWJFCfgDCbz
 A2RRxwfoIEhQrPZEvGX2choTK/wToOS+3a2+UGHsd5a0gGGpgKeLXdoCrrgQNwkfDqcFF+eT
 etU1ergF/YMgUxHtYFxe54yk/Nvuoaz+eMKlVs4dJkuU7hNIu05SpVh9ZcX3pChOpcF0edLc
 hvVo4IDaenh1D3NSgJLemLJkdhvJdlNymWNspzZ0W3x5TR8+/KcQF5OMhyX4BGx35MrWL7JN
 dwJ4ZZMgyTm00JCGo/f3kh8qT/WRlReCPpPi33vKNKx4ubd4gscMcW05+6fyMznVuigxWFze
 W/M2Pqd1+gMrqcAGlJqfUXwMSNmrcxmkHh3IJUqfjxlRvKtaicL4SBs
IronPort-HdrOrdr: A9a23:Q6j4cqM5yUMLHMBcTvqjsMiBIKoaSvp037Dk7SxMoHtuA6ilfq
 +V8sjzuSWftN9VYgBCpTniAtjkfZqjz/9ICOAqVN/IYOClghrLEGgI1+TfKlPbdhEW39Qtsp
 uIC5IfNDU1ZmIK9PoTJ2KDYrAd/OU=
X-Talos-CUID: 9a23:SrpMfG37Hfq4oOBx6DfY/rxfHdggLkCCkWbpflaHEGJZUJ+ZFQCW9/Yx
X-Talos-MUID: 9a23:9KHXXQuRrMWoa/bens2nhzxIOvVW3PuUWR5Os8Q+h/SeKz15JGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.03,291,1694736000"; 
   d="scan'208";a="134982790"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 01:38:32 +0000
Received: from goliath.lan ([10.25.128.169])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTP id 3AA1cHVM011466;
	Fri, 10 Nov 2023 01:38:30 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Will Deacon <will@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Rob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Tomas Mudrunka <tomas.mudrunka@gmail.com>,
        Sean Anderson <sean.anderson@seco.com>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 6/8] CMDLINE: x86: convert to generic builtin command line
Date: Thu,  9 Nov 2023 17:38:10 -0800
Message-Id: <20231110013817.2378507-7-danielwa@cisco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231110013817.2378507-1-danielwa@cisco.com>
References: <20231110013817.2378507-1-danielwa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.25.128.169, [10.25.128.169]
X-Outbound-Node: rcdn-core-4.cisco.com
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
Cc: linux-kernel@vger.kernel.org, Ruslan Ruslichenko <rruslich@cisco.com>, Ruslan Bilovol <ruslan.bilovol@gmail.com>, xe-linux-external@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
index 66bfabae8814..390ffaa743df 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -145,6 +145,7 @@ config X86
 	select EDAC_SUPPORT
 	select GENERIC_CLOCKEVENTS_BROADCAST	if X86_64 || (X86_32 && X86_LOCAL_APIC)
 	select GENERIC_CLOCKEVENTS_MIN_ADJUST
+	select GENERIC_CMDLINE
 	select GENERIC_CMOS_UPDATE
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_CPU_VULNERABILITIES
@@ -2309,49 +2310,6 @@ choice
 
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
index b098b1fa2470..bd025c003f32 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -55,6 +55,7 @@
 #include <asm/unwind.h>
 #include <asm/vsyscall.h>
 #include <linux/vmalloc.h>
+#include <linux/cmdline.h>
 
 /*
  * max_low_pfn_mapped: highest directly mapped pfn < 4 GB
@@ -162,9 +163,6 @@ unsigned long saved_video_mode;
 #define RAMDISK_LOAD_FLAG		0x4000
 
 static char __initdata command_line[COMMAND_LINE_SIZE];
-#ifdef CONFIG_CMDLINE_BOOL
-static char __initdata builtin_cmdline[COMMAND_LINE_SIZE] = CONFIG_CMDLINE;
-#endif
 
 #if defined(CONFIG_EDD) || defined(CONFIG_EDD_MODULE)
 struct edd edd;
@@ -959,19 +957,7 @@ void __init setup_arch(char **cmdline_p)
 	bss_resource.start = __pa_symbol(__bss_start);
 	bss_resource.end = __pa_symbol(__bss_stop)-1;
 
-#ifdef CONFIG_CMDLINE_BOOL
-#ifdef CONFIG_CMDLINE_OVERRIDE
-	strscpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
-#else
-	if (builtin_cmdline[0]) {
-		/* append boot loader cmdline to builtin */
-		strlcat(builtin_cmdline, " ", COMMAND_LINE_SIZE);
-		strlcat(builtin_cmdline, boot_command_line, COMMAND_LINE_SIZE);
-		strscpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
-	}
-#endif
-#endif
-
+	cmdline_add_builtin(boot_command_line);
 	strscpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
 	*cmdline_p = command_line;
 
-- 
2.39.2

