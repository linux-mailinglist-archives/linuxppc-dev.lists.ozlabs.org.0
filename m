Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4A115FA03
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 23:57:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K8034t85zDqDh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 09:57:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.193;
 helo=mail-oi1-f193.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48K7hQ60gGzDql2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 09:43:34 +1100 (AEDT)
Received: by mail-oi1-f193.google.com with SMTP id v19so10953207oic.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 14:43:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RRK+etse5GdhzRRMSbN0AsTFv8NtL6Mf75PwYVcJU44=;
 b=IyTUAVoYaA75uxle16LamecAJoO7iiERwfighPAcpUp70vV1HC57TJUdNLzpFQfbdu
 3MsVmYoJkKr151c7hu/NWEpI23tTnOvXo+KCYJPfEE/txE0LTA7BZ88JDrmp/UMksMDL
 aTtQJfi2Em8154/1ceEt6VlsTQXuxuPXhGIcvG1BkmhHbaVoSB+IbgLlVeazLM+aL1Jk
 OCqtQXD+/jFM9M7Ao06zimEWcUo1bWro5gdhlbOjj+jn7YOn1J9rmXcXzKvEDllLcytn
 +Sz6ik0ZJjohAi/fn2o+93v/QLBUrE1ubGu0/st8e5+vXbMQ+noGaBmfVzwibaVSQmU4
 h7iQ==
X-Gm-Message-State: APjAAAWVyHa1P/UTO1mLbmINDop2+PKKI++Mk9RJhW37cPviOEcwE+tt
 pwQzAX5Q63NKE8PuZWBw0Q==
X-Google-Smtp-Source: APXvYqz909Fzl/Mv16+lZxspbsDGyoBiYnJJXHR2kdCOGJNisRMIBPTjbnRMOa+Vuf4buMe01/NvvA==
X-Received: by 2002:aca:f0b:: with SMTP id 11mr3564215oip.34.1581720212297;
 Fri, 14 Feb 2020 14:43:32 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id m69sm2453167otc.78.2020.02.14.14.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 14:43:31 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org,
	Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 7/7] of/address: Support multiple 'dma-ranges' entries
Date: Fri, 14 Feb 2020 16:43:22 -0600
Message-Id: <20200214224322.20030-8-robh@kernel.org>
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

Currently, the DMA offset and mask for a device are set based only on the
first 'dma-ranges' entry. We should really be using all the entries. The
kernel doesn't yet support multiple offsets and sizes, so the best we can
do is to find the biggest size for a single offset. The algorithm is
copied from acpi_dma_get_range().

If there's different offsets from the first entry, then we warn and
continue. It really should be an error, but this will likely break
existing DTs.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/address.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index a2c45812a50e..8eea3f6e29a4 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -944,6 +944,7 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 	bool found_dma_ranges = false;
 	struct of_range_parser parser;
 	struct of_range range;
+	u64 dma_start = U64_MAX, dma_end = 0, dma_offset = 0;
 
 	while (node) {
 		ranges = of_get_property(node, "dma-ranges", &len);
@@ -974,14 +975,33 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 		pr_debug("dma_addr(%llx) cpu_addr(%llx) size(%llx)\n",
 			 range.bus_addr, range.cpu_addr, range.size);
 
-		*dma_addr = range.bus_addr;
-		*paddr = range.cpu_addr;
-		*size = range.size;
+		if (dma_offset && range.cpu_addr - range.bus_addr != dma_offset) {
+			pr_warn("Can't handle multiple dma-ranges with different offsets on node(%pOF)\n", node);
+			/* Don't error out as we'd break some existing DTs */
+			continue;
+		}
+		dma_offset = range.cpu_addr - range.bus_addr;
+
+		/* Take lower and upper limits */
+		if (range.bus_addr < dma_start)
+			dma_start = range.bus_addr;
+		if (range.bus_addr + range.size > dma_end)
+			dma_end = range.bus_addr + range.size;
+	}
 
+	if (dma_start >= dma_end) {
+		ret = -EINVAL;
+		pr_debug("Invalid DMA ranges configuration on node(%pOF)\n",
+			 node);
 		goto out;
 	}
 
-	pr_err("translation of DMA ranges failed on node(%pOF)\n", np);
+	*dma_addr = dma_start;
+	*size = dma_end - dma_start;
+	*paddr = dma_start + dma_offset;
+
+	pr_debug("final: dma_addr(%llx) cpu_addr(%llx) size(%llx)\n",
+		 *dma_addr, *paddr, *size);
 
 out:
 	of_node_put(node);
-- 
2.20.1

