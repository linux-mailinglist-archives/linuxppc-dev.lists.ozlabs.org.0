Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B710213417
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 08:24:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ylKz1QSlzDrBY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 16:24:23 +1000 (AEST)
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
 header.s=20161025 header.b=EgDCr/l5; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ylF03C5SzDr7j
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 16:20:04 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id x62so23159944qtd.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 23:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iAqnNzgFRUJx+axzGrs6hmhSszYF3MKAI0YBJIy15+s=;
 b=EgDCr/l5tXXG+M2UTRujuMsLlDJjwLPQ67A55qwVHesnZ+KUOTbWU0NjITORCaR2hK
 ogH5k4y25WRFk0UJ861cd+pk7sdRWLO0i9xlnsuBvRb/eqYK+jWbmU17b+Gh1pypOQeG
 sx94A1kqEz972XKma9NH3xoW1rpQasg+iOnDJuxj9GrlYJB6XabLzHSGlRYsviM2BJ0W
 vhXu7ZHg6NIwXOSjU6vu+UemT8RMkPYL8UCXboFFe5tJmaU00hs/JFz1YbBfHRk0GQxf
 m5XNpweC9OKcip2HcIxIVlj49UVpuJ7Kc+9uNkdbgARw5TJ/cxZPpgCITj3WMCMjO6cO
 +WNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iAqnNzgFRUJx+axzGrs6hmhSszYF3MKAI0YBJIy15+s=;
 b=iiu2j1vEz2PPg/CDMHhg/FqV3HtQCkrvuYyUqsYO4BlD1QAmKfwzNhXHPBASBvbu1U
 aDMReB06k+s2IdBBsQo3jcsno5MVXMLkSCLp9M7F3hCsDfMU3hZn2WZxk2o/QJjl4ZaS
 IZ0DeXU0DdwuJpv7cj1g0etvEaMxAriwtegI1yq3a0oPCeJfGJVEM9EzOhFRfahErB8p
 Tdge27HuiX2DE3yEaJ7mC8O4nfgEteS983BgS1TxiKXfZYqIluv1GgcMCjg/6qc4HKH/
 nueXEpi29yYJWRKm+ahnrur+1w0ZY0DlZoHjxEX9UxivYN8mQhGbuTDG3MoqUq5yKBQE
 0mdg==
X-Gm-Message-State: AOAM530pOjy4ntRMUrkUUpfpZxAVdbYIwTWeF/d+u07rCLL7hkOcgMD8
 jYMdBTz3p/sqQ+h+kaJF52A=
X-Google-Smtp-Source: ABdhPJxy3UsZ0iqDkV+LnCkZdp3Tv45E8/xu0RNWxNN5dqeFI1an72T4VTRcbsWvl/GqpeKH3+bBiw==
X-Received: by 2002:ac8:4143:: with SMTP id e3mr34135548qtm.28.1593757201597; 
 Thu, 02 Jul 2020 23:20:01 -0700 (PDT)
Received: from LeoBras.ibmuc.com (200-236-245-17.dynamic.desktop.com.br.
 [200.236.245.17])
 by smtp.gmail.com with ESMTPSA id n28sm11165288qtf.8.2020.07.02.23.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 23:20:01 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Leonardo Bras <leobras.c@gmail.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>
Subject: [PATCH v3 1/6] powerpc/pseries/iommu: Create defines for operations
 in ibm, ddw-applicable
Date: Fri,  3 Jul 2020 03:18:39 -0300
Message-Id: <20200703061844.111865-2-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200703061844.111865-1-leobras.c@gmail.com>
References: <20200703061844.111865-1-leobras.c@gmail.com>
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

Create defines to help handling ibm,ddw-applicable values, avoiding
confusion about the index of given operations.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 43 ++++++++++++++++----------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 6d47b4a3ce39..ac0d6376bdad 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -39,6 +39,14 @@
 
 #include "pseries.h"
 
+enum {
+	DDW_QUERY_PE_DMA_WIN  = 0,
+	DDW_CREATE_PE_DMA_WIN = 1,
+	DDW_REMOVE_PE_DMA_WIN = 2,
+
+	DDW_APPLICABLE_SIZE
+};
+
 static struct iommu_table_group *iommu_pseries_alloc_group(int node)
 {
 	struct iommu_table_group *table_group;
@@ -771,12 +779,12 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
 {
 	struct dynamic_dma_window_prop *dwp;
 	struct property *win64;
-	u32 ddw_avail[3];
+	u32 ddw_avail[DDW_APPLICABLE_SIZE];
 	u64 liobn;
 	int ret = 0;
 
 	ret = of_property_read_u32_array(np, "ibm,ddw-applicable",
-					 &ddw_avail[0], 3);
+					 &ddw_avail[0], DDW_APPLICABLE_SIZE);
 
 	win64 = of_find_property(np, DIRECT64_PROPNAME, NULL);
 	if (!win64)
@@ -798,15 +806,15 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
 		pr_debug("%pOF successfully cleared tces in window.\n",
 			 np);
 
-	ret = rtas_call(ddw_avail[2], 1, 1, NULL, liobn);
+	ret = rtas_call(ddw_avail[DDW_REMOVE_PE_DMA_WIN], 1, 1, NULL, liobn);
 	if (ret)
 		pr_warn("%pOF: failed to remove direct window: rtas returned "
 			"%d to ibm,remove-pe-dma-window(%x) %llx\n",
-			np, ret, ddw_avail[2], liobn);
+			np, ret, ddw_avail[DDW_REMOVE_PE_DMA_WIN], liobn);
 	else
 		pr_debug("%pOF: successfully removed direct window: rtas returned "
 			"%d to ibm,remove-pe-dma-window(%x) %llx\n",
-			np, ret, ddw_avail[2], liobn);
+			np, ret, ddw_avail[DDW_REMOVE_PE_DMA_WIN], liobn);
 
 delprop:
 	if (remove_prop)
@@ -889,11 +897,11 @@ static int query_ddw(struct pci_dev *dev, const u32 *ddw_avail,
 	buid = pdn->phb->buid;
 	cfg_addr = ((pdn->busno << 16) | (pdn->devfn << 8));
 
-	ret = rtas_call(ddw_avail[0], 3, 5, (u32 *)query,
-		  cfg_addr, BUID_HI(buid), BUID_LO(buid));
+	ret = rtas_call(ddw_avail[DDW_QUERY_PE_DMA_WIN], 3, 5, (u32 *)query,
+			cfg_addr, BUID_HI(buid), BUID_LO(buid));
 	dev_info(&dev->dev, "ibm,query-pe-dma-windows(%x) %x %x %x"
-		" returned %d\n", ddw_avail[0], cfg_addr, BUID_HI(buid),
-		BUID_LO(buid), ret);
+		" returned %d\n", ddw_avail[DDW_QUERY_PE_DMA_WIN], cfg_addr,
+		 BUID_HI(buid), BUID_LO(buid), ret);
 	return ret;
 }
 
@@ -920,15 +928,16 @@ static int create_ddw(struct pci_dev *dev, const u32 *ddw_avail,
 
 	do {
 		/* extra outputs are LIOBN and dma-addr (hi, lo) */
-		ret = rtas_call(ddw_avail[1], 5, 4, (u32 *)create,
-				cfg_addr, BUID_HI(buid), BUID_LO(buid),
-				page_shift, window_shift);
+		ret = rtas_call(ddw_avail[DDW_CREATE_PE_DMA_WIN], 5, 4,
+				(u32 *)create, cfg_addr, BUID_HI(buid),
+				BUID_LO(buid), page_shift, window_shift);
 	} while (rtas_busy_delay(ret));
 	dev_info(&dev->dev,
 		"ibm,create-pe-dma-window(%x) %x %x %x %x %x returned %d "
-		"(liobn = 0x%x starting addr = %x %x)\n", ddw_avail[1],
-		 cfg_addr, BUID_HI(buid), BUID_LO(buid), page_shift,
-		 window_shift, ret, create->liobn, create->addr_hi, create->addr_lo);
+		"(liobn = 0x%x starting addr = %x %x)\n",
+		 ddw_avail[DDW_CREATE_PE_DMA_WIN], cfg_addr, BUID_HI(buid),
+		 BUID_LO(buid), page_shift, window_shift, ret, create->liobn,
+		 create->addr_hi, create->addr_lo);
 
 	return ret;
 }
@@ -996,7 +1005,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	int page_shift;
 	u64 dma_addr, max_addr;
 	struct device_node *dn;
-	u32 ddw_avail[3];
+	u32 ddw_avail[DDW_APPLICABLE_SIZE];
 	struct direct_window *window;
 	struct property *win64;
 	struct dynamic_dma_window_prop *ddwprop;
@@ -1029,7 +1038,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	 * the property is actually in the parent, not the PE
 	 */
 	ret = of_property_read_u32_array(pdn, "ibm,ddw-applicable",
-					 &ddw_avail[0], 3);
+					 &ddw_avail[0], DDW_APPLICABLE_SIZE);
 	if (ret)
 		goto out_failed;
 
-- 
2.25.4

