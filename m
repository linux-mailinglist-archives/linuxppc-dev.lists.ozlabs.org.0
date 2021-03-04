Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A49232CB99
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 05:49:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Drdgv0M6Jz3dDv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 15:49:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=CtulSgrU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.75; helo=rcdn-iport-4.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=CtulSgrU; dkim-atps=neutral
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrdfW3cLsz3cGD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 15:48:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=1665; q=dns/txt; s=iport;
 t=1614833299; x=1616042899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JPxIpWSiHwMYUhrJK0/YYj5eo6XXFdrmnrzClDHMFxg=;
 b=CtulSgrU5ijbDkg6i5a4fSeP878dggb/a3n45SBU7+G6ACayufnTqEXp
 TdUBtwX63lhjSlMKbd/5c8LDEhfSwG0btgigfdouDaMkEZZo0pVf44icO
 l+G3LZUgwQughR37yVZfzKURLTzn228cEoHvC+O8Ks8/qI2H/3NZNENkH c=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CaBABRZkBg/40NJK1iHQEBAQEJARI?=
 =?us-ascii?q?BBQUBgg+CK4FMATkxsmkLAQEBDzQEAQGETYF8AiU4EwIDAQELAQEFAQEBAgE?=
 =?us-ascii?q?GBHGFboZ9AUaBPgESgnCDCK4cgiiJH4FEFIEkiFx0hBkcgUlCgRGDWIozBIJ?=
 =?us-ascii?q?AB4EOgigSnimbe4MGgR+acg8io1aUVaJGgWsjgVczGggbFYMkUBkNnCsBXCA?=
 =?us-ascii?q?DLzgCBgoBAQMJjBMBAQ?=
X-IronPort-AV: E=Sophos;i="5.81,221,1610409600"; d="scan'208";a="844460945"
Received: from alln-core-8.cisco.com ([173.36.13.141])
 by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 04 Mar 2021 04:48:10 +0000
Received: from zorba.cisco.com ([10.24.7.178])
 by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTP id 1244m4Ww015988;
 Thu, 4 Mar 2021 04:48:09 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Will Deacon <will@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 ob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 2/5] CMDLINE: drivers: of: ifdef out cmdline section
Date: Wed,  3 Mar 2021 20:47:59 -0800
Message-Id: <20210304044803.812204-2-danielwa@cisco.com>
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
Cc: devicetree@vger.kernel.org, Ruslan Ruslichenko <rruslich@cisco.com>,
 linux-kernel@vger.kernel.org, xe-linux-external@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It looks like there's some seepage of cmdline stuff into
the generic device tree code. This conflicts with the
generic cmdline implementation so I remove it in the case
when that's enabled.

Cc: xe-linux-external@cisco.com
Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 drivers/of/fdt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index feb0f2d67fc5..cfe4f8d3c9f5 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -25,6 +25,7 @@
 #include <linux/serial_core.h>
 #include <linux/sysfs.h>
 #include <linux/random.h>
+#include <linux/cmdline.h>
 
 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
@@ -1048,8 +1049,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 
 	early_init_dt_check_for_initrd(node);
 
+#ifdef CONFIG_GENERIC_CMDLINE
 	/* Retrieve command line */
 	p = of_get_flat_dt_prop(node, "bootargs", &l);
+
+	/*
+	 * The builtin command line will be added here, or it can override
+	 * with the DT bootargs.
+	 */
+	cmdline_add_builtin(data,
+			    ((p != NULL && l > 0) ? p : NULL), /* This is sanity checking */
+			    COMMAND_LINE_SIZE);
+#else
 	if (p != NULL && l > 0)
 		strlcpy(data, p, min(l, COMMAND_LINE_SIZE));
 
@@ -1070,6 +1081,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 		strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
 #endif
 #endif /* CONFIG_CMDLINE */
+#endif /* CONFIG_GENERIC_CMDLINE */
 
 	pr_debug("Command line is: %s\n", (char *)data);
 
-- 
2.25.1

