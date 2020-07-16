Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BA3221D62
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 09:28:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6m7n1pXYzDqxd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 17:28:21 +1000 (AEST)
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
 header.s=20161025 header.b=NcylmrG1; dkim-atps=neutral
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6lvY3SqZzDqv6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 17:17:45 +1000 (AEST)
Received: by mail-qv1-xf43.google.com with SMTP id el4so2251596qvb.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 00:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SXoTy1h4V7NJb4O+XXmTDMHlH/lLg962odT4Jny1J3o=;
 b=NcylmrG1390JPm0HVgxReAnsbpfxRFkncQoQ2+ihYB432hnVUkiUStvHlIqllyGsrF
 6lIlY/OOxjlCVZLGW4zY/UZf5vaymbGcVLPmqW4U4/QccME5iZacDg6z1jJlrz7PTe8G
 6tAdn4T+KTZX47/Gsxio13/Pw1P1+OLkKcG/vfSQs83xkMJfnXt6r/IATvuMCsVoZJ5O
 lNcVpkvrwKtrX3YBfWRoFHgW90jTcOxgGGmzXHWC8Ws3KJnJaLSCLMEeZ3Z+Rf5CKHAC
 nSXk7CSHUlCI94sBxJsAqk1T+WLJ4Hc5xbJHoX9onTqytSnas+uIcXqE0L9EuCZ3bRdI
 Bf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SXoTy1h4V7NJb4O+XXmTDMHlH/lLg962odT4Jny1J3o=;
 b=YjUH3yU4XKnzLXGx/MTDejJ05VXJM5npozdpIjhl7MelvfKG+W3VAoSKALlYQ+CLnR
 PaTvXLDbZe+qfs1SxKfVNowJjkbSGa8Z6a3FdHqH7VlT+xLXhwHaklmzjry8iCYn07+d
 56NQMAVOzCPc9piAUObcw+ChhBysTNg5HlBicr1YN59KYiaf2LqdoHwyrJ8Tjehg37jz
 vph2FFhsJpA6HvmzyKOn4FqJOD5rBlLefjUROkS++S2jOSxoFfT1lJLaNf9bTPgKnzd+
 y/NfZg2DCGNpweCXkvoqwK1OlIbQpmCIUExS4cMkZ0hF7hgW9XxnDvMMUjU/NuZDARAB
 G2mg==
X-Gm-Message-State: AOAM5320quP/ZGqBDBem4Br5MibQ44HbV4FSXcMDlNzvtGII1hsDaAPG
 qBzeibB2sNRh7L0LjL+/DUc=
X-Google-Smtp-Source: ABdhPJxN6nicLFqpJlfCcP6jFOV7E5kTOM49yMkA9W5qvWRJir1dsdqIwPHNpUdpbMqzUWf6j1KvnA==
X-Received: by 2002:ad4:5511:: with SMTP id az17mr2954877qvb.159.1594883863178; 
 Thu, 16 Jul 2020 00:17:43 -0700 (PDT)
Received: from LeoBras.ibmuc.com (200-236-239-31.dynamic.desktop.com.br.
 [200.236.239.31])
 by smtp.gmail.com with ESMTPSA id a5sm6637989qtd.84.2020.07.16.00.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 00:17:42 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Joel Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>
Subject: [PATCH v4 4/7] powerpc/pseries/iommu: Remove default DMA window
 before creating DDW
Date: Thu, 16 Jul 2020 04:16:56 -0300
Message-Id: <20200716071658.467820-5-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200716071658.467820-1-leobras.c@gmail.com>
References: <20200716071658.467820-1-leobras.c@gmail.com>
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
 arch/powerpc/platforms/pseries/iommu.c | 73 +++++++++++++++++++++++---
 1 file changed, 66 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 4e33147825cc..fc8d0555e2e9 100644
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
@@ -1090,6 +1122,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	struct property *win64;
 	struct dynamic_dma_window_prop *ddwprop;
 	struct failed_ddw_pdn *fpdn;
+	bool default_win_removed = false;
 
 	mutex_lock(&direct_window_init_mutex);
 
@@ -1133,14 +1166,38 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
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
+		struct property *default_win;
+		int reset_win_ext;
+
+		default_win = of_find_property(pdn, "ibm,dma-window", NULL);
+		if (!default_win)
+			goto out_failed;
+
+		reset_win_ext = ddw_read_ext(pdn, DDW_EXT_RESET_DMA_WIN, NULL);
+		if (reset_win_ext)
+			goto out_failed;
+
+		remove_dma_window(pdn, ddw_avail, default_win);
+		default_win_removed = true;
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
 	if (query.page_size & 4) {
 		page_shift = 24; /* 16MB */
@@ -1231,6 +1288,8 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	kfree(win64);
 
 out_failed:
+	if (default_win_removed)
+		reset_dma_window(dev, pdn);
 
 	fpdn = kzalloc(sizeof(*fpdn), GFP_KERNEL);
 	if (!fpdn)
-- 
2.25.4

