Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1465EF77B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 16:26:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdbK01yzWz3dw7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 00:26:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LZ0hM+eL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdbFL3fHVz3bSX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 00:23:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LZ0hM+eL;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MdbFL2sZLz4xGl;
	Fri, 30 Sep 2022 00:23:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664461414;
	bh=ZESvvsGyAs4k3taCwH9oLiGD2PAS1KcM6CYkdtPYmwc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LZ0hM+eLpZtz6T+FBmuM9hQpjynmEGOhHFCJ07hLN9a2UiJzZcYiu0V82ayib/985
	 j4U2lFEdHOt1V8q2Q71nWNxZ4R/PcWoT2QjMfU1ionLK+ZG99VtWWbd83DxWgJ87gB
	 PSiCXsJysmvQLf8AuwTScrQu39CEfweyucpmeaKJsyVDpMrCp+yApK8FFtaYRML/0x
	 c2UVQi4hrWM3GOtAVsXnpk7AOzf0Un/cvqQf644xWa35Mkzn5+NlBxeuOQzeHblbu3
	 B7Lb3idsuq382gL3OgjqeAibPiHQgnpQn/tGNZONLtjQ8uqlu3tGwA7PGtdtmog2iU
	 botAYf8b/2puw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 6/6] powerpc/pseries: Add firmware details to the hardware description
Date: Fri, 30 Sep 2022 00:22:51 +1000
Message-Id: <20220929142251.1987025-6-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929142251.1987025-1-mpe@ellerman.id.au>
References: <20220929142251.1987025-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: nathanl@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add firmware version details to the hardware description, which is
printed at boot and in case of an oops.

Use /hypervisor if we find it, though currently it only exists if we're
running under qemu.

Look for "ibm,powervm-partition" which is specified in PAPR+ v2.11 and
tells us we're running under PowerVM.

Failing that look for "ibm,fw-net-version" which is seen on PowerVM
going back to at least Power6.

eg: Hardware name: ... of:'IBM,FW860.42 (SV860_138)' hv:'phyp'

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/pseries/setup.c | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

v2: Look for "ibm,powervm-partition" as suggested by Nathan.
    Use of_property_read_string().

diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 5e44c65a032c..83b047db35da 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -41,6 +41,7 @@
 #include <linux/of_pci.h>
 #include <linux/memblock.h>
 #include <linux/swiotlb.h>
+#include <linux/seq_buf.h>
 
 #include <asm/mmu.h>
 #include <asm/processor.h>
@@ -1011,6 +1012,33 @@ static void __init pSeries_cmo_feature_init(void)
 	pr_debug(" <- fw_cmo_feature_init()\n");
 }
 
+static void __init pseries_add_hw_description(void)
+{
+	struct device_node *dn;
+	const char *s;
+
+	dn = of_find_node_by_path("/openprom");
+	if (dn) {
+		if (of_property_read_string(dn, "model", &s) == 0)
+			seq_buf_printf(&ppc_hw_desc, "of:'%s' ", s);
+
+		of_node_put(dn);
+	}
+
+	dn = of_find_node_by_path("/hypervisor");
+	if (dn) {
+		if (of_property_read_string(dn, "compatible", &s) == 0)
+			seq_buf_printf(&ppc_hw_desc, "hv:'%s' ", s);
+
+		of_node_put(dn);
+		return;
+	}
+
+	if (of_property_read_bool(of_root, "ibm,powervm-partition") ||
+	    of_property_read_bool(of_root, "ibm,fw-net-version"))
+		seq_buf_printf(&ppc_hw_desc, "hv:'phyp' ");
+}
+
 /*
  * Early initialization.  Relocation is on but do not reference unbolted pages
  */
@@ -1018,6 +1046,8 @@ static void __init pseries_init(void)
 {
 	pr_debug(" -> pseries_init()\n");
 
+	pseries_add_hw_description();
+
 #ifdef CONFIG_HVC_CONSOLE
 	if (firmware_has_feature(FW_FEATURE_LPAR))
 		hvc_vio_init_early();
-- 
2.37.3

