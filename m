Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3205615F9EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 23:47:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K7ml1bzwzDqm9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 09:47:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48K7hJ15xGzDqkS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 09:43:27 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id 77so10685894oty.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 14:43:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rEnB5+kU+FjhvIdO5SQl7ydF6Vj7dX77BsiIjtiVufU=;
 b=EmL52jpNBix0UC38rbnTbbPRmfnAX0uPFZwj3WUnumakXk7S8BNSHLO4WG/YZ8mB2y
 W0ufmhZgGKAKR/UAkonKxWhw1oS0SX2xr4DMkoIj925ZYXsRZJuHn8xpSGwLn9/b7juS
 lVAlCJ/Lmv8akPuRxaTQW5Bx0r7c5cB+G1q+f7kr+v6wI+frxWA1epqvWydE+6c4Wsx/
 3pqDEyFBXLflB20dCcKNvtpIK193YqzVtD2loyrnMGuhXaL375IhzmhWHSFv+8KH8YWK
 2vHw+WsNMzHyk+NynGCULxvm5OtMoPsvDYVn87P++XyTXD3SNRn9se2bVWn/74zBvq42
 neGA==
X-Gm-Message-State: APjAAAUKsERuGHE1ROr0Y7LN+M8v7dHRUGmqboalBDfx180YnWfbSKXA
 cIXEbCp9ar64bLiR2d7E0A==
X-Google-Smtp-Source: APXvYqy5SwntOtr1CzPuatwaYlGx9mBbjcZbXp6MOXwEDNH/Uw68ZFD5Up2zlZRyFWflVldIKSAeEA==
X-Received: by 2002:a9d:3b09:: with SMTP id z9mr4087034otb.195.1581720205444; 
 Fri, 14 Feb 2020 14:43:25 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id m69sm2453167otc.78.2020.02.14.14.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 14:43:24 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org,
	Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 1/7] of/address: Move range parser code out of CONFIG_PCI
Date: Fri, 14 Feb 2020 16:43:16 -0600
Message-Id: <20200214224322.20030-2-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214224322.20030-1-robh@kernel.org>
References: <20200214224322.20030-1-robh@kernel.org>
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
Cc: Michal Simek <monstr@monstr.eu>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation to make the range parsing code work for non-PCI buses,
move the parsing functions out from the CONFIG_PCI #ifdef.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/address.c | 215 ++++++++++++++++++++++---------------------
 1 file changed, 109 insertions(+), 106 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index e8a39c3ec4d4..846045a48395 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -100,6 +100,28 @@ static unsigned int of_bus_default_get_flags(const __be32 *addr)
 	return IORESOURCE_MEM;
 }
 
+static unsigned int of_bus_pci_get_flags(const __be32 *addr)
+{
+	unsigned int flags = 0;
+	u32 w = be32_to_cpup(addr);
+
+	if (!IS_ENABLED(CONFIG_PCI))
+		return 0;
+
+	switch((w >> 24) & 0x03) {
+	case 0x01:
+		flags |= IORESOURCE_IO;
+		break;
+	case 0x02: /* 32 bits */
+	case 0x03: /* 64 bits */
+		flags |= IORESOURCE_MEM;
+		break;
+	}
+	if (w & 0x40000000)
+		flags |= IORESOURCE_PREFETCH;
+	return flags;
+}
+
 #ifdef CONFIG_PCI
 /*
  * PCI bus specific translator
@@ -125,25 +147,6 @@ static void of_bus_pci_count_cells(struct device_node *np,
 		*sizec = 2;
 }
 
-static unsigned int of_bus_pci_get_flags(const __be32 *addr)
-{
-	unsigned int flags = 0;
-	u32 w = be32_to_cpup(addr);
-
-	switch((w >> 24) & 0x03) {
-	case 0x01:
-		flags |= IORESOURCE_IO;
-		break;
-	case 0x02: /* 32 bits */
-	case 0x03: /* 64 bits */
-		flags |= IORESOURCE_MEM;
-		break;
-	}
-	if (w & 0x40000000)
-		flags |= IORESOURCE_PREFETCH;
-	return flags;
-}
-
 static u64 of_bus_pci_map(__be32 *addr, const __be32 *range, int na, int ns,
 		int pna)
 {
@@ -234,93 +237,6 @@ int of_pci_address_to_resource(struct device_node *dev, int bar,
 }
 EXPORT_SYMBOL_GPL(of_pci_address_to_resource);
 
-static int parser_init(struct of_pci_range_parser *parser,
-			struct device_node *node, const char *name)
-{
-	const int na = 3, ns = 2;
-	int rlen;
-
-	parser->node = node;
-	parser->pna = of_n_addr_cells(node);
-	parser->np = parser->pna + na + ns;
-	parser->dma = !strcmp(name, "dma-ranges");
-
-	parser->range = of_get_property(node, name, &rlen);
-	if (parser->range == NULL)
-		return -ENOENT;
-
-	parser->end = parser->range + rlen / sizeof(__be32);
-
-	return 0;
-}
-
-int of_pci_range_parser_init(struct of_pci_range_parser *parser,
-				struct device_node *node)
-{
-	return parser_init(parser, node, "ranges");
-}
-EXPORT_SYMBOL_GPL(of_pci_range_parser_init);
-
-int of_pci_dma_range_parser_init(struct of_pci_range_parser *parser,
-				struct device_node *node)
-{
-	return parser_init(parser, node, "dma-ranges");
-}
-EXPORT_SYMBOL_GPL(of_pci_dma_range_parser_init);
-
-struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
-						struct of_pci_range *range)
-{
-	const int na = 3, ns = 2;
-
-	if (!range)
-		return NULL;
-
-	if (!parser->range || parser->range + parser->np > parser->end)
-		return NULL;
-
-	range->pci_space = be32_to_cpup(parser->range);
-	range->flags = of_bus_pci_get_flags(parser->range);
-	range->pci_addr = of_read_number(parser->range + 1, ns);
-	if (parser->dma)
-		range->cpu_addr = of_translate_dma_address(parser->node,
-				parser->range + na);
-	else
-		range->cpu_addr = of_translate_address(parser->node,
-				parser->range + na);
-	range->size = of_read_number(parser->range + parser->pna + na, ns);
-
-	parser->range += parser->np;
-
-	/* Now consume following elements while they are contiguous */
-	while (parser->range + parser->np <= parser->end) {
-		u32 flags;
-		u64 pci_addr, cpu_addr, size;
-
-		flags = of_bus_pci_get_flags(parser->range);
-		pci_addr = of_read_number(parser->range + 1, ns);
-		if (parser->dma)
-			cpu_addr = of_translate_dma_address(parser->node,
-					parser->range + na);
-		else
-			cpu_addr = of_translate_address(parser->node,
-					parser->range + na);
-		size = of_read_number(parser->range + parser->pna + na, ns);
-
-		if (flags != range->flags)
-			break;
-		if (pci_addr != range->pci_addr + range->size ||
-		    cpu_addr != range->cpu_addr + range->size)
-			break;
-
-		range->size += size;
-		parser->range += parser->np;
-	}
-
-	return range;
-}
-EXPORT_SYMBOL_GPL(of_pci_range_parser_one);
-
 /*
  * of_pci_range_to_resource - Create a resource from an of_pci_range
  * @range:	the PCI range that describes the resource
@@ -775,6 +691,93 @@ const __be32 *of_get_address(struct device_node *dev, int index, u64 *size,
 }
 EXPORT_SYMBOL(of_get_address);
 
+static int parser_init(struct of_pci_range_parser *parser,
+			struct device_node *node, const char *name)
+{
+	const int na = 3, ns = 2;
+	int rlen;
+
+	parser->node = node;
+	parser->pna = of_n_addr_cells(node);
+	parser->np = parser->pna + na + ns;
+	parser->dma = !strcmp(name, "dma-ranges");
+
+	parser->range = of_get_property(node, name, &rlen);
+	if (parser->range == NULL)
+		return -ENOENT;
+
+	parser->end = parser->range + rlen / sizeof(__be32);
+
+	return 0;
+}
+
+int of_pci_range_parser_init(struct of_pci_range_parser *parser,
+				struct device_node *node)
+{
+	return parser_init(parser, node, "ranges");
+}
+EXPORT_SYMBOL_GPL(of_pci_range_parser_init);
+
+int of_pci_dma_range_parser_init(struct of_pci_range_parser *parser,
+				struct device_node *node)
+{
+	return parser_init(parser, node, "dma-ranges");
+}
+EXPORT_SYMBOL_GPL(of_pci_dma_range_parser_init);
+
+struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
+						struct of_pci_range *range)
+{
+	const int na = 3, ns = 2;
+
+	if (!range)
+		return NULL;
+
+	if (!parser->range || parser->range + parser->np > parser->end)
+		return NULL;
+
+	range->pci_space = be32_to_cpup(parser->range);
+	range->flags = of_bus_pci_get_flags(parser->range);
+	range->pci_addr = of_read_number(parser->range + 1, ns);
+	if (parser->dma)
+		range->cpu_addr = of_translate_dma_address(parser->node,
+				parser->range + na);
+	else
+		range->cpu_addr = of_translate_address(parser->node,
+				parser->range + na);
+	range->size = of_read_number(parser->range + parser->pna + na, ns);
+
+	parser->range += parser->np;
+
+	/* Now consume following elements while they are contiguous */
+	while (parser->range + parser->np <= parser->end) {
+		u32 flags;
+		u64 pci_addr, cpu_addr, size;
+
+		flags = of_bus_pci_get_flags(parser->range);
+		pci_addr = of_read_number(parser->range + 1, ns);
+		if (parser->dma)
+			cpu_addr = of_translate_dma_address(parser->node,
+					parser->range + na);
+		else
+			cpu_addr = of_translate_address(parser->node,
+					parser->range + na);
+		size = of_read_number(parser->range + parser->pna + na, ns);
+
+		if (flags != range->flags)
+			break;
+		if (pci_addr != range->pci_addr + range->size ||
+		    cpu_addr != range->cpu_addr + range->size)
+			break;
+
+		range->size += size;
+		parser->range += parser->np;
+	}
+
+	return range;
+}
+EXPORT_SYMBOL_GPL(of_pci_range_parser_one);
+
 static u64 of_translate_ioport(struct device_node *dev, const __be32 *in_addr,
 			u64 size)
 {
-- 
2.20.1

