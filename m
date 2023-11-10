Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D06817E76CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 02:46:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=XSm5oTCy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRMBG5LTSz3cmg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 12:46:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=XSm5oTCy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cisco.com (client-ip=173.37.86.75; helo=rcdn-iport-4.cisco.com; envelope-from=danielwa@cisco.com; receiver=lists.ozlabs.org)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRM205N0pz2yGW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Nov 2023 12:39:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3742; q=dns/txt; s=iport;
  t=1699580377; x=1700789977;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hVMC2g6F+sS5xh4dm4+qY8r7kQHgggs8qh2zLFytqSA=;
  b=XSm5oTCyB/dEvoiqgWVy422JLHkaE4CpNTXDQ1ZwVNRZKq9x1lIZ6TXz
   P0Ypmb3LX9DYQXMx2Uh6UukxTN7+nGq3Y04yZEzjoQww/gh+TzY11cHZW
   1sSCJcyKeYlOrbN7PC4EE1d2veHwffWb5T6Wi9wQ9qq32Aq/GJCDDd/Fa
   o=;
X-CSE-ConnectionGUID: t3gihvnOTkyYQzPMwAhgsg==
X-CSE-MsgGUID: suRZL8VFTx6nMj9/gpbWKg==
X-IPAS-Result: =?us-ascii?q?A0ANAADbh01lmJtdJa1aHAEBAQEBAQcBARIBAQQEAQGBe?=
 =?us-ascii?q?wcBAQsBhAdASIxviUKeARSBEQNWDwEBAQ9EBAEBhQYChyYCJjQJDgECBAEBA?=
 =?us-ascii?q?QEDAgMBAQEBAQEBAgEBBQEBAQIBBwQUAQEBAQEBAQEeGQUQDieFdYZNAwMyA?=
 =?us-ascii?q?UYQHTRJDgYBEoJ+gl8DrVeCLIEBsyiBaBiBMAGMQ4EehDUnG4FJRIEVgTuCL?=
 =?us-ascii?q?YQphl0EiSUHMoIig1KNS39HWhYdAwcDVikQKwcELSIGCRQtIwZRBBcRJAkTE?=
 =?us-ascii?q?j4EgWOBUQp/Pw8OEYI/IgIHNjYZSIJbFUAERnYQKgQUF4ESbhsVHjcREhcNA?=
 =?us-ascii?q?wh0HQIRIzwDBQMEMwoSDQshBRRCA0IGSQsDAhoFAwMEgTYFDR4CEC0nAwMTT?=
 =?us-ascii?q?QIQFAM7AwMGAwsxAzBVRAxRA28fGhwJPA8MHwIbHg0nKAI1QwMRBRICFgMkG?=
 =?us-ascii?q?QRFAwkDBwVJQAMLGA1IESw1Bg4bBj9zB6FOBgGBD4EIgSASkzaRS6BHhBeBX?=
 =?us-ascii?q?58qGjOqA5g/IKgxgWM6gVszGggbFYMiUhkPjjmTGwFdIzI7AgcLAQEDCYtKA?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:USJ/Na22r4fJoxrhGfbD5SV2kn2cJEfYwER7XKvMYLTBsI5bpzQCz
 mUfCziOaPqNazf8c4hzaY++oxxXvpbUz9IxTARr3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ1yFjmE4E71btANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXV4
 rsen+WFYAX+gmctajpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauG4ycbjG
 o4vZJnglo/o109F5uGNy94XQWVWKlLmBjViv1INM0SUbreukQRpukozHKJ0hU66EFxllfgpo
 DlGncTYpQvEosQglcxFOyS0HR2SMoVao7DGIWa5lvCQ3nz/YUPJ3NxuA1o5aNhwFuZfWQmi9
 NQCIzwLKxuEne/znPSwS/JngYIoK8yD0IE34y47i2qGS6d9B8meHs0m5vcAtNs0rsxHG/fTY
 9UQQTFudx/HJRZIPz/7Dbpnx7v51iOvK2UwRFS9vrcN0UyD8iJNwObrFdiEPdOST/p2kRPNz
 o7B1z2pXk5FXDCF8hKB83SxlqrMkDn9VYY6CrK17LhpjUeVy2hVDwcZPXO3rOe4gUOiQd9SA
 1Ib9zBorqUo8kGvCN7nUHWQrmSDoRcaV5xUEvYmwA6Iw6vQpQ2eAwAsVDlLaJ8qqOc1SCYs2
 1vPmMnmbRRrsbuIWWqF/fKYoC2aPSkOMXREYj0ARAEepd75r+kbihPJU8YmFa+tlfXrFjzqh
 TOHti4zg/MUl8Fj/7Xro3jEjiiqq5yPSRQ6ji3MU2ujqAp/aIO/fIuuwUPW5vEGJ4GcJnGdu
 30NgI6b8ewUEJeOnQSCRewMGPei4PPtGCTBgFVYB5M7/jSo8la6YIFb4Td1YkxuN64scDzxZ
 WfXuAVM9NpdO2asYaZrYoW3TcMwwsDIGd3jV/3QRtVPZ4B8cAKZ/SpuI1WZ2SXjikEqmqAkM
 pDdes/qEG1yIb5gxjqeROoH17IvgCckygv7TpDhzg+71qKeaTiRRK0CIXOFde8j676c5gjIm
 /5ANs+O4xZSSuvzZm/Q64F7ELwRBWIwCZazoMtNe6vfZAFnA2omTfTWxNvNZrCJgYxJzejJ/
 m+7fXNb2WvGl0XiNiyKZWtsPeaHsYlEkVo3OiklPFCN0nclYJqy4Kp3S3fRVeR5nACE5aMpJ
 8Tpa/lsEdwUFWuao2V1gY3V6d09JE7y1GpiKgL8OGBnF6OMUTAl7TMNQ+cC3DMFAizyvswkr
 vj8kAjaWpEEAQ9lCa46ic5DLXvv4RDxe8orAiMkx+W/nm2wrOCGzASt1pcKzzkkc0mr+9dj/
 1/+7e0kjefMuZQp19LCmLqJqYyke8MnQBsLQjSHs+rmbnaGloZG/WOmeLjRFdw6fD2skJhOm
 c0Jpx0BGKRdxQ0T49YU/0hDl/5kubMDWIO2Piw9TCmUMDxH+5trI2KN2oFUp7ZRy7pC0TZaq
 WrRkuS2zY6hYZu/eHZIfVJNRr3ahZk8xGKIhdxrexqS2cOC1OfdOamkF0PS2HU1wXocGN5N/
 NrNT+ZPsFzn1kp1YorW5s2WnkzVRkE9v2wcnslyKOfWZsADkzmuvbS05vfK3ayy
IronPort-HdrOrdr: A9a23:8hX10KzJCp3ev/u3nQRoKrPwF71zdoMgy1knxilNoNJuHvBw8P
 re+MjzuiWbtN98YhsdcJW7Scq9qBDnhPtICPcqXItKNTOO0ACVxcNZnOnfKlbbdBEWmNQx6U
 5ISdkYNDSJNzhHZQKQ2njALz7mq+P3lpyVuQ==
X-Talos-CUID: 9a23:ovLiuG2jLCZwgmjd/3mxMbxfBpsqc33DylDsIF6JMHRRbaK8SVCL9/Yx
X-Talos-MUID: 9a23:Dz9OZAirh9HKqH0Sbu1iIsMpL9pS0YD+Nm4xgcsAnsvVciNoMQi+g2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.03,291,1694736000"; 
   d="scan'208";a="134982800"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 01:38:33 +0000
Received: from goliath.lan ([10.25.128.169])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTP id 3AA1cHVN011466;
	Fri, 10 Nov 2023 01:38:32 GMT
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
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 7/8] of: replace command line handling
Date: Thu,  9 Nov 2023 17:38:11 -0800
Message-Id: <20231110013817.2378507-8-danielwa@cisco.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xe-linux-external@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rob Herring has complained about this section of code. I removed the
command line handling code to the cmdline.h header. This hopefully makes
it easier for Rob to maintain it (at least he doesn't have to look at it
directly anymore). I would like to add a Kconfig option called
OF_DEPRECATED_CMDLINE which an architecture would set if it uses this code.
This would allow a platform to use the cmdline.h and the added function
directly and remove the Kconfig option. This change would be in a subsequent
patch.

This code was boot tested on powerpc 32bit, powerpc 64bit without
any generic command line conversion.

Cc: xe-linux-external@cisco.com
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 drivers/of/fdt.c        | 22 +++-------------------
 include/linux/cmdline.h | 31 +++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 19 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index bf502ba8da95..1fc1b17d04dc 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -26,6 +26,7 @@
 #include <linux/serial_core.h>
 #include <linux/sysfs.h>
 #include <linux/random.h>
+#include <linux/cmdline.h>
 
 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
@@ -1183,27 +1184,10 @@ int __init early_init_dt_scan_chosen(char *cmdline)
 
 	/* Retrieve command line */
 	p = of_get_flat_dt_prop(node, "bootargs", &l);
-	if (p != NULL && l > 0)
-		strscpy(cmdline, p, min(l, COMMAND_LINE_SIZE));
 
 handle_cmdline:
-	/*
-	 * CONFIG_CMDLINE is meant to be a default in case nothing else
-	 * managed to set the command line, unless CONFIG_CMDLINE_FORCE
-	 * is set in which case we override whatever was found earlier.
-	 */
-#ifdef CONFIG_CMDLINE
-#if defined(CONFIG_CMDLINE_EXTEND)
-	strlcat(cmdline, " ", COMMAND_LINE_SIZE);
-	strlcat(cmdline, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
-#elif defined(CONFIG_CMDLINE_FORCE)
-	strscpy(cmdline, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
-#else
-	/* No arguments from boot loader, use kernel's  cmdl*/
-	if (!((char *)cmdline)[0])
-		strscpy(cmdline, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
-#endif
-#endif /* CONFIG_CMDLINE */
+
+	of_deprecated_cmdline_update(cmdline, p, l);
 
 	pr_debug("Command line is: %s\n", (char *)cmdline);
 
diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
index a94758a0f257..c772afb7340f 100644
--- a/include/linux/cmdline.h
+++ b/include/linux/cmdline.h
@@ -103,4 +103,35 @@ __cmdline_add_builtin(
 
 #define cmdline_get_static_builtin(dest) \
 	(CMDLINE_STATIC_PREPEND CMDLINE_STATIC_APPEND)
+
+#ifndef CONFIG_GENERIC_CMDLINE
+static inline bool of_deprecated_cmdline_update(char *cmdline, const char *dt_bootargs, int length)
+{
+	if (dt_bootargs != NULL && length > 0)
+		strlcpy(cmdline, dt_bootargs, min(length, COMMAND_LINE_SIZE));
+	/*
+	 * CONFIG_CMDLINE is meant to be a default in case nothing else
+	 * managed to set the command line, unless CONFIG_CMDLINE_FORCE
+	 * is set in which case we override whatever was found earlier.
+	 */
+
+#ifdef CONFIG_CMDLINE
+#if defined(CONFIG_CMDLINE_EXTEND)
+	strlcat(cmdline, " ", COMMAND_LINE_SIZE);
+	strlcat(cmdline, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+#elif defined(CONFIG_CMDLINE_FORCE)
+	strscpy(cmdline, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+#else
+	/* No arguments from boot loader, use kernel's  cmdl*/
+	if (!((char *)cmdline)[0])
+		strscpy(cmdline, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
 #endif
+#endif /* CONFIG_CMDLINE */
+	return true;
+}
+#else
+static inline bool of_deprecated_cmdline_update(char *cmdline, const char *dt_bootargs, int length) { return false; }
+#endif /* CONFIG_GENERIC_CMDLINE */
+
+
+#endif /* _LINUX_CMDLINE_H */
-- 
2.39.2

