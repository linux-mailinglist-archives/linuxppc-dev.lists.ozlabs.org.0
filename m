Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD62442565
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 02:58:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjtN24md7z3036
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:58:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=heying24@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjtMX5Xxcz2xWj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 12:57:41 +1100 (AEDT)
Received: from dggeme758-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HjtFw0PM5zbhNk;
 Tue,  2 Nov 2021 09:52:52 +0800 (CST)
Received: from huawei.com (10.67.174.47) by dggeme758-chm.china.huawei.com
 (10.3.19.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Tue, 2
 Nov 2021 09:57:35 +0800
From: He Ying <heying24@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <akpm@linux-foundation.org>, <npiggin@gmail.com>,
 <aneesh.kumar@linux.ibm.com>
Subject: [PATCH] powerpc: Fix reference leak of node np in opal_lpc_init
Date: Mon, 1 Nov 2021 21:59:18 -0400
Message-ID: <20211102015918.134647-1-heying24@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.47]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeme758-chm.china.huawei.com (10.3.19.104)
X-CFilter-Loop: Reflected
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When breaking from for_each_compatible_node body, we increase the
reference of node np. Then calling isa_bridge_init_non_pci()
will assign np to isa_bridge_devnode. It looks good. However,
other error paths in the code should put the node np back to avoid
the reference leak. Fix the problem by adding missing
of_node_put().

Signed-off-by: He Ying <heying24@huawei.com>
---
 arch/powerpc/kernel/isa-bridge.c          | 10 +++++++++-
 arch/powerpc/platforms/powernv/opal-lpc.c |  6 +++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/isa-bridge.c b/arch/powerpc/kernel/isa-bridge.c
index 39c625737c09..bcf1d6024f9e 100644
--- a/arch/powerpc/kernel/isa-bridge.c
+++ b/arch/powerpc/kernel/isa-bridge.c
@@ -192,14 +192,17 @@ void __init isa_bridge_init_non_pci(struct device_node *np)
 	u64 cbase, pbase, size = 0;
 
 	/* If we already have an ISA bridge, bail off */
-	if (isa_bridge_devnode != NULL)
+	if (isa_bridge_devnode != NULL) {
+		of_node_put(np);
 		return;
+	}
 
 	pna = of_n_addr_cells(np);
 	if (of_property_read_u32(np, "#address-cells", &na) ||
 	    of_property_read_u32(np, "#size-cells", &ns)) {
 		pr_warn("ISA: Non-PCI bridge %pOF is missing address format\n",
 			np);
+		of_node_put(np);
 		return;
 	}
 
@@ -207,6 +210,7 @@ void __init isa_bridge_init_non_pci(struct device_node *np)
 	if (na != 2 || ns != 1) {
 		pr_warn("ISA: Non-PCI bridge %pOF has unsupported address format\n",
 			np);
+		of_node_put(np);
 		return;
 	}
 	rs = na + ns + pna;
@@ -216,6 +220,7 @@ void __init isa_bridge_init_non_pci(struct device_node *np)
 	if (ranges == NULL || rlen < rs) {
 		pr_warn("ISA: Non-PCI bridge %pOF has absent or invalid ranges\n",
 			np);
+		of_node_put(np);
 		return;
 	}
 
@@ -233,6 +238,7 @@ void __init isa_bridge_init_non_pci(struct device_node *np)
 	if (!size || !pbasep) {
 		pr_warn("ISA: Non-PCI bridge %pOF has no usable IO range\n",
 			np);
+		of_node_put(np);
 		return;
 	}
 
@@ -246,6 +252,7 @@ void __init isa_bridge_init_non_pci(struct device_node *np)
 	if (pbase == OF_BAD_ADDR) {
 		pr_warn("ISA: Non-PCI bridge %pOF failed to translate IO base\n",
 			np);
+		of_node_put(np);
 		return;
 	}
 
@@ -253,6 +260,7 @@ void __init isa_bridge_init_non_pci(struct device_node *np)
 	if ((cbase & ~PAGE_MASK) || (pbase & ~PAGE_MASK)) {
 		pr_warn("ISA: Non-PCI bridge %pOF has non aligned IO range\n",
 			np);
+		of_node_put(np);
 		return;
 	}
 
diff --git a/arch/powerpc/platforms/powernv/opal-lpc.c b/arch/powerpc/platforms/powernv/opal-lpc.c
index 1e5d51db40f8..5647752b2d6a 100644
--- a/arch/powerpc/platforms/powernv/opal-lpc.c
+++ b/arch/powerpc/platforms/powernv/opal-lpc.c
@@ -398,8 +398,11 @@ void __init opal_lpc_init(void)
 		opal_lpc_chip_id = of_get_ibm_chip_id(np);
 		break;
 	}
-	if (opal_lpc_chip_id < 0)
+	if (opal_lpc_chip_id < 0) {
+		if (np)
+			of_node_put(np);
 		return;
+	}
 
 	/* Does it support direct mapping ? */
 	if (of_get_property(np, "ranges", NULL)) {
@@ -407,6 +410,7 @@ void __init opal_lpc_init(void)
 			opal_lpc_chip_id);
 		isa_bridge_init_non_pci(np);
 	} else {
+		of_node_put(np);
 		pr_info("OPAL: Found non-mapped LPC bus on chip %d\n",
 			opal_lpc_chip_id);
 
-- 
2.17.1

