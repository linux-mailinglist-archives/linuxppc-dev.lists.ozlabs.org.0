Return-Path: <linuxppc-dev+bounces-2925-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBE09BF40F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 18:11:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkBYr61MXz3bdX;
	Thu,  7 Nov 2024 04:11:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730913072;
	cv=none; b=cP17EL4L+Owm7/QiYbGHcCIX9idZtbhPW6V6VSzNfjQoc4qi761fTm9UjEpOIokjm5SC4Ek88l8BempQLvAceKim1k0+IKRI+tzI1zXLMttiyIQsPg0IQP6dsP3t2F5Ipjr1ICKN01AChBblprU39OvoBisaG9KfJL93K3QPMG6qbjdgjS9EQPBkgIty6w6Y6ZT6gIYNGaKmXl0DRrepk4hA6yYOXr/z0XCcjsLy28B3+D929YX9qQojHJDHzdDwlr5kWWWabdJ7XkWZ+M3itpiy4nVC8FsAfxg5PQfKK4ugTB0BgqO/KHQ9FscVenxtttIm6UzY4gtkZb5ER6Obuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730913072; c=relaxed/relaxed;
	bh=uH//ZT3t90HXi65kvHV2aag96qELbsw8055V8cBsltM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HV1b9nJKOthI+SXENADx/7oBS35YFIp9l9OTiZED4wLI4F67cxucucMHbOTs0aBoAUojshdzq/CY5tHTOoiAH1LrvMvURH4lzLNxudfd/1CmwSVVZNOSiMgLZ6O3OhRYRPJm2vBoV6DulUfHCrhMg+FbjXMB6KLoRaQANSN/yWOUxWokOGV1jNmb7Nq3IK9p3AaX+cVFLaxhFpk+MlBX/Nz2Z5SSjw1rkgn3P1bGkHZaMD7V413edOiVRj+v26ZlIYT8RguJQXpzZMoEbUIrZPavRF77UC0P1m+YcEMcLa4xniAO2Gx3y1sqDdXhvvxuo7lAXHbkEBXyl/M0swCLWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IWoz4v9u; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IWoz4v9u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkBYm2lMvz3bdS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 04:11:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 78E11A43F1B;
	Wed,  6 Nov 2024 17:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8359C4CEC6;
	Wed,  6 Nov 2024 17:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730913065;
	bh=FXUgqm5DxwD9CzDMHLka46QpAIfBGKbwRgNSxv+cqeY=;
	h=From:To:Cc:Subject:Date:From;
	b=IWoz4v9ur/yXAyLT90tQC+L1/PgVVa+DSIlQWPmYdFFye1Vn+H/hmeIIihMyB9syE
	 1A7Gbv33l46RHJPaoPH8mR7iO2bqwYZxTrbH6xgrU4kE0IXJeMoI+n/z9SQJV09nwT
	 aqO1SYXdgTv+en5ohoLp0CiLbVVwNuxDA1UzoS5jINUUkJTqdSOsC/MJ6bz0VX8XhQ
	 VFp1x4aj01rj1fwhjIXAzbIBW8A6b1CC6aWdIwtXM91r6H61a3GqfNux2yT9Si9amt
	 XYLUq+02QzVHHrqpXlTNdSPJksT5ZBhETEtOqLgSZBfmRjMznHEG9sLVEQgMXrjK4I
	 Xq/cJBzUuVFxQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Saravana Kannan <saravanak@google.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells handling
Date: Wed,  6 Nov 2024 11:10:27 -0600
Message-ID: <20241106171028.3830266-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
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
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

While OpenFirmware originally allowed walking parent nodes and default
root values for #address-cells and #size-cells, FDT has long required
explicit values. It's been a warning in dtc for the root node since the
beginning (2005) and for any parent node since 2007. Of course, not all
FDT uses dtc, but that should be the majority by far. The various
extracted OF devicetrees I have dating back to the 1990s (various
PowerMac, OLPC, PASemi Nemo) all have explicit root node properties. The
warning is disabled for Sparc as there are known systems relying on
default root node values.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Add a define for excluded platforms to help clarify the intent
   is to have an exclude list and make adding platforms easier.
 - Also warn when walking parent nodes.
---
 drivers/of/base.c | 28 ++++++++++++++++++++++------
 drivers/of/fdt.c  |  4 ++--
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 20603d3c9931..39fb59b666f3 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -87,15 +87,25 @@ static bool __of_node_is_type(const struct device_node *np, const char *type)
 	return np && match && type && !strcmp(match, type);
 }
 
+#define EXCLUDED_DEFAULT_CELLS_PLATFORMS ( \
+	IS_ENABLED(CONFIG_SPARC) \
+)
+
 int of_bus_n_addr_cells(struct device_node *np)
 {
 	u32 cells;
 
-	for (; np; np = np->parent)
+	for (; np; np = np->parent) {
 		if (!of_property_read_u32(np, "#address-cells", &cells))
 			return cells;
-
-	/* No #address-cells property for the root node */
+		/*
+		 * Default root value and walking parent nodes for "#address-cells"
+		 * is deprecated. Any platforms which hit this warning should
+		 * be added to the excluded list.
+		 */
+		WARN_ONCE(!EXCLUDED_DEFAULT_CELLS_PLATFORMS,
+			  "Missing '#address-cells' in %pOF\n", np);
+	}
 	return OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
 }
 
@@ -112,11 +122,17 @@ int of_bus_n_size_cells(struct device_node *np)
 {
 	u32 cells;
 
-	for (; np; np = np->parent)
+	for (; np; np = np->parent) {
 		if (!of_property_read_u32(np, "#size-cells", &cells))
 			return cells;
-
-	/* No #size-cells property for the root node */
+		/*
+		 * Default root value and walking parent nodes for "#size-cells"
+		 * is deprecated. Any platforms which hit this warning should
+		 * be added to the excluded list.
+		 */
+		WARN_ONCE(!EXCLUDED_DEFAULT_CELLS_PLATFORMS,
+			  "Missing '#size-cells' in %pOF\n", np);
+	}
 	return OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
 }
 
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 4d528c10df3a..d79707fb2eb1 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -938,12 +938,12 @@ int __init early_init_dt_scan_root(void)
 	dt_root_addr_cells = OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
 
 	prop = of_get_flat_dt_prop(node, "#size-cells", NULL);
-	if (prop)
+	if (!WARN(!prop, "No '#size-cells' in root node\n"))
 		dt_root_size_cells = be32_to_cpup(prop);
 	pr_debug("dt_root_size_cells = %x\n", dt_root_size_cells);
 
 	prop = of_get_flat_dt_prop(node, "#address-cells", NULL);
-	if (prop)
+	if (!WARN(!prop, "No '#address-cells' in root node\n"))
 		dt_root_addr_cells = be32_to_cpup(prop);
 	pr_debug("dt_root_addr_cells = %x\n", dt_root_addr_cells);
 
-- 
2.45.2


