Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B6E5F0676
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 10:31:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf3Nn6L9wz3fFq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 18:31:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qEfjwl/t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf3KB1F0Yz3c2q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 18:28:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qEfjwl/t;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mf3KB0M7lz4xGn;
	Fri, 30 Sep 2022 18:28:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664526510;
	bh=Ljk8967RiuAeWBYei2s6rowna0PL4JzVT/iU3xSV3NY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qEfjwl/ts0iwqfJM6nQo3djZlJzwL4xw8bC3Cvxhf1KcoixChH5lxL9r552bA+B4A
	 RscCy6MVX0vAQ3q6ZinLsf9hHYQtB7x3tBYvSD2CGj/DlS4QDMdG/vKIF+mW09viLJ
	 ZIpjq9yrQiLl6Qb7qeMUG7aBq2c9ySin0yD7C5+c4NWfTxogyqdSKoqd7QlpBxN8+2
	 h0LzvbqLfHvXO4cy4r0qUNIq44ox+/QQAvKpnhpZk4UvRtJzMl/0oPolQdrvAsAFPZ
	 H2Aupxj29RXy6y4ltoPmminrpDnUFaU5ieXHCqEwFDCstuNDYrAgpo4e1DaG5Wc8rM
	 bFOjJNJ/L7K+Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v3 6/6] powerpc/pseries: Add firmware details to the hardware description
Date: Fri, 30 Sep 2022 18:27:09 +1000
Message-Id: <20220930082709.55830-6-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220930082709.55830-1-mpe@ellerman.id.au>
References: <20220930082709.55830-1-mpe@ellerman.id.au>
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

eg: Hardware name: ... of:IBM,FW860.42 (SV860_138) hv:phyp

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/pseries/setup.c | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

v3: Drop quotes for brevity.

diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 5e44c65a032c..8ef3270515a9 100644
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
+			seq_buf_printf(&ppc_hw_desc, "of:%s ", s);
+
+		of_node_put(dn);
+	}
+
+	dn = of_find_node_by_path("/hypervisor");
+	if (dn) {
+		if (of_property_read_string(dn, "compatible", &s) == 0)
+			seq_buf_printf(&ppc_hw_desc, "hv:%s ", s);
+
+		of_node_put(dn);
+		return;
+	}
+
+	if (of_property_read_bool(of_root, "ibm,powervm-partition") ||
+	    of_property_read_bool(of_root, "ibm,fw-net-version"))
+		seq_buf_printf(&ppc_hw_desc, "hv:phyp ");
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

