Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4641515F9FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 23:53:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K7wD0jjxzDqnW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 09:53:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48K7hN0jhFzDqkc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 09:43:32 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id j16so10715709otl.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 14:43:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o/fB8IpN2HvJy1SWgbzx0N4XyHZ1oSMpdaP9MXF/We8=;
 b=BlfxLW3yr7MQ2hNfTmXazff8hutkhwAPms+dCjQEhYxhU/rHbZCw/CIchivZsnS6d3
 +tM/MY1pAGsCMmjq276gY1l7nFa+aWti1rxAr18vLrSFDFoGloKTs2NFpQ3DRVRp5Y91
 GokG8fGOUq9a/ksKXisDiqe8uNqpAmDzldNA9OvZZwaNT4W2Is1VBsIQdS5M7St2zc5e
 z/hT38w+09X3lLaLbZWTOQh4KgpwUkrP5o0lqu9Sorh+cProeS5XRW+yO3ocYTMNZo2S
 SgqR+zR3JFUyVvvs2qeYmv8czGXck0453lJ1oj9seILJvLrDlgEQygvfyKflXBRAGesx
 nZJQ==
X-Gm-Message-State: APjAAAV6HzAYRmn9+LtB15P5IFoWs93zNHf56qfZ0YTaEKGimFxIKgVG
 c1eFDjTzoQwwi5iHUQjM1A==
X-Google-Smtp-Source: APXvYqxPb7eZ0ET0dBpwWANxrcTfk4nicz/9JegOP1idWSuzHFEIGRzPBmcfQgcoYGCJ+bNZJYwQnw==
X-Received: by 2002:a9d:649a:: with SMTP id g26mr3937088otl.15.1581720210006; 
 Fri, 14 Feb 2020 14:43:30 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id m69sm2453167otc.78.2020.02.14.14.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 14:43:29 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org,
	Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 5/7] of/address: Rework of_pci_range parsing for non-PCI buses
Date: Fri, 14 Feb 2020 16:43:20 -0600
Message-Id: <20200214224322.20030-6-robh@kernel.org>
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

The only PCI specific part of of_pci_range_parser_one() is the handling
of the 3rd address cell. Rework it to work on regular 1 and 2 cell
addresses.

Use defines and a union to avoid a treewide renaming of the parsing
helpers and struct.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/address.c       | 33 +++++++++++++++++++++------------
 include/linux/of_address.h | 12 +++++++++---
 2 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 5d608d7c10d6..6d33f849f114 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -694,12 +694,12 @@ EXPORT_SYMBOL(of_get_address);
 static int parser_init(struct of_pci_range_parser *parser,
 			struct device_node *node, const char *name)
 {
-	const int na = 3, ns = 2;
 	int rlen;
 
 	parser->node = node;
 	parser->pna = of_n_addr_cells(node);
-	parser->np = parser->pna + na + ns;
+	parser->na = of_bus_n_addr_cells(node);
+	parser->ns = of_bus_n_size_cells(node);
 	parser->dma = !strcmp(name, "dma-ranges");
 
 	parser->range = of_get_property(node, name, &rlen);
@@ -724,20 +724,28 @@ int of_pci_dma_range_parser_init(struct of_pci_range_parser *parser,
 	return parser_init(parser, node, "dma-ranges");
 }
 EXPORT_SYMBOL_GPL(of_pci_dma_range_parser_init);
+#define of_dma_range_parser_init of_pci_dma_range_parser_init
 
 struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 						struct of_pci_range *range)
 {
-	const int na = 3, ns = 2;
+	int na = parser->na;
+	int ns = parser->ns;
+	int np = parser->pna + na + ns;
 
 	if (!range)
 		return NULL;
 
-	if (!parser->range || parser->range + parser->np > parser->end)
+	if (!parser->range || parser->range + np > parser->end)
 		return NULL;
 
-	range->flags = of_bus_pci_get_flags(parser->range);
-	range->pci_addr = of_read_number(parser->range + 1, ns);
+	if (parser->na == 3)
+		range->flags = of_bus_pci_get_flags(parser->range);
+	else
+		range->flags = 0;
+
+	range->pci_addr = of_read_number(parser->range, na);
+
 	if (parser->dma)
 		range->cpu_addr = of_translate_dma_address(parser->node,
 				parser->range + na);
@@ -746,15 +754,16 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 				parser->range + na);
 	range->size = of_read_number(parser->range + parser->pna + na, ns);
 
-	parser->range += parser->np;
+	parser->range += np;
 
 	/* Now consume following elements while they are contiguous */
-	while (parser->range + parser->np <= parser->end) {
-		u32 flags;
+	while (parser->range + np <= parser->end) {
+		u32 flags = 0;
 		u64 pci_addr, cpu_addr, size;
 
-		flags = of_bus_pci_get_flags(parser->range);
-		pci_addr = of_read_number(parser->range + 1, ns);
+		if (parser->na == 3)
+			flags = of_bus_pci_get_flags(parser->range);
+		pci_addr = of_read_number(parser->range, na);
 		if (parser->dma)
 			cpu_addr = of_translate_dma_address(parser->node,
 					parser->range + na);
@@ -770,7 +779,7 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 			break;
 
 		range->size += size;
-		parser->range += parser->np;
+		parser->range += np;
 	}
 
 	return range;
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 8d12bf18e80b..763022ed3456 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -10,20 +10,27 @@ struct of_pci_range_parser {
 	struct device_node *node;
 	const __be32 *range;
 	const __be32 *end;
-	int np;
+	int na;
+	int ns;
 	int pna;
 	bool dma;
 };
+#define of_range_parser of_pci_range_parser
 
 struct of_pci_range {
-	u64 pci_addr;
+	union {
+		u64 pci_addr;
+		u64 bus_addr;
+	};
 	u64 cpu_addr;
 	u64 size;
 	u32 flags;
 };
+#define of_range of_pci_range
 
 #define for_each_of_pci_range(parser, range) \
 	for (; of_pci_range_parser_one(parser, range);)
+#define for_each_of_range for_each_of_pci_range
 
 /* Translate a DMA address from device space to CPU space */
 extern u64 of_translate_dma_address(struct device_node *dev,
@@ -142,4 +149,3 @@ static inline int of_pci_range_to_resource(struct of_pci_range *range,
 #endif /* CONFIG_OF_ADDRESS && CONFIG_PCI */
 
 #endif /* __OF_ADDRESS_H */
-
-- 
2.20.1

