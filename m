Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9B45EDE01
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 15:43:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McyPp5qZnz3c70
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 23:43:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cBl/R0Mv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McyL94Jmhz3bkb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 23:40:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cBl/R0Mv;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4McyL93c8Vz4xGm;
	Wed, 28 Sep 2022 23:40:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664372433;
	bh=OmVLqcJXRvUals4duaQ8Y3fFuXzdjkddBOVtf5vzMjk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cBl/R0Mv7TbDoDPBwHqb7Btjy0TlhgEdKFCdHCHlvUP31hAsuo9diPoFGIW9eU8lb
	 j74y1RqaIUIM0/lRxq1PXYU93Qt3tU1x22c6mU7TtE1XRtwpDZYm7oe4Lh+jO1wFl1
	 lxLvFuEXghOR4GvC033J1ttzpjPLHlPCicmxGXurCVRPo0kuyt5pez6RMX2e6TQhew
	 6yStgzGCqaR1VUXpu6nncNc0Z7pbp5jKE5w8rYvMj4QCNHwvcDUT2gT205tIwz+PCC
	 UfcdEznmGL4GTkYJ4VNVhCPlSiTPbl2+uEMZMnrxxti5q0GPbZOGLPVdsmF/PGazAG
	 Km66lYgdgTkOg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 6/6] powerpc/pseries: Add firmware details to dump stack arch description
Date: Wed, 28 Sep 2022 23:40:25 +1000
Message-Id: <20220928134025.1739909-6-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928134025.1739909-1-mpe@ellerman.id.au>
References: <20220928134025.1739909-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add firmware version details to the dump stack arch description, which
is printed in case of an oops.

Currently /hypervisor only exists on KVM, so if we don't find that
look for something that suggests we're on phyp and if so that's
probably a good guess. The actual content of the ibm,fw-net-version
seems to be a full path so is too long to add to the description.

eg: Hardware name: ... of:'IBM,FW860.42 (SV860_138)' hv:phyp

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/pseries/setup.c | 36 ++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 5e44c65a032c..f0ce8256ebb8 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -41,6 +41,7 @@
 #include <linux/of_pci.h>
 #include <linux/memblock.h>
 #include <linux/swiotlb.h>
+#include <linux/seq_buf.h>
 
 #include <asm/mmu.h>
 #include <asm/processor.h>
@@ -1011,6 +1012,39 @@ static void __init pSeries_cmo_feature_init(void)
 	pr_debug(" <- fw_cmo_feature_init()\n");
 }
 
+static void __init pseries_add_dump_stack_arch_desc(void)
+{
+	struct device_node *dn;
+	const char *prop;
+
+	dn = of_find_node_by_path("/openprom");
+	if (dn) {
+		prop = of_get_property(dn, "model", NULL);
+		if (prop)
+			seq_buf_printf(&ppc_hw_desc, "of:'%s' ", prop);
+
+		of_node_put(dn);
+	}
+
+	dn = of_find_node_by_path("/hypervisor");
+	if (dn) {
+		prop = of_get_property(dn, "compatible", NULL);
+		if (prop)
+			seq_buf_printf(&ppc_hw_desc, "hv:%s ", prop);
+
+		of_node_put(dn);
+	} else {
+		dn = of_find_node_by_path("/");
+		if (dn) {
+			prop = of_get_property(dn, "ibm,fw-net-version", NULL);
+			if (prop)
+				seq_buf_printf(&ppc_hw_desc, "hv:phyp ");
+
+			of_node_put(dn);
+		}
+	}
+}
+
 /*
  * Early initialization.  Relocation is on but do not reference unbolted pages
  */
@@ -1018,6 +1052,8 @@ static void __init pseries_init(void)
 {
 	pr_debug(" -> pseries_init()\n");
 
+	pseries_add_dump_stack_arch_desc();
+
 #ifdef CONFIG_HVC_CONSOLE
 	if (firmware_has_feature(FW_FEATURE_LPAR))
 		hvc_vio_init_early();
-- 
2.37.3

