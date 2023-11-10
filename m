Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7ED7E76C1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 02:44:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=g+sgxPvF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRM7R6Yqsz3clH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 12:44:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=g+sgxPvF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cisco.com (client-ip=173.37.86.76; helo=rcdn-iport-5.cisco.com; envelope-from=danielwa@cisco.com; receiver=lists.ozlabs.org)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRM1x22dYz3cHF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Nov 2023 12:39:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=5564; q=dns/txt; s=iport;
  t=1699580373; x=1700789973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G3mzXCo9zuU2hguTVdS6rnUvvYqWcYPaShxuD6OBkN0=;
  b=g+sgxPvFqzcOGmofJvFj4UzbFDuz2tSGRrHA/M+jwGJglrlXEcNVYvrz
   Ll8JvEnYy899Lha7knBG0/kvKyW+T1YTSLuhu5bUKCiHbn5GfG9xFes4f
   PmIXRKj26aFPMoxyMRct0PDFK9TeotLL66jgnPICS0ZwmkdBOJ+7foKuA
   o=;
X-CSE-ConnectionGUID: YdHHS5cKSjOdkXWDdGQbWA==
X-CSE-MsgGUID: 3j2JtuLcRJaUnDnLONU/TA==
X-IPAS-Result: =?us-ascii?q?A0ANAABsiE1lmJtdJa1aHAEBAQEBAQcBARIBAQQEAQGBe?=
 =?us-ascii?q?wcBAQsBhAdASIxvp0OBJQNWDwEBAQ9EBAEBhQYChyYCJjQJDgECBAEBAQEDA?=
 =?us-ascii?q?gMBAQEBAQEBAgEBBQEBAQIBBwQUAQEBAQEBAQEeGQUOECeFdYZNAwMyAUYQU?=
 =?us-ascii?q?VcGARKCfoJfA61YgiyBAbMogWgYgTABjEOBHoQ1JxuBSUSCUIItiwYEiSUHM?=
 =?us-ascii?q?oIig1KNS39HWhYdAwcDVikQKwcELSIGCRQtIwZRBBcRJAkTEj4EgWOBUQp/P?=
 =?us-ascii?q?w8OEYI/IgI9NhlIglsVQARGdhAqBBQXgRJuGxUeNxESFw0DCHQdAhEjPAMFA?=
 =?us-ascii?q?wQzChINCyEFFEIDQgZJCwMCGgUDAwSBNgUNHgIQLScDAxNNAhAUAzsDAwYDC?=
 =?us-ascii?q?zEDMFVEDFEDbx8aHAk8DwwfAhseDScoAjVDAxEFEgIWAyQZBEUDCQMHBUlAA?=
 =?us-ascii?q?wsYDUgRLDUGDhsGP3MHoVQBgQ+CBW6ScwqRS6BHhBeBX58qGjOqA5g/IKJxh?=
 =?us-ascii?q?UCBYzqBWzMaCBsVgyJSGQ+OLA0JkxIBXSMyOwIHCwEBAwmLSgEB?=
IronPort-Data: A9a23:Qrw7/6MulgG1lqvvrR1KkMFynXyQoLVcMsEvi/4bfWQNrUol0WEGy
 WcZW2jXbK6IYWH1c4t2aNjgphtVsZ/RmIAyHHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCdaphyFjmF/kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/W1jlV
 e/a+ZWFYwb8gmYsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQrl58R7PSq
 07rldlVz0uBl/sfIorNfoXTLiXmdoXv0T2m0RK6bUQNbi9q/UTe2o5jXBYVhNw+Zz+hx7idw
 /0V3XC8pJtA0qDkwIwgvxdk/y5WDKFm2ISaKluEs+ufzH35X3fD+v9RJRRjVWEY0r4f7WBm7
 /cULnUGaQqOwr7wy7OgQe4qjcMmRCXpFNpA4Tc7kneIVrB/HM2rr6bivbe02B88j8ZPEPLBb
 uISaCFka1LLZBgn1lI/UcljxL722iSjG9FegAmX/4gr/kzY9i547b7BNv7yXOHNeewAyy50o
 UqfrzimXXn2Lue3zTuD72LpheLVmy7/cJwdGaf+9fNwhlCXgGsJB3U+UVq9vOn8g1S7HtFSM
 UoZ/gIqrLMu7wqqSNfnVhG1qXLCuQQTM/JbGvEz7ACLjK/d+QefD3MsRyRELtchsaceQT0sy
 0+Rh9isCTFxmLmUUm6GsLCGqTq4Im4SN2BqTSsFSxYVptziuJobkB3CVJBgHbSzg9mzHiv/q
 xia/HYWhLgJi8MPkaKh8jjvmD+loN7ASAI4/B7QWEq+4wh+IoWiYuSA9V/e5O0GKZuVVESHv
 3EslM2X7eRIBpaI/ASUXeQGK6mj/f+FNTT0mENuFJgn/HKm/HvLVYlT+DRWIEZvL9ZBdzj0Z
 kPapQJW4tlUJnTCRaN+ZYO8D+wlzK34GNDoSPHfbpxVa540ehWO+ipvfkWXmWvk1lU3+YklP
 p2bWcWhF3AXDeJg1jXeb+wdy74w2icmxW6VQZ3hyAWP2qGRfnmIUfEILTOmceE96IuHrR/T/
 tIZMNGFoyizS8XkaSXRtIUUN11PcT4wBIv9rIpccevrzhda9H8JOvPx4Yh8cK9enYNZldf30
 n2SY0Vn4Q+q7ZHYEjmiZndmYbLpeJ9wq3MnICAhVWpEPVB+P+5DC49CKvMKkakbGP9LlqErE
 qFUEymUKrEeFWSdomV1gYzV9dQ6LHyWaRSy0z1JiQXTkrZ6TADPv9TjZAaqqG8FDzG8so01p
 LjIOuLnrXgrGVgK4CX+Ma/HI7aNUZ41xL4as6zgfoE7RakU2NI2QxEdd9duSy32FT3NxyGBy
 yGdCgoCqO/GrucdqYeY1P3Z89n1Q7AhQiK2+lU3C57obEE2GUL9med9vBqgIVgxqUutovz5P
 LUJpx0CGKdbxggiX3VA/0ZDlPJiuISHS05yxQV/F3KDdEWwFr5lORG7MTpn6MVwKktikVLuA
 Cqno4ACUZ3QYZ+NOABKfmINML/cvcz4bxGPt5zZ1m2gun8ulFdGOG0PVySxZNt1deAlaN91n
 rd96Kb7KWWX03IXDzpPtQgMn0zkE5DKe/xPWk0yaGMztjcW9w==
IronPort-HdrOrdr: A9a23:b/Ygcq9TQsiw84BTBQ9uk+DjI+orL9Y04lQ7vn2ZhyY4TiX+rb
 HLoB1173HJYVoqMk3I3OrwW5VoIkmskKKdn7NxAV7KZmCP01dAbrsSj7cKqAeOJ8SRzINgPI
 5bAs9D4aXLbWSTSa3BkXCF+xFK+qjgzJyV
X-Talos-CUID: =?us-ascii?q?9a23=3Azo7SVGl8chH7+ZqbvLEe1TvEUczXOUzR7FfrfkS?=
 =?us-ascii?q?bMmRORL6ldnOc15purOM7zg=3D=3D?=
X-Talos-MUID: 9a23:1okezwpl1HEpOPbxGLsez2pgbuV0/oClMmIErJMqve2jExE3Bx7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.03,291,1694736000"; 
   d="scan'208";a="135016454"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 01:38:35 +0000
Received: from goliath.lan ([10.25.128.169])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTP id 3AA1cHVO011466;
	Fri, 10 Nov 2023 01:38:34 GMT
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
        Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 8/8] CMDLINE: arm64: convert to generic builtin command line
Date: Thu,  9 Nov 2023 17:38:12 -0800
Message-Id: <20231110013817.2378507-9-danielwa@cisco.com>
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, xe-linux-external@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This removes arm64 from the device tree handling of the
command line arguments.

The boot_command_line variable is populated inside the earliest
user of the command line, which is in idreg-override.c.

The device tree should not be needed to do any further handling
of the boot command line options.

Cc: xe-linux-external@cisco.com
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 arch/arm64/Kconfig                  | 33 +----------------------------
 arch/arm64/include/asm/setup.h      |  4 ++++
 arch/arm64/include/uapi/asm/setup.h |  2 ++
 arch/arm64/kernel/idreg-override.c  |  9 ++++----
 arch/arm64/kernel/pi/kaslr_early.c  | 14 ++++++------
 5 files changed, 19 insertions(+), 43 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 78f20e632712..d3b7fd1080d0 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -131,6 +131,7 @@ config ARM64
 	select GENERIC_ALLOCATOR
 	select GENERIC_ARCH_TOPOLOGY
 	select GENERIC_CLOCKEVENTS_BROADCAST
+	select GENERIC_CMDLINE
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_EARLY_IOREMAP
@@ -2217,38 +2218,6 @@ config ARM64_ACPI_PARKING_PROTOCOL
 	  protocol even if the corresponding data is present in the ACPI
 	  MADT table.
 
-config CMDLINE
-	string "Default kernel command string"
-	default ""
-	help
-	  Provide a set of default command-line options at build time by
-	  entering them here. As a minimum, you should specify the the
-	  root device (e.g. root=/dev/nfs).
-
-choice
-	prompt "Kernel command line type" if CMDLINE != ""
-	default CMDLINE_FROM_BOOTLOADER
-	help
-	  Choose how the kernel will handle the provided default kernel
-	  command line string.
-
-config CMDLINE_FROM_BOOTLOADER
-	bool "Use bootloader kernel arguments if available"
-	help
-	  Uses the command-line options passed by the boot loader. If
-	  the boot loader doesn't provide any, the default kernel command
-	  string provided in CMDLINE will be used.
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
 config EFI_STUB
 	bool
 
diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
index f4af547ef54c..5a8037262cbb 100644
--- a/arch/arm64/include/asm/setup.h
+++ b/arch/arm64/include/asm/setup.h
@@ -3,10 +3,13 @@
 #ifndef __ARM64_ASM_SETUP_H
 #define __ARM64_ASM_SETUP_H
 
+#ifndef __ASSEMBLY__
 #include <linux/string.h>
+#endif
 
 #include <uapi/asm/setup.h>
 
+#ifndef __ASSEMBLY__
 void *get_early_fdt_ptr(void);
 void early_fdt_map(u64 dt_phys);
 
@@ -30,5 +33,6 @@ static inline bool arch_parse_debug_rodata(char *arg)
 	return false;
 }
 #define arch_parse_debug_rodata arch_parse_debug_rodata
+#endif /* __ASSEMBLY__ */
 
 #endif
diff --git a/arch/arm64/include/uapi/asm/setup.h b/arch/arm64/include/uapi/asm/setup.h
index 5d703888f351..f5fc5b806369 100644
--- a/arch/arm64/include/uapi/asm/setup.h
+++ b/arch/arm64/include/uapi/asm/setup.h
@@ -20,7 +20,9 @@
 #ifndef __ASM_SETUP_H
 #define __ASM_SETUP_H
 
+#ifndef __ASSEMBLY__
 #include <linux/types.h>
+#endif
 
 #define COMMAND_LINE_SIZE	2048
 
diff --git a/arch/arm64/kernel/idreg-override.c b/arch/arm64/kernel/idreg-override.c
index 3addc09f8746..6334a9228909 100644
--- a/arch/arm64/kernel/idreg-override.c
+++ b/arch/arm64/kernel/idreg-override.c
@@ -9,6 +9,7 @@
 #include <linux/ctype.h>
 #include <linux/kernel.h>
 #include <linux/libfdt.h>
+#include <linux/cmdline.h>
 
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
@@ -304,11 +305,11 @@ static __init void parse_cmdline(void)
 {
 	const u8 *prop = get_bootargs_cmdline();
 
-	if (IS_ENABLED(CONFIG_CMDLINE_FORCE) || !prop)
-		__parse_cmdline(CONFIG_CMDLINE, true);
+	strscpy(boot_command_line, prop, COMMAND_LINE_SIZE);
+	cmdline_add_builtin(boot_command_line);
+
+	__parse_cmdline(boot_command_line, true);
 
-	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE) && prop)
-		__parse_cmdline(prop, true);
 }
 
 /* Keep checkers quiet */
diff --git a/arch/arm64/kernel/pi/kaslr_early.c b/arch/arm64/kernel/pi/kaslr_early.c
index 17bff6e399e4..1e00bc01fa7a 100644
--- a/arch/arm64/kernel/pi/kaslr_early.c
+++ b/arch/arm64/kernel/pi/kaslr_early.c
@@ -11,6 +11,7 @@
 #include <linux/types.h>
 #include <linux/sizes.h>
 #include <linux/string.h>
+#include <linux/cmdline.h>
 
 #include <asm/archrandom.h>
 #include <asm/memory.h>
@@ -42,7 +43,7 @@ static bool cmdline_contains_nokaslr(const u8 *cmdline)
 
 static bool is_kaslr_disabled_cmdline(void *fdt)
 {
-	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE)) {
+	if (!IS_ENABLED(CONFIG_CMDLINE_OVERRIDE)) {
 		int node;
 		const u8 *prop;
 
@@ -54,16 +55,15 @@ static bool is_kaslr_disabled_cmdline(void *fdt)
 		if (!prop)
 			goto out;
 
+		if (cmdline_contains_nokaslr(CMDLINE_STATIC_APPEND))
+			return true;
 		if (cmdline_contains_nokaslr(prop))
 			return true;
-
-		if (IS_ENABLED(CONFIG_CMDLINE_EXTEND))
-			goto out;
-
-		return false;
+		if (cmdline_contains_nokaslr(CMDLINE_STATIC_PREPEND))
+			return true;
 	}
 out:
-	return cmdline_contains_nokaslr(CONFIG_CMDLINE);
+	return cmdline_contains_nokaslr(cmdline_get_static_builtin());
 }
 
 static u64 get_kaslr_seed(void *fdt)
-- 
2.39.2

