Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA8A6CCB63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 22:18:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmLcK6717z3fBV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 07:18:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.54; helo=mail-oa1-f54.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmLYJ41rSz3cP0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 07:16:20 +1100 (AEDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-17ab3a48158so14034104fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 13:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680034578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCPFOdIpNQUFJhPrmeiDu2DdLbGsab44HmyQyVjGzEY=;
        b=q/umkkuegG2CMmWn/x37FiUhK+YdBwquoPH1GUTNTO8UCpV008kCIFpXiZOWL1RYS9
         uB2QhPd4EaNv7PBmbZmGoCwzv4N01r+R9g1PWGqzH9GITI0yLnzJAvtuHGeKvpFEs9oF
         DLp0w/EBGrf1UcBxfwLCRNQ3Y1Jm1oNs2Pn89g9NG4yoXJC2fS6Q2D/8y3/xGrWrhvWn
         jcIMGaG6fXzUWVqVeUuXGVklpYo+9nzvBo78+Nq5XsCl8wAsU+QmE+1R/BZ4vjbN2I7n
         QgRTEqyCtMDF99M99g6WmekCRC3J6KnCeBHJ+ZDwfSoCNv/scn33lRgMxhzSxk88Fppc
         vnsA==
X-Gm-Message-State: AAQBX9fwV3BOwNGTujoUkX9qHKbnsZCNN8TVTq6Hu2SujrdhPH8Clmu0
	RnfKTGwh7itDeZgnytQ4jQ==
X-Google-Smtp-Source: AK7set/9uPgN0yCrXLJT35rq7Qat3QtTAkbocxc8t5r/+YdjprY4iCDY11yfxUH4UdUAQpsUjhc5qg==
X-Received: by 2002:a05:6870:a454:b0:177:c8dc:501f with SMTP id n20-20020a056870a45400b00177c8dc501fmr12122129oal.29.1680034578097;
        Tue, 28 Mar 2023 13:16:18 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v23-20020a056870709700b0017280f7d653sm11129807oae.35.2023.03.28.13.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 13:16:17 -0700 (PDT)
Received: (nullmailer pid 3993737 invoked by uid 1000);
	Tue, 28 Mar 2023 20:16:10 -0000
From: Rob Herring <robh@kernel.org>
Date: Tue, 28 Mar 2023 15:16:00 -0500
Subject: [PATCH 5/5] of/address: Add of_property_read_reg() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230328-dt-address-helpers-v1-5-e2456c3e77ab@kernel.org>
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

Add a helper, of_property_read_reg(), to read "reg" entries untranslated
address and size. This function is intended mainly for cases with an
untranslatable "reg" address (i.e. not MMIO). There's also a few
translatable cases such as address cells containing a bus chip-select
number.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/address.c       | 23 +++++++++++++++++++++++
 drivers/of/unittest.c      | 22 ++++++++++++++++++++++
 include/linux/of_address.h |  7 +++++++
 3 files changed, 52 insertions(+)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 8cfae24148e0..fdb15c6fb3b1 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -760,6 +760,29 @@ const __be32 *__of_get_address(struct device_node *dev, int index, int bar_no,
 }
 EXPORT_SYMBOL(__of_get_address);
 
+/**
+ * of_property_read_reg - Retrieve the specified "reg" entry index without translating
+ * @np: device tree node for which to retrieve "reg" from
+ * @idx: "reg" entry index to read
+ * @addr: return value for the untranslated address
+ * @size: return value for the entry size
+ *
+ * Returns -EINVAL if "reg" is not found. Returns 0 on success with addr and
+ * size values filled in.
+ */
+int of_property_read_reg(struct device_node *np, int idx, u64 *addr, u64 *size)
+{
+	const __be32 *prop = of_get_address(np, idx, size, NULL);
+
+	if (!prop)
+		return -EINVAL;
+
+	*addr = of_read_number(prop, of_n_addr_cells(np));
+
+	return 0;
+}
+EXPORT_SYMBOL(of_property_read_reg);
+
 static int parser_init(struct of_pci_range_parser *parser,
 			struct device_node *node, const char *name)
 {
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index eaeb58065acc..e73ecbef977b 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1134,6 +1134,27 @@ static void __init of_unittest_bus_3cell_ranges(void)
 	of_node_put(np);
 }
 
+static void __init of_unittest_reg(void)
+{
+	struct device_node *np;
+	int ret;
+	u64 addr, size;
+
+	np = of_find_node_by_path("/testcase-data/address-tests/bus@80000000/device@1000");
+	if (!np) {
+		pr_err("missing testcase data\n");
+		return;
+	}
+
+	ret = of_property_read_reg(np, 0, &addr, &size);
+	unittest(!ret, "of_property_read_reg(%pOF) returned error %d\n",
+		np, ret);
+	unittest(addr == 0x1000, "of_property_read_reg(%pOF) untranslated address (%llx) incorrect\n",
+		np, addr);
+
+	of_node_put(np);
+}
+
 static void __init of_unittest_parse_interrupts(void)
 {
 	struct device_node *np;
@@ -3772,6 +3793,7 @@ static int __init of_unittest(void)
 	of_unittest_pci_dma_ranges();
 	of_unittest_bus_ranges();
 	of_unittest_bus_3cell_ranges();
+	of_unittest_reg();
 	of_unittest_match_node();
 	of_unittest_platform_populate();
 	of_unittest_overlay();
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 5292f62c1baa..95cb6c5c2d67 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -72,6 +72,8 @@ void __iomem *of_io_request_and_map(struct device_node *device,
 extern const __be32 *__of_get_address(struct device_node *dev, int index, int bar_no,
 				      u64 *size, unsigned int *flags);
 
+int of_property_read_reg(struct device_node *np, int idx, u64 *addr, u64 *size);
+
 extern int of_pci_range_parser_init(struct of_pci_range_parser *parser,
 			struct device_node *node);
 extern int of_pci_dma_range_parser_init(struct of_pci_range_parser *parser,
@@ -106,6 +108,11 @@ static inline const __be32 *__of_get_address(struct device_node *dev, int index,
 	return NULL;
 }
 
+static int of_property_read_reg(struct device_node *np, int idx, u64 *addr, u64 *size)
+{
+	return -ENOSYS;
+}
+
 static inline int of_pci_range_parser_init(struct of_pci_range_parser *parser,
 			struct device_node *node)
 {

-- 
2.39.2

