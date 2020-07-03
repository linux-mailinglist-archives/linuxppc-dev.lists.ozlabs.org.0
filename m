Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC8221342F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 08:30:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ylSV5zQYzDqH1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 16:30:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f43;
 helo=mail-qv1-xf43.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=h3+N6ta6; dkim-atps=neutral
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ylFC0RmhzDr7m
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 16:20:14 +1000 (AEST)
Received: by mail-qv1-xf43.google.com with SMTP id p7so13831965qvl.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 23:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2kFFMxggEIFqCBrgO51rxrq3mVOtoMZWvoFNTEnVYpg=;
 b=h3+N6ta6owmtPD4bZ+y01OG/8MZZka7O2nnyn6DnWoFoE96yrFT4lZ6NmTxeSRAion
 YMA6eoCvwRHcCfQb5uYaMr8ZJmThEXvNYHKfDI+TzdloMns5U5Tu3qG2vjH4FHgSS0DV
 CRGHk76Wq5MytgynlDv6DS27hu+YMd0WKlQ6zX1ukVXdm9VW1Qxvw2tOtILfdXCjJMN5
 vPBtOIywm2usEjTDgiNuiKgFDdD/Ry8iW7kRUZ/yulhN7DrxcZmpugCEXrkwl+qsHwRA
 hf4vEc6BDdxqlivP+STM7NU6CKam31lYDOMRXU2SwZKfq7c4BGapIol/iEE75Bbo7weM
 GUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2kFFMxggEIFqCBrgO51rxrq3mVOtoMZWvoFNTEnVYpg=;
 b=U+DtVn+oMIy2btq7L4qIgpDhThYuToiWi7yU3RH6xuODVhG7JVFcveHqZnREg8sWLW
 Q2ETd8BiCI5jsqAsNDE1BVGA9NoM6pjDosVagBI5l4boJaiueLaIkA0cdvHDICPcV+MF
 VyhkUFnKeWFrHT1yyRp+DmHnVfdQ1HH76U2NvJT6a5Oaq2JjoW1bah0U7LI9fWISYjfl
 tP3Z5G2QYvED/qzErN690CYvp/eM82T0lkV2aDNH0XkvwotLUyUYloPlPfkh0LWc1XHq
 HNF79/PHmRuNwX9jZL+m0KvS1wRmvJ2yOsaPjwU/ul9yORl4+FXZgR6M5PRfTGYzsaYT
 G/ew==
X-Gm-Message-State: AOAM532Is2/99A7B+cCM/WhPDpmoF1fvljNsBLZ74tuYf07RbszJYUpF
 uiC3j9AdogyVOSN3DKktm6w=
X-Google-Smtp-Source: ABdhPJyHz2iHWY/XaLxAzV4hisYKTEeTpW3pg3z77TkHLGUPz59N8Xi47TwOatL7RtHwHZsvZtkAeA==
X-Received: by 2002:a0c:d687:: with SMTP id k7mr26414217qvi.42.1593757211637; 
 Thu, 02 Jul 2020 23:20:11 -0700 (PDT)
Received: from LeoBras.ibmuc.com (200-236-245-17.dynamic.desktop.com.br.
 [200.236.245.17])
 by smtp.gmail.com with ESMTPSA id n28sm11165288qtf.8.2020.07.02.23.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 23:20:10 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Leonardo Bras <leobras.c@gmail.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>
Subject: [PATCH v3 4/6] powerpc/pseries/iommu: Remove default DMA window
 before creating DDW
Date: Fri,  3 Jul 2020 03:18:42 -0300
Message-Id: <20200703061844.111865-5-leobras.c@gmail.com>
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

On LoPAR "DMA Window Manipulation Calls", it's recommended to remove the
default DMA window for the device, before attempting to configure a DDW,
in order to make the maximum resources available for the next DDW to be
created.

This is a requirement for using DDW on devices in which hypervisor
allows only one DMA window.

If setting up a new DDW fails anywhere after the removal of this
default DMA window, it's needed to restore the default DMA window.
For this, an implementation of ibm,reset-pe-dma-windows rtas call is
needed:

Platforms supporting the DDW option starting with LoPAR level 2.7 implement
ibm,ddw-extensions. The first extension available (index 2) carries the
token for ibm,reset-pe-dma-windows rtas call, which is used to restore
the default DMA window for a device, if it has been deleted.

It does so by resetting the TCE table allocation for the PE to it's
boot time value, available in "ibm,dma-window" device tree node.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 83 +++++++++++++++++++++-----
 1 file changed, 69 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 4e33147825cc..5b520ac354c6 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1066,6 +1066,38 @@ static phys_addr_t ddw_memory_hotplug_max(void)
 	return max_addr;
 }
 
+/*
+ * Platforms supporting the DDW option starting with LoPAR level 2.7 implement
+ * ibm,ddw-extensions, which carries the rtas token for
+ * ibm,reset-pe-dma-windows.
+ * That rtas-call can be used to restore the default DMA window for the device.
+ */
+static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
+{
+	int ret;
+	u32 cfg_addr, reset_dma_win;
+	u64 buid;
+	struct device_node *dn;
+	struct pci_dn *pdn;
+
+	ret = ddw_read_ext(par_dn, DDW_EXT_RESET_DMA_WIN, &reset_dma_win);
+	if (ret)
+		return;
+
+	dn = pci_device_to_OF_node(dev);
+	pdn = PCI_DN(dn);
+	buid = pdn->phb->buid;
+	cfg_addr = ((pdn->busno << 16) | (pdn->devfn << 8));
+
+	ret = rtas_call(reset_dma_win, 3, 1, NULL, cfg_addr, BUID_HI(buid),
+			BUID_LO(buid));
+	if (ret)
+		dev_info(&dev->dev,
+			 "ibm,reset-pe-dma-windows(%x) %x %x %x returned %d ",
+			 reset_dma_win, cfg_addr, BUID_HI(buid), BUID_LO(buid),
+			 ret);
+}
+
 /*
  * If the PE supports dynamic dma windows, and there is space for a table
  * that can map all pages in a linear offset, then setup such a table,
@@ -1079,7 +1111,7 @@ static phys_addr_t ddw_memory_hotplug_max(void)
  */
 static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 {
-	int len, ret;
+	int len, ret, reset_win_ext;
 	struct ddw_query_response query;
 	struct ddw_create_response create;
 	int page_shift;
@@ -1087,7 +1119,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	struct device_node *dn;
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
 	struct direct_window *window;
-	struct property *win64;
+	struct property *win64, *default_win = NULL;
 	struct dynamic_dma_window_prop *ddwprop;
 	struct failed_ddw_pdn *fpdn;
 
@@ -1122,7 +1154,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	if (ret)
 		goto out_failed;
 
-       /*
+	/*
 	 * Query if there is a second window of size to map the
 	 * whole partition.  Query returns number of windows, largest
 	 * block assigned to PE (partition endpoint), and two bitmasks
@@ -1133,14 +1165,34 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	if (ret != 0)
 		goto out_failed;
 
+	/*
+	 * If there is no window available, remove the default DMA window,
+	 * if it's present. This will make all the resources available to the
+	 * new DDW window.
+	 * If anything fails after this, we need to restore it, so also check
+	 * for extensions presence.
+	 */
 	if (query.windows_available == 0) {
-		/*
-		 * no additional windows are available for this device.
-		 * We might be able to reallocate the existing window,
-		 * trading in for a larger page size.
-		 */
-		dev_dbg(&dev->dev, "no free dynamic windows");
-		goto out_failed;
+		default_win = of_find_property(pdn, "ibm,dma-window", NULL);
+		if (!default_win)
+			goto out_failed;
+
+		reset_win_ext = ddw_read_ext(pdn, DDW_EXT_RESET_DMA_WIN, NULL);
+		if (reset_win_ext)
+			goto out_failed;
+
+		remove_dma_window(pdn, ddw_avail, default_win);
+
+		/* Query again, to check if the window is available */
+		ret = query_ddw(dev, ddw_avail, &query, pdn);
+		if (ret != 0)
+			goto out_restore_defwin;
+
+		if (query.windows_available == 0) {
+			/* no windows are available for this device. */
+			dev_dbg(&dev->dev, "no free dynamic windows");
+			goto out_restore_defwin;
+		}
 	}
 	if (query.page_size & 4) {
 		page_shift = 24; /* 16MB */
@@ -1151,7 +1203,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	} else {
 		dev_dbg(&dev->dev, "no supported direct page size in mask %x",
 			  query.page_size);
-		goto out_failed;
+		goto out_restore_defwin;
 	}
 	/* verify the window * number of ptes will map the partition */
 	/* check largest block * page size > max memory hotplug addr */
@@ -1160,14 +1212,14 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu "
 			  "%llu-sized pages\n", max_addr,  query.largest_available_block,
 			  1ULL << page_shift);
-		goto out_failed;
+		goto out_restore_defwin;
 	}
 	len = order_base_2(max_addr);
 	win64 = kzalloc(sizeof(struct property), GFP_KERNEL);
 	if (!win64) {
 		dev_info(&dev->dev,
 			"couldn't allocate property for 64bit dma window\n");
-		goto out_failed;
+		goto out_restore_defwin;
 	}
 	win64->name = kstrdup(DIRECT64_PROPNAME, GFP_KERNEL);
 	win64->value = ddwprop = kmalloc(sizeof(*ddwprop), GFP_KERNEL);
@@ -1230,8 +1282,11 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	kfree(win64->value);
 	kfree(win64);
 
-out_failed:
+out_restore_defwin:
+	if (default_win && reset_win_ext == 0)
+		reset_dma_window(dev, pdn);
 
+out_failed:
 	fpdn = kzalloc(sizeof(*fpdn), GFP_KERNEL);
 	if (!fpdn)
 		goto out_unlock;
-- 
2.25.4

