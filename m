Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9AE34F05E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 20:00:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8y0043cyz3c2Q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 05:00:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=b5JWU8kx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.74; helo=rcdn-iport-3.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=b5JWU8kx; dkim-atps=neutral
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8xwz29XHz3bsv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 04:57:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=5244; q=dns/txt; s=iport;
 t=1617127043; x=1618336643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z8anDruZfbCd8nxE9KL6/A2E5PwrXLs8pPpA/zlWF6w=;
 b=b5JWU8kxBw965qCsO+//WLVStchbXeA+1dsbsAb5uxb9KDyQm8ZLexOd
 nCSMFufxT4FBPw1VsniUeypIx3Xiypu/o6AUOGdCdcsVRKyvxxZ1QyRDE
 Y7CZXlchbTCLhTdmQk8n1GxnTr70e+ZhPvCVHkMdxAy1MLhrG3M8uQUb3 s=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Am/H1YKFBatQSpq7EpLqFtZHXdLJzesId70?=
 =?us-ascii?q?hD6mlaQ3VuHvCwvcaogfgdyFvIkz4XQn4tgpStP6OHTHPa+/dOkO0sFJqrQQ?=
 =?us-ascii?q?WOggWVBa5464+K+VfdMg34stVQzKJxN5V5YeeAbmRSqebfzE2GH807wN+BmZ?=
 =?us-ascii?q?rY4Nv263t2VwllZ+VB4m5CazqzKUF9SAlYCZdRLvP1jfZvnDaudW8aac62HB?=
 =?us-ascii?q?A+Lor+jufWn5HrawNuPXEawTSJ5AnE1JfKVzCFwxFbaD9U2LEk62SAqRDh/7?=
 =?us-ascii?q?6uqevT8G6660bjq7BfmN7s0bJ4ZPCku4wyNijmjBquacBHXbCP1QpF2d2H2R?=
 =?us-ascii?q?INjMTGpQsmMoBIz07pOkuxoRfrxmDboVAT10M=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ANAAAXZmNg/5ldJa1aGwEBAQEBAQE?=
 =?us-ascii?q?BBQEBARIBAQEDAwEBAYF8BgEBAQsBgiqBTAE5MYxlpBKBfAsBAQEPNAQBAYR?=
 =?us-ascii?q?QAoF6AiU0CQ4CAwEBDAEBBQEBAQIBBgRxhW6GRQYnCwFGEFFXBgEShXirNIF?=
 =?us-ascii?q?2M4kLgUQUgSUBiGN0g3ImHIFJQoFFgyeKNgSCR4EPk2AGjUKBIJlugRSDEYE?=
 =?us-ascii?q?jm0UipFKVB58MhCiBVDqBWTMaCBsVgyRQGQ2OKxaNagFbIQMvOAIGCgEBAwm?=
 =?us-ascii?q?JHwEB?=
X-IronPort-AV: E=Sophos;i="5.81,291,1610409600"; d="scan'208";a="853727117"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
 by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 30 Mar 2021 17:57:19 +0000
Received: from zorba.cisco.com ([10.24.8.123])
 by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTP id 12UHv6CJ024502;
 Tue, 30 Mar 2021 17:57:18 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Will Deacon <will@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 ob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/8] drivers: firmware: efi: libstub: enable generic
 commandline
Date: Tue, 30 Mar 2021 10:57:01 -0700
Message-Id: <e5d98d566c38d6f8516b8d9d1fd603ec1f131037.1617126961.git.danielwa@cisco.com>
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
Cc: linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, xe-linux-external@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds code to handle the generic command line changes.
The efi code appears that it doesn't benefit as much from this design
as it could.

For example, if you had a prepend command line with "nokaslr" then
you might be helpful to re-enable it in the boot loader or dts,
but there appears to be no way to re-enable kaslr or some of the
other options.

Cc: xe-linux-external@cisco.com
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 .../firmware/efi/libstub/efi-stub-helper.c    | 35 +++++++++++++++++++
 drivers/firmware/efi/libstub/efi-stub.c       |  7 ++++
 drivers/firmware/efi/libstub/efistub.h        |  1 +
 drivers/firmware/efi/libstub/x86-stub.c       | 13 +++++--
 4 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/efi/libstub/efi-stub-helper.c b/drivers/firmware/efi/libstub/efi-stub-helper.c
index aa8da0a49829..c155837cedc9 100644
--- a/drivers/firmware/efi/libstub/efi-stub-helper.c
+++ b/drivers/firmware/efi/libstub/efi-stub-helper.c
@@ -13,6 +13,7 @@
 #include <linux/efi.h>
 #include <linux/kernel.h>
 #include <linux/printk.h> /* For CONSOLE_LOGLEVEL_* */
+#include <linux/cmdline.h>
 #include <asm/efi.h>
 #include <asm/setup.h>
 
@@ -172,6 +173,40 @@ int efi_printk(const char *fmt, ...)
 	return printed;
 }
 
+/**
+ * efi_handle_cmdline() - handle adding in building parts of the command line
+ * @cmdline:	kernel command line
+ *
+ * Add in the generic parts of the commandline and start the parsing of the
+ * command line.
+ *
+ * Return:	status code
+ */
+efi_status_t efi_handle_cmdline(char const *cmdline)
+{
+	efi_status_t status;
+
+	status = efi_parse_options(CMDLINE_PREPEND);
+	if (status != EFI_SUCCESS) {
+		efi_err("Failed to parse options\n");
+		return status;
+	}
+
+	status = efi_parse_options(IS_ENABLED(CONFIG_CMDLINE_OVERRIDE) ? "" : cmdline);
+	if (status != EFI_SUCCESS) {
+		efi_err("Failed to parse options\n");
+		return status;
+	}
+
+	status = efi_parse_options(CMDLINE_APPEND);
+	if (status != EFI_SUCCESS) {
+		efi_err("Failed to parse options\n");
+		return status;
+	}
+
+	return EFI_SUCCESS;
+}
+
 /**
  * efi_parse_options() - Parse EFI command line options
  * @cmdline:	kernel command line
diff --git a/drivers/firmware/efi/libstub/efi-stub.c b/drivers/firmware/efi/libstub/efi-stub.c
index 26e69788f27a..760480248adf 100644
--- a/drivers/firmware/efi/libstub/efi-stub.c
+++ b/drivers/firmware/efi/libstub/efi-stub.c
@@ -172,6 +172,12 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 		goto fail;
 	}
 
+#ifdef CONFIG_GENERIC_CMDLINE
+	status = efi_handle_cmdline(cmdline_ptr);
+	if (status != EFI_SUCCESS) {
+		goto fail_free_cmdline;
+	}
+#else
 	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) ||
 	    IS_ENABLED(CONFIG_CMDLINE_FORCE) ||
 	    cmdline_size == 0) {
@@ -189,6 +195,7 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 			goto fail_free_cmdline;
 		}
 	}
+#endif
 
 	efi_info("Booting Linux Kernel...\n");
 
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index cde0a2ef507d..07c7f9fdfffc 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -800,6 +800,7 @@ efi_status_t efi_relocate_kernel(unsigned long *image_addr,
 				 unsigned long alignment,
 				 unsigned long min_addr);
 
+efi_status_t efi_handle_cmdline(char const *cmdline);
 efi_status_t efi_parse_options(char const *cmdline);
 
 void efi_parse_option_graphics(char *option);
diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index f14c4ff5839f..30ad8fb7122d 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -673,6 +673,8 @@ unsigned long efi_main(efi_handle_t handle,
 	unsigned long bzimage_addr = (unsigned long)startup_32;
 	unsigned long buffer_start, buffer_end;
 	struct setup_header *hdr = &boot_params->hdr;
+	unsigned long cmdline_paddr = ((u64)hdr->cmd_line_ptr |
+				       ((u64)boot_params->ext_cmd_line_ptr << 32));
 	efi_status_t status;
 
 	efi_system_table = sys_table_arg;
@@ -735,6 +737,14 @@ unsigned long efi_main(efi_handle_t handle,
 		image_offset = 0;
 	}
 
+#ifdef CONFIG_GENERIC_CMDLINE
+	status = efi_handle_cmdline((char *)cmdline_paddr);
+	if (status != EFI_SUCCESS) {
+		efi_err("Failed to parse options\n");
+		goto fail;
+	}
+#else /* CONFIG_GENERIC_CMDLINE */
+
 #ifdef CONFIG_CMDLINE_BOOL
 	status = efi_parse_options(CONFIG_CMDLINE);
 	if (status != EFI_SUCCESS) {
@@ -743,8 +753,6 @@ unsigned long efi_main(efi_handle_t handle,
 	}
 #endif
 	if (!IS_ENABLED(CONFIG_CMDLINE_OVERRIDE)) {
-		unsigned long cmdline_paddr = ((u64)hdr->cmd_line_ptr |
-					       ((u64)boot_params->ext_cmd_line_ptr << 32));
 		status = efi_parse_options((char *)cmdline_paddr);
 		if (status != EFI_SUCCESS) {
 			efi_err("Failed to parse options\n");
@@ -752,6 +760,7 @@ unsigned long efi_main(efi_handle_t handle,
 		}
 	}
 
+#endif
 	/*
 	 * At this point, an initrd may already have been loaded by the
 	 * bootloader and passed via bootparams. We permit an initrd loaded
-- 
2.25.1

