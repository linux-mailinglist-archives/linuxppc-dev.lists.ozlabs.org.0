Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7018323C3E2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 05:10:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLxTS1b34zDqcM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 13:10:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f42;
 helo=mail-qv1-xf42.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cvRnM4uU; dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLxM03fBCzDqRD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 13:05:16 +1000 (AEST)
Received: by mail-qv1-xf42.google.com with SMTP id j10so13422224qvo.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Aug 2020 20:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FJwtXKryPct6ANmQ36Ytc2bYA9QUUsVGIRklUOOsfAw=;
 b=cvRnM4uUQvxlFcLUYZy2XEHeQVXsEUJxQQ4g9jIZ8R+hslzosSFNqwKSJ6nGGQ6fOL
 0Y6LL3oD4znV3PRumEGOEvrjG1mWWNp5lwKuU3ZrEE4PNIQF+S6l2PkqU9XJf/7rnada
 IYcHsGjxnoBSeHoBqpNvRN1gmEHTYR+0/YkEVGikNa+8bMPcz8BADA1ulm/oOda10+Ow
 N4ODO/+3/0tX0FGpypH8MTtb/gbM/3dcTsg2k6zbSeV2FKmbg8fA5PvHhkB+uggiY9/w
 3aNudLCLubMetQBk0avstYeOxGHiHiZCWXiM9nY6e4sucz2GCvoKfcaeXHtChpeOJxDB
 cxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FJwtXKryPct6ANmQ36Ytc2bYA9QUUsVGIRklUOOsfAw=;
 b=NRO5zE986tSQ04C8YZDKVT9M7GGI14+9CIwnmAFhYvJPPxXnDrZGc44cQ4rYwLW5Wd
 Di5PRCIWWZZ3URYd1aqNG0CLdqGylbJd9w+6VWJF4cUE7xlMqDpyBhHHct/1YWMSOPLR
 l41yhw/QQU46Yq7BoSOJCngcuEZ3I6QtQ9gj/kqZr/C72hr3fPgrLX9mRam5KMmB6fJp
 2nwSsDYOBe0OoFGvgNG3M9vGeYQ3VjExBW+LEboQRj1wgDNDn9JK6sIS2L38mlcKnQz3
 Irrb5j2bkEmeA87gizmVp4pqdWxixV9ySP/lCdkdV77aLCzkCwwccQw1rK8H3nnq1Jka
 HVDA==
X-Gm-Message-State: AOAM533DephR7yf+hYsBBcBiH9keTIFG0vwrHIiZEXyDT1sCeKkrxbhR
 uP//eQmm70qn8N2ggvtK1VFFSgeV
X-Google-Smtp-Source: ABdhPJx8TXNGRdQ0ehIfJO2zJu6RAMRLpLNY5hqAh3lThLKPdZlULgxiiL7SHArVhaEze4tacaStfA==
X-Received: by 2002:a0c:ff02:: with SMTP id w2mr1523304qvt.206.1596596713467; 
 Tue, 04 Aug 2020 20:05:13 -0700 (PDT)
Received: from LeoBras.ibmuc.com (179-125-154-168.dynamic.desktop.com.br.
 [179.125.154.168])
 by smtp.gmail.com with ESMTPSA id n4sm869946qtr.73.2020.08.04.20.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 20:05:12 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Subject: [PATCH v5 2/4] powerpc/pseries/iommu: Update call to ibm,
 query-pe-dma-windows
Date: Wed,  5 Aug 2020 00:04:53 -0300
Message-Id: <20200805030455.123024-3-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200805030455.123024-1-leobras.c@gmail.com>
References: <20200805030455.123024-1-leobras.c@gmail.com>
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

Also, a routine was created for helping reading the ddw extensions as
suggested by LoPAR: First reading the size of the extension array from
index 0, checking if the property exists, and then returning it's value.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
Tested-by: David Dai <zdai@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 91 +++++++++++++++++++++++---
 1 file changed, 81 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index ac0d6376bdad..1a933c4e8bba 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -47,6 +47,12 @@ enum {
 	DDW_APPLICABLE_SIZE
 };
 
+enum {
+	DDW_EXT_SIZE = 0,
+	DDW_EXT_RESET_DMA_WIN = 1,
+	DDW_EXT_QUERY_OUT_SIZE = 2
+};
+
 static struct iommu_table_group *iommu_pseries_alloc_group(int node)
 {
 	struct iommu_table_group *table_group;
@@ -342,7 +348,7 @@ struct direct_window {
 /* Dynamic DMA Window support */
 struct ddw_query_response {
 	u32 windows_available;
-	u32 largest_available_block;
+	u64 largest_available_block;
 	u32 page_size;
 	u32 migration_capable;
 };
@@ -877,14 +883,62 @@ static int find_existing_ddw_windows(void)
 }
 machine_arch_initcall(pseries, find_existing_ddw_windows);
 
+/**
+ * ddw_read_ext - Get the value of an DDW extension
+ * @np:		device node from which the extension value is to be read.
+ * @extnum:	index number of the extension.
+ * @value:	pointer to return value, modified when extension is available.
+ *
+ * Checks if "ibm,ddw-extensions" exists for this node, and get the value
+ * on index 'extnum'.
+ * It can be used only to check if a property exists, passing value == NULL.
+ *
+ * Returns:
+ *	0 if extension successfully read
+ *	-EINVAL if the "ibm,ddw-extensions" does not exist,
+ *	-ENODATA if "ibm,ddw-extensions" does not have a value, and
+ *	-EOVERFLOW if "ibm,ddw-extensions" does not contain this extension.
+ */
+static inline int ddw_read_ext(const struct device_node *np, int extnum,
+			       u32 *value)
+{
+	static const char propname[] = "ibm,ddw-extensions";
+	u32 count;
+	int ret;
+
+	ret = of_property_read_u32_index(np, propname, DDW_EXT_SIZE, &count);
+	if (ret)
+		return ret;
+
+	if (count < extnum)
+		return -EOVERFLOW;
+
+	if (!value)
+		value = &count;
+
+	return of_property_read_u32_index(np, propname, extnum, value);
+}
+
 static int query_ddw(struct pci_dev *dev, const u32 *ddw_avail,
-			struct ddw_query_response *query)
+		     struct ddw_query_response *query,
+		     struct device_node *parent)
 {
 	struct device_node *dn;
 	struct pci_dn *pdn;
-	u32 cfg_addr;
+	u32 cfg_addr, ext_query, query_out[5];
 	u64 buid;
-	int ret;
+	int ret, out_sz;
+
+	/*
+	 * From LoPAR level 2.8, "ibm,ddw-extensions" index 3 can rule how many
+	 * output parameters ibm,query-pe-dma-windows will have, ranging from
+	 * 5 to 6.
+	 */
+	ret = ddw_read_ext(parent, DDW_EXT_QUERY_OUT_SIZE, &ext_query);
+	if (!ret && ext_query == 1)
+		out_sz = 6;
+	else
+		out_sz = 5;
 
 	/*
 	 * Get the config address and phb buid of the PE window.
@@ -897,11 +951,28 @@ static int query_ddw(struct pci_dev *dev, const u32 *ddw_avail,
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
 
@@ -1049,7 +1120,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	 * of page sizes: supported and supported for migrate-dma.
 	 */
 	dn = pci_device_to_OF_node(dev);
-	ret = query_ddw(dev, ddw_avail, &query);
+	ret = query_ddw(dev, ddw_avail, &query, pdn);
 	if (ret != 0)
 		goto out_failed;
 
@@ -1077,7 +1148,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
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

