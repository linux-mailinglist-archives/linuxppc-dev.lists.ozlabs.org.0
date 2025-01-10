Return-Path: <linuxppc-dev+bounces-5016-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D433A09D64
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 22:50:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVFhT0lQYz3cD1;
	Sat, 11 Jan 2025 08:50:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736545849;
	cv=none; b=DMq3Z0zKs7htuqfj10m/lz06aIiinf7/WxEc4pwUPlhQbTaFmJM+WMEWxnwdbfkB8B+eEf0Rw+MoE59jK9hXvZ5Yo9vmISRalTJ/LAbaSdg3rMt0D0qmW/1rQ6rEVlHuQgwrwt1Q7A6C7+Pq3a+WeDxjjSGjbOWPXRMINpk/AaLZFkhdN9o+XeytlFcDvSElU5T5Dyeu3Eq5K3LJurNp2D3ofg7nkydwAJ/my9LCIKuw3/1NH1PMzh6fqkS3ZcC085JnnHlEZM5yn4MMLblKPzvxaVLCsv1nYfPrOVv+jqwUnsXps7qV11iWN+AkKHSOb0nWW6hIeI7Kt3KePlXFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736545849; c=relaxed/relaxed;
	bh=lagCCFHyRv0NErEVgQNPdoiuOmtBOCS8991dZcSyA4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LnOTxh6LKjvsnVxhonCba2ZQrm82rGoQwWC1You0jee7ENGnQw/ckaq2abfb7bEMFBbadlt0kEger4fsrMrUYLhPTnw/Kdr76PPiRAwnX8Vl/TL5olZ/NfhlWifS+GWGwN8KKBp08kPwBJJKFtoHErdUQjg6rwGITZ6LHP1biFrvToD4P4sct9cYX7U0g/W+afo31SKCsiopPuAC0m/HD/YFOtJUF4Iyb+ufpcucumhn5YD981VBu8FcTx3HrMiszaQuGtVD/tF2jqqejmNoYeMft83oajLnzFR7sY97QAN8jbri+m8dXUQbOAmiGv84m1TsuEC1aciw3KwDm2d8dA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=exoxjQ1z; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=exoxjQ1z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVFhR5fNTz3cBN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 08:50:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B69B1A4299D;
	Fri, 10 Jan 2025 21:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0CFDC4CEDF;
	Fri, 10 Jan 2025 21:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736545843;
	bh=VdYC++UgtT3zpTpM+j8NPemw8YOa7RrCYBZxDppHFsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=exoxjQ1zVSTTH1oxr8QovNACX1bTNqEbEl+DanKYdfAiJK8YMDORLw8DviTn0MB+S
	 fI0SjeySDGmN7OhZByTCeXmB3icOzfwooi1ipfgH9/6S5FxhiIkoV5pCJBhxyXo7jb
	 7vdyOivNNgwdchbR201DepTIvijSupYvGFOO7v+WE4nrOklvU3XNFGhQ7WFxq0uMOV
	 ab1WkDjMEY/+b9XBoHxVygzUcIIJLPQTUWRtjGQclm21ryfTXKyS01p1FDKR8qu8la
	 oDOQFB3MIbhUAiK7Do2k6fK/GQqlgtkz9Hg6zg2LRtVYfHRRWkk1k9Lu+T91DamE4F
	 EQ1xFg6EQBmRg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Saravana Kannan <saravanak@google.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] of/address: Fix WARN when attempting translating non-translatable addresses
Date: Fri, 10 Jan 2025 15:50:29 -0600
Message-ID: <20250110215030.3637845-2-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250110215030.3637845-1-robh@kernel.org>
References: <20250110215030.3637845-1-robh@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The recently added WARN() for deprecated #address-cells and #size-cells
triggered a WARN when of_platform_populate() (which calls
of_address_to_resource()) is used on nodes with non-translatable
addresses. This case is expected to return an error.

Rework the bus matching to allow no match and make the default require
an #address-cells property. That should be safe to do as any platform
missing #address-cells would have a warning already.

Fixes: 045b14ca5c36 ("of: WARN on deprecated #address-cells/#size-cells handling")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/address.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index c1f1c810e810..8770004d9b08 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -340,6 +340,15 @@ static int of_bus_default_flags_match(struct device_node *np)
 	return of_property_present(np, "#address-cells") && (of_bus_n_addr_cells(np) == 3);
 }
 
+static int of_bus_default_match(struct device_node *np)
+{
+	/*
+	 * Check for presence first since of_bus_n_addr_cells() will warn when
+	 * walking parent nodes.
+	 */
+	return of_property_present(np, "#address-cells");
+}
+
 /*
  * Array of bus specific translators
  */
@@ -384,7 +393,7 @@ static const struct of_bus of_busses[] = {
 	{
 		.name = "default",
 		.addresses = "reg",
-		.match = NULL,
+		.match = of_bus_default_match,
 		.count_cells = of_bus_default_count_cells,
 		.map = of_bus_default_map,
 		.translate = of_bus_default_translate,
@@ -399,7 +408,6 @@ static const struct of_bus *of_match_bus(struct device_node *np)
 	for (i = 0; i < ARRAY_SIZE(of_busses); i++)
 		if (!of_busses[i].match || of_busses[i].match(np))
 			return &of_busses[i];
-	BUG();
 	return NULL;
 }
 
@@ -521,6 +529,8 @@ static u64 __of_translate_address(struct device_node *node,
 	if (parent == NULL)
 		return OF_BAD_ADDR;
 	bus = of_match_bus(parent);
+	if (!bus)
+		return OF_BAD_ADDR;
 
 	/* Count address cells & copy address locally */
 	bus->count_cells(dev, &na, &ns);
@@ -564,6 +574,8 @@ static u64 __of_translate_address(struct device_node *node,
 
 		/* Get new parent bus and counts */
 		pbus = of_match_bus(parent);
+		if (!pbus)
+			return OF_BAD_ADDR;
 		pbus->count_cells(dev, &pna, &pns);
 		if (!OF_CHECK_COUNTS(pna, pns)) {
 			pr_err("Bad cell count for %pOF\n", dev);
@@ -703,7 +715,7 @@ const __be32 *__of_get_address(struct device_node *dev, int index, int bar_no,
 
 	/* match the parent's bus type */
 	bus = of_match_bus(parent);
-	if (strcmp(bus->name, "pci") && (bar_no >= 0))
+	if (!bus || (strcmp(bus->name, "pci") && (bar_no >= 0)))
 		return NULL;
 
 	/* Get "reg" or "assigned-addresses" property */
-- 
2.45.2


