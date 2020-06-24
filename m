Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C268206C83
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 08:35:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sD0N5smjzDqkb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 16:35:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JxQezt9w; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sCmY03H8zDqVq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 16:24:45 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id d27so866902qtg.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 23:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=So2/vu+EL+OrMb5JxMT9QwjF5FYYejn+1+Omdy+0Eak=;
 b=JxQezt9w39vQyvQ+aIYqYkcus1CujftpADe9rWdSWPYhV+GhDXM3gbFdHVmrM5GYp1
 rxTyuH+nkU/bvUko8gHiWmBMaZeKVjDVyGCOvzm9/SAVpkKHipzQslsP70cphMuofofP
 fANMd87yQ2gNV6tkKsuwPBuLkIWuYKdJ1sDv3OV+rYByzE4xwpzPv/7DZwgtmCWyCprW
 FB60+ZQKFheHuQez/lGMVU/UjSWadkDv2Wr2QRyvB/Jid3LyhUc9NmZE7DM6gpdFoXuX
 iSNF/0ZyrjmF4yNXTYvWLmq7WpTSMEj0Q41WVoFGN+E+yWpJK2m2yRUajpGo4OsL8Kcp
 BF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=So2/vu+EL+OrMb5JxMT9QwjF5FYYejn+1+Omdy+0Eak=;
 b=jZkkEHW7kSyTMwngkzz9GlGMPWQKTHzKMj7qyjiWv8u97nnB37H1J57DdzhdM5MCB1
 Vdz9j8P0p0l+avwYVJFmekq1855hcqczve2N8t4hTXNF2zxaroHrGRE0cDtalRYBw8am
 84mZ4e7yFG/i2GmMWmq/H7DWB9HssDF9jv4Yx7f7287KTUQMdz2yF/tFtjIrq8UWx8/l
 462+IMi1/tnvvHATxDUOQkXso71AL7Y2nJyKNzx3ARo7+deodrwjfTYvUkIX3VoujEj2
 AMAz3ocZdMqNwlhJLqSFHwksxbuisjo6P4IMVn6nlhcewT464jQUotYbwo2YM6u8xULp
 vFKg==
X-Gm-Message-State: AOAM533mDLDwmRXkSvzX8REhVEUHbG26UQQF3/Xxv6lrbXpNG9njG/Ej
 kE4FaHq7iBXvCn3/hyQ/TXg=
X-Google-Smtp-Source: ABdhPJwKQR+t/nHT6BBFIbQL5eKywbKwv9vmIT6XW3aFzkFZm7i4t9TMs0AVYUFbbfW2CFbrJrhSrA==
X-Received: by 2002:ac8:4e8c:: with SMTP id 12mr25311594qtp.20.1592979882301; 
 Tue, 23 Jun 2020 23:24:42 -0700 (PDT)
Received: from LeoBras.ibmuc.com (179-125-148-1.dynamic.desktop.com.br.
 [179.125.148.1])
 by smtp.gmail.com with ESMTPSA id n2sm2489727qtp.45.2020.06.23.23.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 23:24:41 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>
Subject: [PATCH v2 5/6] powerpc/pseries/iommu: Make use of DDW even if it does
 not map the partition
Date: Wed, 24 Jun 2020 03:24:10 -0300
Message-Id: <20200624062411.367796-6-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200624062411.367796-1-leobras.c@gmail.com>
References: <20200624062411.367796-1-leobras.c@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As of today, if a DDW is created and can't map the whole partition, it's
removed and the default DMA window "ibm,dma-window" is used instead.

Usually this DDW is bigger than the default DMA window, so it would be
better to make use of it instead.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 28 +++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 4fcf00016fb1..2d217cda4075 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -685,7 +685,7 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
 	struct iommu_table *tbl;
 	struct device_node *dn, *pdn;
 	struct pci_dn *ppci;
-	const __be32 *dma_window = NULL;
+	const __be32 *dma_window = NULL, *alt_dma_window = NULL;
 
 	dn = pci_bus_to_OF_node(bus);
 
@@ -699,8 +699,13 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
 			break;
 	}
 
+	/* If there is a DDW available, use it instead */
+	alt_dma_window = of_get_property(pdn, DIRECT64_PROPNAME, NULL);
+	if (alt_dma_window)
+		dma_window = alt_dma_window;
+
 	if (dma_window == NULL) {
-		pr_debug("  no ibm,dma-window property !\n");
+		pr_debug("  no ibm,dma-window nor linux,direct64-ddr-window-info property !\n");
 		return;
 	}
 
@@ -1166,16 +1171,19 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 			  query.page_size);
 		goto out_failed;
 	}
+
 	/* verify the window * number of ptes will map the partition */
-	/* check largest block * page size > max memory hotplug addr */
 	max_addr = ddw_memory_hotplug_max();
 	if (query.largest_available_block < (max_addr >> page_shift)) {
-		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu "
-			  "%llu-sized pages\n", max_addr,  query.largest_available_block,
-			  1ULL << page_shift);
-		goto out_failed;
+		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu %llu-sized pages\n",
+			max_addr, query.largest_available_block,
+			1ULL << page_shift);
+
+		len = order_base_2(query.largest_available_block << page_shift);
+	} else {
+		len = order_base_2(max_addr);
 	}
-	len = order_base_2(max_addr);
+
 	win64 = kzalloc(sizeof(struct property), GFP_KERNEL);
 	if (!win64) {
 		dev_info(&dev->dev,
@@ -1229,7 +1237,9 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	list_add(&window->list, &direct_window_list);
 	spin_unlock(&direct_window_list_lock);
 
-	dma_addr = be64_to_cpu(ddwprop->dma_base);
+	/* Only returns the dma_addr if DDW maps the whole partition */
+	if (len == order_base_2(max_addr))
+		dma_addr = be64_to_cpu(ddwprop->dma_base);
 	goto out_unlock;
 
 out_free_window:
-- 
2.25.4

