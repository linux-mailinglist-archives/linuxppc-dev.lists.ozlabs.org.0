Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFD46CCB60
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 22:18:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmLbK2LsHz3fl3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 07:18:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.51; helo=mail-ot1-f51.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmLYF6w0Rz3cP0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 07:16:17 +1100 (AEDT)
Received: by mail-ot1-f51.google.com with SMTP id cm7-20020a056830650700b006a11f365d13so5757306otb.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 13:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680034575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPV83Ku05eVtYDdjByFRpdT6sBQBYt8mDRN3PCU3Qec=;
        b=7IsP+DUbJTlhYNSlPlFvezzeox7uZhmeXVWyIyw2QNV5VweGODdEZGeF5Fe2wN1VRs
         aRIoCL+aAXRflr6uik0CnDAUoLnTvkAHE6ed+uUgmKPFcssTnFD67dz8FYZHGg9nMPQU
         0MjXQDbqkH7mgjiqaZzEr097BvnHIWKMfO2xcC1SDAqPqiPls9ku/6G9tA+7Lon7skXh
         7PxgcFnktsVxBldLQCNXFrO/AEVnlW1t2ie3l2Nf8vgDzNMbhyiuojvWD82eY8z5YF23
         RXYKMx+LevWqSGn0foJQCep3nWLJPlkRuH2usKSSMUv1HutVa9n3ZTOfR6hdq+CkH3eu
         JmRw==
X-Gm-Message-State: AAQBX9ddGz7rHjn2V3kA54pVDb9rsNj4Ee+8V0e3bng98m4scMlWLotn
	rhn9Ks0jRbRmFs6HAPXtUw==
X-Google-Smtp-Source: AKy350Yvh7h3jcQs0qnOEKMeNpdXqJbdelh/CYaGEedZYqt4AXoReTYyPgoYdksvfizCTRrhxzbqJg==
X-Received: by 2002:a9d:6c93:0:b0:69f:b065:7716 with SMTP id c19-20020a9d6c93000000b0069fb0657716mr8330440otr.11.1680034575472;
        Tue, 28 Mar 2023 13:16:15 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d11-20020a05683018eb00b0069f1774cde8sm6583848otf.71.2023.03.28.13.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 13:16:15 -0700 (PDT)
Received: (nullmailer pid 3993727 invoked by uid 1000);
	Tue, 28 Mar 2023 20:16:10 -0000
From: Rob Herring <robh@kernel.org>
Date: Tue, 28 Mar 2023 15:15:58 -0500
Subject: [PATCH 3/5] of/address: Add support for 3 address cell bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230328-dt-address-helpers-v1-3-e2456c3e77ab@kernel.org>
References: <20230328-dt-address-helpers-v1-0-e2456c3e77ab@kernel.org>
In-Reply-To: <20230328-dt-address-helpers-v1-0-e2456c3e77ab@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
X-Mailer: b4 0.13-dev
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's a few custom bus bindings (e.g. fsl,qoriq-mc) which use a
3 cell format with custom flags in the high cell. We can match these
buses as a fallback if we didn't match on PCI bus which is the only
standard bus binding with 3 address cells.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/address.c                        | 22 +++++++++++
 drivers/of/unittest-data/tests-address.dtsi |  9 ++++-
 drivers/of/unittest.c                       | 58 ++++++++++++++++++++++++++++-
 3 files changed, 87 insertions(+), 2 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index b79f005834fc..8cfae24148e0 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -95,11 +95,17 @@ static int of_bus_default_translate(__be32 *addr, u64 offset, int na)
 	return 0;
 }
 
+static unsigned int of_bus_default_flags_get_flags(const __be32 *addr)
+{
+	return of_read_number(addr, 1);
+}
+
 static unsigned int of_bus_default_get_flags(const __be32 *addr)
 {
 	return IORESOURCE_MEM;
 }
 
+
 #ifdef CONFIG_PCI
 static unsigned int of_bus_pci_get_flags(const __be32 *addr)
 {
@@ -344,6 +350,11 @@ static unsigned int of_bus_isa_get_flags(const __be32 *addr)
 	return flags;
 }
 
+static int of_bus_default_flags_match(struct device_node *np)
+{
+	return of_bus_n_addr_cells(np) == 3;
+}
+
 /*
  * Array of bus specific translators
  */
@@ -373,6 +384,17 @@ static struct of_bus of_busses[] = {
 		.has_flags = true,
 		.get_flags = of_bus_isa_get_flags,
 	},
+	/* Default with flags cell */
+	{
+		.name = "default-flags",
+		.addresses = "reg",
+		.match = of_bus_default_flags_match,
+		.count_cells = of_bus_default_count_cells,
+		.map = of_bus_default_map,
+		.translate = of_bus_default_translate,
+		.has_flags = true,
+		.get_flags = of_bus_default_flags_get_flags,
+	},
 	/* Default */
 	{
 		.name = "default",
diff --git a/drivers/of/unittest-data/tests-address.dtsi b/drivers/of/unittest-data/tests-address.dtsi
index 6604a52bf6cb..bc0029cbf8ea 100644
--- a/drivers/of/unittest-data/tests-address.dtsi
+++ b/drivers/of/unittest-data/tests-address.dtsi
@@ -14,7 +14,7 @@ address-tests {
 			#size-cells = <1>;
 			/* ranges here is to make sure we don't use it for
 			 * dma-ranges translation */
-			ranges = <0x70000000 0x70000000 0x40000000>,
+			ranges = <0x70000000 0x70000000 0x50000000>,
 				 <0x00000000 0xd0000000 0x20000000>;
 			dma-ranges = <0x0 0x20000000 0x40000000>;
 
@@ -43,6 +43,13 @@ pci@90000000 {
 					     <0x42000000 0x0 0xc0000000 0x20000000 0x0 0x10000000>;
 			};
 
+			bus@a0000000 {
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges = <0xf00baa 0x0 0x0 0xa0000000 0x0 0x100000>,
+					 <0xf00bee 0x1 0x0 0xb0000000 0x0 0x200000>;
+			};
+
 		};
 	};
 };
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 945288d5672f..29066ecbed47 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1048,7 +1048,7 @@ static void __init of_unittest_bus_ranges(void)
 			"for_each_of_range wrong flags on node %pOF flags=%x (expected %x)\n",
 			np, range.flags, IORESOURCE_MEM);
 		if (!i) {
-			unittest(range.size == 0x40000000,
+			unittest(range.size == 0x50000000,
 				 "for_each_of_range wrong size on node %pOF size=%llx\n",
 				 np, range.size);
 			unittest(range.cpu_addr == 0x70000000,
@@ -1074,6 +1074,61 @@ static void __init of_unittest_bus_ranges(void)
 	of_node_put(np);
 }
 
+static void __init of_unittest_bus_3cell_ranges(void)
+{
+	struct device_node *np;
+	struct of_range range;
+	struct of_range_parser parser;
+	int i = 0;
+
+	np = of_find_node_by_path("/testcase-data/address-tests/bus@a0000000");
+	if (!np) {
+		pr_err("missing testcase data\n");
+		return;
+	}
+
+	if (of_range_parser_init(&parser, np)) {
+		pr_err("missing ranges property\n");
+		return;
+	}
+
+	/*
+	 * Get the "ranges" from the device tree
+	 */
+	for_each_of_range(&parser, &range) {
+		if (!i) {
+			unittest(range.flags == 0xf00baa,
+				 "for_each_of_range wrong flags on node %pOF flags=%x\n",
+				 np, range.flags);
+			unittest(range.size == 0x100000,
+				 "for_each_of_range wrong size on node %pOF size=%llx\n",
+				 np, range.size);
+			unittest(range.cpu_addr == 0xa0000000,
+				 "for_each_of_range wrong CPU addr (%llx) on node %pOF",
+				 range.cpu_addr, np);
+			unittest(range.bus_addr == 0x0,
+				 "for_each_of_range wrong bus addr (%llx) on node %pOF",
+				 range.pci_addr, np);
+		} else {
+			unittest(range.flags == 0xf00bee,
+				 "for_each_of_range wrong flags on node %pOF flags=%x\n",
+				 np, range.flags);
+			unittest(range.size == 0x200000,
+				 "for_each_of_range wrong size on node %pOF size=%llx\n",
+				 np, range.size);
+			unittest(range.cpu_addr == 0xb0000000,
+				 "for_each_of_range wrong CPU addr (%llx) on node %pOF",
+				 range.cpu_addr, np);
+			unittest(range.bus_addr == 0x100000000,
+				 "for_each_of_range wrong bus addr (%llx) on node %pOF",
+				 range.pci_addr, np);
+		}
+		i++;
+	}
+
+	of_node_put(np);
+}
+
 static void __init of_unittest_parse_interrupts(void)
 {
 	struct device_node *np;
@@ -3711,6 +3766,7 @@ static int __init of_unittest(void)
 	of_unittest_parse_dma_ranges();
 	of_unittest_pci_dma_ranges();
 	of_unittest_bus_ranges();
+	of_unittest_bus_3cell_ranges();
 	of_unittest_match_node();
 	of_unittest_platform_populate();
 	of_unittest_overlay();

-- 
2.39.2

