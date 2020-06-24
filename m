Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96158206C65
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 08:33:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sCy15QclzDqfS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 16:32:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=I9ruBgD7; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sCmT1HSgzDqTx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 16:24:41 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id i3so824525qtq.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 23:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3h0KTMR9rrY+WXnWaCQphxLTyQkuBGaHlmGU+VwrxV0=;
 b=I9ruBgD7pERXLviff6ATkAVtBywsITDmX7utLtD0yNx0W5312ifHN6SRRt2QfY29Vi
 c0/UvEuaBpI5dWvZsdyIwKvBk+KGSrE/MtQf7XZydEwuOlwJfHbOx82CnNa8lUAPE4fG
 BLSGIkJWy7FGk8B9va2o1mIHtc9XeSWYHAZVUGqIm4fkvJhHbFk+fYDdlMM5Yf31uUZB
 3cHsCLNhwpLSB9ZA92HIRfn/xGpaZJztuu8zJMNp4VBs9vqx8yKDQ0k3VrstcSYGmw34
 Ef9K2WBZ/gS33sRgK4A0Ib7XtnuHP/qbnc2mb0t3VIe+mo/gcXj1XllT1QyjnyRIXMVp
 gTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3h0KTMR9rrY+WXnWaCQphxLTyQkuBGaHlmGU+VwrxV0=;
 b=AqYcnBHjnJLUFbDF/I7xRUqfkWV99JDWOh86zOn2dJEFC8EzrVU5Mv7cF0Vs4Uq3TU
 ZzxR5IBnMa24hH+8BaLo5xbpyWB+kSmNFLaEhNpp1tVmIymrrajyedp+e4/SxkvmR7Xp
 kknTZdIuIfdJU/wq9BBLTtremcwYqPt5se0BNmw6FmQuZH9JSPQaaucnMUjNaiM18uc1
 zA+tfYpnv5GWdbsWd9A8wdfAM1bCsViqJCP2sdMrzWEImyWJWJELHBRKC/iOOfvLQGMP
 rQFvn8RDAlTnBdvuDQZYZ673LhQqK2pIh5ZkYzj95C2Jvu/17hKgN7+AQoewFQLCyDrm
 33XA==
X-Gm-Message-State: AOAM530mubgxZEihtE3c6wwVQwrOXCmwIa2jZ49xAc+qc8XZ8u7G2CQE
 14QBDYrEo62KcohXBmY9cJo=
X-Google-Smtp-Source: ABdhPJzKRz8npfnViE6IjSP51EsOWFHmBTAKpeXYkNOq2hRZy58E/HIu6AW+thOxNw8wKVPXNv2lwA==
X-Received: by 2002:ac8:7587:: with SMTP id s7mr6494145qtq.304.1592979878403; 
 Tue, 23 Jun 2020 23:24:38 -0700 (PDT)
Received: from LeoBras.ibmuc.com (179-125-148-1.dynamic.desktop.com.br.
 [179.125.148.1])
 by smtp.gmail.com with ESMTPSA id n2sm2489727qtp.45.2020.06.23.23.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 23:24:37 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>
Subject: [PATCH v2 4/6] powerpc/pseries/iommu: Remove default DMA window
 before creating DDW
Date: Wed, 24 Jun 2020 03:24:09 -0300
Message-Id: <20200624062411.367796-5-leobras.c@gmail.com>
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

On LoPAR "DMA Window Manipulation Calls", it's recommended to remove the
default DMA window for the device, before attempting to configure a DDW,
in order to make the maximum resources available for the next DDW to be
created.

This is a requirement for some devices to use DDW, given they only
allow one DMA window.

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
 arch/powerpc/platforms/pseries/iommu.c | 70 ++++++++++++++++++++++----
 1 file changed, 61 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index a8840d9e1c35..4fcf00016fb1 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1029,6 +1029,39 @@ static phys_addr_t ddw_memory_hotplug_max(void)
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
+	u32 cfg_addr, ddw_ext[DDW_EXT_RESET_DMA_WIN + 1];
+	u64 buid;
+	struct device_node *dn;
+	struct pci_dn *pdn;
+
+	ret = of_property_read_u32_array(par_dn, "ibm,ddw-extensions",
+					 &ddw_ext[0], DDW_EXT_RESET_DMA_WIN + 1);
+	if (ret)
+		return;
+
+	dn = pci_device_to_OF_node(dev);
+	pdn = PCI_DN(dn);
+	buid = pdn->phb->buid;
+	cfg_addr = ((pdn->busno << 16) | (pdn->devfn << 8));
+
+	ret = rtas_call(ddw_ext[DDW_EXT_RESET_DMA_WIN], 3, 1, NULL, cfg_addr,
+			BUID_HI(buid), BUID_LO(buid));
+	if (ret)
+		dev_info(&dev->dev,
+			 "ibm,reset-pe-dma-windows(%x) %x %x %x returned %d ",
+			 ddw_ext[1], cfg_addr, BUID_HI(buid), BUID_LO(buid),
+			 ret);
+}
+
 /*
  * If the PE supports dynamic dma windows, and there is space for a table
  * that can map all pages in a linear offset, then setup such a table,
@@ -1049,8 +1082,9 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	u64 dma_addr, max_addr;
 	struct device_node *dn;
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
+
 	struct direct_window *window;
-	struct property *win64;
+	struct property *win64, *default_win = NULL, *ddw_ext = NULL;
 	struct dynamic_dma_window_prop *ddwprop;
 	struct failed_ddw_pdn *fpdn;
 
@@ -1085,7 +1119,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	if (ret)
 		goto out_failed;
 
-       /*
+	/*
 	 * Query if there is a second window of size to map the
 	 * whole partition.  Query returns number of windows, largest
 	 * block assigned to PE (partition endpoint), and two bitmasks
@@ -1096,15 +1130,31 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
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
+		ddw_ext = of_find_property(pdn, "ibm,ddw-extensions", NULL);
+		if (default_win && ddw_ext)
+			remove_dma_window(pdn, ddw_avail, default_win);
+
+		/* Query again, to check if the window is available */
+		ret = query_ddw(dev, ddw_avail, &query, pdn);
+		if (ret != 0)
+			goto out_failed;
+
+		if (query.windows_available == 0) {
+			/* no windows are available for this device. */
+			dev_dbg(&dev->dev, "no free dynamic windows");
+			goto out_failed;
+		}
 	}
+
 	if (query.page_size & 4) {
 		page_shift = 24; /* 16MB */
 	} else if (query.page_size & 2) {
@@ -1194,6 +1244,8 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	kfree(win64);
 
 out_failed:
+	if (default_win && ddw_ext)
+		reset_dma_window(dev, pdn);
 
 	fpdn = kzalloc(sizeof(*fpdn), GFP_KERNEL);
 	if (!fpdn)
-- 
2.25.4

