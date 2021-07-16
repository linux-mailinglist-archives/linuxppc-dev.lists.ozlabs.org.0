Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B83183CB43A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 10:30:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GR4FD43WFz3bpy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 18:30:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JJBOIYO0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JJBOIYO0; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GR4BL6Vv6z3069
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jul 2021 18:28:10 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id t185so7943149qkd.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jul 2021 01:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UXFVBE2HycPcMN2stBvdj2PQClDQFiZQMSTR+g9NmxU=;
 b=JJBOIYO0+EphM+2cwMk+6w+ApBb+iPciEFIPEr+4J4QpZEeTFNxBD1wTgoOrRDv97P
 Wp05rbbQVRFW+q6/KsdmexE++/HCEFz71P0rHVs4rWh86QlJjSi/cuJx7W2JNOYFL0NF
 xTsZVdaXjFmup90urJHStFrBjEh9yrPQFTPUvj82+er5epD+lWibvj+82RBRc+6NUsny
 aTq3Ppe1G4MUPvG9zGVeRXOowmWVs6qMK3gyNgWe5jCu7xWlSpyGdJHbK88mK9tz8wic
 QVKCV2fqj3WfYyPWg54/C03MqWc2RYzi+IZjPANJab9tkAImaiowWUjmG8zt5idgYJZr
 x2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UXFVBE2HycPcMN2stBvdj2PQClDQFiZQMSTR+g9NmxU=;
 b=mP1Ob06uRvdrrjtiIEwCLurnEwl+i7raNZvqKCAI2RZKHi2Kb4xZi8qZ1Ko9S5BT60
 Z2C4brQNA6AFGXF0U74HeSopmmwk3nuNy/tN7xSiMUsfwKINt5bYO3VgsQ8TYN7+RoJf
 NHk+Zh+HWW9BilRTaHlD0fFMjhD73JR2FEyxcZS4ibdkZJlVGkqzoM7x+4cpadcgN7P0
 zT8V6WukVR+h3GqWljZySKMrQ05Ck3PAsAM4dmVqTIgNBjpTfh/TyA7Qx3ZEPeSGMpCm
 oiy76111c6wjf3nnNaoQLyuNBJs5rImZ+I1jJw/NVBfC+/5VWn5BRaAmjxQG2IwBD3sM
 OXvQ==
X-Gm-Message-State: AOAM530w7WdugWsjQ4Bc//6U387grLfCkB9mYYZwWh3DuQGGwOCcWJLx
 pup4jG4UhwaW73GaIucENKc=
X-Google-Smtp-Source: ABdhPJwJ8lWq3IVuWDL1cRNWvD3B2ySk+T1LB8mrT9WDzPvm5+d8KlGLhGqSlNC0wVDpH7lV/vdz5g==
X-Received: by 2002:a37:a286:: with SMTP id l128mr1198306qke.77.1626424088415; 
 Fri, 16 Jul 2021 01:28:08 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:14c:482:92eb:ffdf:6b35:b94d:258])
 by smtp.gmail.com with ESMTPSA id q199sm3603540qka.112.2021.07.16.01.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 01:28:08 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>,
 kernel test robot <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PATCH v5 05/11] powerpc/pseries/iommu: Allow DDW windows starting at
 0x00
Date: Fri, 16 Jul 2021 05:27:50 -0300
Message-Id: <20210716082755.428187-6-leobras.c@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716082755.428187-1-leobras.c@gmail.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
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

enable_ddw() currently returns the address of the DMA window, which is
considered invalid if has the value 0x00.

Also, it only considers valid an address returned from find_existing_ddw
if it's not 0x00.

Changing this behavior makes sense, given the users of enable_ddw() only
need to know if direct mapping is possible. It can also allow a DMA window
starting at 0x00 to be used.

This will be helpful for using a DDW with indirect mapping, as the window
address will be different than 0x00, but it will not map the whole
partition.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/platforms/pseries/iommu.c | 36 +++++++++++++-------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 712d1667144a..b34b473bbdc1 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -853,25 +853,26 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
 			np, ret);
 }
 
-static u64 find_existing_ddw(struct device_node *pdn, int *window_shift)
+static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr, int *window_shift)
 {
 	struct direct_window *window;
 	const struct dynamic_dma_window_prop *direct64;
-	u64 dma_addr = 0;
+	bool found = false;
 
 	spin_lock(&direct_window_list_lock);
 	/* check if we already created a window and dupe that config if so */
 	list_for_each_entry(window, &direct_window_list, list) {
 		if (window->device == pdn) {
 			direct64 = window->prop;
-			dma_addr = be64_to_cpu(direct64->dma_base);
+			*dma_addr = be64_to_cpu(direct64->dma_base);
 			*window_shift = be32_to_cpu(direct64->window_shift);
+			found = true;
 			break;
 		}
 	}
 	spin_unlock(&direct_window_list_lock);
 
-	return dma_addr;
+	return found;
 }
 
 static struct direct_window *ddw_list_new_entry(struct device_node *pdn,
@@ -1161,20 +1162,20 @@ static int iommu_get_page_shift(u32 query_page_size)
  * pdn: the parent pe node with the ibm,dma_window property
  * Future: also check if we can remap the base window for our base page size
  *
- * returns the dma offset for use by the direct mapped DMA code.
+ * returns true if can map all pages (direct mapping), false otherwise..
  */
-static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
+static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 {
 	int len = 0, ret;
 	int max_ram_len = order_base_2(ddw_memory_hotplug_max());
 	struct ddw_query_response query;
 	struct ddw_create_response create;
 	int page_shift;
-	u64 dma_addr;
 	struct device_node *dn;
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
 	struct direct_window *window;
 	struct property *win64;
+	bool ddw_enabled = false;
 	struct dynamic_dma_window_prop *ddwprop;
 	struct failed_ddw_pdn *fpdn;
 	bool default_win_removed = false;
@@ -1186,9 +1187,10 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 	mutex_lock(&direct_window_init_mutex);
 
-	dma_addr = find_existing_ddw(pdn, &len);
-	if (dma_addr != 0)
+	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &len)) {
+		ddw_enabled = true;
 		goto out_unlock;
+	}
 
 	/*
 	 * If we already went through this for a previous function of
@@ -1342,7 +1344,8 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	list_add(&window->list, &direct_window_list);
 	spin_unlock(&direct_window_list_lock);
 
-	dma_addr = be64_to_cpu(ddwprop->dma_base);
+	dev->dev.archdata.dma_offset = be64_to_cpu(ddwprop->dma_base);
+	ddw_enabled = true;
 	goto out_unlock;
 
 out_free_window:
@@ -1374,10 +1377,10 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	 * as RAM, then we failed to create a window to cover persistent
 	 * memory and need to set the DMA limit.
 	 */
-	if (pmem_present && dma_addr && (len == max_ram_len))
-		dev->dev.bus_dma_limit = dma_addr + (1ULL << len);
+	if (pmem_present && ddw_enabled && (len == max_ram_len))
+		dev->dev.bus_dma_limit = dev->dev.archdata.dma_offset + (1ULL << len);
 
-	return dma_addr;
+	return ddw_enabled;
 }
 
 static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
@@ -1456,11 +1459,8 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
 			break;
 	}
 
-	if (pdn && PCI_DN(pdn)) {
-		pdev->dev.archdata.dma_offset = enable_ddw(pdev, pdn);
-		if (pdev->dev.archdata.dma_offset)
-			return true;
-	}
+	if (pdn && PCI_DN(pdn))
+		return enable_ddw(pdev, pdn);
 
 	return false;
 }
-- 
2.32.0

