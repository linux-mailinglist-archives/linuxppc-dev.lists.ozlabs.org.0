Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8963134F055
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 19:58:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8xxv44hmz3c4s
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 04:58:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=dcXeqkry;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.73; helo=rcdn-iport-2.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=dcXeqkry; dkim-atps=neutral
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8xwp1Qk1z3bsy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 04:57:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=1732; q=dns/txt; s=iport;
 t=1617127034; x=1618336634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7VPnrz823hwL8BI8YhldOyGsN9S/SEW13dD2feyjGac=;
 b=dcXeqkry0JRa6H6FPGqA4MZUs/bANepd/1F6WRv3w1b+LG02b9tAzq8r
 6LfPHjtaSF/vwmJyCvCZ1otHZ7BXadmVWvdT9l2lRzFygCIQgpsh7erGX
 nab5a6sDLn195Zat6uQ15hEMJzQ5hIHy8aYuCTXPZ01qcHISdTMeqy+s7 I=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A2uCtjqNekWosXMBcT5z155DYdL4zR+YMi2?=
 =?us-ascii?q?QD/UoZc3BoW+afkN2jm+le6AT9jywfVGpltdeLPqSBRn20z+8Q3aA9NaqvNT?=
 =?us-ascii?q?OJhEKGN4dnhLGJ/xTBHGnE+vdZxeNcdcFFeb7NJHxbqeq/3wWiCdYnx7C8gc?=
 =?us-ascii?q?WVrMPT1W1kQw0vS6wI1WZEIz2WGEF3WwVKbKBRfPGhz/FKqDa6dXMcYt7TPA?=
 =?us-ascii?q?hmY8H4u9bJmJj6CCRoOzcb7mC14A+A2frTDwWfmiwTSSpIxq0vtVLYihXj6r?=
 =?us-ascii?q?+42svLrSP05iv255RSlMCJ8Lt+Lf3JrNQJITPxjQvtQ4JtV9S5zUkIidDqzk?=
 =?us-ascii?q?o2m9/RpBplBeBP0jf6e2G4pgaF4XiH7AoT?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AEAAAYZWNg/5ldJa1aGgEBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBARIBAQEBAgIBAQEBgXwFAQEBAQsBgiqBTAE5MYxlpBKBfAsBAQE?=
 =?us-ascii?q?PNAQBAYRQAoF6AiU0CQ4CAwEBDAEBBQEBAQIBBgRxhW6GRQYyAUYQUVcGARK?=
 =?us-ascii?q?FeKsvgimJC4FEFIElAYhjdINyJhyBSUKBEjODJ4o2BIJAB4EOgigSnm+cIoM?=
 =?us-ascii?q?RgSObRSKkUpUHozSBVDqBWTMaCBsVgyRQGQ2cKwFbIQMvOAIGCgEBAwmJHwE?=
 =?us-ascii?q?B?=
X-IronPort-AV: E=Sophos;i="5.81,291,1610409600"; d="scan'208";a="881996333"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
 by rcdn-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 30 Mar 2021 17:57:09 +0000
Received: from zorba.cisco.com ([10.24.8.123])
 by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTP id 12UHv6CF024502;
 Tue, 30 Mar 2021 17:57:07 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Will Deacon <will@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 ob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 2/8] CMDLINE: drivers: of: ifdef out cmdline section
Date: Tue, 30 Mar 2021 10:56:57 -0700
Message-Id: <0c4b839f023f87c451c8aa3c4f7a8d92729c2f02.1617126961.git.danielwa@cisco.com>
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
 drivers/of/fdt.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index dcc1dd96911a..d8805cd9717a 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -25,6 +25,7 @@
 #include <linux/serial_core.h>
 #include <linux/sysfs.h>
 #include <linux/random.h>
+#include <linux/cmdline.h>
 
 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
@@ -1050,6 +1051,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 
 	/* Retrieve command line */
 	p = of_get_flat_dt_prop(node, "bootargs", &l);
+
+#if defined(CONFIG_GENERIC_CMDLINE) && defined(CONFIG_GENERIC_CMDLINE_OF)
+	/*
+	 * The builtin command line will be added here, or it can override
+	 * with the DT bootargs.
+	 */
+	cmdline_add_builtin(data,
+			    (l > 0 ? p : NULL), /* This is sanity checking */
+			    COMMAND_LINE_SIZE);
+#elif defined(CONFIG_GENERIC_CMDLINE)
+	strlcpy(data, p, COMMAND_LINE_SIZE);
+#else
 	if (p != NULL && l > 0)
 		strlcpy(data, p, min(l, COMMAND_LINE_SIZE));
 
@@ -1070,6 +1083,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 		strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
 #endif
 #endif /* CONFIG_CMDLINE */
+#endif /* CONFIG_GENERIC_CMDLINE */
 
 	pr_debug("Command line is: %s\n", (char *)data);
 
-- 
2.25.1

