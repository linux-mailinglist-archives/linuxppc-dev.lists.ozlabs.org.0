Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63928206C57
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 08:29:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sCtD56XkzDqY1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 16:29:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=A45oNA6H; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sCmL42CJzDqTY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 16:24:34 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id e12so837680qtr.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 23:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yajEeGcHJxjBvTZAS0s0BFpw3ZLBt1KNWcONoPvtsFM=;
 b=A45oNA6HpyY4G2DdBilcqBNQL2XvX3Ui2sA8ppuJJEySagRDSUHW6ZpCMMkiQJcRcW
 MDH9cnyY9wgKQq9VetABfQQl9NdkYuq2Hy3HblrFHjO+6VFDubIALGyUsR1do96OM+EE
 UID9rULAJnPFG6DiSICN9FAAxUot7+9tsPGJH6rlh0hh1U0KllSgj/e1N6pMwdzv4Dbs
 DRLm7pLVyRfBI9AcGNJFG+NrI3IYMO+bDEQBL0SY5fyFzmQ4DNo+SCUNBOI3JcixhSgv
 PPYpbH8XKNEg4Ty1bIETAXHeZr4U1AkBrKdntYTWTXFdwzwATmqOVgXRsnE66giwkknY
 bOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yajEeGcHJxjBvTZAS0s0BFpw3ZLBt1KNWcONoPvtsFM=;
 b=uTOJbJeeXmL6+4Ka4m/eTggXwzIqHZcSmnPT7zFdu72F+u+GGaXIozlLkhhJK3b76x
 TtXmwSZ2lHKVIAjxxbYVK+JjhPWOrKG0R+y61J23MagqOG8ks9pGaSLWiNwUmZcd8oVl
 /kMdjXGGn5OAWCYFhKa6k3hXW8F8filvNf1Dnl6Nf3Y9P1LNSbpFtvhTsP5M9VjQu4e/
 WBCFmndPx+1Fpc93Z2YZiMGhb0OdZyn4R7Heq8oJNuLWdwnlZ16jKzkBvuN0icvLaLqy
 cUbI6lsd4jcctiA765IOAFBkAtJf/10Jo7/bPyl03291Fbs8hd1OZDulL5A4h2cVgJRq
 cyig==
X-Gm-Message-State: AOAM533me/lLGKBAxJChP/Ui6MLUizaM1umD3x9lUKG2dPM0jBMSDVWc
 E69P3oxtnvGax2cayxNqR7M=
X-Google-Smtp-Source: ABdhPJxDWGlcgntYYwswsfDbkWRKpZI+Okk4pWLiUtupPZQ0RL9DTjzuDlpxqUt6bydwyt71uN4teA==
X-Received: by 2002:ac8:19d3:: with SMTP id s19mr14386962qtk.274.1592979871542; 
 Tue, 23 Jun 2020 23:24:31 -0700 (PDT)
Received: from LeoBras.ibmuc.com (179-125-148-1.dynamic.desktop.com.br.
 [179.125.148.1])
 by smtp.gmail.com with ESMTPSA id n2sm2489727qtp.45.2020.06.23.23.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 23:24:30 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>
Subject: [PATCH v2 2/6] powerpc/pseries/iommu: Update call to ibm,
 query-pe-dma-windows
Date: Wed, 24 Jun 2020 03:24:07 -0300
Message-Id: <20200624062411.367796-3-leobras.c@gmail.com>
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

From LoPAR level 2.8, "ibm,ddw-extensions" index 3 can make the number of
outputs from "ibm,query-pe-dma-windows" go from 5 to 6.

This change of output size is meant to expand the address size of
largest_available_block PE TCE from 32-bit to 64-bit, which ends up
shifting page_size and migration_capable.

This ends up requiring the update of
ddw_query_response->largest_available_block from u32 to u64, and manually
assigning the values from the buffer into this struct, according to
output size.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 57 +++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 68d2aa9c71a8..558e5441c355 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -44,6 +44,10 @@
 #define DDW_REMOVE_PE_DMA_WIN	2
 #define DDW_APPLICABLE_SIZE	3
 
+#define DDW_EXT_SIZE		0
+#define DDW_EXT_RESET_DMA_WIN	1
+#define DDW_EXT_QUERY_OUT_SIZE	2
+
 static struct iommu_table_group *iommu_pseries_alloc_group(int node)
 {
 	struct iommu_table_group *table_group;
@@ -339,7 +343,7 @@ struct direct_window {
 /* Dynamic DMA Window support */
 struct ddw_query_response {
 	u32 windows_available;
-	u32 largest_available_block;
+	u64 largest_available_block;
 	u32 page_size;
 	u32 migration_capable;
 };
@@ -875,13 +879,29 @@ static int find_existing_ddw_windows(void)
 machine_arch_initcall(pseries, find_existing_ddw_windows);
 
 static int query_ddw(struct pci_dev *dev, const u32 *ddw_avail,
-			struct ddw_query_response *query)
+		     struct ddw_query_response *query,
+		     struct device_node *parent)
 {
 	struct device_node *dn;
 	struct pci_dn *pdn;
-	u32 cfg_addr;
+	u32 cfg_addr, query_out[5], ddw_ext[DDW_EXT_QUERY_OUT_SIZE + 1];
 	u64 buid;
-	int ret;
+	int ret, out_sz;
+
+	/*
+	 * From LoPAR level 2.8, "ibm,ddw-extensions" index 3 can rule how many
+	 * output parameters ibm,query-pe-dma-windows will have, ranging from
+	 * 5 to 6.
+	 */
+
+	ret = of_property_read_u32_array(parent, "ibm,ddw-extensions",
+					 &ddw_ext[0],
+					 DDW_EXT_QUERY_OUT_SIZE + 1);
+	if (ret && ddw_ext[DDW_EXT_SIZE] > 1 &&
+	    ddw_ext[DDW_EXT_QUERY_OUT_SIZE] == 1)
+		out_sz = 6;
+	else
+		out_sz = 5;
 
 	/*
 	 * Get the config address and phb buid of the PE window.
@@ -894,11 +914,28 @@ static int query_ddw(struct pci_dev *dev, const u32 *ddw_avail,
 	buid = pdn->phb->buid;
 	cfg_addr = ((pdn->busno << 16) | (pdn->devfn << 8));
 
-	ret = rtas_call(ddw_avail[DDW_QUERY_PE_DMA_WIN], 3, 5, (u32 *)query,
+	ret = rtas_call(ddw_avail[DDW_QUERY_PE_DMA_WIN], 3, out_sz, query_out,
 			cfg_addr, BUID_HI(buid), BUID_LO(buid));
-	dev_info(&dev->dev, "ibm,query-pe-dma-windows(%x) %x %x %x"
-		" returned %d\n", ddw_avail[DDW_QUERY_PE_DMA_WIN], cfg_addr,
-		 BUID_HI(buid), BUID_LO(buid), ret);
+	dev_info(&dev->dev, "ibm,query-pe-dma-windows(%x) %x %x %x returned %d\n",
+		 ddw_avail[DDW_QUERY_PE_DMA_WIN], cfg_addr, BUID_HI(buid),
+		 BUID_LO(buid), ret);
+
+	switch (out_sz) {
+	case 5:
+		query->windows_available = query_out[0];
+		query->largest_available_block = query_out[1];
+		query->page_size = query_out[2];
+		query->migration_capable = query_out[3];
+		break;
+	case 6:
+		query->windows_available = query_out[0];
+		query->largest_available_block = ((u64)query_out[1] << 32) |
+						 query_out[2];
+		query->page_size = query_out[3];
+		query->migration_capable = query_out[4];
+		break;
+	}
+
 	return ret;
 }
 
@@ -1046,7 +1083,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	 * of page sizes: supported and supported for migrate-dma.
 	 */
 	dn = pci_device_to_OF_node(dev);
-	ret = query_ddw(dev, ddw_avail, &query);
+	ret = query_ddw(dev, ddw_avail, &query, pdn);
 	if (ret != 0)
 		goto out_failed;
 
@@ -1074,7 +1111,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	/* check largest block * page size > max memory hotplug addr */
 	max_addr = ddw_memory_hotplug_max();
 	if (query.largest_available_block < (max_addr >> page_shift)) {
-		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %u "
+		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu "
 			  "%llu-sized pages\n", max_addr,  query.largest_available_block,
 			  1ULL << page_shift);
 		goto out_failed;
-- 
2.25.4

