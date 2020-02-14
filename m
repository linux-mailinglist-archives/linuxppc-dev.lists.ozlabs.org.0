Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D38E515F9FC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 23:55:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K7xz0BkCzDqs8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 09:55:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48K7hP35GFzDqkw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 09:43:33 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id 59so10675597otp.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 14:43:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pxqrTmSWehNrZNpQ90LT3R+yI3An6tFPJHq9Cs6TvSY=;
 b=myDWTqpIp0kzuurXVpFoB+VzadlBh3zKRpHmdj+/Pj12mKYlgwlBGmaZqtIWsBNtuZ
 x+AlBvn8X9E8A1WP0Z/p7SYKL7bHactvj6drTzrDxR/tt17/Slph2y4qzU7nZ7koQX3K
 KnHdSVYmdWXDQeoUaCvLd1Nux8BeQZ+sBREyubYkG/AeMW8a4LNdnlTbwFZUC8Juh/Xm
 /b+dxs8ZLyi1LohohffOsfJan+My3gNz0nXHQwrk1/GItxrAUfFztSPik6yculrhk2sK
 QT4Pvl4I5jCUM4+gRJEgzU3lUWcv4VHGtoHZ4io/+314nF+GLIQ8FJRRBFwcFAG9a6DV
 7e9A==
X-Gm-Message-State: APjAAAUklXBCCdtJOb3JhwkhlnyIp9S5o7re4E5pOdRkh+NVVsIigToC
 rKSlOdx3ijM7DqIlR8bJdw==
X-Google-Smtp-Source: APXvYqzRyruX6jzkcJBQ4Ol9aSCzNcGPj4+4pT7mi4zsBVbfgiMtU6G60aL26K2rvdNgbEenPv9cKg==
X-Received: by 2002:a05:6830:1049:: with SMTP id
 b9mr4276236otp.100.1581720211206; 
 Fri, 14 Feb 2020 14:43:31 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id m69sm2453167otc.78.2020.02.14.14.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 14:43:30 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org,
	Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 6/7] of/address: use range parser for of_dma_get_range
Date: Fri, 14 Feb 2020 16:43:21 -0600
Message-Id: <20200214224322.20030-7-robh@kernel.org>
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

of_dma_get_range() does the same ranges parsing as
of_pci_range_parser_one(), so let's refactor of_dma_get_range() to use
it instead.

This commit is no functional change. Subsequent commits will parse more
than the 1st dma-ranges entry.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/address.c | 38 +++++++++++++-------------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 6d33f849f114..a2c45812a50e 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -939,10 +939,11 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 {
 	struct device_node *node = of_node_get(np);
 	const __be32 *ranges = NULL;
-	int len, naddr, nsize, pna;
+	int len;
 	int ret = 0;
 	bool found_dma_ranges = false;
-	u64 dmaaddr;
+	struct of_range_parser parser;
+	struct of_range range;
 
 	while (node) {
 		ranges = of_get_property(node, "dma-ranges", &len);
@@ -967,33 +968,20 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 		goto out;
 	}
 
-	naddr = of_bus_n_addr_cells(node);
-	nsize = of_bus_n_size_cells(node);
-	pna = of_n_addr_cells(node);
-	if ((len / sizeof(__be32)) % (pna + naddr + nsize)) {
-		ret = -EINVAL;
-		goto out;
-	}
+	of_dma_range_parser_init(&parser, node);
+
+	for_each_of_range(&parser, &range) {
+		pr_debug("dma_addr(%llx) cpu_addr(%llx) size(%llx)\n",
+			 range.bus_addr, range.cpu_addr, range.size);
+
+		*dma_addr = range.bus_addr;
+		*paddr = range.cpu_addr;
+		*size = range.size;
 
-	/* dma-ranges format:
-	 * DMA addr	: naddr cells
-	 * CPU addr	: pna cells
-	 * size		: nsize cells
-	 */
-	dmaaddr = of_read_number(ranges, naddr);
-	*paddr = of_translate_dma_address(node, ranges + naddr);
-	if (*paddr == OF_BAD_ADDR) {
-		pr_err("translation of DMA address(%llx) to CPU address failed node(%pOF)\n",
-		       dmaaddr, np);
-		ret = -EINVAL;
 		goto out;
 	}
-	*dma_addr = dmaaddr;
-
-	*size = of_read_number(ranges + naddr + pna, nsize);
 
-	pr_debug("dma_addr(%llx) cpu_addr(%llx) size(%llx)\n",
-		 *dma_addr, *paddr, *size);
+	pr_err("translation of DMA ranges failed on node(%pOF)\n", np);
 
 out:
 	of_node_put(node);
-- 
2.20.1

