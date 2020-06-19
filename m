Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 210C5200191
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 07:10:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49p6MW4FSFzDrNr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 15:10:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QsiM4ZEJ; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49p6Hk2Pc0zDqmj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 15:07:30 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id 205so7910658qkg.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 22:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vn1bV10W3tvJRgYqdiRF0lmWnCMP76unsCJTzVGifFg=;
 b=QsiM4ZEJtUhQBs9Gx6kygyiM3m/xn7LX5/xJOnd0aIo40xbOLxTp3kkz7sZLVlTRxs
 Ijtlknaxc3Ni0Zx29CJV3owe/eHwEtYBAZtZ5+ytAeodTJ7djTA0YxZj0GYFM+TAuX+W
 oy2uKeyRuTu7BwkVok5NX/e9CpWQhciz8/7+YPxEz7yMw17y+wLYHtTX39jYgzpNvSs5
 5YrusWV2KudcVsaEk72kDZP0wPoDWMNINCOI3+Rl0ucKCY40WrUM0QMztvj+n0Vt/PH4
 n1DsLnHfzxTg+hH0f0DL4nRNmOqLgiqcI92EgqTFWKrXCRQIFZ0PEH6YHVA1kj4IlR5T
 lCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vn1bV10W3tvJRgYqdiRF0lmWnCMP76unsCJTzVGifFg=;
 b=Xs7fEiWEO8PiEpJOgqgU4Pa6ujXGOmi88UEuGDEdDuy+H2PkI6OdKZ75grmFroWKxP
 b4Wt/o90zgJL2Xqp4kHsUj0vPwaBtk8MF4ojTACpleiyfCTZMcryCxWZqN2RKYFC05SN
 PeTMMr8m/Pz+/0eBPnrrwvZWl5+EnUvVfO/xsmD0NXRQZqWOpPiJJaiv/fFbBd2KHDtQ
 6KtQmHHur4t9sUaLf0gTHeN2u2dxSdkremAfAnV5hdDDTR9n28wKNjlOkfOU1KwnSG2Z
 Nv2pFtWGblj9vCmCXtbpLUiNuCVawjG6RnfyXLK8zNQCuPJwccWW5G0IoiFK7lmvMx2V
 XJJA==
X-Gm-Message-State: AOAM533EdQvKerBU91sYOpR1Wv3CHESLEsGNvtKN7g3eAiNueZn2hr5E
 gSdbpzwmdLWL7G57ARkdGjc=
X-Google-Smtp-Source: ABdhPJwGrG2+nHFRvXxjANzAX712LgL7SmRcp5gvmZCjf8F4P0+WmiVBJ7ItfaAO+UlXJWD3mVSyIA==
X-Received: by 2002:a37:49d1:: with SMTP id w200mr1766639qka.153.1592543247147; 
 Thu, 18 Jun 2020 22:07:27 -0700 (PDT)
Received: from LeoBras.ibmuc.com (177-131-65-187.dynamic.desktop.com.br.
 [177.131.65.187])
 by smtp.gmail.com with ESMTPSA id o6sm5235503qtd.59.2020.06.18.22.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 22:07:26 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Leonardo Bras <leobras.c@gmail.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>
Subject: [PATCH 1/4] powerpc/pseries/iommu: Update call to ibm,
 query-pe-dma-windows
Date: Fri, 19 Jun 2020 02:06:17 -0300
Message-Id: <20200619050619.266888-2-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200619050619.266888-1-leobras.c@gmail.com>
References: <20200619050619.266888-1-leobras.c@gmail.com>
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
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 6d47b4a3ce39..e5a617738c8b 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -334,7 +334,7 @@ struct direct_window {
 /* Dynamic DMA Window support */
 struct ddw_query_response {
 	u32 windows_available;
-	u32 largest_available_block;
+	u64 largest_available_block;
 	u32 page_size;
 	u32 migration_capable;
 };
@@ -869,14 +869,32 @@ static int find_existing_ddw_windows(void)
 }
 machine_arch_initcall(pseries, find_existing_ddw_windows);
 
+/*
+ * From LoPAR level 2.8, "ibm,ddw-extensions" index 3 can rule how many output
+ * parameters ibm,query-pe-dma-windows will have, ranging from 5 to 6.
+ */
+
+static int query_ddw_out_sz(struct device_node *par_dn)
+{
+	int ret;
+	u32 ddw_ext[3];
+
+	ret = of_property_read_u32_array(par_dn, "ibm,ddw-extensions",
+					 &ddw_ext[0], 3);
+	if (ret || ddw_ext[0] < 2 || ddw_ext[2] != 1)
+		return 5;
+	return 6;
+}
+
 static int query_ddw(struct pci_dev *dev, const u32 *ddw_avail,
-			struct ddw_query_response *query)
+		     struct ddw_query_response *query,
+		     struct device_node *par_dn)
 {
 	struct device_node *dn;
 	struct pci_dn *pdn;
-	u32 cfg_addr;
+	u32 cfg_addr, query_out[5];
 	u64 buid;
-	int ret;
+	int ret, out_sz;
 
 	/*
 	 * Get the config address and phb buid of the PE window.
@@ -888,12 +906,29 @@ static int query_ddw(struct pci_dev *dev, const u32 *ddw_avail,
 	pdn = PCI_DN(dn);
 	buid = pdn->phb->buid;
 	cfg_addr = ((pdn->busno << 16) | (pdn->devfn << 8));
+	out_sz = query_ddw_out_sz(par_dn);
+
+	ret = rtas_call(ddw_avail[0], 3, out_sz, query_out,
+			cfg_addr, BUID_HI(buid), BUID_LO(buid));
+	dev_info(&dev->dev, "ibm,query-pe-dma-windows(%x) %x %x %x returned %d\n",
+		 ddw_avail[0], cfg_addr, BUID_HI(buid), BUID_LO(buid), ret);
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
 
-	ret = rtas_call(ddw_avail[0], 3, 5, (u32 *)query,
-		  cfg_addr, BUID_HI(buid), BUID_LO(buid));
-	dev_info(&dev->dev, "ibm,query-pe-dma-windows(%x) %x %x %x"
-		" returned %d\n", ddw_avail[0], cfg_addr, BUID_HI(buid),
-		BUID_LO(buid), ret);
 	return ret;
 }
 
@@ -1040,7 +1075,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	 * of page sizes: supported and supported for migrate-dma.
 	 */
 	dn = pci_device_to_OF_node(dev);
-	ret = query_ddw(dev, ddw_avail, &query);
+	ret = query_ddw(dev, ddw_avail, &query, pdn);
 	if (ret != 0)
 		goto out_failed;
 
@@ -1068,7 +1103,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
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

